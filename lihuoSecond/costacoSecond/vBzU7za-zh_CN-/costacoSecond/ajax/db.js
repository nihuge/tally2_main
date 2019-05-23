/**
 * 功能：对sqlite的操作。 作者：周正 (408898347@qq.com) 日期：2017-3-22 15:51:01 版本：version 1.0
 */

/**
 * 设备就绪、打开数据库、创建数据表
 */
function onDeviceReady(table) {
	var me = this;
	tableName = table;
	tableName_status = tableName + "_status";
	me.db = window.sqlitePlugin.openDatabase({
		name : "cost.db"
	});
	me.db.transaction(function(tx) {
		tx.executeSql('CREATE TABLE IF NOT EXISTS ' + tableName + '(id integer primary key,ctnid varchar,oprationdata varchar,status varchar)');
		tx.executeSql('CREATE TABLE IF NOT EXISTS ' + tableName_status + '(ctnid varchar,status varchar)');
	});
}

/**
 * 插入记录tableName
 */
function insert(insertCtnId, insertData, insertStatus, is_insert, m_s) {
	var me = this;
	insertSql = "INSERT INTO " + tableName + " (ctnid,oprationdata,status) VALUES (?,?,?);";
	me.db.transaction(function(tx) {
		tx.executeSql(insertSql, [ insertCtnId, insertData, insertStatus ], function(tx, res) {
			// alert(insertCtnId + " " + insertData + " "+ insertStatus);
			if (is_insert) {
				select_guan_list(m_s, insertCtnId, true);
			} else {
				// alert("插入成功!");
				me.readyUpCahce(insertCtnId);
			}

		}, function(e) {
			alert("ERROR: tableName_insert");
		});
	});
};

/**
 * 查询tableName录入缓存,拿到第一条数据
 */
function select_cahce(isEmpty, is_stop, sc_AllData) {
	// alert("cahce_ctn_id: " + cahce_ctn_id);
	var me = this;
	selectSql_cahce = "select * from " + tableName;
	me.db.transaction(function(tx) {
		tx.executeSql(selectSql_cahce, [], function(tx, res) {
			// alert("缓存数据条数：" + res.rows.length + "条");
			if (res.rows.length >= 1) {
				// alert("行id: " + res.rows.item(0).id + "\n箱id" +
				// res.rows.item(0).ctnid);
				isEmpty("false", res.rows.item(0).id, res.rows.item(0).ctnid, res.rows.item(0).oprationdata, res.rows.item(0).status, is_stop);
			} else {
				isEmpty("true", is_stop, sc_AllData);
			}
		}, function(e) {
			alert("ERROR: select_cahce");
		});
	});
};

/**
 * 查询关缓
 */
function select_guan_list(me_s, guanListCtnId, isUpLoad) {
	var me = this;
	var span;
	if (tableName == "CFS_TABLE") {
		span = "span17";
		status = 2;
		LevelListData = me_s.comp("LevelListData");
	}
	if (tableName == "QBZX_TABLE") {
		span = "span10";
		status = 2;
		LevelListData = me_s.comp('workingDetailsData');
	}

	if (tableName == "MtoM_TABLE") {
		span = "cacheMessage";
		status = 3;
		LevelListData = me_s.comp('LevelListData');
	}
	select_ctnSql = "select id,oprationdata from " + tableName + " where ctnid = " + guanListCtnId + " and status =" + status;
	me.db.transaction(function(tx) {
		tx.executeSql(select_ctnSql, [], function(tx, res) {
			if (res.rows.length >= 1) {
				if (isUpLoad == true) {
					if (tableName == "CFS_TABLE") {
						// readyUpCahce(guanListCtnId);
						upGuanList(res.rows.item(0).oprationdata, res.rows.item(0).id, true, me_s, guanListCtnId);
					}
					if (tableName == "QBZX_TABLE") {
						upQBZXGuanList(res.rows.item(0).oprationdata, res.rows.item(0).id, true, me_s, guanListCtnId);
					}
					if (tableName == "MtoM_TABLE") {
						upMtoMGuanList(res.rows.item(0).oprationdata, res.rows.item(0).id, true, me_s, guanListCtnId)
					}
				} else {
					var result = "[";
					for (var i = 0; i < res.rows.length; i++) {
						if (i == res.rows.length - 1) {
							result = result + res.rows.item(i).oprationdata;
						} else {
							result = result + res.rows.item(i).oprationdata + ",";
						}
					}
					result += "]";
					me_s.getElementByXid(span).innerText = "缓存数据，请刷新！";
					LevelListData.loadData(JSON.parse(result));
					fleshAndReLoad = 1;
				}
			}
			if (res.rows.length == 0) {
				LevelListData.loadData(JSON.parse("[]"));
				// 上传关后za 上传所有，或者无缓存调用
				if (tableName == "CFS_TABLE") {
					getUrlAreadingData(me_s, guanListCtnId);
				}
				if (tableName == "QBZX_TABLE") {
					getQBZXUrlAreadingData(me_s, guanListCtnId);
				}

				if (tableName == "MtoM_TABLE") {
					getMtoMUrlAreadingData(me_s, guanListCtnId);
				}
				if (isUpLoad == true) {
					readyUpCahce(guanListCtnId);
				}
			}
		});
	});
};

/**
 * 删除关列表缓存中的最后一关
 */
function delete_slige(me_s, deleteSligeCtnId) {
	var me = this;
	if (tableName == "MtoM_TABLE") {
		status = 3;
	} else {
		status = 2;
	}
	delete_sligeRowSql = "delete from " + tableName + " where ctnid = " + deleteSligeCtnId + " and status = " + status + " and id = (select max(id) from " + tableName + ");";
	me.db.transaction(function(tx) {
		tx.executeSql(delete_sligeRowSql, [], function(tx, res) {
			if (res.rowsAffected > 0) {
				justep.Util.hint("删除成功！", {
					"delay" : normerHintDelay
				});
				if (localStorage.getItem(deleteSligeCtnId + "level_num") > 0) {
					localStorage.setItem(deleteSligeCtnId + "level_num", Number(localStorage.getItem(deleteSligeCtnId + "level_num")) - 1);
					me_s.getElementByXid("span14").innerText = Number(localStorage.getItem(deleteSligeCtnId + "level_num")) + 1;
				}
				select_guan_list(me_s, deleteSligeCtnId);
			} else {
				justep.Util.hint("数据不同步1，请刷新", {
					"delay" : normerHintDelay
				});
			}
		});
	});
}

/**
 * 删除表的数据，根据id
 */
function deleteRow(upLoadingTableId, isEnd, isAloneGuan, me_s, guanListCtnId) {
	var me = this;
	deleteTRowSql = "delete from " + tableName + " where id = " + upLoadingTableId + ";";
	// alert("行id：" + upLoadingTableId);
	me.db.transaction(function(tx) {
		tx.executeSql(deleteTRowSql);
		if (isEnd) {
			justep.Util.hint("箱上传完成,请刷新界面！", {
				"delay" : normerHintDelay
			});
			delete_StatusRow(tableName_status, isAloneGuan);
		} else {
			// alert("删除成功!")
			if (isAloneGuan) {
				select_guan_list(me_s, guanListCtnId, true);
			} else {
				readyUpCahce();
			}
		}
	}, function(e) {
		alert("Erroy" + e.message + "123456");
	});
}

/**
 * 删除表的数据，根据ctn_id、status，为QBZX的超重服务
 */
function deleteRow_backGuan(backGuan_id, status, delete_success) {
	var me = this;
	delete_backGuanRowSql = "delete from " + tableName + " where ctnid = " + backGuan_id + " and status in(" + status + ");";
	// alert(delete_backGuanRowSql);
	me.db.transaction(function(tx) {
		tx.executeSql(delete_backGuanRowSql, [], function(tx, res) {
			if (res.rowsAffected > 0) {
				justep.Util.hint("删除成功!", {
					"delay" : normerHintDelay
				});
				delete_success();
			} else {
				justep.Util.hint("没有缓存!", {
					"delay" : normerHintDelay
				});
				delete_success();
			}
		});
	}, function(e) {
		alert("deleteRow_backGuan" + e.message + "123456");
	});
}

/**
 * 删除表的数据，为取消作业服务
 */
function deleteALLctn(tableName2, ctn_all) {
	var me = this;
	deleteALLctnRowSql = "delete from " + tableName + " where ctnid = " + ctn_all + ";";
	me.db.transaction(function(tx) {
		tx.executeSql(deleteALLctnRowSql, [], function(tx, res) {
			if (res.rowsAffected > 0) {
				// alert("缓存清空！！！");
			}
		});
	});
}

/**
 * 查询记录tableName_status,用于跳转作业步骤
 */
function select_status(statusToShellPage, status_ctn_id) {
	var me = this;
	selectSql_status = "select ctnid,status from " + tableName_status + " where ctnid = " + status_ctn_id + ";";
	me.db.transaction(function(tx) {
		tx.executeSql(selectSql_status, [], function(tx, res) {
			if (res.rows.length >= 1) {
				statusToShellPage(res.rows.item(0).status);
			} else {
				statusToShellPage(0);
			}
		}, function(e) {
			alert("ERROR: tableName_status");
		});
	});
};

/**
 * 插入记录tableName_status,根据ctn_id有就修改,没有就添加
 */
