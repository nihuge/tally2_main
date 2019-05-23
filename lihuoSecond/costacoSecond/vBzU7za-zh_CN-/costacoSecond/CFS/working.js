define(function(require) {
	require("$UI/costacoSecond/ajax/jquery-1");
	var justep = require("$UI/system/lib/justep");
	var Baas = require("$UI/demo/baas/baas");
	var ShellImpl = require('$UI/system/lib/portal/shellImpl');

	var Model = function() {
		this.step;
		this.ctn_id;
		this.row;
		this.doData;
		this.rows;
		this.qiid;
		this.instruction_id;
		this.containerno;
		this.qbjobcontainerid;
		this.callParent();
		this.fisrtFreshFlag = true;
		this.cache_ctns;
	};
	Model.prototype.button2Click = function(event) {
		var doingData = this.comp("doingData");
		doingData.refreshData();
	};
	Model.prototype.modelActive = function(event) {
		this.doDataCustomRefresh();
		this.doneDataCustomRefresh();
		this.doingDataCustomRefresh();

		var contents = this.comp("contents");
		contents.to(Number(localStorage.getItem("contentIndex")));
		// var active = contents.get('active');
		changeBorderColor(Number(localStorage.getItem("contentIndex")), this);
	};
	// 获取作业中列表
	Model.prototype.doingDataCustomRefresh = function(event) {
		var me = this;
		var uid = localStorage.getItem('userinfoid');
		var doingData = this.comp("doingData");
		if (debugMode) {
			alert("--获取箱列表--" + "\n用户id：" + uid);
		}
		$.ajax({
			"type" : "post",
			"async" : false,
			"data" : {
				"uid" : uid,
				"status" : 2
			},
			"dataType" : "json",
			// http://192.168.1.91/xztally/app.php?c=DdOperation&a=getContainerList
			"url" : interface_url + "?c=CfsOperation&a=getContainerList", // PHP数据库校验用户名和密码是否正常
			"success" : function(data) {
				// alert(data);
				if (PrintReturnValue) {
					alert(data);
					return;
				}
				if (data['code'] == 0) {
					doingData.loadData(data["list"]);
				} else {
					justep.Util.hint(data['msg'], {
						"delay" : normerHintDelay
					});
					doingData.clear();
				}
			},
			"error" : function() {
				justep.Util.hint("数据传输失败！", {
					"delay" : normerHintDelay,
					"style" : "color:red;"
				});
			}
		});

	};
	// 获取完成作业列表
	Model.prototype.doneDataCustomRefresh = function(event) {

		var me = this;
		var uid = localStorage.getItem('userinfoid');
		var doneData = this.comp("doneData");
		if (debugMode) {
			alert("--获取箱列表--" + "\n用户id：" + uid);
		}
		$.ajax({
			"type" : "post",
			"async" : false,
			"data" : {
				"uid" : uid,
				"status" : 3
			},
			"dataType" : "json",
			// http://192.168.1.91/xztally/app.php?c=DdOperation&a=getContainerList
			"url" : interface_url + "?c=CfsOperation&a=getContainerList", // PHP数据库校验用户名和密码是否正常
			"success" : function(data) {
				if (PrintReturnValue) {
					justep.Util.hint(data['msg'], {
						"delay" : normerHintDelay
					});
					return;
				}
				if (data['code'] == 0) {
					doneData.loadData(data["list"]);
				} else {
					justep.Util.hint(data['msg'], {
						"delay" : normerHintDelay
					});
					doneData.clear();
				}
			},
			"error" : function() {
				justep.Util.hint("数据传输失败！", {
					"delay" : normerHintDelay,
					"style" : "color:red;"
				});
			}
		});

	};
	// 获取未接单列表
	Model.prototype.doDataCustomRefresh = function(event) {
		var me = this;
		var uid = localStorage.getItem('userinfoid');
		me.doData = this.comp("doData");
		if (debugMode) {
			alert("--获取箱列表--" + "\n用户id：" + uid);
		}
		$.ajax({
			"type" : "post",
			"async" : false,
			"data" : {
				"uid" : uid,
				"status" : 1
			},
			"dataType" : "json",
			// http://192.168.1.91/xztally/app.php?c=DdOperation&a=getContainerList
			"url" : interface_url + "?c=CfsOperation&a=getContainerList", // PHP数据库校验用户名和密码是否正常
			"success" : function(data) {
				// alert(data)
				if (PrintReturnValue) {
					alert(data);
					return;
				}
				if (data['code'] == 0) {
					me.doData.loadData(data["list"]);
				} else {
					justep.Util.hint(data['msg'], {
						"delay" : normerHintDelay
					});
					me.doData.clear();
				}
			},
			"error" : function() {
				justep.Util.hint("数据传输失败！", {
					"delay" : normerHintDelay,
					"style" : "color:red;"
				});
			}
		});
	};
	Model.prototype.li1Click = function(event) {
		// justep.Shell.showPage("working_details.w");
		// var doData = this.comp("doData");
		var containerno_id = event.bindingContext.$object.val('id');
		this.instruction_id = event.bindingContext.$object.val('instruction_id');
		var row1 = event.bindingContext.$object;
		this.row = row1;
		this.containerno = containerno_id;
		this.comp("messageDialog").show({
			"title" : "温馨提示",
			"message" : "是否接单？"
		});

	};

	Model.prototype.li3Click = function(event) {
	};

	// 开始作业
	Model.prototype.beginworkClick = function(event) {
		var me = this;
		onDeviceReady("CFS_TABLE");
		// alert(event.bindingContext.$object.val('id'))
		var containerno = event.bindingContext.$object.val('id');
		var operation_id = event.bindingContext.$object.val('operation_id');
		localStorage.setItem("working_details_oid", operation_id);
		var status = event.bindingContext.$object.val('status');
		localStorage.setItem('ctndetails_ID', containerno);
		var instruction_id = event.bindingContext.$object.val('instruction_id');
		localStorage.setItem('working_details_instruction_id', instruction_id);
		localStorage.setItem("working_details_ctnno", event.bindingContext.$object.val('ctnno'));
		localStorage.setItem('ctnstatus', status);
		// 缓存状态
		select_status(beginwork_selectstatus, event.bindingContext.$object.val('id'));

		function beginwork_selectstatus(status) {
			if (Number(status) == 0) {
				insert_status(localStorage.getItem('ctndetails_ID'), "1");
				justep.Shell.showPage("beginworking_firststep_cfs");
			}
			if (Number(status) > 0 && Number(status) != 5) {
				justep.Util.hint("作业已开始,请继续作业！", {
					"delay" : normerHintDelay
				});
			}
			if (Number(status) == 5) {
				justep.Util.hint("作业已完成，请点击装箱作业完成上传！", {
					"delay" : 3000
				});
			}
		}

	};
	// 继续作业
	Model.prototype.ContinueWorkingClick = function(event) {
		var me = this;
		var operation_id = event.bindingContext.$object.val('operation_id');
		var cargo_weight = event.bindingContext.$object.val('cargo_weight');
		var sealno = event.bindingContext.$object.val('sealno');
		var ctnno = event.bindingContext.$object.val('ctnno');
		var instruction_id = event.bindingContext.$object.val('instruction_id');
		var tmp_sealno = event.bindingContext.$object.val('tmp_sealno');
		var is_stop = event.bindingContext.$object.val('is_stop');
		me.step = event.bindingContext.$object.val('step');
		me.ctn_id = event.bindingContext.$object.val('id');
		localStorage.setItem("cargo_weight", cargo_weight);
		localStorage.setItem("sealno", sealno);
		localStorage.setItem("working_details_oid", operation_id);
		localStorage.setItem("working_details_ctnno", ctnno);
		localStorage.setItem('working_details_instruction_id', instruction_id);
		localStorage.setItem('ctndetails_ID', me.ctn_id);
		// 可以改为在接单的时候保存了指令id;后面会用到
		localStorage.setItem('instruction_id' + me.ctn_id, instruction_id);
		// 保存箱状态
		// localStorage.setItem('ctnstatus', status);
		var set_continue = 0;
		// 继续作业时根据状态表跳转
		// var operation_examine =
		// event.bindingContext.$object.val('operation_examine');
		//
		// if (operation_examine == "3") {
		// justep.Shell.showPage("supplementary_cfs");
		// return;
		// }

		// 把暂停作业的箱子恢复作业
		this.ctn_id = event.bindingContext.$object.val('id');
		this.qbzx_operationid = event.bindingContext.$object.val('operation_id');
		var is_stop = event.bindingContext.$object.val('is_stop');
		var tmp_sealno = event.bindingContext.$object.val('tmp_sealno');

		if (is_stop == "Y") {
			if (tmp_sealno != "") {
				me.comp("tmp_sealno").show({
					"title" : "温馨提示",
					"message" : "您的暂时铅封号为：" + tmp_sealno + ",是否继续作业？",
				});
			} else {
				this.tmp_sealnoYes();
			}
		} else {
			showPage(me.ctn_id);
		}
	};
	function showPage(ctn_id) {
		select_status(statusToShellPage, ctn_id);
		function statusToShellPage(status) {
			// set_continue = status;
			// 这是服务器上的状态
			// alert( me_s.step);
			// if (me.step > set_continue) {
			// set_continue = me_s.step;
			// }
			// 获取url上的操作步骤，若无缓存则跳转到url上对应的界面，否则跳转到状态表所对应的缓存
			switch (Number(status)) {
			case 1:
				justep.Shell.showPage("beginworking_firststep_cfs");
				break;
			case 2:
				justep.Shell.showPage("working_details_cfs");
				break;
			case 3:
				justep.Shell.showPage("SealDone_cfs");
				break;
			case 4:
				// justep.Shell.showPage("working_details_cfs");
				justep.Shell.showPage("forecastQF_cfs");
				break;
			case 5:
				// 判断有没有网络
				justep.Util.hint("作业任务完成，上传中...", {
					'delay' : 3000
				});
				readyUpCahce();
				break;

			default:
				// 状态表为空，跳转到空箱作业
				insert_status(localStorage.getItem('ctndetails_ID'), "1");
				justep.Shell.showPage("beginworking_firststep_cfs");
				break;
			}
		}
	}
	// 查看关详情
	Model.prototype.button1Click = function(event) {
		var containerno = event.bindingContext.$object.val('id');
		localStorage.setItem('Done_containerno', containerno)
		var CFS_Done_ctn = event.bindingContext.$object.val('ctnno');
		localStorage.setItem('CFS_Done_ctn', CFS_Done_ctn);
		justep.Shell.showPage("doneboxdetails_cfs");
	};

	Model.prototype.button7Click = function(event) {
		var qbzx_operationid = event.bindingContext.$object.val('qbzx_operationid');
		var sling = this.comp("sling");
		// 关列表
		$.ajax({
			"type" : "get",
			"async" : false,
			"data" : {

			// get提交密码字段
			},
			"dataType" : "json",
			// http://192.168.1.91/xztally/index.php/working/find?operationid=182&business=qbzx
			"url" : interface_url + "?c=working&a=find&operationid=" + qbzx_operationid + "&business=qbzx", // PHP数据库校验用户名和密码是否正常
			"success" : function(data) {
				// 设置删除不提示对话框
				sling.loadData(data);
				sling.refreshData();
			},
			"error" : function() {
				justep.Util.hint("数据传输失败！", {
					"delay" : normerHintDelay,
					"style" : "color:red;"
				});
			}

		});
	};

	Model.prototype.backClick = function(event) {
		var position = localStorage.getItem('position');
		if (position != 11) {
			justep.Shell.showPage("SelectSys");
		} else {
			// justep.Shell.showPage("index_employees_cfs");
			justep.Shell.showPage("SelectSys");
		}
	};

	// 代办按钮
	Model.prototype.backlogClick = function(event) {
		localStorage.setItem("isClick", "true")
		changeBorderColor(0, this);
	};

	// 进行按钮
	Model.prototype.workingClick = function(event) {
		localStorage.setItem("isClick", "true")
		changeBorderColor(1, this);
	};

	// 完工按钮
	Model.prototype.doneClick = function(event) {
		localStorage.setItem("isClick", "true")
		changeBorderColor(2, this);
	};

	// 取消作业
	Model.prototype.cancelworkClick = function(event) {
		var doData = this.comp('doingData')
		var rows = event.bindingContext.$object;
		var uid = localStorage.getItem('userinfoid');
		var ctndetails_ID = event.bindingContext.$object.val('id');
		var qbjobcontainerid = event.bindingContext.$object.val('qbjobcontainerid');
		select_status(cancelwork_status, event.bindingContext.$object.val('id'));
		function cancelwork_status(status) {
			if (Number(status) != 6) {
				// alert("正在作业中，不允许取消!");
				select_cahce(IscacheEmpty);
				function IscacheEmpty(is_Empty) {
					if (is_Empty) {
						$.ajax({
							"type" : "post",
							"async" : false,
							"data" : {
								"uid" : uid,
								"ctn_id" : ctndetails_ID
							},
							"dataType" : "json",
							"url" : interface_url + "?c=CfsOperation&a=cancelOperation", //
							// PHP数据库校验用户名和密码是否正常
							"success" : function(data) {
								if (data['code'] == 0) {
									doData.deleteData(rows);
									justep.Util.hint("取消作业成功！", {
										"delay" : normerHintDelay
									});
									// 删除该箱id的所有数据,数据表和状态表
									deleteALLctn("CFS_TABLE", ctndetails_ID);
									delete_StatusRow("CFS_TABLE_status", ctndetails_ID);
									localStorage.setItem(ctndetails_ID + "level_num", 0);
									localStorage.removeItem(ctndetails_ID + "level_num");
									localStorage.removeItem('average' + ctndetails_ID);
									localStorage.removeItem('select2_' + ctndetails_ID);
								} else {
									justep.Util.hint(data['msg'], {
										"delay" : normerHintDelay
									});

								}

							},
							"error" : function() {
								justep.Util.hint("数据传输失败！", {
									"delay" : normerHintDelay,
									"style" : "color:red;"
								});
							}
						});

					} else {
						justep.Util.hint("有缓存数据，请刷新或点击继续作业完成上传！", {
							"delay" : 3000
						});
					}

				}
			}

			if (Number(status) == 6) {
				justep.Util.hint("作业已完成，不允许取消，请刷新或点击继续作业完成上传！", {
					"delay" : 3000
				});
			}
		}

		// me.select_cahce(cancelwork_Empty, me);
		// function cancelwork_Empty(is_Empty, me_s) {
		// if (is_Empty) {
		// // alert("空的");
		// $.ajax({
		// "type" : "post",
		// "async" : false,
		// "data" : {
		// "uid" : uid,
		// "ctn_id" : ctndetails_ID
		// },
		// "dataType" : "json",
		// "url" : interface_url + "?c=CfsOperation&a=cancelOperation", //
		// // PHP数据库校验用户名和密码是否正常
		// "success" : function(data) {
		// if (data['code'] == 0) {
		// doData.deleteData(rows);
		// alert("取消作业成功！");
		// // 删除该箱id的所有数据,数据表和状态表
		// me_s.db = new DB();
		// me_s.db.onDeviceReady("CFS_TABLE");
		// // me_s.db.deleteALLctn("CFS_TABLE", ctndetails_ID);
		// me_s.db.delete_StatusRow("CFS_TABLE_status", ctndetails_ID);
		// localStorage.setItem(localStorage.getItem('ctndetails_ID') +
		// "level_num", 0);
		// localStorage.removeItem(localStorage.getItem('ctndetails_ID') +
		// "level_num");
		//
		// } else {
		// justep.Util.hint(data['msg'], {"delay" : normerHintDelay});
		// }
		//
		// },
		// "error" : function() {
		// justep.Util.hint("数据传输失败！", {"delay" : normerHintDelay,"style" :
		// "color:red;"});
		// }
		// });
		// } else {
		// alert("有缓存，上传中!");
		// // 回调状态表
		//
		// }
		// }

	};

	// 查询tableName录入缓存,拿到第一条数据
	// setup=1.开始作业；2继续作业；3.取消作业；
	Model.prototype.select_cahce = function(isEmpty, me_s) {
		var tableName = "CFS_TABLE";
		var tableName_status = tableName + "_status";
		me_s.db = window.sqlitePlugin.openDatabase({
			name : "cost.db"
		});
		me_s.db.transaction(function(tx) {
			tx.executeSql('CREATE TABLE IF NOT EXISTS ' + tableName + '(id integer primary key,ctnid varchar,oprationdata varchar,status varchar)');
			tx.executeSql('CREATE TABLE IF NOT EXISTS ' + tableName_status + '(ctnid varchar,status varchar)');
		});
		selectSql_cahce = "select * from CFS_TABLE where ctnid = " + localStorage.getItem('ctndetails_ID');
		me_s.db.transaction(function(tx) {
			tx.executeSql(selectSql_cahce, [], function(tx, res) {
				if (res.rows.length > 0) {
					isEmpty(false, me_s);
				} else {
					isEmpty(true, me_s);
				}
			}, function(e) {
				alert("ERROR: select_cahce");
			});
		});
	};

	// 预定铅封
	Model.prototype.button4Click = function(event) {
		var flag = 1;
		var sealno = event.bindingContext.$object.val('sealno');
		var cargo_weight = event.bindingContext.$object.val('cargo_weight');
		var ctndetails_ID = event.bindingContext.$object.val('id');
		localStorage.setItem('ctndetails_ID', ctndetails_ID);
		localStorage.setItem('sealno', sealno);
		localStorage.setItem('flagQF', flag);
		localStorage.setItem('cargo_weight', cargo_weight);
		justep.Shell.showPage("forecastQF_cfs");
	};

	// 接单
	Model.prototype.messageDialogYes = function(event) {
		var me = this;
		var uid = localStorage.getItem('userinfoid');
		var qiid = this.qiid;
		var containerno = this.containerno;
		var row = this.row;
		// justep.Shell.showPage("working_details.w");
		var doData = this.comp("doData");
		// var qiid = event.bindingContext.$object.val('qbjobinstructionid');
		// var containerno = event.bindingContext.$object.val('containerno');
		// alert(containerno);
		// alert(me.instruction_id);
		// 跳转到拍摄空箱照片的界面
		// window.location.href = "dispatchingOrderDetails.w"
		$.ajax({
			"type" : "post",
			"async" : false,
			"data" : {
				"uid" : uid,
				"ctn_id" : containerno,
				"instruction_id" : me.instruction_id
			},
			"dataType" : "json",
			// http://192.168.1.91/xztally/index.phpc=DdOperation&a=ordertaking
			"url" : interface_url + "?c=CfsOperation&a=ordertaking", // PHP数据库校验用户名和密码是否正常
			"success" : function(data) {
				if (data['code'] == 0) {
					// 保存平均最大载重量，空箱用到
					// localStorage.setItem('average' + containerno,
					// data['average']);
					doData.deleteData(row);
					me.doingDataCustomRefresh();
					localStorage.setItem(containerno + "level_num", data['level_num']);
					var content_set = Number(data['step']);
					if (content_set == 0) {
						insert_status(containerno, content_set + 1);
					} else if (content_set == 1 || content_set == 2) {
						insert_status(containerno, 2);
					} else {
						insert_status(containerno, content_set);
					}
				} else {
					justep.Util.hint(data['msg'], {
						"delay" : normerHintDelay
					});
				}
			},
			"error" : function(data) {

				justep.Util.hint("数据传输失败！", {
					"delay" : normerHintDelay,
					"style" : "color:red;"
				});

			}
		});
		// 获取提单号，并存进locat中，在作业录入关列表事放进去
		$.ajax({
			"type" : "post",
			"async" : false,
			"data" : {
				"instruction_id" : me.instruction_id
			},
			"dataType" : "json",
			"url" : interface_url + "?c=CfsOperation&a=getCargoList", // PHP数据库校验用户名和密码是否正常
			"success" : function(data) {
				if (data['code'] == 0) {
					// 保存提单号
					localStorage.setItem(me.instruction_id, JSON.stringify(data['list']));
					// 保存劳务队信息
					// me.saveLST();
				} else {
					justep.Util.hint(data['msg'], {
						"delay" : normerHintDelay
					});

				}
			},
			"error" : function() {
				justep.Util.hint("数据传输失败！", {
					"delay" : normerHintDelay,
					"style" : "color:red;"
				});

			}

		});

	};

	Model.prototype.saveLST = function() {
		$.ajax({
			"type" : "post",
			"async" : false,
			"dataType" : "json",
			"url" : interface_url + "?c=LaborTeam&a=getLaborTeamList",
			"success" : function(data) {
				if (data['code'] == 0) {
					localStorage.setItem("LST", JSON.stringify(data['list']));
				} else {
					justep.Util.hint(data['msg'], {
						"delay" : normerHintDelay
					});
				}
			},
			"error" : function() {
				justep.Util.hint("数据传输失败！", {
					"delay" : normerHintDelay,
					"style" : "color:red;"
				});
			}
		});

	}

	Model.prototype.messageDialogNo = function(event) {

	};

	Model.prototype.modelLoad = function(event) {
		// this.doDataCustomRefresh();
		onDeviceReady("CFS_TABLE");
		uid = localStorage.getItem('userinfoid');
	};

	// 箱子残损操作
	Model.prototype.ctndamageClick = function(event) {
		this.doData = this.comp('doingData')
		this.ctn_id = event.bindingContext.$object.val('id');
		this.rows = event.bindingContext.$object;
		this.comp("messageDialog1").show({
			"title" : "温馨提示",
			"message" : "残损箱将会从作业指令中删除，确认箱子残损吗？"
		});
	};

	// 确认箱子残损
	Model.prototype.messageDialog1Yes = function(event) {
		var me = this;
		var uid = localStorage.getItem('userinfoid');
		$.ajax({
			"type" : "post",
			"async" : false,
			"data" : {
				"uid" : uid,
				"ctn_id" : me.ctn_id
			},
			"dataType" : "json",
			"url" : interface_url + "?c=CfsOperation&a=cancelContainer", // PHP数据库校验用户名和密码是否正常
			"success" : function(data) {
				if (data['code'] == 0) {
					me.doData.deleteData(me.rows);

				} else {
					justep.Util.hint(data['msg'], {
						"delay" : normerHintDelay
					});
				}
			},
			"error" : function() {
				justep.Util.hint("数据传输失败！", {
					"delay" : normerHintDelay,
					"style" : "color:red;"
				});
			}

		});
	};

	// 暂停作业
	Model.prototype.stopworkClick = function(event) {
		this.ctn_id = event.bindingContext.$object.val('id');
		this.comp("stopsealno").show({
			"title" : "输入暂停作业铅封号",
			"message" : "可选填",
		});
	};

	Model.prototype.stopsealnoOK = function(event) {
		var me = this;
		var tmp_sealno = event.input;// 获取临时铅封号
		var uid = localStorage.getItem('userinfoid');
		var doData = this.comp('doingData');

		// 上传缓存
		readyUpCahce("", sc_AllData, "", "true");
		function sc_AllData() {
			$.ajax({
				"type" : "POST",
				"async" : false,
				"data" : {
					"ctn_id" : me.ctn_id,
					"uid" : uid,
					"tmp_sealno" : tmp_sealno
				},
				"dataType" : "json",
				"url" : interface_url + "?c=CfsOperation&a=stopOperation",
				"success" : function(data) {
					if (data['code'] == 0) {
						doData.refreshData();
					} else {
						justep.Util.hint(data['msg'], {
							"delay" : normerHintDelay
						});
					}
				},
				"error" : function() {
					justep.Util.hint("数据传输失败！", {
						"delay" : normerHintDelay,
						"style" : "color:red;"
					});
				}

			});
		}
	};
	Model.prototype.tmp_sealnoYes = function(event) {
		var me = this;
		var uid = localStorage.getItem('userinfoid');
		var doData = this.comp('doingData');
		$.ajax({
			"type" : "post",
			"async" : false,
			"data" : {
				"uid" : uid,
				"ctn_id" : me.ctn_id,
			},
			"dataType" : "json",
			"url" : interface_url + "?c=CfsOperation&a=resumeOperation",
			"success" : function(data) {
				if (data['code'] == 0) {
					showPage(me.ctn_id);
				} else {
					justep.Util.hint(data['msg'], {
						"delay" : normerHintDelay
					});
					return;
				}
			},
			"error" : function() {
				justep.Util.hint("数据传输失败！", {
					"delay" : normerHintDelay,
					"style" : "color:red;"
				});
				return;
			}

		});
	};

	// 上传所有的缓存数据
	Model.prototype.finishWorkClick = function(event) {
		this.db.upCahceIsEmpty(event.bindingContext.$object.val('id'));
	};

	Model.prototype.begin = function() {
		// alert("begin");
		this.getElementByXid("beginwork").style.display = "inline";
		this.getElementByXid("ContinueWorking").style.display = "none";
		this.getElementByXid("finishWork").style.display = "none";
	};

	// Model.prototype.each = function(ctnid) {
	// var me = this;
	// this.doData.each(function(param) {
	// var row = param.row;
	// var ctn_id = row.val('id');
	// // 不显示fTitle中包含2的数据
	// if (ctn_id == ctnid)
	// me.doData.setValue('step', 5, row);
	// me.getElementByXid("ContinueWorking").style.display = "none";
	// me.getElementByXid("beginwork").style.display = "none";
	// });
	// }

	Model.prototype.btn_finshi = function() {
		this.getElementByXid("finishWork").style.display = "inline";
		this.getElementByXid("beginwork").style.display = "none";
		this.getElementByXid("ContinueWorking").style.display = "none";
	};

	// 提示作业就不许取消了
	Model.prototype.messageDialog3Yes = function(event) {

	};

	Model.prototype.messageDialog3No = function(event) {

	};

	Model.prototype.contentsActiveChanged = function(event) {
		var isClick = localStorage.getItem("isClick");
		if (isClick == "true") {
			localStorage.setItem("isClick", "false");
			return;
		}
		var me = this;
		var contents = me.comp("contents");
		var active = contents.get('active');
		changeBorderColor(active, me);
	};

	// 按钮的选定底边框的改变
	function changeBorderColor(contentNum, me_s) {
		var me = me_s;
		localStorage.setItem("contentIndex", contentNum);
		switch (contentNum) {
		case 0:
			me.getElementByXid("do_line").style.borderColor = "#1793EE";
			me.getElementByXid("btn_do").style.color = "#EC6941";
			me.getElementByXid("doing_line").style.borderColor = "#FFFFFF";
			me.getElementByXid("btn_doing").style.color = "#465A82";
			me.getElementByXid("doed_line").style.borderColor = "#FFFFFF";
			me.getElementByXid("btn_doed").style.color = "#465A82";
			// Do(me_s);
			break;
		case 1:
			me.getElementByXid("do_line").style.borderColor = "#FFFFFF";
			me.getElementByXid("btn_do").style.color = "#465A82";
			me.getElementByXid("doing_line").style.borderColor = "#1793EE";
			me.getElementByXid("btn_doing").style.color = "#EC6941";
			me.getElementByXid("doed_line").style.borderColor = "#FFFFFF";
			me.getElementByXid("btn_doed").style.color = "#465A82";
			// Doing(me_s);
			break;
		case 2:
			me.getElementByXid("do_line").style.borderColor = "#FFFFFF";
			me.getElementByXid("btn_do").style.color = "#465A82";
			me.getElementByXid("doing_line").style.borderColor = "#FFFFFF";
			me.getElementByXid("btn_doing").style.color = "#465A82";
			me.getElementByXid("doed_line").style.borderColor = "#1793EE";
			me.getElementByXid("btn_doed").style.color = "#EC6941";
			// Doed(me_s);
			break;
		default:
			me.getElementByXid("do_line").style.borderColor = "#1793EE";
			me.getElementByXid("btn_do").style.color = "#EC6941";
			me.getElementByXid("doing_line").style.borderColor = "#FFFFFF";
			me.getElementByXid("btn_doing").style.color = "#465A82";
			me.getElementByXid("doed_line").style.borderColor = "#FFFFFF";
			me.getElementByXid("btn_doed").style.color = "#465A82";
			// Do(me_s);
			break;
		}
	}

	Model.prototype.ContinueWorking1Click = function(event) {

	};

	Model.prototype.image4Click = function(event) {
		var doingData = this.comp("doingData");
		var getshowHide = event.bindingContext.$object.val('showHide');
		if (getshowHide) {
			event.bindingContext.$object.val('showHide', false);
		} else {
			event.bindingContext.$object.val('showHide', true);
		}
	};

	// 刷新同步后台
	Model.prototype.reflashClick = function(event) {
		localStorage.setItem("ModerCahce", 2);
		localStorage.setItem("ModerCahce_ctn_id", event.bindingContext.$object.val('id'));
		readyUpCahce();

	};

	Model.prototype.clear_cacheClick = function(event) {
		// 获取当前工作中列表的箱子的箱号
		var ctns_array = new Array();
		var ContainerListData = this.comp('doingData');
		ContainerListData.each(function(param) {
			ctns_array.push(param.row.val('id'));
		});
		// 拼接箱号
		var ctns = "("
		for (var int = 0; int < ctns_array.length; int++) {
			if (int != ctns_array.length - 1) {
				ctns = ctns + ctns_array[int] + ",";
			} else {
				ctns = ctns + ctns_array[int] + ")";
			}
		}
		// 查询所有的缓存
		select_cache_each(this, "clear_cache_dialog", ctns);
	};

	Model.prototype.clear_cache_dialogYes = function(event) {
		delete_cache_each(this.cache_ctns);
	};

	return Model;
});
