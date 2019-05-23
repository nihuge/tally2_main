define(function(require) {
	// var $ = require("jquery");
	require("$UI/costacoSecond/ajax/jquery-1");
	var justep = require("$UI/system/lib/justep");
	var Baas = require("$UI/demo/baas/baas");
	require("css!$UI/costacoSecond/datajq/jquery/css/vigo.datepicker").load();

	var Model = function() {
		this.callParent();
	};

	// 确认签到
	Model.prototype.signInClick = function(event) {
		var me = this;
		var group_id = this.getElementByXid("group").value;
		var date = this.getElementByXid("date").value;
		var classes = this.getElementByXid("classes").value;
		var department_id = this.getElementByXid("department").value;
		var uid = localStorage.getItem('userinfoid');
		//alert(uid);
		// 获取登入人员的身份 position 1:理货长 2：理货经理 3：理货员
		var position = localStorage.getItem('position');
		// alert("group_id："+group_id+"classes："+classes+"uid："+uid+"position"+position);
		if (debugMode) {
			alert("uid：" + uid + "\n部门id：" + group_id + "\n日期：" + date + "\n班次id：" + classes);
		}
		if (department_id == '') {
			alert("请选择部门！");
			return;
		} else if (group_id == '') {
			alert("请选择班组！");
			return;
		} else if (date == '') {
			alert("请选择时间！");
			return;
		} else if (classes == '') {
			alert("请选择班次！");
			return;
		}
		$.ajax({
			"type" : "post",
			"async" : false,
			"data" : {
				"uid" : uid,
				"department_id" : group_id,
				"date" : date,
				"classes" : classes
			},
			"dataType" : dataType,
			// http://121.41.22.2/costacoSecond/app.php?c=Common&a=signIn
			"url" : interface_url + "?c=Shift&a=signIn",
			"success" : function(data) {
				if (debugMode) {
					alert(data);
				}
				// data['code']：签到返回码。0表示成功，其他便是失败
				if (data['code'] == 0) {
					// 签到成功后判断当前登录人是否为理货长，是：提示是否接单，否：跳转到主页
					if (position == 12) {
						$.ajax({
							"type" : "post",
							"async" : false,
							"data" : {

								"uid" : uid,
							},
							"dataType" : "json",
							"url" : interface_url + "?c=Shift&a=whetherTakeOver",
							"success" : function(data) {
							//alert(data)
								if (data['code'] == 0) {
									// 如果上個工班的交接信息為空，直接跳轉到主頁，否則彈出是否接班
									if (data['lastshift'] == "") {
										justep.Util.hint("签到成功！");
										justep.Shell.showPage("SelectSys");
									} else {
										// 保存工班id
										localStorage.setItem('work_id', data['lastshift']['shift_id']);

										me.comp("messageDialog").show(
												{
													"title" : "是否接班？",
													"message" : "理货长：" + data['lastshift']['master_name'] + "\n" + "交班时间：" + data['lastshift']['transfer_time'] + "\n" + "工班信息："
															+ data['lastshift']['parent_department_name'] + "_" + data['lastshift']['department_name'] + "_" + data['lastshift']['classes_zh'] + "\n"
															+ "留言内容：" + data['lastshift']['note']
												});
									}
								} else {
									alert("签到成功！");
									justep.Shell.showPage("SelectSys");
								}

							},
							"error" : function() {
								alert("接班数据传输失败！");
							}

						});
					} else {
						alert(data['msg']);// 签到成功需要跳转
						justep.Shell.showPage("SelectSys");
					}
				} else {
					// 203:历史工班未交班，提示历史工班的信息
					if (data['code'] == 203) {
						alert("签到失败：" + data['shift']['date'] + " " + data['shift']['parent_department_name'] + "_" + data['shift']['department_name'] + "_" + data['shift']['classes_zh'] + "　"
								+ "理货长：" + data['shift']['master_name'] + "　" + "未交班" + "。请先交班！");
					} else {
						alert(data['msg']);
					}
				}
			},

			"error" : function() {
				alert("签到数据传输失败！");
			}

		});

	};
	// 确定接班
	Model.prototype.messageDialogYes = function(event) {
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
				if (PrintReturnValue) {
					alert(data);
					return;
				}
				if (data['code'] == 0) {
					justep.Util.hint("接班成功！");
					justep.Shell.showPage("SelectSys");
				} else {
					alert(data['msg']);
				}

			},
			"error" : function() {
				alert("数据传输失败！");
			}

		});
	};
	// 不接班
	Model.prototype.messageDialogNo = function(event) {

		justep.Shell.closePage();
	};
	// 获取部门信息
	Model.prototype.departmentDataCustomRefresh = function(event) {
		var departmentData = event.source;
		$.ajax({
			"type" : "POST",
			"async" : false,
			"data" : {

			// get提交密码字段
			},
			"dataType" : "json",
			// http://192.168.1.91/xzcostacoSecond/app.php?c=Department&a=getTopDepartmentList
			"url" : interface_url + "?c=Department&a=getTopDepartmentList", // 获取所有部门
			"success" : function(data) {
				departmentData.loadData(data['list']);

			},
			"error" : function(data) {

				alert("数据传输失败！");
			}

		});
	};
	// 部门列表选择的监听事件
	Model.prototype.getGroup = function(event) {
		var department = this.getElementByXid("department").value;
		var groupData = this.comp('groupData');
		$.ajax({
			"type" : "post",
			"async" : false,
			"data" : {
				"pid" : department
			},
			"dataType" : "json",
			// http://192.168.1.91/xzcostacoSecond/app.php?c=Department&a=getChildDepartmentList&pid=30
			"url" : interface_url + "?c=Department&a=getChildDepartmentList", // 根据部门获取班组的信息
			"success" : function(data) {
				groupData.loadData(data['childlist']);
			},
			"error" : function() {
				alert("数据传输失败！");
			}

		});

	};

	// 页面返回键
	Model.prototype.backClick = function(event) {
		var position = localStorage.getItem('position');
		justep.Shell.showPage("SelectSys");
	};

	// 页面初始化，给时间组件赋值

	Model.prototype.modelLoad = function(event) {
		var localData = this.comp('localData');
		var time = justep.Date.toString(new Date(), justep.Date.STANDART_FORMAT_SHOT);
		this.comp("date").val(time);
	};

	return Model;
});