function insert_status(insert_status_ctn_id, insert_status_status, isUp, isBackGuan) {
	var me = this;
	seclect_Sql_insert_status = "select ctnid,status from " + tableName_status + " where ctnid = " + insert_status_ctn_id + ";";
	insertSql_insert_status = "INSERT INTO " + tableName_status + " (ctnid,status) VALUES (?,?);";
	upDataSql_insert_status = "update " + tableName_status + " set status = " + insert_status_status + " where ctnid = " + insert_status_ctn_id + ";";
	// update 表名 set 字段名=值 where 条件子句。如：update person set name=‘传智‘ where
	// id=10
	me.db.transaction(function(tx) {
		tx.executeSql(seclect_Sql_insert_status, [], function(tx, res) {
			if (res.rows.length == 0) {
				me.db.transaction(function(tx) {
					tx.executeSql(insertSql_insert_status, [ insert_status_ctn_id, insert_status_status ], function(tx, res) {
						// alert("插入状态成功!");
						if (isBackGuan == "Y") {
							justep.Util.hint("同步完成！", {
								"delay" : 1000
							});
						}
					}, function(e) {
						alert("ERROR: insert_status");
					});
				});
			} else {
				// 修改
				me.db.transaction(function(tx) {
					tx.executeSql(upDataSql_insert_status, [], function(tx, res) {
						if (isUp) {
							isBackGuan();
						} else {
							if (isBackGuan == "Y") {
								justep.Util.hint("同步完成！", {
									"delay" : 1000
								});
							}
						}

					}, function(e) {
						alert("ERROR: updata_status");
					});
				});
			}
		});
	});
};

/**
 * 查询清除特定的缓存的条数
 */

function select_cache_each(me_s, dialog_name, ctns) {
	var me = this;
	var seclect_Sql_cache = "";
	if (ctns != "(") {
		seclect_Sql_cache = "select count(ctnid) as ctns from " + tableName + " where ctnid not in " + ctns;
	} else {
		seclect_Sql_cache = "select count(ctnid) as ctns from " + tableName;
	}
	me.db.transaction(function(tx) {
		tx.executeSql(seclect_Sql_cache, [], function(tx, res) {

			if (res.rows.item(0).ctns != 0) {
				me_s.comp(dialog_name).show({
					"title" : "温馨提示",
					"message" : "存在 " + res.rows.item(0).ctns + " 条缓存作业数据，清除后无法恢复，是否清除缓存？"
				});
				me_s.cache_ctns = ctns;
			} else {
				justep.Util.hint("无缓存数据！", {
					"delay" : normerHintDelay,
				});
			}

		}, function(e) {
			alert("ERROR: delete_cache_each");
		});
	});
}

/**
 * 清除特定的缓存
 */

function delete_cache_each(ctns) {

	var me = this;
	var delete_Sql_cache = "";
	if (ctns != "(") {
		delete_Sql_cache = "delete from " + tableName + " where ctnid not in " + ctns;
	} else {
		delete_Sql_cache = "delete from " + tableName;
	}

	me.db.transaction(function(tx) {
		tx.executeSql(delete_Sql_cache, [], function(tx, res) {
			justep.Util.hint("删除成功！", {
				"delay" : normerHintDelay,
				"style" : "color:red;"
			});
		});
	});

}

/**
 * 删除状态表中的数据,为取消作业服务
 */
function delete_StatusRow(table_Status, iupLoadingData_tableid) {
	var me = this;
	// alert(iupLoadingData_tableid);
	deleteStatusRowRowSql = "delete from " + tableName_status + " where ctnid = " + iupLoadingData_tableid + ";";
	me.db.transaction(function(tx) {
		tx.executeSql(deleteStatusRowRowSql, [], function(tx, res) {
			// alert("删除状态表中数据成功！");
		});
	});

}

/**
 * CFS空箱录入数据json拼接并插入到表中
 */
function CFS_firstSet(firstSetCtnId, firstSetEmptyWeight, firstSetWeightMax, firstSetLST, firstSetEmptyPicture, firstSetStatus) {
	var result_firstSet = "{\"ctn_id\":\"" + firstSetCtnId + "\",\"empty_weight\":\"" + firstSetEmptyWeight + "\",\"load\":\"" + firstSetWeightMax + "\",\"laborteam_id\":\"" + firstSetLST
			+ "\",\"empty_picture\":\"" + firstSetEmptyPicture + "\"}";
	insert(firstSetCtnId, result_firstSet, firstSetStatus);
	// 保存最大载重量
	localStorage.setItem('empty_weight_max' + firstSetCtnId, firstSetWeightMax);
	insert_status(firstSetCtnId, "2");

}

/**
 * CFS关录入数据json拼接并插入到表中
 */
function CFS_secondSet(secondSetCtnId, secondSetLevelPicture, secondSetOperationId, secondSetNum, secondSetDamageNum, secondSetDamageImg, secondSetBlno, secondSetStatus, secondLevelNum, is_secondSet,
		me_s) {
	var result_secondSet = "{\"level_picture\":\"" + secondSetLevelPicture + "\",\"operation_id\":\"" + secondSetOperationId + "\",\"num\":\"" + secondSetNum + "\",\"damage_num\":\""
			+ secondSetDamageNum + "\",\"damage_img\":\"" + secondSetDamageImg + "\",\"blno\":\"" + secondSetBlno + "\",\"level_num\":\"" + secondLevelNum + "\"}";
	insert(secondSetCtnId, result_secondSet, secondSetStatus, is_secondSet, me_s);
	insert_status(secondSetCtnId, secondSetStatus);
}

/**
 * CFS半关门数据json拼接并插入到表中
 */
function CFS_halfcloseDooSet(halfcloseDooSetCtnId, halfcloseDooSetOnedoor, halfcloseDooSetStatus) {
	var result_halfcloseDooSet = "{\"ctn_id\":\"" + halfcloseDooSetCtnId + "\",\"halfclose_door_picture\":\"" + halfcloseDooSetOnedoor + "\"}";
	// alert("123 "+result_halfcloseDooSet);
	insert(halfcloseDooSetCtnId, result_halfcloseDooSet, halfcloseDooSetStatus);
	insert_status(halfcloseDooSetCtnId, halfcloseDooSetStatus);
}

/**
 * CFS全关门数据json拼接并插入到表中
 */
function CFS_SealDoneSet(SealDoneSetCtnId, SealDoneSetTwoDoor, SealDoneSetCargoweight, SealDoneSetStatus) {
	var result_SealDoneSet = "{\"ctn_id\":\"" + SealDoneSetCtnId + "\",\"close_door_picture\":\"" + SealDoneSetTwoDoor + "\",\"cargo_weight\":\"" + SealDoneSetCargoweight + "\"}";
	insert(SealDoneSetCtnId, result_SealDoneSet, SealDoneSetStatus);
	insert_status(SealDoneSetCtnId, SealDoneSetStatus);
}

/**
 * CFS铅封数据json拼接并插入到表中
 */
function CFS_forecastQFSet(forecastQFSetCtnId, forecastQFSetRemark, forecastQFSetSealno, forecastQFSetSealImg, forecastQFSetStatus) {
	var result_forecastQFSet = "{\"ctn_id\":\"" + forecastQFSetCtnId + "\",\"remark\":\"" + forecastQFSetRemark + "\",\"sealno\":\"" + forecastQFSetSealno + "\",\"seal_picture\":\""
			+ forecastQFSetSealImg + "\"}";
	insert(forecastQFSetCtnId, result_forecastQFSet, forecastQFSetStatus);

	if (localStorage.getItem("isStop" + localStorage.getItem('ctndetails_ID')) == "true") {
		// 暂不铅封不改变状态
		// alert("我是暂不铅封");
	} else {
		insert_status(forecastQFSetCtnId, forecastQFSetStatus);
	}
}

/**
 * CFS补充照片数据json拼接并插入到表中
 */
function CFS_supplementarySet(CFSSupplementarySetCtnId, CFSSupplementarySetOperationId, CFSSupplementarySetPicture, CFSSupplementarySetStatus) {
	var result_CFS_supplementarySet = "{\"ctn_id\":\"" + CFSSupplementarySetCtnId + "\",\"operation_id\":\"" + CFSSupplementarySetOperationId + "\",\"supplement_picture\":\""
			+ CFSSupplementarySetPicture + "\"}";
	insert(CFSSupplementarySetCtnId, result_CFS_supplementarySet, CFSSupplementarySetStatus);
	// insert_status(CFSSupplementarySetCtnId, CFSSupplementarySetStatus);
}

/**
 * QBZX空箱录入数据json拼接并插入到表中
 */
function QBZX_firstSet(QBZXCtnId, QBZXEmptyWeight, QBZXWeightMax, QBZXEmptyPicture, QBZXLST, QBZXStatus) {
	var QBZX_firstSet_result = "{\"ctn_id\":\"" + QBZXCtnId + "\",\"empty_weight\":\"" + QBZXEmptyWeight + "\",\"load\":\"" + QBZXWeightMax + "\",\"empty_picture\":\"" + QBZXEmptyPicture
			+ "\",\"labor_id\":\"" + QBZXLST + "\"}";
	// alert(QBZXCtnId)
	// 保存最大载重量
	localStorage.setItem('empty_weight_max' + QBZXCtnId, QBZXWeightMax);
	insert(QBZXCtnId, QBZX_firstSet_result, QBZXStatus);
	insert_status(QBZXCtnId, "2");
}

/**
 * QBZX关录入数据json拼接并插入到表中
 */
