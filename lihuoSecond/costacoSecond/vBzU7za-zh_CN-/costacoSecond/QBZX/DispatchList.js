define(function(require) {
	require("$UI/costacoSecond/ajax/jquery-1");
	var justep = require("$UI/system/lib/justep");
	// 引入/UI2/demo/baas/baas.js
	var Baas = require("$UI/demo/baas/baas");
	var loadinbBar = require("$UI/system/components/justep/loadingBar/loadingBar");
	var Model = function() {
		this.callParent();
	};

	Model.prototype.button1Click = function(event) {
		// this.comp("order").to("search");
		window.location.href = "creatInstructions.w";
	};

	// 已派指令列表（orderData）

	Model.prototype.orderDataCustomRefresh = function(event) {
		var me = this;
		// 弹出加载框
		showdiv();
		var uid = localStorage.getItem('userinfoid');
		var orderData = this.comp("orderData");
		if (debugMode) {
			alert("--获取理货长所在部门的指令列表接口--" + "\n用户id：" + uid);
		}
		$.ajax({
			"type" : "post",
			"async" : true,
			"data" : {
				"uid" : uid,
			},
			"dataType" : dataType,
			"url" : interface_url + "?c=QbzxInstruction&a=getInstructionListByWork",
			"success" : function(data) {
				// alert(data['list'].length)
				if (PrintReturnValue) {
					alert(data);
					return;
				}
				if (data['code'] == 0) {
					orderData.loadData(data['list']);
					hin(me, "加载成功 ！");
					return;
				} else {
					hin(me, data['msg']);
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
	Model.prototype.button4Click = function(event) {
		var insid = event.bindingContext.$object.val('id');
		var plan_id = event.bindingContext.$object.val('plan_id');
		localStorage.setItem('workPlanID_details', insid);
		localStorage.setItem('qbzx_forecastplanid', plan_id);
		justep.Shell.showPage("InstructionDetails");
	};

	// 未派作业指令详情
	Model.prototype.button6Click = function(event) {
		localStorage.setItem('searchInstructionFlag', 0);
		var value = event.bindingContext.$object.val('id');
		var plan_id = event.bindingContext.$object.val('plan_id');
		localStorage.setItem('qbzx_forecastplanid', plan_id);
		localStorage.setItem('workPlanID_details', value);
		localStorage.setItem('insid', value);
		justep.Shell.showPage("InstructionDetails")
		/*
		 * var detailnotaskData = this.comp("detailnotaskData"); $.ajax({ "type" :
		 * "get", "async" : false, "data" : {
		 * 
		 * //get提交密码字段 }, "dataType" : "json", "url" :
		 * interface_url+"/qbzx/jifindone?value="+value+"&field=qbzx_JobInstructionId",
		 * //PHP数据库校验用户名和密码是否正常 "success" : function(data) {
		 * 
		 * detailnotaskData.loadData(data); }, "error" : function() {
		 * alert("数据传输失败！"); }
		 * 
		 * });
		 */
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

	// 确认指令新建
	Model.prototype.button22Click = function(event) {

		var addinstructions_Data = this.comp("addinstructions_Data");

		var loadingtype = this.comp("loadingtype");
		// alert(addinstructions_Data.val("bargeno")+addinstructions_Data.val("locationno")+addinstructions_Data.val("qbzx_forecastplanid"));
		// alert(addinstructions_Data.val("loadingtype"))
		var insid = addinstructions_Data.val("qbzx_jobinstructionid")

		// 用户名和密码为空提示locationno=&planid=&loadingtype=
		if ($.trim(addinstructions_Data.val("bargeno")) === "" || $.trim(addinstructions_Data.val("locationno")) === "" || $.trim(addinstructions_Data.val("loadingtype")) === ""
				|| $.trim(addinstructions_Data.val("qbzx_forecastplanid")) === "") {
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
				// http://192.168.1.91/xztally/index.php/qbzx/jiadd?bargeno=&locationno=&planid=&loadingtype=
				"url" : interface_url + "?c=qbzx&a=jiadd&bargeno=" + addinstructions_Data.val("bargeno") + "&locationno=" + addinstructions_Data.val("locationno") + "&planid="
						+ addinstructions_Data.val("qbzx_forecastplanid") + "&loadingtype=" + addinstructions_Data.val("loadingtype"), // PHP数据库校验用户名和密码是否正常
				"success" : function(data) {
					alert("成功")
				},
				"error" : function() {
					alert("新建失败");
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
	Model.prototype.button5Click = function(event) {
		var me = this;
		var insid = event.bindingContext.$object.val('id');
		var uid = localStorage.getItem('userinfoid');
		localStorage.setItem("dispatching", insid);
		if (debugMode) {
			alert("用户id：" + uid + "\n指令id：" + insid);
		}
		$.ajax({
			"type" : "post",
			"async" : false,
			"data" : {
				"uid" : uid,
				"instruction_id" : insid
			},
			"dataType" : dataType,

			"url" : interface_url + "?c=QbzxDispatch&a=isPermissionsForDispatching",
			"success" : function(data) {
				if (data['code'] == 0) {
					// 保存工班ID
					localStorage.setItem("dispatching_gand_id", data["shift_id"]);
					justep.Shell.showPage("begindispatching");
				} else if (data['code'] == 207) {
					$.ajax({
						"type" : "post",
						"async" : false,
						"data" : {

							// get提交密码字段
							"uid" : uid,
						},
						"dataType" : "json",
						"url" : interface_url + "?c=Shift&a=whetherTakeOver",
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

	// 修改派工
	Model.prototype.button7Click = function(event) {
		var insid = event.bindingContext.$object.val('id');
		localStorage.setItem("dispatching", insid);

		var uid = localStorage.getItem('userinfoid');
		// alert("--是否有权限派工接口--"+"\n用户id："+uid+"\n指令id:"+insid);
		$.ajax({
			"type" : "post",
			"async" : false,
			"data" : {
				"uid" : uid,
				"instruction_id" : insid
			},
			"dataType" : dataType,

			"url" : interface_url + "?c=QbzxDispatch&a=isPermissionsForDispatching",
			"success" : function(data) {
				if (data['code'] == 0) {
					// 保存工班ID
					localStorage.setItem("dispatching_gand_id", data["shift_id"]);
					justep.Shell.showPage("dispatching");
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
	Model.prototype.button10Click = function(event) {
		var me = this;
		var orderData = me.comp('orderData');
		var repair_id = event.bindingContext.$object.val('repair_id');
		var uid = localStorage.getItem('userinfoid');
		var value = event.bindingContext.$object.val('id');
		if (debugMode) {
			alert("--取消派工接口传值--" + "\n用户id:" + uid + "\n派工id:" + repair_id + "\n指令id:" + value);
		}

		$.ajax({
			"type" : "GET",
			"async" : false,
			"data" : {
				"uid" : uid,
				"repair_id" : repair_id,
				"instruction_id" : value

			},
			"dataType" : dataType,
			"url" : interface_url + "?c=QbzxDispatch&a=cancel",
			"success" : function(data) {
				if (PrintReturnValue) {
					alert(data);
					return;
				}
				if (data['code'] == 0) {
					justep.Util.hint("取消派工成功！");
					orderData.refreshData();
				} else {
					alert(data['msg']);
				}

			},
			"error" : function() {
				alert("取消派工失败！服务器异常！");
			}

		});

	};

	// 确定接班

	Model.prototype.messageDialog1Yes = function(event) {
		var uid = localStorage.getItem('userinfoid');
		var work_id = localStorage.getItem('work_id');
		if (debugMode) {
			alert("uid：" + uid + "\n工班id：" + work_id);
		}
		$.ajax({
			"type" : "post",
			"async" : false,
			"data" : {
				"uid" : uid,
				"shift_id" : work_id,

			},
			"dataType" : dataType,
			// ?c=Common&a=succeed
			"url" : interface_url + "?c=Shift&a=succeed",
			"success" : function(data) {
				if (debugMode) {
					alert(data);
					return;
				}
				if (data['code'] == 0) {
					justep.Util.hint("接班成功！");
					justep.Shell.showPage("begindispatching");
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

	Model.prototype.contentActiveChanged = function(event) {
		var getcontents = this.comp("content");

		PageChange(this, getcontents.getActiveIndex());
	};

	Model.prototype.modelLoad = function(event) {
		// showdiv();
		this.orderDataCustomRefresh();
	};

	function showdiv() {
		$("#loading").css("display", "block");// show的display属性设置为block（显示）
	}

	function hin(me, msg) {
		document.getElementById("loading").style.visibility = "visible";
		if (msg != "") {
			$("#loading").css("display", "none");// show的display属性设置为none（隐藏）
			justep.Util.hint(msg, {
				"delay" : 1000
			});
		} else {
			$("#loading").css("display", "none");// show的display属性设置为none（隐藏）
		}
	}

	Model.prototype.panel1Mouseup = function(event) {
		hin(this, "");
	};


	return Model;
});