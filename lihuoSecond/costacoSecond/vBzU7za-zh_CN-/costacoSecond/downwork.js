define(function(require) {
	// require("$UI/costaco/ajax/jquery-1");
	var justep = require("$UI/system/lib/justep");
	// 引入/UI2/demo/baas/baas.js
	var Baas = require("$UI/demo/baas/baas");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.transferBtnClick = function(event) {
		var note = this.getElementByXid("note").value;
		if (note == "") {
			alert("留言不能为空！");
			return;
		}
		uid = localStorage.getItem('userinfoid');

		$.ajax({
			"type" : "post",
			"async" : false,
			"data" : {
				"uid" : uid,
				"note" : note,
			},
			"dataType" : "json",
			// http://192.168.1.91/xztally/app.php/task/jiaoban?uid=3&business=qbzx&note=nihao
			"url" : interface_url + "?c=Shift&a=transfer",
			"success" : function(data) {
				if (data['code'] == 0) {
					justep.Util.hint("交班成功！");
					justep.Shell.closePage();
				} else {
					alert(data['msg']);
				}

			},
			"error" : function() {
				alert("数据传输失败！");
			}

		});

	};

	Model.prototype.backBtnClick = function(event) {
		justep.Shell.showPage("SelectSys");
	};

	return Model;
});