function QBZX_secondSet(QBZXSecondSetCtnId, QBZXSecondSetBillno, QBZXSecondSetOperationId, QBZXSecondSetCargoNumber, QBZXSecondSetCargoPicture, QBZXSecondSetDamageNum, QBZXSecondSetDamageImg,
		QBZXSecondSetDamageExplain, QBZXSecondSetTransport, QBZXSecondSetRemark, QBZXSecondSetShipId, QBZXSecondSetLocationId, QBZXSecondSetCar, QBZXSecondSetStatus, QBZXSecondLevelNum, is_secondSet,
		me_s) {
	var QBZX_secondSet_result = "{\"billno\":\"" + QBZXSecondSetBillno + "\",\"operation_id\":\"" + QBZXSecondSetOperationId + "\",\"cargo_number\":\"" + QBZXSecondSetCargoNumber
			+ "\",\"cargo_picture\":\"" + QBZXSecondSetCargoPicture + "\",\"damage_num\":\"" + QBZXSecondSetDamageNum + "\",\"damage_img\":\"" + QBZXSecondSetDamageImg + "\",\"damage_explain\":\""
			+ QBZXSecondSetDamageExplain + "\",\"transport\":\"" + QBZXSecondSetTransport + "\",\"remark\":\"" + QBZXSecondSetRemark + "\",\"ship_id\":\"" + QBZXSecondSetShipId
			+ "\",\"location_id\":\"" + QBZXSecondSetLocationId + "\",\"car\":\"" + QBZXSecondSetCar + "\",\"level_num\":\"" + QBZXSecondLevelNum + "\"}";
	insert(QBZXSecondSetCtnId, QBZX_secondSet_result, QBZXSecondSetStatus, is_secondSet, me_s);
	insert_status(QBZXSecondSetCtnId, QBZXSecondSetStatus);
}

/**
 * QBZX半关门数据json拼接并插入到表中
 */
function QBZX_halfcloseDooSet(QBZXhalfcloseDooSetCtnId, QBZXhalfcloseDooSetonedOnedoor, QBZXhalfcloseDooSetonedStatus) {
	var result_halfcloseDooSet = "{\"ctn_id\":\"" + QBZXhalfcloseDooSetCtnId + "\",\"halfclose_door_picture\":\"" + QBZXhalfcloseDooSetonedOnedoor + "\"}";
	insert(QBZXhalfcloseDooSetCtnId, result_halfcloseDooSet, QBZXhalfcloseDooSetonedStatus);
	insert_status(QBZXhalfcloseDooSetCtnId, QBZXhalfcloseDooSetonedStatus);
}

/**
 * QBZX全关门数据json拼接并插入到表中
 */
function QBZX_SealDoneSet(QBZXSealDoneSetCtnId, QBZXSealDoneSetTwodoor, QBZXSealDoneSetStatus) {
	var result_SealDoneSet = "{\"ctn_id\":\"" + QBZXSealDoneSetCtnId + "\",\"close_door_picture\":\"" + QBZXSealDoneSetTwodoor + "\"}";
	insert(QBZXSealDoneSetCtnId, result_SealDoneSet, QBZXSealDoneSetStatus);
	insert_status(QBZXSealDoneSetCtnId, QBZXSealDoneSetStatus);
}

/**
 * QBZX铅封数据json拼接并插入到表中
 */
function QBZX_forecastQFSet(QBZXforecastQFSetCtnId, QBZXforecastQFSetRemark, QBZXforecastQFSetSealno, QBZXforecastQFSetSealImg, QBZXforecastQFSetCargoWeight, QBZXforecastQFSetStatus) {
	var result_forecastQFSet = "{\"ctn_id\":\"" + QBZXforecastQFSetCtnId + "\",\"remark\":\"" + QBZXforecastQFSetRemark + "\",\"sealno\":\"" + QBZXforecastQFSetSealno + "\",\"seal_picture\":\""
			+ QBZXforecastQFSetSealImg + "\",\"cargo_weight\":\"" + QBZXforecastQFSetCargoWeight + "\"}";
	insert(QBZXforecastQFSetCtnId, result_forecastQFSet, QBZXforecastQFSetStatus);
	if (localStorage.getItem("isStop" + localStorage.getItem('id')) == "true") {
		// alert("我是暂不铅封");
	} else {
		insert_status(QBZXforecastQFSetCtnId, QBZXforecastQFSetStatus);
	}
}

/**
 * QBZX补充照片数据json拼接并插入到表中
 */
function QBZX_supplementarySet(QBZXSupplementarySetCtnId, QBZXSupplementaryOperationId, QBZXSupplementaryPicture, QBZXSupplementarySetStatus) {
	var result_supplementarySet = "{\"ctn_id\":\"" + QBZXSupplementarySetCtnId + "\",\"operation_id\":\"" + QBZXSupplementaryOperationId + "\",\"supplement_picture\":\"" + QBZXSupplementaryPicture
			+ "\"}";
	insert(QBZXSupplementarySetCtnId, result_supplementarySet, QBZXSupplementarySetStatus);
	insert_status(QBZXSupplementarySetCtnId, QBZXSupplementarySetStatus);
}

/**
 * MtoM开始作业数据json拼接并插入到表中
 */
function MtoM_firstSet(MtoMfirstSetCtnId, MtoMfirstSetTrueSealno, MtoMfirstSetSealPicture, MtoMfirstSetDoorPicture, MtoMfirstSetDamageRemark, MtoMfirstSetDamageImg, MtoMfirstSetStatus) {
	var result_MtoM_firstSet = "{\"ctn_id\":\"" + MtoMfirstSetCtnId + "\",\"true_sealno\":\"" + MtoMfirstSetTrueSealno + "\",\"seal_picture\":\"" + MtoMfirstSetSealPicture + "\",\"door_picture\":\""
			+ MtoMfirstSetDoorPicture + "\",\"damage_remark\":\"" + MtoMfirstSetDamageRemark + "\",\"damage_img\":\"" + MtoMfirstSetDamageImg + "\"}";
	insert(MtoMfirstSetCtnId, result_MtoM_firstSet, MtoMfirstSetStatus);
	insert_status(MtoMfirstSetCtnId, "2");
}

/**
 * MtoM开箱数据json拼接并插入到表中
 */
function MtoM_open_door(MtoMOpenDoorCtnId, MtoMOpenDoorCargoPicture, MtoMOpenDoorStatus) {
	var result_MtoM_open_door = "{\"ctn_id\":\"" + MtoMOpenDoorCtnId + "\",\"cargo_picture\":\"" + MtoMOpenDoorCargoPicture + "\"}";
	insert(MtoMOpenDoorCtnId, result_MtoM_open_door, MtoMOpenDoorStatus);
	insert_status(MtoMOpenDoorCtnId, "3");
}

/**
 * MtoM关录入数据json拼接并插入到表中
 */
function MtoM_secondSet(MtoMSecondSetCtnId, MtoMSecondSetLevelNum, MtoMSecondSetOid, MtoMSecondSetNum, MtoMSecondDamageNum, MtoMSecondDamageImg, MtoMSecondStatus, is_secondSet, me_s, MtoMSecond_blno,
		MtoMSecond_goods_pics) {

	var MtoM_secondSet_result = "{\"ctn_id\":\"" + MtoMSecondSetCtnId + "\",\"operation_id\":\"" + MtoMSecondSetOid + "\",\"level_num\":\"" + MtoMSecondSetLevelNum + "\",\"num\":\""
			+ MtoMSecondSetNum + "\",\"damage_num\":\"" + MtoMSecondDamageNum + "\",\"damage_img\":\"" + MtoMSecondDamageImg + "\",\"blno\":\"" + MtoMSecond_blno + "\",\"cargo_picture\":\""
			+ MtoMSecond_goods_pics + "\"}";
	insert(MtoMSecondSetCtnId, MtoM_secondSet_result, MtoMSecondStatus, is_secondSet, me_s);
	insert_status(MtoMSecondSetCtnId, MtoMSecondStatus);
}

/**
 * MtoM完成作业数据json拼接并插入到表中
 */
function MtoM_finish(MtoMfinishCtnId, MtoMfinishEmptyPicture, MtoMfinishDamageAfterRemark, MtoMfinishDamageAfterImg, MtoMfinishRemark, MtoMfinishStatus) {
	var MtoM_finish_result = "{\"ctn_id\":\"" + MtoMfinishCtnId + "\",\"empty_picture\":\"" + MtoMfinishEmptyPicture + "\",\"damage_after_remark\":\"" + MtoMfinishDamageAfterRemark
			+ "\",\"damage_after_img\":\"" + MtoMfinishDamageAfterImg + "\",\"remark\":\"" + MtoMfinishRemark + "\"}";
	// alert(MtoM_finish_result);
	insert(MtoMfinishCtnId, MtoM_finish_result, MtoMfinishStatus);
	insert_status(MtoMfinishCtnId, "5");
}

/**
 * MtoM补充照片数据json拼接并插入到表中
 */
function MtoM_supplementarySet(MtoMsupplementaryCtnId, MtoMsupplementaryOperationId, MtoMsupplementaryPicture, MtoMsupplementaryStatus) {
	var result_MtoMsupplementarySet = "{\"ctn_id\":\"" + MtoMsupplementaryCtnId + "\",\"operation_id\":\"" + MtoMsupplementaryOperationId + "\",\"supplement_picture\":\"" + MtoMsupplementaryPicture
			+ "\"}";
	// alert(result_MtoMsupplementarySet)
	insert(MtoMsupplementaryCtnId, result_MtoMsupplementarySet, MtoMsupplementaryStatus);
	insert_status(MtoMsupplementaryCtnId, MtoMsupplementaryStatus);
}

/**
 * 上传缓存起始步骤sc_AllData\sc_AllData_op:操作关步骤时用到
 */
