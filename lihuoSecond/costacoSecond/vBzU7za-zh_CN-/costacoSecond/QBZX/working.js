define(function(require) {
	require("$UI/costacoSecond/ajax/jquery-1");
	// require("cordova!org.apache.cordova.network-information");
	var justep = require("$UI/system/lib/justep");
	var Baas = require("$UI/demo/baas/baas");
	var ShellImpl = require('$UI/system/lib/portal/shellImpl');

	var Model = function() {
		this.step;
		this.uid;
		this.row;
		this.daData;
		this.rows;
		this.qiid;
		this.containerno;
		this.qbzx_operationid;
		this.ctn_id;
		this.qbjobinstructionid;
		this.callParent();
		this.cache_ctns;
	};

	// 获取当前箱子的数据并保存
	Model.prototype.setParameter = function(event) {
		var ctn_id = event.bindingContext.$object.val('id');
		var ctnno = event.bindingContext.$object.val('ctnno');
		var is_stop = event.bindingContext.$object.val('is_stop');
		var instruction_id = event.bindingContext.$object.val('instruction_id');
		var cargo_weight = event.bindingContext.$object.val('cargo_weight');
		var operation_id = event.bindingContext.$object.val('operation_id');
		var sealno = event.bindingContext.$object.val('sealno');
		var tmp_sealno = event.bindingContext.$object.val('tmp_sealno');
		localStorage.setItem('id', ctn_id);
		localStorage.setItem('ctnno', ctnno);
		localStorage.setItem('is_stop', is_stop);
		localStorage.setItem('tmp_sealno', tmp_sealno);
		localStorage.setItem('instruction_id', instruction_id);
		localStorage.setItem('cargo_weight', cargo_weight);
		localStorage.setItem('operation_id', operation_id);
		localStorage.setItem('sealno', sealno);
	}
	// 获取进行中箱子列表
	Model.prototype.DoingContainerListDataCustomRefresh = function(event) {

		var me = this;
		var uid = localStorage.getItem('userinfoid');
		var DoingContainerListData = this.comp("DoingContainerListData");
		var ajaxTimeOut = $.ajax({
			"type" : "POST",
			"async" : false,
			"data" : {
				"uid" : uid,
				"status" : 2
			},
			"dataType" : "json",
			"url" : interface_url + "?c=QbzxOperation&a=getContainerList", // PHP数据库校验用户名和密码是否正常
			"success" : function(data) {
				// alert(data);
				// return;
				if (data['code'] == 0) {
					localStorage.setItem("working_boxlist", JSON.stringify(data['list']));
					DoingContainerListData.loadData(data['list']);
				} else {
					justep.Util.hint(data['msg'], {
						"delay" : normerHintDelay
					});
					DoingContainerListData.clear();
				}
			},
			"complete" : function(XMLHttpRequest, status) {
				if (status == 'timeout' || status == 'error') {
					var data = JSON.parse(localStorage.getItem("working_boxlist"));
					DoingContainerListData.loadData(data);
					// ajaxTimeOut.abort();
				}
			}
		});

	};
	// 获取完成业箱子列表
	Model.prototype.DoneContainerListDataCustomRefresh = function(event) {

		var me = this;
		var uid = localStorage.getItem('userinfoid');
		var DoneContainerListData = this.comp("DoneContainerListData");
		var ajaxTimeOut = $.ajax({
			"type" : "POST",
			"async" : false,
			"data" : {
				"uid" : uid,
				"status" : 3
			},
			"dataType" : "json",
			"url" : interface_url + "?c=QbzxOperation&a=getContainerList", // PHP数据库校验用户名和密码是否正常
			"success" : function(data) {
				// alert(data);
				// return;
				if (data['code'] == 0) {
					localStorage.setItem("worked_boxlist", JSON.stringify(data['list']));
					DoneContainerListData.loadData(data['list']);
				} else {
					// alert(data['msg']);
					DoneContainerListData.clear();
				}
			},
			"complete" : function(XMLHttpRequest, status) {
				if (status == 'timeout' || status == 'error') {
					var data = JSON.parse(localStorage.getItem("worked_boxlist"));
					DoneContainerListData.loadData(data);
					// ajaxTimeOut.abort();
				}
			}
		});

	};
	// 获取未作业箱子列表
	Model.prototype.DoContainerListDataCustomRefresh = function(status) {
		var me = this;
		var uid = localStorage.getItem('userinfoid');
		var DoContainerListData = this.comp("DoContainerListData");
		var ajaxTimeOut = $.ajax({
			"type" : "POST",
			"async" : false,
			"data" : {
				"uid" : uid,
				"status" : 1
			},
			"dataType" : "json",
			"url" : interface_url + "?c=QbzxOperation&a=getContainerList", // PHP数据库校验用户名和密码是否正常
			"success" : function(data) {
				// alert(data);
				// return;
				if (data['code'] == 0) {
					localStorage.setItem("work_boxlist", JSON.stringify(data['list']));
					DoContainerListData.loadData(data['list']);
				} else {
					justep.Util.hint(data['msg'], {
						"delay" : normerHintDelay
					});
					DoContainerListData.clear();
				}
			},
			"complete" : function(XMLHttpRequest, status) {
				if (status == 'timeout' || status == 'error') {
					var data = JSON.parse(localStorage.getItem("work_boxlist"));
					DoContainerListData.loadData(data);
					// ajaxTimeOut.abort();
				}
			}
		});
	};

	Model.prototype.li1Click = function(event) {
		// justep.Shell.showPage("working_details.w");
		var ContainerListData = this.comp("DoContainerListData");
		var qiid1 = event.bindingContext.$object.val('instruction_id');
		var containerno1 = event.bindingContext.$object.val('id');
		// var ctn_step = event.bindingContext.$object.val('step');
		var row1 = event.bindingContext.$object;
		this.qbzx_operationid = event.bindingContext.$object.val('operation_id');
		// this.step = ctn_step;
		this.qiid = qiid1;
		this.row = row1;
		this.containerno = containerno1;
		this.comp("messageDialog").show({
			"title" : "温馨提示",
			"message" : "是否接单？"
		});
	};

	// 开始作业
	Model.prototype.beginworkClick = function(event) {
		var me = this;
		this.setParameter(event);
		var status = event.bindingContext.$object.val('status');
		localStorage.setItem('ctnstatus', status);
		// justep.Shell.showPage("OperationCheck");
		localStorage.setItem("instruction_id" + event.bindingContext.$object.val('id'), event.bindingContext.$object.val('instruction_id'));
		// 缓存状态
		select_status(beginwork_selectstatus, event.bindingContext.$object.val('id'), me);
		function beginwork_selectstatus(status, me_s) {
			if (Number(status) == 0) {
				insert_status(localStorage.getItem('id'), "1");
				justep.Shell.showPage("OperationCheck");
			}
			if (Number(status) > 0 && Number(status) != 5) {
				alert("作业已开始,请继续作业！")
			}
			if (Number(status) == 5) {
				alert("作业已完成，请刷新或点击继续作业完成上传！");
			}
		}
	};

	// 查看关详情
	Model.prototype.ctndetailsClick = function(event) {
		this.setParameter(event);
		var QBZX_Done_ctn = event.bindingContext.$object.val('ctnno');
		localStorage.setItem('QBZX_Done_ctn', QBZX_Done_ctn);
		justep.Shell.showPage("doneboxdetails");
	};

	Model.prototype.backClick = function(event) {
		var position = localStorage.getItem('position');
		if (position != 11) {
			justep.Shell.showPage("SelectSys");
		} else {
			// justep.Shell.showPage("index_employees");
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
	Model.prototype.button3Click = function(event) {
		var me = this;
		var ContainerListData = this.comp('DoingContainerListData');
		var rows = event.bindingContext.$object;
		var ctn_id = event.bindingContext.$object.val('id');
		this.setParameter(event);
		var uid = localStorage.getItem('userinfoid');
		/*
		 * me.db_QBZX.select_status(cancelwork_status,
		 * event.bindingContext.$object.val('id'), me); function
		 * cancelwork_status(status, me_s) { if (Number(status) != 5) { //
		 * alert("正在作业中，不允许取消!"); me_s.select_cahce(IscacheEmpty, me_s);
		 * function IscacheEmpty(is_Empty, me_ss) { if (is_Empty) { $.ajax({
		 * "type" : "post", "async" : false, "data" : { "uid" : uid, "ctn_id" :
		 * ctn_id }, "dataType" : "json", "url" :
		 * interface_url+"?c=QbzxOperation&a=cancelOperation", //
		 * PHP数据库校验用户名和密码是否正常 "success" : function(data) { if (data['code'] ==
		 * 0) { ContainerListData.deleteData(rows); alert("取消作业成功！"); //
		 * 删除该箱id的所有数据,数据表和状态表 me_ss.db_QBZX = new DB_QB();
		 * me_ss.db_QBZX.onDeviceReady("QBZX_TABLE");
		 * me_ss.db_QBZX.deleteALLctn("QBZX_TABLE", ctn_id);
		 * me_ss.db_QBZX.delete_StatusRow("QBZX_TABLE_status", ctn_id);
		 * localStorage.setItem(localStorage.getItem('id') + "level_num", 0);
		 * localStorage.removeItem(localStorage.getItem('id') + "level_num"); }
		 * else { alert(data['msg']); } }, "error" : function() {
		 * alert("数据传输失败！"); } }); } else { alert("有缓存数据，请刷新或点击继续作业完成上传！"); } } }
		 * if (Number(status) == 5) { alert("作业已完成，不允许取消，请刷新或点击继续作业完成上传！"); } }
		 */
		select_status(cancelwork_status, ctn_id);

		function cancelwork_status(status) {
			if (Number(status) != 5) {
				$.ajax({
					"type" : "POST",
					"async" : false,
					"data" : {
						"uid" : uid,
						"ctn_id" : ctn_id
					},
					"dataType" : dataType,
					"url" : interface_url + "?c=QbzxOperation&a=cancelOperation", // PHP数据库校验用户名和密码是否正常
					"success" : function(data) {
						if (data['code'] == 0) {
							// justep.Util.hint("退单成功！");
							ContainerListData.deleteData(rows);
							deleteALLctn("QBZX_TABLE", ctn_id);
							delete_StatusRow("QBZX_TABLE_status", ctn_id);
							localStorage.setItem(ctn_id + "level_num", 0);
							localStorage.removeItem(ctn_id + "level_num");
							localStorage.removeItem('average' + ctn_id);
							localStorage.removeItem('select1_' + ctn_id);
							// alert(localStorage.getItem('average' +
							// localStorage.getItem('id')))
							// localStorage.removeItem("LST");
						} else if (data['code'] == 209) {
							justep.Shell.showPage("working_details");
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
				justep.Util.hint("装箱已完成，不允许取消!", {
					"delay" : normerHintDelay,
					"style" : "color:red;"
				});
			}
		}

	};

	// 继续作业
	Model.prototype.button9Click = function(event) {
		var me = this;
		this.setParameter(event);
		var ctn_id = event.bindingContext.$object.val('id');
		// alert("箱ID："+ctn_id);
		localStorage.setItem("instruction_id" + ctn_id, event.bindingContext.$object.val('instruction_id'));
		me.step = event.bindingContext.$object.val('step');
		var ContainerListData = this.comp('DoContainerListData');
		// 保存箱状态
		localStorage.setItem('ctnstatus', status);
		var set_continue = 0;
		// 判断是否审核通过
		var operation_examine = event.bindingContext.$object.val('operation_examine');

		if (operation_examine == "3") {
			justep.Shell.showPage("supplementary");
			return;
		}

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
			showPage(ctn_id);
		}

	};
	function showPage(ctn_id) {
		// 继续作业时根据状态表跳转
		select_status(statusToShellPage, ctn_id);
		function statusToShellPage(status) {
			// set_continue = status;
			// 这是服务器上的状态
			// if (me.step > set_continue) {
			// set_continue = me_s.step;
			// }
			// 获取url上的操作步骤，若无缓存则跳转到url上对应的界面，否则跳转到状态表所对应的缓存
			// alert(status);
			switch (Number(status)) {
			case 1:
				justep.Shell.showPage("OperationCheck");
				break;
			case 2:
				justep.Shell.showPage("working_details");
				break;
			case 3:
				justep.Shell.showPage("closedoor");
				break;
			case 4:
				localStorage.setItem('flagQF', 0);
				justep.Shell.showPage("forecastQF");
				break;
			case 5:
				// 判断有没有网络
				// justep.Shell.showPage("forecastQF");
				justep.Util.hint("作业任务完成，上传中...", {
					'delay' : 3000
				});
				readyUpCahce();
				break;
			default:
				insert_status(localStorage.getItem('id'), "1");
				justep.Shell.showPage("OperationCheck");
				break;
			}
		}

	}

	// 核实暂停铅封号继续作业
	Model.prototype.tmp_sealnoYes = function(event) {
		var me = this;
		// alert("恢复作业uid: " + me.uid);
		var ContainerListData = this.comp('DoContainerListData');
		$.ajax({
			"type" : "post",
			"async" : false,
			"data" : {
				"uid" : me.uid,
				"ctn_id" : me.ctn_id,
			},
			"dataType" : "json",
			"url" : interface_url + "?c=QbzxOperation&a=resumeOperation",
			"success" : function(data) {
				if (data['code'] == 0) {
					showPage(me.ctn_id);
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
				return;

			}
		});
	};

	// 预定铅封
	Model.prototype.button4Click = function(event) {
		var flag = 1;
		localStorage.setItem('flagQF', flag);
		this.setParameter(event);
		justep.Shell.showPage("forecastQF");
	};

	// 确认接单
	Model.prototype.messageDialogYes = function(event) {
		var me = this;
		var qiid = this.qiid;
		var containerno = this.containerno;
		var row = this.row;
		var ContainerListData = this.comp("DoContainerListData");
		var uid = localStorage.getItem('userinfoid');
		// alert("指令ID：" + qiid)
		$.ajax({
			"type" : "post",
			"async" : false,
			"data" : {
				"uid" : uid,
				"ctn_id" : containerno,
				"instruction_id" : qiid
			},
			"dataType" : "json",
			"url" : interface_url + "?c=QbzxOperation&a=ordertaking", // PHP数据库校验用户名和密码是否正常
			"success" : function(data) {
				if (data['code'] == 0) {
					// justep.Util.hint("接单成功！");
					ContainerListData.deleteData(row);
					me.savegooddetails(qiid);
					me.DoingContainerListDataCustomRefresh();
					localStorage.setItem(containerno + "level_num", data['level_num']);
					// alert(data['step']);
					// 将步骤插入表中
					var content_set = Number(data['step']);
					if (content_set == 0) {
						insert_status(containerno, content_set + 1);
					} else if (content_set == 1 || content_set == 2) {
						insert_status(containerno, 2);
					} else {
						insert_status(containerno, content_set);
					}
					// 保存平均值
					// localStorage.setItem('average' + containerno,
					// data['average']);
					// alert("平均重量:" + localStorage.getItem('average' +
					// containerno))
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

	Model.prototype.savegooddetails = function(instruction_id) {
		$.ajax({
			"type" : "post",
			"async" : false,
			"data" : {
				"instruction_id" : instruction_id
			},
			"dataType" : "json",
			"url" : interface_url + "?c=QbzxOperation&a=getPlanCargo",
			"success" : function(data) {
				if (data['code'] == 0) {
					var content = data['content'];
					for (var i = 0; i < content.length; i++) {
						// alert(JSON.stringify(content[i]['shiplist']))
						localStorage.setItem(content[i]['billno'], JSON.stringify(content[i]['shiplist']));
						localStorage.setItem(content[i]['billno'] + "localname", JSON.stringify(content[i]['locationlist']));
						localStorage.setItem("goods" + instruction_id, JSON.stringify(content[i]));
					}
					localStorage.setItem("goods" + instruction_id, JSON.stringify(data));
					// alert("goods" + instruction_id) goods119
					// alert(JSON.stringify(data))
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

	Model.prototype.messageDialogNo = function(event) {

	};

	Model.prototype.modelLoad = function(event) {
		// this.ContainerListDataCustomRefresh();
		// onDeviceReady("QBZX_TABLE");
		this.hahah();
	};

	// 箱子残损操作
	Model.prototype.button2Click = function(event) {
		this.ContainerListData = this.comp('DoingContainerListData')
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
		$.ajax({
			"type" : "POST",
			"async" : false,
			"data" : {
				"uid" : me.uid,
				"ctn_id" : me.ctn_id
			},
			"dataType" : "json",
			"url" : interface_url + "?c=QbzxOperation&a=cancelContainer", // PHP数据库校验用户名和密码是否正常
			"success" : function(data) {
				if (data['code'] == 0) {
					justep.Util.hint("操作成功！");
					me.ContainerListData.deleteData(me.rows);
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

	Model.prototype.a2Click = function(event) {
		var instruction_id = event.bindingContext.$object.val('instruction_id');
		localStorage.setItem("loadingRequire", instruction_id);
		this.comp("loadingRequire").open();
	};

	Model.prototype.button6Click = function(event) {
		var list = this.comp('list1');
		var ContainerListData = this.comp('DoContainerListData');
		this.ContainerListDataCustomRefresh(event);
		var Data = this.getTexts();
		// doData.loadData(this.data);
		// doData.refreshData();
		// alert(Data.length)
		// list.refresh();
	};

	Model.prototype.getTexts = function(ctn_no) {
		var me = this;
		var ContainerListData = me.comp('DoContainerListData');
		var ret = [];
		ContainerListData.each(function(param) {
			var row = param.row;
			var containerno = row.val('ctnno');
			// 不显示fTitle中包含2的数据
			if (containerno.indexOf(ctn_no) < 0)
				ret.push(row);
		});
		ContainerListData.deleteData(ret);
		return ret;
	};

	Model.prototype.hahah = function immediately() {
		me = this;
		var element = this.getElementByXid('searchCTN');
		if ("\v" == "v") {
			element.onpropertychange = webChange;
		} else {
			element.addEventListener("input", webChange, false);
		}
		function webChange() {
			me.DoContainerListDataCustomRefresh();
			var upcaseVaule = element.value.toUpperCase()
			me.getTexts(upcaseVaule);
			// if(element.value){document.getElementById("test").innerHTML =
			// element.value};
		}
	}

	// 暂停作业
	Model.prototype.stopworkClick = function(event) {
		this.ctn_id = event.bindingContext.$object.val('id');
		this.qbzx_operationid = event.bindingContext.$object.val('qbzx_operationid');
		this.comp("stopsealno").show({
			"title" : "输入暂停作业铅封号",
			"message" : "可选填",
		});
	};

	Model.prototype.stopsealnoOK = function(event) {
		var me = this;
		var tmp_sealno = event.input;// 获取临时铅封号
		var uid = localStorage.getItem('userinfoid');
		var ContainerListData = this.comp('DoingContainerListData');
		if (debugMode) {
			alert("箱id：" + me.ctn_id + "\n用户id：" + uid + "\n临时铅封号：" + tmp_sealno);
		}
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
				"url" : interface_url + "?c=QbzxOperation&a=stopOperation",
				"success" : function(data) {
					if (data['code'] == 0) {
						justep.Util.hint("暂停作业成功！")
						ContainerListData.refreshData();
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

	Model.prototype.modelActive = function(event) {
		onDeviceReady("QBZX_TABLE");
		this.uid = localStorage.getItem('userinfoid');
		this.DoingContainerListDataCustomRefresh();
		this.DoneContainerListDataCustomRefresh();
		this.DoContainerListDataCustomRefresh();
		var me = this;
		var contents = me.comp("contents");
		var active = contents.get('active');
		// alert(localStorage.getItem("contentIndex"));
		contents.to(Number(localStorage.getItem("contentIndex")));
		changeBorderColor(active, me);
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

	Model.prototype.image4Click = function(event) {
		var getshowHide = event.bindingContext.$object.val('showHide');
		if (getshowHide) {
			event.bindingContext.$object.val('showHide', false);
		} else {
			event.bindingContext.$object.val('showHide', true);
		}
	};

	Model.prototype.content2Mousedown = function(event) {
		// alert("searchCTN");
		var input = this.getElementByXid("searchCTN");
		input.blur();
	};

	Model.prototype.reflashClick = function(event) {
		localStorage.setItem("ModerCahce", 1);
		localStorage.setItem("ModerCahce_ctn_id", event.bindingContext.$object.val('id'));
		readyUpCahce();
	};

	// 清除缓存
	Model.prototype.clear_cacheClick = function(event) {
		// 获取当前工作中列表的箱子的箱号
		var ctns_array = new Array();
		var ContainerListData = this.comp('DoingContainerListData');
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

		// 删除特定的箱数据缓存
		// delete from tally_user where uid not in (1,2,3)
		// select count(uid) from tb where uid not in (1,2,3);
		// 删除特定的想状态缓存

	};

	return Model;
});