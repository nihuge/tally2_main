define(function(require) {
	require("$UI/costacoSecond/ajax/jquery-1");
	var justep = require("$UI/system/lib/justep");
	// 引入/UI2/demo/baas/baas.js
	var Baas = require("$UI/demo/baas/baas");
	var loadinbBar = require("$UI/system/components/justep/loadingBar/loadingBar");
	var Model = function() {
		this.callParent();
		this.lodingHtml = "";
	};

	// 已派指令列表（orderData）

	Model.prototype.orderDataCustomRefresh = function(event) {
		var me = this;
		showdiv();
		var uid = localStorage.getItem('userinfoid');
		var orderData = this.comp("orderData");
		// alert(document.getElementById("div8").style.visibility)
		$.ajax({
			"type" : "post",
			"async" : true,
			"data" : {
				// get提交密码字段
				"status" : 1,
				"uid" : uid
			},
			"dataType" : "json",
			// http://121.41.22.2/tally/qbzx/jifindall?status=1&uid=3
			"url" : interface_url + "?c=DdInstruction&a=getInstructionListByWork", // PHP数据库校验用户名和密码是否正常
			"success" : function(data) {

				if (data['code'] == 0) {
					orderData.loadData(data['list']);
					hin(me, "加载成功！");
					return;
				}
				if (data['code'] == 106) {
					alert(data['msg']);
					justep.Shell.showPage("SignIn");
				} else {
					hin(me, data['msg']);
					return;
				}

			},
			"error" : function() {
				hin(me, "数据传输失败！");
			}

		});
	};

	// 未派工指令列表（notaskData）
	Model.prototype.notaskDateCustomRefresh = function(event) {
		var me = this;
		showdiv();
		var uid = localStorage.getItem('userinfoid');
		var notaskDate = this.comp("notaskDate");
		$.ajax({
			"type" : "post",
			"async" : true,
			"data" : {

				"status" : 0,
				"uid" : uid
			},
			"dataType" : "json",
			"url" : interface_url + "?c=DdInstruction&a=getInstructionListByWork",
			"success" : function(data) {
				if (data['code'] == 0) {
					notaskDate.loadData(data['list']);
					hin(me, "加载成功！");
					return;
				}
				if (data['code'] == 106) {
					alert(data['msg']);
					justep.Shell.showPage("SignIn");
				} else {
					hin(me, data['msg']);
					return;
				}
			},
			"error" : function() {
				hin(me, "数据传输失败！");
			}

		});
	};

	Model.prototype.list3Click = function(event) {

	};

	Model.prototype.no = function(event) {

		var no = event.source;
		$.ajax({
			"type" : "get",
			"async" : false,
			"data" : {

			// get提交密码字段
			},
			"dataType" : "json",
			"url" : interface_url + "?c=qbzx&a=jifindall&status=1",
			"success" : function(data) {
				no.loadData(data);
			},
			"error" : function() {
				alert("数据传输失败！");
			}

		});

	};

	// 已派作业指令详情
	Model.prototype.insdetailsClick = function(event) {

		var id = event.bindingContext.$object.val('id');
		localStorage.setItem('instructionId_work', id);
		justep.Shell.showPage("instructionDetails_work_dd");
	};

	// 未派作业指令详情
	Model.prototype.insDetailsBtn = function(event) {
		var id = event.bindingContext.$object.val('id');
		localStorage.setItem('instructionId_work', id);

		justep.Shell.showPage("instructionDetails_work_dd");
	};

	// 作业指令详情跳转派工界面
	Model.prototype.button11Click = function(event) {
		window.location.href = "dispatching.w";
	};

	// 显示箱列表
	Model.prototype.button12Click = function(event) {
		var value = event.bindingContext.$object.val('qbzx_jobinstructionid');
		var boxList = this.comp("boxList");
		$.ajax({
			"type" : "get",
			"async" : false,
			"data" : {

			// get提交密码字段
			},
			"dataType" : "json",
			"url" : interface_url + "?c=qbzx&a=allcont&insid=" + value, // PHP数据库校验用户名和密码是否正常
			"success" : function(data) {

				boxList.loadData(data);

			},
			"error" : function() {
				alert("数据传输失败！");
			}

		});
	};

	// 修改作业指令并且保存
	Model.prototype.button18Click = function(event) {
		var detailnotaskData = this.comp("detailnotaskData");
		// alert(detailnotaskData.val("bargeno")+detailnotaskData.val("locationno")+detailnotaskData.val("qbzx_forecastplanid")+detailnotaskData.val("loadingtype"));
		var insid = detailnotaskData.val("qbzx_jobinstructionid");
		var bargeno = detailnotaskData.val("bargeno");
		var locationno = detailnotaskData.val("locationno");
		var qbzx_forecastplanid = detailnotaskData.val("qbzx_forecastplanid");
		var loadingtype = detailnotaskData.val("loadingtype");

		// alert(bargeno+locationno);
		if ($.trim(detailnotaskData.val("bargeno")) === "" || $.trim(detailnotaskData.val("locationno")) === "" || $.trim(detailnotaskData.val("loadingtype")) === ""
				|| $.trim(detailnotaskData.val("qbzx_forecastplanid")) === "") {
			this.comp("messageDialog").show({
				"title" : "温馨提示",
				"message" : "值不能为空"
			});
		} else {

			$.ajax({
				"type" : "get",
				"async" : false,
				"data" : {

				},
				"dataType" : "json",
				// http://192.168.1.91/xztally/index.php/index/checkin?username=123456&userpass=111
				"url" : interface_url + "?c=qbzx&a=insup&insid=" + insid + "&bargeno=" + detailnotaskData.val("bargeno") + "&locationno=" + detailnotaskData.val("locationno") + "&planid="
						+ detailnotaskData.val("qbzx_forecastplanid") + "&loadingtype=" + detailnotaskData.val("loadingtype"), // PHP数据库校验用户名和密码是否正常
				"success" : function(data) {
					alert("成功")
				},
				"error" : function() {
					alert("失败");
				}

			});
		}
	};

	//
	Model.prototype.button21Click = function(event) {

		// url:http://192.168.1.91/xztally/index.php/qbzx/addcont?insid=&containerno=&containertypecode=&containermaster=

	};

	// 新增箱并且保存
	Model.prototype.button23Click = function(event) {
		var detailnotaskData = this.comp("detailnotaskData");
		var boxdetails = this.comp("boxdetails");

		var insid = detailnotaskData.val("qbzx_jobinstructionid");
		var containerno = boxdetails.val("containerno");
		var containertypecode = boxdetails.val("containertypecode");
		var containermaster = boxdetails.val("containermaster");
		// alert(insid+"containerno"+containerno+"containertypecode"+containertypecode+"containermaster"+containermaster);
		if ($.trim(containermaster) === "" || $.trim(containerno) === "" || $.trim(containertypecode) === "") {
			this.comp("messageDialog").show({
				"title" : "温馨提示",
				"message" : "值不能为空"
			});
		} else {

			$.ajax({
				"type" : "get",
				"async" : false,
				"data" : {

				},
				"dataType" : "json",
				// http://192.168.1.91/xztally/index.php/qbzx/addcont?insid=&containerno=&containertypecode=&containermaster=
				"url" : interface_url + "?c=qbzx&a=addcont&insid=" + insid + "&containerno=" + containerno + "&containertypecode=&" + containertypecode + "containermaster=" + containermaster, // PHP数据库校验用户名和密码是否正常
				"success" : function(data) {
					alert("成功")
				},
				"error" : function() {
					alert("新建失败");
				}

			});
		}
	};

	// 页面返回键
	Model.prototype.backClick = function(event) {
		var position = localStorage.getItem('position');
		if (position != 11) {
			justep.Shell.showPage("SelectSys");
		} else {
			justep.Shell.showPage("SelectSys");
		}

	};

	// 开始派工
	Model.prototype.beginworkClick = function(event) {
		var uid = localStorage.getItem('userinfoid');
		var id = event.bindingContext.$object.val('id');
		localStorage.setItem("dispatching_instruction_id", id);

		// alert(gand_id+"----"+classes)
		// 查询是否已经接单
		$.ajax({
			"type" : "post",
			"async" : false,
			"data" : {
				"uid" : uid,
				"instruction_id" : id
			},
			"dataType" : "json",

			// IP地址+?c=DdDispatch&a=getDetail
			"url" : interface_url + "?c=DdDispatch&a=isPermissionsForDispatching", // PHP数据库校验用户名和密码是否正常
			"success" : function(data) {
				if (data['code'] == 0) {
					// 保存工班ID
					localStorage.setItem("dispatching_gand_id", data["shift_id"]);
					justep.Shell.showPage("begindispatching_dd");
				} else if (data['code'] == 207) {
					$.ajax({
						"type" : "post",
						"async" : false,
						"data" : {

							// get提交密码字段
							"uid" : uid,
						},
						"dataType" : "json",
						// http://192.168.1.91/tally/app.php?c=Common&a=whetherTakeOver&uid=20
						"url" : interface_url + "?c=Common&a=whetherTakeOver",
						"success" : function(data) {

							if (data['code'] == 0) {
								// 如果上個工班的交接信息為空，直接跳轉到主頁，否則彈出是否接班
								if (data['lastshift'] == "") {
									alert("跳轉到主頁！");
								} else {
									// 保存工班id
									localStorage.setItem('work_id', data['lastshift']['shift_id']);

									me.comp("messageDialog1").show(
											{
												"title" : "是否接班？",
												"message" : "理货长：" + data['lastshift']['master_name'] + "\n" + "交班时间：" + data['lastshift']['transfer_time'] + "\n" + "工班信息："
														+ data['lastshift']['parent_department_name'] + "_" + data['lastshift']['department_name'] + "_" + data['lastshift']['classes_zh'] + "\n"
														+ "留言内容：" + data['lastshift']['note']
											});
								}
							} else {
								alert(data['msg']);
							}
						},
						"error" : function() {
							alert("12数据传输失败！");
						}

					});

				} else {
					alert(data['msg']);
				}

			},
			"error" : function() {
				alert("---数据传输失败！");
			}

		});

	};

	// 修改派工
	Model.prototype.FixClick = function(event) {

		var id = event.bindingContext.$object.val('id');
		localStorage.setItem("dispatching_instruction_id", id);
		var uid = localStorage.getItem('userinfoid');
		if (debugMode) {
			alert("修改派工接口：" + "\n用户id：" + uid + "\n指令id：" + id);
		}
		$.ajax({
			"type" : "post",
			"async" : false,
			"data" : {
				"uid" : uid,
				"instruction_id" : id
			},
			"dataType" : dataType,

			// IP地址+?c=DdDispatch&a=getDetail
			"url" : interface_url + "?c=DdDispatch&a=isPermissionsForDispatching", // PHP数据库校验用户名和密码是否正常
			"success" : function(data) {
				if (PrintReturnValue) {
					alert(data);
					return;
				}
				if (data['code'] == 0) {
					// 保存工班ID
					localStorage.setItem("dispatching_gand_id", data["shift_id"]);
					justep.Shell.showPage("dispatching_dd");
				} else if (data['code'] == 207) {
					$.ajax({
						"type" : "post",
						"async" : false,
						"data" : {

							// get提交密码字段
							"uid" : uid,
						},
						"dataType" : "json",
						// http://192.168.1.91/tally/app.php?c=Common&a=whetherTakeOver&uid=20
						"url" : interface_url + "?c=Common&a=whetherTakeOver",
						"success" : function(data) {

							if (data['code'] == 0) {
								// 如果上個工班的交接信息為空，直接跳轉到主頁，否則彈出是否接班
								if (data['lastshift'] == "") {
									alert("跳轉到主頁！");
								} else {
									// 保存工班id
									localStorage.setItem('work_id', data['lastshift']['shift_id']);

									me.comp("messageDialog1").show(
											{
												"title" : "是否接班？",
												"message" : "理货长：" + data['lastshift']['master_name'] + "\n" + "交班时间：" + data['lastshift']['transfer_time'] + "\n" + "工班信息："
														+ data['lastshift']['parent_department_name'] + "_" + data['lastshift']['department_name'] + "_" + data['lastshift']['classes_zh'] + "\n"
														+ "留言内容：" + data['lastshift']['note']
											});
								}
							} else {
								alert(data['msg']);
							}
						},
						"error" : function() {
							alert("数据传输失败！");
						}

					});

				} else {
					alert(data['msg']);
				}

			},
			"error" : function() {
				alert("数据传输失败！");
			}

		});

	};

	// 取消派工
	Model.prototype.cancelworkClick = function(event) {
		var me = this;
		var uid = localStorage.getItem('userinfoid');
		var id = event.bindingContext.$object.val('id');
		var dispatch_id = event.bindingContext.$object.val('dispatch_id');
		var orderData = this.comp('orderData');
		var notaskDate = this.comp('notaskDate');
		if (debugMode) {
			alert("派工id：" + dispatch_id + "\n用户id：" + uid + "\n指令id：" + id);
		}
		$.ajax({
			"type" : "get",
			"async" : false,
			"data" : {
				"uid" : uid,
				"instruction_id" : id,
				"dispatch_id" : dispatch_id
			},
			"dataType" : dataType,
			// http://192.168.1.91/xztally/app.php/index/canceltask?business=qbzx&insid=70
			"url" : interface_url + "?c=DdDispatch&a=cancel", // PHP数据库校验用户名和密码是否正常
			"success" : function(data) {
				if (data['code'] == 0) {
					justep.Util.hint("取消成功！");
					orderData.refreshData();
					notaskDate.refreshData();
				} else {
					alert(data['msg']);
				}

			},
			"error" : function() {
				alert("数据传输失败！");
			}

		});

	};

	// 确定接单

	Model.prototype.messageDialog1Yes = function(event) {

		var staffData = this.comp("staffData");
		var uid = localStorage.getItem('userinfoid');
		var work_id = localStorage.getItem('work_id');
		var dispatching_instruction_id = localStorage.getItem('dispatching_instruction_id');
		$.ajax({
			"type" : "post",
			"async" : false,
			"data" : {
				"uid" : uid,
				"shift_id" : work_id,

			},
			"dataType" : "json",
			// ?c=Common&a=succeed
			"url" : interface_url + "?c=Common&a=succeed",
			"success" : function(data) {
				if (data['code'] == 0) {
					justep.Util.hint("接班成功！");
					justep.Shell.showPage("dispatching_dd");
				} else {

					alert(data['msg']);

				}

			},
			"error" : function() {
				alert("数据传输失败！");
			}

		});

	};

	Model.prototype.modelActive = function(event) {
		var getcontents = this.comp("content");
		PageChange(this, getcontents.getActiveIndex());
		this.notaskDateCustomRefresh();
		this.orderDataCustomRefresh();
	};

	function PageChange(getcontext, getcontentsIndesx) {
		switch (getcontentsIndesx) {
		case 0:
			getcontext.getElementByXid("dispatchLine").style.borderColor = "#1793EE";
			getcontext.getElementByXid("dispatchList").style.color = "#EC6941";
			getcontext.getElementByXid("dispatchedLine").style.borderColor = "#FFFFFF";
			getcontext.getElementByXid("dispatchedList").style.color = "#465A82";
			break;
		case 1:
			getcontext.getElementByXid("dispatchedLine").style.borderColor = "#1793EE";
			getcontext.getElementByXid("dispatchedList").style.color = "#EC6941";
			getcontext.getElementByXid("dispatchLine").style.borderColor = "#FFFFFF";
			getcontext.getElementByXid("dispatchList").style.color = "#465A82";
			break;

		}
	}
	;

	Model.prototype.contentActiveChanged = function(event) {
		var getcontents = this.comp("content");
		PageChange(this, getcontents.getActiveIndex());
	};

	Model.prototype.modelLoad = function(event) {
		// this.notaskDateCustomRefresh();
		// this.orderDataCustomRefresh();
	};

	function showdiv() {
		$("#loading2").css("display", "block");// show的display属性设置为block（显示）
	}

	function hin(me, msg) {
		document.getElementById("loading2").style.visibility = "visible";
		if (msg != "") {
			$("#loading2").css("display", "none");// show的display属性设置为none（隐藏）
			justep.Util.hint(msg, {
				"delay" : 1000
			});
		} else {
			$("#loading2").css("display", "none");// show的display属性设置为none（隐藏）
		}
	}

	Model.prototype.panel1Mouseup = function(event) {
		hin(this, "");
	};

	return Model;
});