function readyUpCahce(readyUpCahceCtnId, sc_AllData, sc_AllData_op, is_stop) {
	// alert("准备上传!")
	var ms = this;
	ms.select_cahce(isEmpty, is_stop, sc_AllData);
	function isEmpty(isEmpty_result, isEmpty_tableid, isEmpty_ctnid, isEmpty_data, isEmpty_status, is_stop_s) {
		if (isEmpty_result == "false") {
			if (is_stop_s == "true") {
				justep.Util.hint("上缓存传中...", {
					"delay" : normerHintDelay
				});
			}
			ms.upLoadingData(isEmpty_tableid, isEmpty_ctnid, isEmpty_data, isEmpty_status);
		}
		if (isEmpty_result == "true" && sc_AllData_op == "2") {
			// alert("没缓存");
			sc_AllData();
			return;
		}
		if (isEmpty_result == "true" && isEmpty_tableid == "true") {
			isEmpty_ctnid();
			return;
		}
		// 箱列表（作业中）箱子同步后台前上传缓存
		if (isEmpty_result == "true") {
			// alert("缓存上传完成！");
			var num = Number(localStorage.getItem("ModerCahce"));
			switch (num) {
			case 1:
				// alert("qbzx缓存上传完成！");
				GetReflashCTN(1, localStorage.getItem("ModerCahce_ctn_id"), reflash_qb_cfs_mtom);
				break;
			case 2:
				// alert("CFS缓存上传完成！");
				GetReflashCTN(2, localStorage.getItem("ModerCahce_ctn_id"), reflash_qb_cfs_mtom);
				break;
			case 3:
				// alert("mtom缓存上传完成！");
				GetReflashCTN(3, localStorage.getItem("ModerCahce_ctn_id"), reflash_qb_cfs_mtom);
				break;
			default:
				// alert("我们遇到一个未知错误1！");
				break;
			}
			localStorage.setItem("ModerCahce", 0);
		}
	}
};

/**
 * 上传缓存(1空箱;2关列表;3半关门;4全关门;5铅封)
 */
function upLoadingData(upLoadingTableId, upLoadingData_ctnid, ctnData, LoadingStatus) {
	var me = this;
	if (tableName == "CFS_TABLE") {
		switch (Number(LoadingStatus)) {
		case 1:
			upEmptyCtn(ctnData, upLoadingTableId);
			break;
		case 2:
			upGuanList(ctnData, upLoadingTableId);
			break;
		case 3:
			upHalfCloseDoor(ctnData, upLoadingTableId);
			break;
		case 4:
			upSealDone(ctnData, upLoadingTableId);
			break;
		case 5:
			upForeCasrQF(ctnData, upLoadingTableId);
			break;
		case 6:
			upCFSsupplementary(ctnData, upLoadingTableId, upLoadingData_ctnid);
			break;
		}
	}

	if (tableName == "QBZX_TABLE") {
		switch (Number(LoadingStatus)) {
		case 1:
			upQBZXEmptyCtn(ctnData, upLoadingTableId);
			break;
		case 2:
			upQBZXGuanList(ctnData, upLoadingTableId);
			break;
		case 3:
			upQBZXHalfCloseDoor(ctnData, upLoadingTableId);
			break;
		case 4:
			upQBZXSealDone(ctnData, upLoadingTableId);
			break;
		case 5:
			upQBZXForeCasrQF(ctnData, upLoadingTableId, upLoadingData_ctnid);
			break;
		case 6:
			upQBZXsupplementary(ctnData, upLoadingTableId, upLoadingData_ctnid);
			break;
		}
	}

	if (tableName == "MtoM_TABLE") {
		switch (Number(LoadingStatus)) {
		case 1:
			upMtoMEmptyCtn(ctnData, upLoadingTableId);
			break;
		case 2:
			upMtoMOpenDoor(ctnData, upLoadingTableId);
			break;
		case 3:
			upMtoMGuanList(ctnData, upLoadingTableId);
			break;
		case 4:
			upMtoMFinish(ctnData, upLoadingTableId);
			break;
		case 6:
			upMtoMsupplementary(ctnData, upLoadingTableId, upLoadingData_ctnid);
			break;
		}
	}
};

/**
 * 上传CFS空箱
 */
function upEmptyCtn(ctnData, upLoadingTableId) {
	var me = this;
	var obj1 = JSON.parse(ctnData);
	var arry1 = new Array();
	var arry1 = obj1.empty_picture.split("----------");
	// alert("最大载重量: " + obj1.load + "\n劳务队ID：" + obj1.laborteam_id + "\n指令ID："
	// + localStorage.getItem('instruction_id' + obj1.ctn_id));
	// alert(arry1[0]);
	// alert(obj1.empty_weight)
	$.ajax({
		"type" : "post",
		"async" : false,
		"data" : {
			"uid" : localStorage.getItem("userinfoid"),
			"ctn_id" : obj1.ctn_id,
			"empty_weight" : obj1.empty_weight,
			"empty_picture" : arry1,
			"load" : obj1.load,
			"laborteam_id" : obj1.laborteam_id,
			"instruction_id" : localStorage.getItem('instruction_id' + obj1.ctn_id)

		},
		"dataType" : "json",
		"url" : interface_url + "?c=CfsOperation&a=OperationCheck", // PHP数据库校验用户名和密码是否正常
		"success" : function(data) {
			if (data['code'] == 0) {
				// alert("上传空箱成功！")
				// 清空输入的数据
				deleteRow(upLoadingTableId);
			} else {
				alert("上传空箱失败! " + data['msg']);
			}
		},
		"error" : function() {
			// if (isAllLasrt == true) {
			// alert("连接服务器异常，还有缓存存在！！！");
			// justep.Shell.showPage("working_cfs");
			// }
			justep.Util.hint("上传失败！", {
				"delay" : normerHintDelay,
				"style" : "color:red;"
			});

		}
	});
}

/**
 * 上传CFS关列表
 */
function upGuanList(ctnData, upLoadingTableId, isAloneGuan, me_s, guanListCtnId) {
	var me = this;
	var obj2 = JSON.parse(ctnData);
	var arry2 = new Array();
	var arry2_goods_pic = new Array();
	arry2_goods_pic = obj2.level_picture.split("----------");
	// alert(arry2_goods_pic.length);
	if (obj2.damage_img != "") {
		arry2 = obj2.damage_img.split("----------");
	}
	// alert("上传货物照片的张数：" + arry2_goods_pic.length);
	$.ajax({
		"type" : "post",
		"async" : false,
		"timeout" : 5000,
		"data" : {
			"level_picture" : arry2_goods_pic,
			"operation_id" : obj2.operation_id,
			"num" : obj2.num,
			"damage_num" : obj2.damage_num,
			"damage_img" : arry2,
			"blno" : obj2.blno
		},
		"dataType" : "json",
		// http://192.168.1.91/xztally/app.php?c=CfsOperation&a=OperationLevel
		"url" : interface_url + "?c=CfsOperation&a=OperationLevel",
		// PHP数据库校验用户名和密码是否正常
		"success" : function(data) {
			// alert(data['code'])
			if (data['code'] == 0) {
				// 清空输入的数据
				deleteRow(upLoadingTableId, false, isAloneGuan, me_s, guanListCtnId);
				// alert("上传第" + i + "关列表成功！")
			} else {
				justep.Util.hint("上传关失败: " + data['msg'], {
					"delay" : normerHintDelay,
					"style" : "color:red;"
				});
				// deleteRow(upLoadingTableId, false, isAloneGuan, me_s,
				// guanListCtnId);
			}
		},
		"error" : function() {
			// if (isAllLasrt == true) {
			// alert("连接服务器异常，还有缓存存在！！！");
			// justep.Shell.showPage("working_cfs");
			// }

			if (isAloneGuan) {
				justep.Util.hint("上传关失败，请检查网络！！！", {
					"delay" : normerHintDelay,
					"style" : "color:red;"
				});
				select_guan_list(me_s, guanListCtnId);
			}
		}
	});
}
/**
 * 上传CFS半关门
 */
function upHalfCloseDoor(ctnData, upLoadingTableId) {
	var me = this;
	var obj3 = JSON.parse(ctnData);

	// alert(obj3.halfclose_door_picture)
	$.ajax({
		"type" : "post",
		"async" : false,
		"data" : {
			"uid" : localStorage.getItem("userinfoid"),
			"halfclose_door_picture" : obj3.halfclose_door_picture,
			"ctn_id" : obj3.ctn_id,
		},
		"dataType" : dataType,
		"url" : interface_url + "?c=CfsOperation&a=halfcloseDoor",
		"success" : function(data) {
			if (data['code'] == 0) {
				// 清空输入的数据
				deleteRow(upLoadingTableId);
				// alert("上传办关门成功！")
			} else {
				justep.Util.hint("上传办关门失败: " + data['msg'], {
					"delay" : normerHintDelay,
					"style" : "color:red;"
				});
			}
		},
		"error" : function() {
			// if (isAllLasrt == true) {
			// alert("连接服务器异常，还有缓存存在！！！");
			// justep.Shell.showPage("working_cfs");
			// }
			// alert("上传失败！");
		}
	});
}

/**
 * 上传CFS全关门
 */
function upSealDone(ctnData, upLoadingTableId) {
	var me = this;
	var obj4 = JSON.parse(ctnData);
	$.ajax({
		"type" : "post",
		"async" : false,
		"data" : {
			"uid" : localStorage.getItem("userinfoid"),
			"close_door_picture" : obj4.close_door_picture,
			"ctn_id" : obj4.ctn_id,
			"cargo_weight" : obj4.cargo_weight
		},
		"dataType" : "json",
		"url" : interface_url + "?c=CfsOperation&a=closeDoor",
		"success" : function(data) {
			if (data['code'] == 0) {
				// 清空输入的数据
				deleteRow(upLoadingTableId);
				// alert("上传全关门成功！")
			} else {

				// if (data['code'] == 601) {
				// deleteRow(upLoadingTableId);
				// }
				justep.Util.hint("上传全关门失败: " + data['msg'], {
					"delay" : normerHintDelay,
					"style" : "color:red;"
				});
			}
		},
		"error" : function() {
			// if (isAllLasrt == true) {
			// alert("连接服务器异常，还有缓存存在！！！");
			// justep.Shell.showPage("working_cfs");
			//
			// }
			// alert("上传失败！");
		}
	});
}

