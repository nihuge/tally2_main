define(function(require) {
	// var $ = require("jquery");
	require("$UI/costacoSecond/ajax/jquery-1");
	var justep = require("$UI/system/lib/justep");
	require("$UI/system/lib/cordova/cordova");
	// require("$UI/blshopApp/JS/Chart.js");
	require("cordova!org.apache.cordova.device");
	var loadinbBar = require("$UI/system/components/justep/loadingBar/loadingBar");
	// loadinbBar.start();
	// loadinbBar.stop();
	var Model = function() {
		this.staffno = "";
		this.pwd = "";
		this.callParent();

	};
	Model.prototype.model1Load = function(event) {
		this.username = localStorage.getItem('staffno');
		this.userpassword = localStorage.getItem('pwd');
		this.comp("staffno").val(this.username);
		this.comp("pwd").val(this.userpassword);
	};

	document.addEventListener('backbutton', back, true);
	function back(backPage) {
		justep.Shell.showPage("systemSelect");
	}

	Model.prototype.btnCheckUserLogin = function(event) {
		//alert(device.uuid);
		// localStorage.setItem("pagestep", "1");
		var self = this;
		var userData = this.comp("userData");
		// 调试信息打印
		if (debugMode) {
			alert("--登录接口--" + "\n工号：" + userData.val("staffno") + "\n密码：" + userData.val("pwd"));
		}
		// 用户名和密码为空提示
		if ($.trim(userData.val("staffno")) === "" || $.trim(userData.val("pwd")) === "") {
			this.comp("messageDialog").show({
				"title" : "温馨提示",
				"message" : "请输入用户名或密码"
			});

		} else {

			$.ajax({
				"type" : "post",
				"async" : false,
				"data" : {
					"staffno" : userData.val("staffno"),
					"pwd" : userData.val("pwd")
				// get提交密码字段
				},
				"dataType" : dataType,
				"url" : interface_url + "?c=User&a=login",
				"success" : function(data) {
					if (PrintReturnValue) {
						alert(data);
						return;
					}
					// alert(window.document.location.pathname);
					if (data['code'] == 0) {
						localStorage.setItem('staffno', userData.val("staffno"));
						localStorage.setItem('pwd', userData.val("pwd"));
						localStorage.setItem('userinfoid', data['uid']);
						localStorage.setItem('position', data['group_id']);// 11：理货员、12：理货长、13：部门长
						justep.Shell.showPage("systemSelect");
					} else if (data['code'] == 102) {
						self.comp("messageDialog").show({
							"title" : "温馨提示",
							"message" : data['msg']
						});
					} else if (data['code'] == 101) {
						self.comp("messageDialog").show({
							"title" : "温馨提示",
							"message" : data['msg']
						});
					}

				},
				"error" : function(data) {
					alert("数据传输失败！");
				}

			});
		}

	};

	Model.prototype.model1Active = function(event) {
		// localStorage.setItem("pagestep", "0");
		this.username = localStorage.getItem('staffno');
		this.userpassword = localStorage.getItem('pwd');
		this.comp("staffno").val(this.username);
		this.comp("pwd").val(this.userpassword);
	};

	// document.addEventListener('backbutton', back, false);
	// function back(backPage) {
	// switch (localStorage.getItem("pagestep")) {
	// case "0":
	// navigator.app.exitApp();
	// break;
	//
	// default:
	// justep.Shell.showPage("login");
	// break;
	// }
	// }
	return Model;
});