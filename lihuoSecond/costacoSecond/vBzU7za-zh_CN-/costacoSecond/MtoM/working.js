define(function(require) {
	require("$UI/costacoSecond/ajax/jquery-1");
	var justep = require("$UI/system/lib/justep");
	var Baas = require("$UI/demo/baas/baas");
	var ShellImpl = require('$UI/system/lib/portal/shellImpl');

	var Model = function() {
		// http://192.168.1.91/xztally/index.php/task/taskman?uid=1&business=qbzx
		this.row;
		this.daData;
		this.rows;
		this.qiid;
		this.delrow;
		this.containerno;
		this.qbjobcontainerid;
		this.PlanId;
		this.callParent();
		this.ctndetails_ID = "";
		this.oid = "";
		this.cache_ctns;
	};
	// 获取完成箱列表
	Model.prototype.doneDataCustomRefresh = function(event) {

		var uid = localStorage.getItem('userinfoid');
		if (debugMode) {
			alert("--获取箱列表接口--" + "\n用户id：" + uid);
		}
		var doneData = this.comp("doneData");
		$.ajax({
			"type" : "post",
			"async" : true,
			"data" : {
				"uid" : uid,
				"status" : 3
			},
			"dataType" : "json",
			"url" : interface_url + "?c=DdOperation&a=getContainerList", // PHP数据库校验用户名和密码是否正常
			"success" : function(data) {
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
	// 获取工作中列表箱子
	Model.prototype.DoingDataCustomRefresh = function(event) {

		var uid = localStorage.getItem('userinfoid');
		if (debugMode) {
			alert("--获取箱列表接口--" + "\n用户id：" + uid);
		}
		var DoingData = this.comp("DoingData");
		$.ajax({
			"type" : "post",
			"async" : true,
			"data" : {
				"uid" : uid,
				"status" : 2
			},
			"dataType" : "json",
			"url" : interface_url + "?c=DdOperation&a=getContainerList", // PHP数据库校验用户名和密码是否正常
			"success" : function(data) {
				// alert(data);
				if (data['code'] == 0) {
					DoingData.loadData(data["list"]);
				} else {
					justep.Util.hint(data['msg'], {
						"delay" : normerHintDelay
					});
					DoingData.clear();
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
	// 获取未作业箱子列表
	Model.prototype.doDataCustomRefresh = function(event) {
		var uid = localStorage.getItem('userinfoid');
		if (debugMode) {
			alert("--获取箱列表接口--" + "\n用户id：" + uid);
		}
		var doData = this.comp("doData");
		$.ajax({
			"type" : "post",
			"async" : true,
			"data" : {
				"uid" : uid,
				"status" : 1
			},
			"dataType" : "json",
			"url" : interface_url + "?c=DdOperation&a=getContainerList", // PHP数据库校验用户名和密码是否正常
			"success" : function(data) {
				if (data['code'] == 0) {
					doData.loadData(data["list"]);
				} else {
					justep.Util.hint(data['msg'], {
						"delay" : normerHintDelay
					});
					doData.clear();
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
		var doData = this.comp("doData");
		var containerno_id = event.bindingContext.$object.val('id');
		var getPlanId = event.bindingContext.$object.val('plan_id');
		var row1 = event.bindingContext.$object;
		this.row = row1;
		this.PlanId = getPlanId;
		this.containerno = containerno_id;
		this.comp("messageDialog").show({
			"title" : "温馨提示",
			"message" : "是否接单？"
		});
	};

	// 开始作业
	Model.prototype.button5Click = function(event) {
		var me = this;
		var ctn_id = event.bindingContext.$object.val('id');
		localStorage.setItem('ctndetails_ID', ctn_id);
		if (event.bindingContext.$object.val('is_must') == "Y") {
			localStorage.setItem('isMust_' + ctn_id, event.bindingContext.$object.val('is_must'));
		}
		var ctnno = event.bindingContext.$object.val('ctnno');
		localStorage.setItem("working_details_ctnno", ctnno);
		var oid = localStorage.getItem("working_details_oid");
		localStorage.setItem("working_details_oid", oid);

		// 缓存状态
		select_status(beginwork_selectstatus, ctn_id);

		function beginwork_selectstatus(status) {
			if (Number(status) == 0) {
				insert_status(localStorage.getItem('ctndetails_ID'), "1");
				justep.Shell.showPage("beginworking_firststep_dd");
			}
			if (Number(status) > 0 && Number(status) != 5) {

				justep.Util.hint("作业已开始,请继续作业！", {
					"delay" : normerHintDelay
				});
			}
			if (Number(status) == 5) {
				justep.Util.hint("作业已完成，请刷新或点击继续作业完成上传！", {
					"delay" : normerHintDelay
				});
			}
		}
	};

	// 继续作业
	Model.prototype.ContinueWorkingClick = function(event) {
		var me = this;
		this.ctndetails_ID = event.bindingContext.$object.val('id');
		localStorage.setItem('ctndetails_ID', this.ctndetails_ID);
		if (event.bindingContext.$object.val('is_must') == "Y") {
			localStorage.setItem('isMust_' + this.ctndetails_ID, event.bindingContext.$object.val('is_must'));
		}
		// 保存作业id和提单号和箱号给working_details页面 显示和操作
		var ctnno = event.bindingContext.$object.val('ctnno');
		localStorage.setItem("working_details_ctnno", ctnno);
		var oid = localStorage.getItem("working_details_oid" + this.ctndetails_ID);
		localStorage.setItem("working_details_oid" + this.ctndetails_ID, event.bindingContext.$object.val('operation_id'));
		localStorage.setItem("working_details_oid", oid);
		var billno = localStorage.getItem("working_details_blno");
		localStorage.setItem("working_details_blno", billno);
		localStorage.setItem('planId_DD', event.bindingContext.$object.val('plan_id'));
		// alert(event.bindingContext.$object.val('plan_id'))
		var set_continue = 0;
		// 继续作业时根据状态表跳转
		select_status(statusToShellPage, this.ctndetails_ID);
		function statusToShellPage(status) {
			// 获取url上的操作步骤，若无缓存则跳转到url上对应的界面，否则跳转到状态表所对应的缓存
			switch (Number(status)) {
			case 1:
				justep.Shell.showPage("beginworking_firststep_dd");
				break;
			case 2:
				justep.Shell.showPage("openDoor_dd");
				break;
			case 3:
				justep.Shell.showPage("working_details_dd");
				break;
			case 4:
				justep.Shell.showPage("workingfinish_dd");
				break;
			case 5:
				justep.Util.hint("作业任务完成，上传中...", {
					"delay" : normerHintDelay
				});
				readyUpCahce();
				// justep.Shell.showPage("supplementary_mtom");
				break;
			case 6:
				// justep.Shell.showPage("supplementary_mtom");
				justep.Util.hint("作业任务完成，上传中...", {
					"delay" : normerHintDelay
				});
				readyUpCahce();
				break;
			default:
				// 状态表为空，跳转到空箱作业
				insert_status(localStorage.getItem('ctndetails_ID'), "1");
				justep.Shell.showPage("beginworking_firststep_dd");
				// justep.Shell.showPage("working_details_dd");
				break;
			}
		}
	};

	Model.prototype.backClick = function(event) {
		var position = localStorage.getItem('position');
		if (position != 11) {
			justep.Shell.showPage("SelectSys");
		} else {
			// justep.Shell.showPage("index_employees_dd");
			justep.Shell.showPage("SelectSys");
		}
	};

	// 接单
	Model.prototype.messageDialogYes = function(event) {
		var me = this;
		var uid = localStorage.getItem('userinfoid');
		var qiid = me.qiid;
		var containerno = me.containerno;
		var row = me.row;
		var doData = me.comp("doData");
		localStorage.setItem('ctndetails_ID', containerno);
		$.ajax({
			"type" : "post",
			"async" : false,
			"data" : {
				"uid" : uid,
				"ctn_id" : containerno
			},
			"dataType" : "json",
			"url" : interface_url + "?c=DdOperation&a=ordertaking", // PHP数据库校验用户名和密码是否正常
			"success" : function(data) {
				var getStringBlno = JSON.stringify(data['blno']);
				if (data['code'] == 0) {
					doData.deleteData(row);
					me.DoingDataCustomRefresh();
					localStorage.setItem("working_details_oid" + containerno, data['operation_id']);
					// alert(getStringBlno);
					localStorage.setItem("working_details_blno" + me.PlanId, getStringBlno);// 提单号
					localStorage.setItem("working_details_sealno" + containerno, data['seal_no']);
					localStorage.setItem(containerno + "level_num", data['level_num']);
					var content_set = Number(data['step']);
					// MtoM
					if (content_set == 3) {
						insert_status(containerno, content_set);
					} else {
						insert_status(containerno, content_set + 1);
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
	};

	Model.prototype.modelLoad = function(event) {
		uid = localStorage.getItem('userinfoid');
		onDeviceReady("MtoM_TABLE");
	};

	// 未工作点击事件
	Model.prototype.backlogClick = function(event) {
		localStorage.setItem("isClick1", "true")
		changeBorderColor(0, this);
	};
	// 工作中点击事件
	Model.prototype.workingClick = function(event) {
		localStorage.setItem("isClick1", "true")
		changeBorderColor(1, this);
	};
	// 已工作点击事件
	Model.prototype.doneClick = function(event) {
		localStorage.setItem("isClick1", "true")
		changeBorderColor(2, this);
	};

	Model.prototype.contentsActiveChanged = function(event) {
		var isClick = localStorage.getItem("isClick1");
		if (isClick == "true") {
			localStorage.setItem("isClick1", "false");
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

	Model.prototype.modelActive = function(event) {
		var me = this;
		this.doDataCustomRefresh();
		this.DoingDataCustomRefresh();
		this.doneDataCustomRefresh();
		this.ctndetails_ID = localStorage.getItem('ctndetails_ID');
		var contents = me.comp("contents");
		contents.to(Number(localStorage.getItem("contentIndex")));
		var active = contents.get('active');
		changeBorderColor(active, me);

	};

	// 取消作业
	Model.prototype.cancelClick = function(event) {
		var globle = this;
		this.ctndetails_ID = event.bindingContext.$object.val('id');
		localStorage.setItem('ctndetails_ID', globle.ctndetails_ID);
		var delrow = event.bindingContext.$object;
		// this.upCacheData(cancelWorking, globle, 5);
		select_status(cancelwork_status, this.ctndetails_ID);

		function cancelwork_status(status) {
			if (Number(status) != 6) {
				cancelWorking(globle);
			} else {
				justep.Util.hint("作业已经完成!", {
					"delay" : normerHintDelay
				});
			}
		}

	};

	// 取消作业方法
	function cancelWorking(globle) {
		var doData = globle.comp('DoingData');
		var uid = localStorage.getItem('userinfoid');
		$.ajax({
			"type" : "post",
			"async" : false,
			"data" : {
				"uid" : uid,
				"ctn_id" : globle.ctndetails_ID
			},
			"dataType" : "json",
			"url" : interface_url + "?c=DdOperation&a=cancelOperation", // PHP数据库校验用户名和密码是否正常
			"success" : function(data) {
				if (data['code'] == 0) {
					doData.deleteData(globle.delrow);
					deleteALLctn("MtoM_TABLE", localStorage.getItem('ctndetails_ID'));
					delete_StatusRow("MtoM_TABLE_status", localStorage.getItem('ctndetails_ID'));
					localStorage.removeItem(localStorage.getItem('ctndetails_ID') + "level_num");
				} else {
					justep.Util.hint(data['msg'], {
						"delay" : normerHintDelay
					});
				}
			},
			"complete" : function(XMLHttpRequest, status) {
				if (status == 'timeout' || status == 'error') {
					justep.Util.hint("网络异常，无法操作！", {
						"delay" : normerHintDelay,
						"style" : "color:red;"
					});
				}
			}
		});
	}

	Model.prototype.messageDialogNo = function(event) {

	};

	Model.prototype.button1Click = function(event) {
		var containerno = event.bindingContext.$object.val('id');
		var Done_ctn = event.bindingContext.$object.val('ctnno');
		var qbzx_operationid = event.bindingContext.$object.val('qbzx_operationid');
		localStorage.setItem('Done_containerno', containerno);
		localStorage.setItem('Done_ctn', Done_ctn);
		justep.Shell.showPage("doneboxdetails_dd");
	};

	Model.prototype.button2Click = function(event) {

	};

	Model.prototype.image2Click = function(event) {

	};

	Model.prototype.reflashClick = function(event) {
		localStorage.setItem("ModerCahce", 3);
		localStorage.setItem("ModerCahce_ctn_id", event.bindingContext.$object.val('id'));
		readyUpCahce();
	};

	function reflash(ctn_s, data) {
		localStorage.setItem(ctn_s + "level_num", data['content']['num_level']);
		if (data['content']['step'] == 2) {
			insert_status(ctn_s, data['content']['step'], false, "Y");
		} else {
			insert_status(ctn_s, Number(data['content']['step']) + 1, false, "Y");
		}
	}

	Model.prototype.clear_cacheClick = function(event) {
		// 获取当前工作中列表的箱子的箱号
		var ctns_array = new Array();
		var ContainerListData = this.comp('DoingData');
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