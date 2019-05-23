define(function(require) {
	// var $ = require("jquery");
	require("$UI/costacoSecond/ajax/jquery-1");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.levelpictureid;
		this.orderno;
		this.cargonumber;
		this.damageno;
		this.callParent();
	};

	Model.prototype.slingdetailCustomRefresh = function(event) {

		var ctn_id = localStorage.getItem('boxdetails_id');
		var boxdetails = this.comp('boxdetails');
		var operationDetails = this.comp('operationDetails');
		var slingdetail = this.comp("slingdetail");
		// 关列表
		$.ajax({
			"type" : "POST",
			"async" : false,
			"data" : {
				"ctn_id" : ctn_id

			},
			"dataType" : "json",
			// http://192.168.1.91/xztally/app.php/working/find?operationid=369&business=qbzx
			"url" : interface_url + "?c=QbzxOperation&a=getContainerMsg", // PHP数据库校验用户名和密码是否正常
			"success" : function(data) {
				if (data['code'] == 0) {
					slingdetail.loadData(data['levellist']);
					operationDetails.loadData([ data['operationMsg'] ]);
					boxdetails.loadData([ data['containerMsg'] ]);
				} else {
					alert(data['msg']);
				}
			},
			"error" : function() {
				alert("数据传输失败！");
			}

		});

	};
	// 保存箱子信息

	Model.prototype.button5Click = function(event) {
		this.comp("messageDialog1").show({
			"title" : "提示",
			"message" : "请输入修改原因："
		});

	};

	// 保存关信息
	Model.prototype.button6Click = function(event) {

		this.comp("messageDialog3").show({
			"title" : "提示",
			"message" : "请输入修改原因："
		});

		var levelpictureid = event.bindingContext.$object.val('id');
		var orderno = event.bindingContext.$object.val('billno');
		var cargonumber = event.bindingContext.$object.val('cargo_number');
		var damageno = event.bindingContext.$object.val('damage_num');
		this.levelpictureid = levelpictureid;
		this.orderno = orderno;
		this.cargonumber = cargonumber;
		this.damageno = damageno;
	};

	Model.prototype.messageDialog1OK = function(event) {
		var sealnoPIC = this.comp('sealnoPIC');
		var base64 = sealnoPIC.val('sealnopic');
		var sealno = this.getElementByXid("sealno").value;
		var cargoweight = this.getElementByXid("cargoweight").value;
		var emptyweight = this.getElementByXid("emptyweight").value;
		var uid = localStorage.getItem('userinfoid');
		var qbzx_operationid = localStorage.getItem('boxdetails_qbzx_operationid');
		if (debugMode) {
			alert("--修改箱接口--" + "\n作业id：" + qbzx_operationid + "\n用户id：" + uid + "\空箱重量：" + emptyweight + "\n货物重量：" + cargoweight + "\n铅封号：" + sealno + "\n备注：" + event.input)
		}
		$.ajax({
			"type" : "post",
			"async" : false,
			"data" : {
				"tp" : base64,
				"uid" : uid,
				"operation_id" : qbzx_operationid,
				"sealno" : sealno,
				"cargo_weight" : cargoweight,
				"empty_weight" : emptyweight,
				"remark" : event.input
			},
			"dataType" : "json",
			"url" : interface_url + "?c=QbzxOperation&a=editContainer", // PHP数据库校验用户名和密码是否正常
			"success" : function(data) {
				if (data['code'] == 0) {
					alert(data['msg']);
				} else {
					alert(data['msg']);
				}
			},
			"error" : function() {
				alert("数据传输失败！");
			}

		});

	};

	Model.prototype.messageDialog3OK = function(event) {
		var levelpictureid = this.levelpictureid;
		var orderno = this.orderno;
		var cargonumber = this.cargonumber;
		var damageno = this.damageno;
		var uid = localStorage.getItem('userinfoid');
		var qbzx_operationid = localStorage.getItem('boxdetails_qbzx_operationid');
		if (debugMode) {
			alert("--修改关接口--" + "\n作业id：" + qbzx_operationid + "\n用户id：" + uid + "\n提单号：" + orderno + "\n货物件数：" + cargonumber + "\n关id：" + levelpictureid + "\n残损：" + damageno + "\n备注：" + event.input)
		}
		$.ajax({
			"type" : "POST",
			"async" : false,
			"data" : {

				"uid" : uid,
				"operation_id" : qbzx_operationid,
				"level_id" : levelpictureid,
				"damage_num" : damageno,
				"billno" : orderno,
				"cargo_number" : cargonumber,
				"remark" : event.input
			},
			"dataType" : "json",
			// http://192.168.1.91/xztally/app.php/qbzx/saveguan?uid=28&oid=369&guanid=191&cargonumber=1&damageno=1&orderno=1&remark=1
			"url" : interface_url + "?c=QbzxOperation&a=editLevel", // PHP数据库校验用户名和密码是否正常
			"success" : function(data) {
				if (data['code'] == 0) {
					alert(data['msg']);
				} else {
					alert(data['msg']);
				}
			},
			"error" : function() {
				alert("数据传输失败！");
			}

		});

	};

	// 拍摄货照片
	Model.prototype.button8Click = function(event) {
		var me = this;
		function onSuccess(imageURI) {
			// data.newData({index : 0});
			// data.setValue("filePath", imageURI);
			// data.setValue("fileName",
			// imageURI.substr(imageURI.lastIndexOf('/') + 1));
			// data.setValue('createTime', justep.Date.toString(new Date(),
			// justep.Date.DEFAULT_FORMAT ));
			// var dispatchingOrderDetailsData =
			// this.comp("dispatchingOrderDetailsData");
			me.uploadgoodsImage(imageURI);
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
	};
	Model.prototype.uploadgoodsImage = function(imageURI) {
		var sealnoPIC = this.comp('sealnoPIC');

		sealnoPIC.setValue('sealnopic', "data:image/jpg;base64," + imageURI);
		// this.comp('input5').val("data:image/jpg;base64,"+imageURI);

	}

	Model.prototype.backBtnClick = function(event) {
		justep.Shell.closePage();
	};
	// 查看图片
	Model.prototype.image1Click = function(event) {
		/*
		 * var contents = this.comp("contents1"); var boxlist =
		 * this.comp('boxlist'); var sealpicture = boxlist.val('sealpicture');
		 */

	};

	return Model;
});