/**
 * 上传CFS铅封
 */
function upForeCasrQF(ctnData, upLoadingTableId, upLoadingData_ctnid) {
	var me = this;
	var url = interface_url + "?c=CfsOperation&a=operationFinish";
	var obj5 = JSON.parse(ctnData);
	// alert("上传的是否是暂不铅封数据：" + localStorage.getItem("isStop" + obj5.ctn_id));
	if (localStorage.getItem("isStop" + obj5.ctn_id) == "true") {
		// alert("我是暂不铅封接口");
		url = interface_url + "?c=CfsOperation&a=operation_temporarily_seal";
	}
	$.ajax({
		"type" : "post",
		"async" : false,
		"data" : {
			"remark" : obj5.remark,
			"uid" : localStorage.getItem("userinfoid"),
			"sealno" : obj5.sealno,
			"ctn_id" : obj5.ctn_id,
			"seal_picture" : obj5.seal_picture,
		},
		"dataType" : "json",
		"url" : url, // PHP数据库校验用户名和密码是否正常
		"success" : function(data) {
			if (data['code'] == 0) {
				// 清空输入的数据
				deleteRow(upLoadingTableId, true, upLoadingData_ctnid);
				// if (localStorage.getItem("isStop" + obj5.ctn_id) == "true") {
				// // alert("暂不铅封上传成功!");
				// localStorage.removeItem("isStop" + obj5.ctn_id);
				// }
			} else {
				justep.Util.hint("上传铅封失败: " + data['msg'], {
					"delay" : normerHintDelay,
					"style" : "color:red;"
				});

			}
		},
		"error" : function() {
			// if (isAllLasrt == true) {
			// alert("连接服务器异常，还有缓存存在！！！");
			// justep.Shell.showPage("working_cfs");
			// }
			// alert("上传失败！");
		}
	});
}

/**
 * 上传CFS补充照片
 */
function upCFSsupplementary(ctnData, upLoadingTableId, upLoadingData_ctnid) {
	var me = this;
	var obj6 = JSON.parse(ctnData);
	var arry6 = new Array();
	if (obj6.supplement_picture != "") {
		arry6 = obj6.supplement_picture.split("----------");
	}
	// alert("上传数据如下：" + "\n箱ID：" + obj6.ctn_id + "\noperation_id：" +
	// obj6.operation_id + "\n图片的张数：" + arry6.length);
	// deleteRow(upLoadingTableId);
	$.ajax({
		"type" : "post",
		"async" : false,
		"data" : {
			"operation_id" : obj6.operation_id,
			"supplement_picture" : arry6,
			"ctn_id" : obj6.ctn_id
		},
		"dataType" : "json",
		"url" : interface_url + "?c=CfsOperation&a=supplement_picture", // PHP数据库校验用户名和密码是否正常
		"success" : function(data) {
			if (data['code'] == 0) {
				alert("上传补充照片成功");
				// 清空输入的数据
				deleteRow(upLoadingTableId, true, upLoadingData_ctnid);
			} else {
				justep.Util.hint("上传补充照片: ", {
					"delay" : normerHintDelay
				});
			}
		},
		"error" : function() {
			// if (isAllLasrt == true) {
			// alert("连接服务器异常，还有缓存存在！！！");
			// justep.Shell.showPage("working_cfs");
			// }
			justep.Util.hint("数据传输失败！", {
				"delay" : normerHintDelay,
				"style" : "color:red;"
			});
		}
	});

}

/**
 * 获取CFS关列表
 */
function getUrlAreadingData(me_s, guanListCtnId) {
	var me = this;
	LevelListData = me_s.comp('LevelListData');
	$.ajax({
		"type" : "post",
		"async" : false,
		"data" : {
			"ctn_id" : guanListCtnId
		},
		"dataType" : "json",
		"url" : interface_url + "?c=CfsOperation&a=getLevelList", // PHP数据库校验用户名和密码是否正常
		"success" : function(data) {
			if (data['code'] == 0) {
				if (eval(data['list']).length == 0) {
					var contents = me_s.comp('contents1');
					contents.to(1);
				} else {
					// LevelListData.loadData(data['list']);
				}
				me_s.getElementByXid("span17").innerText = "";
				LevelListData.loadData(data['list']);
			} else {
				// justep.Util.hint(data['msg'], {"delay" : normerHintDelay});
			}
		},
		"error" : function() {
			justep.Util.hint("网络连接异常，获取关列表失败!", {
				"delay" : normerHintDelay,
				"style" : "color:red;"
			});
			fleshAndReLoad = 2;
		}
	});
}

/**
 * 删除CFS关操作
 */
function deleteGuanLast(me_s, GuanLastUId, GuanLastOId, lastLevelID) {
	LevelListData = me_s.comp("LevelListData");
	$.ajax({
		"type" : "post",
		"async" : false,
		"data" : {
			"uid" : localStorage.getItem("userinfoid"),
			"operation_id" : GuanLastOId,
			"level_id" : lastLevelID
		},
		"dataType" : "json",
		// http://192.168.1.91/xztally/app.php?c=CfsOperation&a=delLevel
		"url" : interface_url + "?c=CfsOperation&a=delLevel", // PHP数据库校验用户名和密码是否正常
		"success" : function(data) {
			if (data['code'] == 0) {
				justep.Util.hint("删除成功！", {
					"delay" : 1000
				});
				if (localStorage.getItem(localStorage.getItem('ctndetails_ID') + "level_num") > 0) {
					localStorage.setItem(localStorage.getItem('ctndetails_ID') + "level_num", Number(localStorage.getItem(localStorage.getItem('ctndetails_ID') + "level_num")) - 1);
					me_s.getElementByXid("span14").innerText = Number(localStorage.getItem(localStorage.getItem('ctndetails_ID') + "level_num")) + 1;
				}
				LevelListData.refreshData();
			} else {
				delete_slige(me_s, localStorage.getItem('ctndetails_ID'));
			}
		},
		"error" : function() {
			// justep.Util.hint("数据传输失败！", {"delay" : normerHintDelay,"style" :
			// "color:red;"});
		},
		"complete" : function(XMLHttpRequest, status) {
			if (status != "success") {
				switch (fleshAndReLoad) {
				case 0:
					justep.Util.hint("数据不同步，请刷新", {
						"delay" : normerHintDelay
					});
					break;
				case 1:
					delete_slige(me_s, localStorage.getItem('ctndetails_ID'));
					break;
				default:
					break;
				}
			}
		}
	});

}

/**
 * CFS获取提单号(刷新)
 */
function CFSGetBlno(me_s, instructionId, setBlno) {
	$.ajax({
		"type" : "post",
		"async" : false,
		"data" : {
			"instruction_id" : instructionId
		},
		"dataType" : "json",
		"url" : interface_url + "?c=CfsOperation&a=getCargoList", // PHP数据库校验用户名和密码是否正常
		"success" : function(data) {
			if (data['code'] == 0) {
				// 保存提单号
				localStorage.setItem(instructionId, JSON.stringify(data['list']));
				justep.Util.hint("提单号刷新成功！", {
					"delay" : 1000
				});
				setBlno(me_s);
			} else {
				justep.Util.hint(data['msg'], {
					"delay" : 1000
				});
			}
		},
		"error" : function() {
			justep.Util.hint("数据传输失败！", {
				"delay" : 1000
			});
		}
	});
}

/**
 * 上传QBZX空箱
 */
function upQBZXEmptyCtn(ctnData, upLoadingTableId, is_stop_s) {
	// alert(ctnData)
	var obj1 = JSON.parse(ctnData);
	var arry1 = new Array();
	var arry1 = obj1.empty_picture.split("----------");
	// alert(obj1.labor_id);
	// alert(obj1.ctn_id);
	// ["data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACYAAAAcCAIAAACCvloyAAAASUlEQVRIDe3SsQkAMAwDwST7j6wiZAE1T1y9WyEEh3eSNXtndu6tOfnJXFhhgYDvA/BaVdimAzJhAV6rCtt0QCYswGtVYZsOyC6OJgMs2zswuwAAAABJRU5ErkJggg==","data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACYAAAAcCAIAAACCvloyAAAASUlEQVRIDe3SsQkAMAwDwST7j6wiZAE1T1y9WyEEh3eSNXtndu6tOfnJXFhhgYDvA/BaVdimAzJhAV6rCtt0QCYswGtVYZsOyC6OJgMs2zswuwAAAABJRU5ErkJggg=="]
	$.ajax({
		"type" : "post",
		"async" : false,
		"data" : {
			"uid" : localStorage.getItem("userinfoid"),
			"ctn_id" : obj1.ctn_id,
			"empty_weight" : obj1.empty_weight,
			"empty_picture" : arry1,
			"load" : obj1.load,
			"instruction_id" : localStorage.getItem("instruction_id" + obj1.ctn_id),
			"laborteam_id" : obj1.labor_id
		},
		"dataType" : "json",
		"url" : interface_url + "?c=QbzxOperation&a=OperationCheck", // PHP数据库校验用户名和密码是否正常
		"success" : function(data) {
			if (data['code'] == 0) {
				// 清空输入的数据
				deleteRow(upLoadingTableId);
			} else {
				justep.Util.hint("上传空箱失败! " + data['msg'], {
					"delay" : normerHintDelay,
					"style" : "color:red;"
				});
			}
		},
		"error" : function() {
			// if (isAllLasrt == true) {
			// alert("连接服务器异常，还有缓存存在！！！");
			// justep.Shell.showPage("working_cfs");
			// }
			// if (is_stop_s == "true") {
			// alert("上传缓存失败！");
			// }
		}
	});
}

/**
 * 上传QBZX关列表
 */
