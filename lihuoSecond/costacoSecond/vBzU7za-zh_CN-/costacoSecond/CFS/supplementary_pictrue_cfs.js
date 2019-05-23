define(function(require) {
	require("$UI/costacoSecond/ajax/jquery-1");
	require("$UI/costacoSecond/ajax/db");
	var justep = require("$UI/system/lib/justep");
	require("cordova!com.brodysoft.sqlitePlugin");
	var Model = function() {
		this.callParent();
		this.i = 0;
		this.supplementary_picture = new Array();
	};

	Model.prototype.modelLoad = function(event) {
		onDeviceReady("CFS_TABLE");
		this.comp("titlebar1").set({
			"title" : "补充照片"
		});
	};

	Model.prototype.backBtnClick = function(event) {
		justep.Shell.showPage("working_cfs");
		//justep.Shell.closePage();
	};

	Model.prototype.nextClick = function(event) {
		var me = this;
		var ctndetails_ID = localStorage.getItem('ctndetails_ID');
		var uid = localStorage.getItem('userinfoid');
		// 将数组转化为字符串，通过特定的符号来连接
		var supplementary_picture_to_str = me.supplementary_picture.join("----------");

		CFS_supplementarySet(ctndetails_ID, localStorage.getItem("working_details_oid"), supplementary_picture_to_str, "6");

		justep.Shell.showPage("working_cfs");
	};

	Model.prototype.supplementary_pictureClick = function(event) {
		var me = this;
		if (this.i < 10) {
			function onSuccess(imageURI) {
				me.i++;
				me.comp('input_supplementary_picture').val("拍照成功！" + "第" + me.i + "张");
				me.supplementary_picture.push("data:image/jpg;base64," + imageURI);
			}
			function onFail(message) {
				return message;
			}
			navigator.camera.getPicture(onSuccess, onFail, {
				quality : 50,
				sourceType : 1,
				destinationType : 0,
				targetWidth : 1024,
				targetHeight : 768,
			// 0、2为从相册文件中选择，1为拍照，DestinationType返回类型0是base64
			});
		} else {
			alert("不能超过十张！");
		}
	};

	Model.prototype.modelActive = function(event) {
		this.comp('input_supplementary_picture').val("");
		this.i = 0;
		this.supplementary_picture = new Array();
	};

	return Model;
});