function upQBZXGuanList(ctnData, upLoadingTableId, isAloneGuan, me_s, guanListCtnId) {
	var me = this;
	var obj2 = JSON.parse(ctnData);
	var arry2 = new Array();
	var arry2_goods = new Array();
	arry2_goods = obj2.cargo_picture.split("----------");
	if (obj2.damage_img != "") {
		// alert(obj2.damage_img)
		arry2 = obj2.damage_img.split("----------");
	}
	// alert(obj2.operation_id);
	// select_guan_list(me_s, guanListCtnId);
	// return;
	$.ajax({
		"type" : "post",
		"async" : true,
		"timeout" : 5000,
		"data" : {
			"billno" : obj2.billno,
			"operation_id" : obj2.operation_id,
			"cargo_number" : obj2.cargo_number,
			"cargo_picture" : arry2_goods,
			"damage_num" : obj2.damage_num,
			"damage_img" : arry2,
			"damage_explain" : obj2.remark,
			"transport" : obj2.transport,
			"remark" : obj2.damage_explain,
			"ship_id" : obj2.ship_id,
			"location_id" : obj2.location_id,
			"car" : obj2.car,
			"level_num" : obj2.level_num
		},
		"dataType" : "json",
		// http://192.168.1.91/xztally/app.php?c=CfsOperation&a=OperationLevel
		"url" : interface_url + "?c=QbzxOperation&a=OperationLevel",// PHP数据库校验用户名和密码是否正常
		"success" : function(data) {
			if (data['code'] == 0) {
				// 清空输入的数据
				// alert("上传关成功！")
				deleteRow(upLoadingTableId, false, isAloneGuan, me_s, guanListCtnId);

			} else {
				justep.Util.hint("上传关失败: " + data['msg'], {
					"delay" : normerHintDelay,
					"style" : "color:red;"
				});
				// select_guan_list(me_s, guanListCtnId);
			}
		},
		"error" : function(XMLHttpRequest, textStatus, errorThrown) {
			if (isAloneGuan) {
				justep.Util.hint("上传关失败，请检查网络！！！", {
					"delay" : normerHintDelay,
					"style" : "color:red;"
				});
				select_guan_list(me_s, guanListCtnId);
			}
		}
	});
}

/**
 * 上传QBZX半关门
 */
function upQBZXHalfCloseDoor(ctnData, upLoadingTableId) {
	var obj3 = JSON.parse(ctnData);
	$.ajax({
		"type" : "post",
		"async" : false,
		"data" : {
			"uid" : localStorage.getItem("userinfoid"),
			"halfclose_door_picture" : obj3.halfclose_door_picture,
			"ctn_id" : obj3.ctn_id,
		},
		"dataType" : dataType,
		"url" : interface_url + "?c=QbzxOperation&a=halfclosedoor",
		"success" : function(data) {
			if (data['code'] == 0) {
				// 清空输入的数据
				// alert("上传办关门成功！")
				deleteRow(upLoadingTableId);

			} else {
				justep.Util.hint("上传半关门失败: " + data['msg'], {
					"delay" : normerHintDelay,
					"style" : "color:red;"
				});
			}
		},
		"error" : function() {
			// if (isAllLasrt == true) {
			// alert("连接服务器异常，还有缓存存在！！！");
			// justep.Shell.showPage("working_cfs");
			// }
			// alert("上传失败！");
		}
	});
}

/**
 * 上传QBZX全关门
 */
function upQBZXSealDone(ctnData, upLoadingTableId) {
	var obj4 = JSON.parse(ctnData);
	$.ajax({
		"type" : "post",
		"async" : false,
		"data" : {
			"uid" : localStorage.getItem("userinfoid"),
			"close_door_picture" : obj4.close_door_picture,
			"ctn_id" : obj4.ctn_id,
		},
		"dataType" : "json",
		"url" : interface_url + "?c=QbzxOperation&a=closedoor", // PHP数据库校验用户名和密码是否正常
		"success" : function(data) {
			if (data['code'] == 0) {
				// 清空输入的数据
				// alert("上传全关门成功！");
				deleteRow(upLoadingTableId);
			} else {
				justep.Util.hint("上传全关门失败: " + data['msg'], {
					"delay" : normerHintDelay,
					"style" : "color:red;"
				});
			}
		},
		"error" : function() {
			// if (isAllLasrt == true) {
			// alert("连接服务器异常，还有缓存存在！！！");
			// justep.Shell.showPage("working_cfs");
			//
			// }
			// alert("上传失败！");
		}
	});
}

/**
 * 上传QBZ铅封
 */
function upQBZXForeCasrQF(ctnData, upLoadingTableId, upLoadingData_ctnid) {
	var url = interface_url + "?c=QbzxOperation&a=operationFinish";
	var obj5 = JSON.parse(ctnData);
	// alert("上传的是否是暂不铅封数据：" + localStorage.getItem("isStop" + obj5.ctn_id));
	// if (localStorage.getItem("isStop" + obj5.ctn_id) == "true") {
	// alert("暂不铅封借口");
	// url = interface_url + "?c=QbzxOperation&a=operation_temporarily_seal";
	// }
	$.ajax({
		"type" : "post",
		"async" : false,
		"data" : {
			"remark" : obj5.remark,
			"uid" : localStorage.getItem("userinfoid"),
			"sealno" : obj5.sealno,
			"ctn_id" : obj5.ctn_id,
			"seal_picture" : obj5.seal_picture,
			"cargo_weight" : obj5.cargo_weight
		},
		"dataType" : "json",
		"url" : url, // PHP数据库校验用户名和密码是否正常
		"success" : function(data) {
			if (data['code'] == 0) {
				// 清空输入的数据
				deleteRow(upLoadingTableId, true, upLoadingData_ctnid);
				// deleteRow(upLoadingTableId, true, upLoadingData_ctnid);
				// justep.Shell.showPage("working_cfs");
				// 暂时不铅封
				// if (localStorage.getItem("isStop" + obj5.ctn_id) == "true") {
				// alert("暂时不铅封上传成功!")
				// localStorage.removeItem("isStop" + obj5.ctn_id);
				// }
			} else {
				justep.Util.hint("上传铅封失败: " + data['msg'], {
					"delay" : normerHintDelay,
					"style" : "color:red;"
				});
			}
		},
		"error" : function() {
			// if (isAllLasrt == true) {
			// alert("连接服务器异常，还有缓存存在！！！");
			// justep.Shell.showPage("working_cfs");
			// }
			// alert("上传失败！");
		}
	});
}

/**
 * 上传QBZ补充照片
 */
function upQBZXsupplementary(ctnData, upLoadingTableId, upLoadingData_ctnid) {
	var me = this;
	var obj6 = JSON.parse(ctnData);
	var arry6 = new Array();
	if (obj6.supplement_picture != "") {
		arry6 = obj6.supplement_picture.split("----------");
	}
	// deleteRow(upLoadingTableId);
	$.ajax({
		"type" : "post",
		"async" : false,
		"data" : {
			"operation_id" : obj6.operation_id,
			"supplement_picture" : arry6,
			"ctn_id" : obj6.ctn_id
		},
		"dataType" : "json",
		"url" : interface_url + "?c=QbzxOperation&a=supplement_picture", // PHP数据库校验用户名和密码是否正常
		"success" : function(data) {
			if (data['code'] == 0) {
				// alert("上传补充照片成功");
				// 清空输入的数据
				deleteRow(upLoadingTableId, true, upLoadingData_ctnid);
			} else {
				justep.Util.hint("上传补充照片: " + data['msg'], {
					"delay" : normerHintDelay,
					"style" : "color:red;"
				});
			}
		},
		"error" : function() {
			// if (isAllLasrt == true) {
			// alert("连接服务器异常，还有缓存存在！！！");
			// justep.Shell.showPage("working_cfs");
			// }
			justep.Util.hint("数据传输失败！", {
				"delay" : normerHintDelay,
				"style" : "color:red;"
			});
		}
	});

}

/**
 * 获取QBZX关列表
 */
function getQBZXUrlAreadingData(me_s, guanListCtnId) {
	var me = this;
	$.ajax({
		"type" : "post",
		"async" : false,
		"data" : {
			"ctn_id" : guanListCtnId
		},
		"dataType" : "json",
		"url" : interface_url + "?c=QbzxOperation&a=getLevelList", // PHP数据库校验用户名和密码是否正常
		"success" : function(data) {

			if (eval(data['list']).length > 0) {
				// alert(data['list'][eval(data['list']).length - 1]["billno"]);
				var billno = data['list'][eval(data['list']).length - 1]["billno"]
				var ship_id = data['list'][eval(data['list']).length - 1]["ship_id"];
				var car = data['list'][eval(data['list']).length - 1]["car"];
				var location_id = data['list'][eval(data['list']).length - 1]["location_id"];
				var transport = data['list'][eval(data['list']).length - 1]["transport"];

				getQBZXLocalName(me_s, billno, ship_id, car, location_id, transport);
			}

			if (data['code'] == 0) {
				if (eval(data['list']).length == 0) {
					var contents = me_s.comp('contents1');
					contents.to(1);
				}

				me_s.getElementByXid("span10").innerText = "";
				LevelListData.loadData(data['list']);
			} else {
				justep.Util.hint(data['msg'], {
					"delay" : normerHintDelay
				});
			}
		},
		"error" : function() {
			justep.Util.hint("网络连接异常，获取关列表失败!", {
				"delay" : normerHintDelay,
				"style" : "color:red;"
			});
			fleshAndReLoad = 2;
		}
	});
}

/**
 * QBZX获取场地显示船名
 */
function getQBZXLocalName(me_s, billno, billno, ship_id, car, location_id, transport) {
	isgoodsbad = me_s.comp("isgoodsbad");
	shiplist = me_s.comp('shiplist');
	localnameData = me_s.comp('localnameData');
	var uid = localStorage.getItem('userinfoid');
	$.ajax({
		"type" : "post",
		"timeout" : 6000,
		"async" : false,
		"data" : {
			"billno" : billno
		},
		"dataType" : "json",
		"url" : interface_url + "?c=QbzxOperation&a=getShipListByBill", // PHP数据库校验用户名和密码是否正常
		"success" : function(data) {
			shiplist.loadData(data['content']);
		},
		"complete" : function(XMLHttpRequest, status) {
			if (status == 'timeout' || status == 'error') {
				var qbjobinstructionid = localStorage.getItem("qbjobinstructionid");
				var cache_shiplist = JSON.parse(localStorage.getItem(billno));
				shiplist.loadData(cache_shiplist);
			}
		}
	});

	// 获取场地
	$.ajax({
		"type" : "post",
		"timeout" : 6000,
		"async" : false,
		"data" : {
			"billno" : billno
		},
		"dataType" : "json",
		// http://121.41.22.2/tally/app.php?c=Qbzx&a=getLocationListByBill
		"url" : interface_url + "?c=QbzxOperation&a=getLocationListByBill", // PHP数据库校验用户名和密码是否正常
		"success" : function(data) {
			localnameData.loadData(data['content']);
		},
		"complete" : function(XMLHttpRequest, status) {
			if (status == 'timeout' || status == 'error') {
				var qbjobinstructionid = localStorage.getItem("qbjobinstructionid");
				var cache_shiplist = JSON.parse(localStorage.getItem(billno + "localname"));
				localnameData.loadData(cache_shiplist);
			}
		}
	});

	isgoodsbad.setValue("orderNo", billno);
	isgoodsbad.setValue("transport", transport);
	isgoodsbad.setValue("car", car);
	isgoodsbad.setValue("shipname", ship_id);
	isgoodsbad.setValue("operationlocationinfoid", location_id);
}

/**
 * QBZX选择提单号触发事件显示船名
 */
function selectChange(me_s) {
	shiplist = me_s.comp('shiplist');
	billno = me_s.getElementByXid('select1').value;
	localnameData = me_s.comp('localnameData');
	$.ajax({
		"type" : "post",
		"timeout" : 3000,
		"data" : {
			"billno" : billno
		},
		"dataType" : "json",
		// http://121.41.22.2/tally/app.php?c=Qbzx&a=getLocationListByBill
		// http://121.41.22.2/tally/app.php?c=Qbzx&a=getShipListByBill
		"url" : interface_url + "?c=QbzxOperation&a=getShipListByBill", // PHP数据库校验用户名和密码是否正常
		"success" : function(data) {
			// alert(data)
			shiplist.loadData(data['content']);
		},
		"complete" : function(XMLHttpRequest, status) {
			if (status == 'timeout' || status == 'error') {
				var cache_shiplist = JSON.parse(localStorage.getItem(billno));
				shiplist.loadData(cache_shiplist);
			}
		}
	});

	// 获取场地
	$.ajax({
		"type" : "post",
		"timeout" : 3000,
		"data" : {
			"billno" : billno
		},
		"dataType" : "json",
		// http://121.41.22.2/tally/app.php?c=Qbzx&a=getLocationListByBill
		"url" : interface_url + "?c=QbzxOperation&a=getLocationListByBill", // PHP数据库校验用户名和密码是否正常
		"success" : function(data) {
			localnameData.loadData(data['content']);
		},
		"complete" : function(XMLHttpRequest, status) {
			if (status == 'timeout' || status == 'error') {
				var cache_shiplist = JSON.parse(localStorage.getItem(billno + "localname"));
				localnameData.loadData(cache_shiplist);
			}
		}
	});
}

/**
 * 删除QBZX关操作
 */
function deleteQBZXGuanLast(me_s, GuanLastUId, GuanLastOId, lastLevelID) {
	LevelListData = me_s.comp("workingDetailsData");
	// alert("用户ID：" + GuanLastUId + "\n操作ID: " + GuanLastOId + "\nLevelID: " +
	// lastLevelID);
	$.ajax({
		"type" : "post",
		"async" : false,
		"data" : {
			"uid" : GuanLastUId,
			"operation_id" : GuanLastOId,
			"level_id" : lastLevelID
		},
		"dataType" : "json",
		"url" : interface_url + "?c=QbzxOperation&a=delLevel",
		"success" : function(data) {
			if (data['code'] == 0) {
				justep.Util.hint("删除成功！", {
					"delay" : 1000
				});
				if (localStorage.getItem(localStorage.getItem('id') + "level_num") > 0) {
					localStorage.setItem(localStorage.getItem('id') + "level_num", Number(localStorage.getItem(localStorage.getItem('id') + "level_num")) - 1);
					me_s.getElementByXid("span14").innerText = Number(localStorage.getItem(localStorage.getItem('id') + "level_num")) + 1;
				}
				LevelListData.refreshData();
			} else {
				delete_slige(me_s, localStorage.getItem('id'));
			}
			// me.workingDetailsData.refreshData();
		},
		"error" : function() {
			// justep.Util.hint("数据传输失败！", {"delay" : normerHintDelay,"style" :
			// "color:red;"});
		},
		"complete" : function(XMLHttpRequest, status) {
			if (status != "success") {
				switch (fleshAndReLoad) {
				case 0:
					justep.Util.hint("数据不同步，请刷新", {
						"delay" : normerHintDelay
					});
					break;
				case 1:
					delete_slige(me_s, localStorage.getItem('id'));
					break;
				default:
					break;
				}
			}
		}
	});
}

/**
 * QBZX获取提单号(刷新)
 */
function QBZXGetBlno(me_s, instructionId, setBlno) {
	$.ajax({
		"type" : "post",
		"async" : false,
		"data" : {
			"instruction_id" : instructionId
		},
		"dataType" : "json",
		"url" : interface_url + "?c=QbzxOperation&a=getPlanCargo", // PHP数据库校验用户名和密码是否正常
		"success" : function(data) {
			if (data['code'] == 0) {
				var content = data['content'];
				for (var i = 0; i < content.length; i++) {
					// alert(JSON.stringify(content[i]['shiplist']))
					localStorage.setItem(content[i]['billno'], JSON.stringify(content[i]['shiplist']));
					localStorage.setItem(content[i]['billno'] + "localname", JSON.stringify(content[i]['locationlist']));
					localStorage.setItem("goods" + instructionId, JSON.stringify(content[i]));
				}
				// 保存提单号
				localStorage.setItem("goods" + instructionId, JSON.stringify(data));
				justep.Util.hint("提单号刷新成功！", {
					"delay" : 1000
				});
				setBlno(me_s);
			} else {
				justep.Util.hint(data['msg'], {
					"delay" : 1000
				});
			}
		},
		"error" : function() {
			justep.Util.hint("数据传输失败！", {
				"delay" : 1000
			});
		}
	});
}

/**
 * 上传MtoM开始作业
 */
function upMtoMEmptyCtn(ctnData, upLoadingTableId) {
	var obj1 = JSON.parse(ctnData);
	var arry1 = new Array();
	var arry1 = obj1.damage_img.split("----------");
	if (arry1 == "") {
		arry1 = "[]";
	}
	$.ajax({
		"type" : "post",
		"timeout" : 5000,
		"async" : true,
		"data" : {
			"uid" : localStorage.getItem("userinfoid"),
			"operation_id" : localStorage.getItem("working_details_oid"),
			"ctn_id" : obj1.ctn_id,
			"damage_remark" : obj1.damage_remark,
			"true_sealno" : obj1.true_sealno,
			"door_picture" : obj1.door_picture,
			"seal_picture" : obj1.seal_picture,
			"damage_img" : arry1,
		},
		"dataType" : dataType,
		"url" : interface_url + "?c=DdOperation&a=OperationCheck", // PHP数据库校验用户名和密码是否正常
		"success" : function(data) {
			if (data['code'] == 0) {
				deleteRow(upLoadingTableId);
			} else {
				justep.Util.hint(data['msg'] + "  没有上传", {
					"delay" : normerHintDelay
				});
			}
		},
		"complete" : function(XMLHttpRequest, status) {
			// alert(status);
		}
	});
}

/**
 * 上传MtoM开箱
 */
function upMtoMOpenDoor(ctnData, upLoadingTableId) {
	var me = this;
	var obj2 = JSON.parse(ctnData);
	$.ajax({
		"type" : "post",
		"timeout" : 5000,
		"async" : true,
		"data" : {
			"uid" : localStorage.getItem("userinfoid"),
			"ctn_id" : obj2.ctn_id,
			"cargo_picture" : obj2.cargo_picture,
		},
		"dataType" : "json",
		"url" : interface_url + "?c=DdOperation&a=OpenDoor", // PHP数据库校验用户名和密码是否正常
		"success" : function(data) {
			if (PrintReturnValue) {
				alert(data);
				return;
			}
			if (data['code'] == 0) {
				deleteRow(upLoadingTableId);
			} else {
				justep.Util.hint(data['msg'], {
					"delay" : normerHintDelay
				});
			}
		},
		"complete" : function(XMLHttpRequest, status) {

		}
	});
}

/**
 * 上传MtoM关列表
 */
function upMtoMGuanList(ctnData, upLoadingTableId, isAloneGuan, me_s, guanListCtnId) {
	var me = this;
	var obj3 = JSON.parse(ctnData);
	var arry3_goods = new Array();
	var arry3 = new Array();

	if (obj3.cargo_picture != "") {
		arry3_goods = obj3.cargo_picture.split("----------");
	}
	if (obj3.damage_img != "") {
		arry3 = obj3.damage_img.split("----------");
	}
	$.ajax({
		"type" : "post",
		"timeout" : 5000,
		"async" : true,
		"data" : {
			"blno" : obj3.blno,
			"operation_id" : obj3.operation_id,
			"level_num" : obj3.level_num,
			"num" : obj3.num,
			"cargo_picture" : arry3_goods,
			"damage_num" : obj3.damage_num,
			"damage_img" : arry3
		},
		"dataType" : "json",
		"url" : interface_url + "?c=DdOperation&a=OperationLevel",
		"success" : function(data) {
			if (data['code'] == 0) {
				deleteRow(upLoadingTableId, false, isAloneGuan, me_s, guanListCtnId);
			} else {
				justep.Util.hint(data['msg'], {
					"delay" : normerHintDelay
				});
			}
		},
		"error" : function() {
			if (isAloneGuan) {
				// alert("上传关失败，有缓存加载缓存无缓存不加载！！！");
				select_guan_list(me_s, guanListCtnId);
			}
		}
	});
}

/**
 * 上传MtoM完成作业
 */
function upMtoMFinish(ctnData, upLoadingTableId, upLoadingData_ctnid) {
	var me = this;
	var obj4 = JSON.parse(ctnData);
	var arry4 = new Array();
	if (obj4.damage_after_img != "") {
		arry4 = obj4.damage_after_img.split("----------");
	}
	$.ajax({
		"type" : "post",
		"timeout" : 5000,
		"async" : true,
		"data" : {
			"uid" : localStorage.getItem("userinfoid"),
			"ctn_id" : obj4.ctn_id,
			"empty_picture" : obj4.empty_picture,
			"damage_after_remark" : obj4.damage_after_remark,
			"damage_after_img" : arry4,
			"remark" : obj4.remark
		},
		"dataType" : dataType,
		"url" : interface_url + "?c=DdOperation&a=operationFinish",
		"success" : function(data) {
			if (data['code'] == 0) {
				// 清空输入的数据
				deleteRow(upLoadingTableId);
				// justep.Shell.showPage("working_cfs");
			} else {
				justep.Util.hint(data['msg'], {
					"delay" : normerHintDelay
				});
			}
		},
		"error" : function() {
			// if (isAllLasrt == true) {
			// alert("连接服务器异常，还有缓存存在！！！");
			// justep.Shell.showPage("working_cfs");
			// }
			// alert("上传失败！");
		}
	});

}

function upMtoMsupplementary(ctnData, upLoadingTableId, upLoadingData_ctnid) {
	var me = this;
	var obj6 = JSON.parse(ctnData);
	var arry6 = new Array();
	if (obj6.supplement_picture != "") {
		arry6 = obj6.supplement_picture.split("----------");
	}
	$.ajax({
		"type" : "post",
		"async" : false,
		"data" : {
			"operation_id" : obj6.operation_id,
			"supplement_picture" : arry6,
			"ctn_id" : obj6.ctn_id
		},
		"dataType" : "json",
		"url" : interface_url + "?c=DdOperation&a=supplement_picture", // PHP数据库校验用户名和密码是否正常
		"success" : function(data) {
			if (data['code'] == 0) {
				// alert("上传补充照片成功");
				// 清空输入的数据
				deleteRow(upLoadingTableId, true, upLoadingData_ctnid);
			} else {
				justep.Util.hint("上传补充照片: ", {
					"delay" : normerHintDelay
				});
			}
		},
		"error" : function() {
			// if (isAllLasrt == true) {
			// alert("连接服务器异常，还有缓存存在！！！");
			// justep.Shell.showPage("working_cfs");
			// }
			justep.Util.hint("数据传输失败！", {
				"delay" : normerHintDelay,
				"style" : "color:red;"
			});
		}
	});
}

/**
 * 获取MtoM关列表
 */
function getMtoMUrlAreadingData(me_s, guanListCtnId) {
	$.ajax({
		"type" : "post",
		"async" : true,
		"data" : {
			"ctn_id" : guanListCtnId
		},
		"dataType" : dataType,
		// http://192.168.1.91/xztally/app.php?c=working&a=find&operationid=10&business=qbzx
		"url" : interface_url + "?c=DdOperation&a=getLevelList",// PHP数据库校验用户名和密码是否正常
		"success" : function(data) {
			if (data['code'] == 0) {

				if (eval(data['list']).length == 0) {
					var contents = me_s.comp('contents1');
					contents.to(1);
				} else {

				}
				me_s.getElementByXid("cacheMessage").innerText = "";
				LevelListData.loadData(data['list']);
			} else {
				justep.Util.hint(data['msg'], {
					"delay" : normerHintDelay
				});
			}
		},
		"error" : function() {
			justep.Util.hint("网络连接异常，获取关列表失败!", {
				"delay" : normerHintDelay,
				"style" : "color:red;"
			});
			fleshAndReLoad = 2;
		}
	});
}

/**
 * 删除MtoM关列表最后一关
 */
function deleteMtoMGuanLast(me_s, GuanLastUId, GuanLastOId, lastLevelID) {
	LevelListData = me_s.comp("LevelListData");
	$.ajax({
		"type" : "post",
		"async" : false,
		"data" : {
			"uid" : localStorage.getItem("userinfoid"),
			"operation_id" : GuanLastOId,
			"level_id" : lastLevelID
		},
		"dataType" : "json",
		// http://192.168.1.91/xztally/app.php?c=CfsOperation&a=delLevel
		"url" : interface_url + "?c=DdOperation&a=delLevel", // PHP数据库校验用户名和密码是否正常
		"success" : function(data) {
			if (data['code'] == 0) {
				justep.Util.hint("删除成功！", {
					"delay" : 1000
				});
				if (localStorage.getItem(localStorage.getItem('ctndetails_ID') + "level_num") > 0) {
					localStorage.setItem(localStorage.getItem('ctndetails_ID') + "level_num", Number(localStorage.getItem(localStorage.getItem('ctndetails_ID') + "level_num")) - 1);
					me_s.getElementByXid("span14").innerText = Number(localStorage.getItem(localStorage.getItem('ctndetails_ID') + "level_num")) + 1;
				}
				LevelListData.refreshData();
			} else {
				delete_slige(me_s, localStorage.getItem('ctndetails_ID'));
			}
		},
		"error" : function() {
			// justep.Util.hint("数据传输失败！", {"delay" : normerHintDelay,"style" :
			// "color:red;"});
		},
		"complete" : function(XMLHttpRequest, status) {
			if (status != "success") {
				switch (fleshAndReLoad) {
				case 0:
					justep.Util.hint("数据不同步，请刷新", {
						"delay" : normerHintDelay
					});
					break;
				case 1:
					delete_slige(me_s, localStorage.getItem('ctndetails_ID'));
					break;
				default:
					break;
				}
			}
		}
	});
}

/**
 * MtoM获取提单号(刷新)
 */
function MtoMGetBlno(me_s, plan_id, setBlno) {
	// alert(plan_id)
	$.ajax({
		"type" : "post",
		"async" : false,
		"data" : {
			"plan_id" : plan_id
		},
		"dataType" : "json",
		"url" : interface_url + "?c=DdOperation&a=getblno", // PHP数据库校验用户名和密码是否正常
		"success" : function(data) {
			// alert(data);
			if (data['code'] == 0) {
				// 保存提单号
				localStorage.setItem("working_details_blno" + plan_id, JSON.stringify(data['blno']));
				// alert(localStorage.getItem("working_details_blno" +
				// plan_id));
				justep.Util.hint("提单号刷新成功！", {
					"delay" : 1000
				});
				setBlno(me_s);
			} else {
				justep.Util.hint(data['msg'], {
					"delay" : 1000
				});
			}
		},
		"error" : function() {
			justep.Util.hint("数据传输失败！", {
				"delay" : 1000
			});
		}
	});
}

/**
 * CFS、QBZX、MtoM获取箱状态、关号同步后台(刷新)
 */
function GetReflashCTN(moder, ctn_id, reflash) {

	var GetReflashCTN_url = "";
	switch (moder) {
	case 1:
		GetReflashCTN_url = "?c=QbzxOperation&a=getContainerDetail";
		break;
	case 2:
		GetReflashCTN_url = "?c=CfsOperation&a=getContainerDetail";
		break;
	case 3:
		GetReflashCTN_url = "?c=DdOperation&a=getContainerDetail";
		break;
	default:
		alert("我们遇到一个未知错误！");
		break;
	}

	$.ajax({
		"type" : "post",
		"async" : false,
		"data" : {
			"ctn_id" : ctn_id
		},
		"dataType" : "json",
		"url" : interface_url + GetReflashCTN_url, // PHP数据库校验用户名和密码是否正常
		"success" : function(data) {
			if (data['code'] == 0) {
				reflash(moder, ctn_id, data);
			} else {
				justep.Util.hint(data['msg'], {
					"delay" : 1000
				});
			}
		},
		"error" : function() {
			justep.Util.hint("数据传输失败！", {
				"delay" : 1000
			});
		}
	});
}

/**
 * CFS、QBZX、MtoM获取箱状态、关号同步后台(刷新回调)
 */
function reflash_qb_cfs_mtom(moder, ctn_s, data) {
	var content_set = Number(data['content']['step']);
	localStorage.setItem(ctn_s + "level_num", data['content']['num_level']);
	// CFS、QBZX
	if (moder == 1 || moder == 2) {
		if (content_set == 0) {
			insert_status(ctn_s, content_set + 1, false, "Y");
		} else if (content_set == 1 || content_set == 2) {
			insert_status(ctn_s, 2, false, "Y");
		} else {
			insert_status(ctn_s, content_set, false, "Y");
		}

	} else if (moder == 3) {
		// MtoM
		if (content_set == 3) {
			insert_status(ctn_s, content_set, false, "Y");
		} else {
			insert_status(ctn_s, content_set + 1, false, "Y");
		}

	}

}
