define(function(require) {
	// require("$UI/costaco/ajax/jquery-1");
	var justep = require("$UI/system/lib/justep");
	require("$UI/costacoSecond/ajax/jquery-ui.min");
	var Model = function() {
		this.callParent();
	};

	Model.prototype.button1Click = function(event) {
		var contents = this.comp("contents1");
		var operationMsg = this.comp('operationMsg');
		var boxlist = this.comp('boxlist');
		var slingdetail = this.comp('slingdetail');
		var contno = this.getElementByXid("input1").value;
		var voyage = this.getElementByXid("input2").value;
		var shipname = $("#qbzx_work_shipname").val();
		if (false) {
			alert("--作业明细查询接口--" + "\n箱号：" + contno + "\n航次：" + voyage + "\n船id：" + shipname);
		}
		if (contno == "" || voyage == "" || shipname == "") {
			alert("查询条件不能为空！");
			return;
		} else {

			$.ajax({
				"type" : "POST",
				"async" : false,
				"data" : {
					"ship_name" : shipname,
					"voyage" : voyage,
					"ctnno" : contno
				},
				"dataType" : "json",
				"url" : interface_url + "?c=QbzxSearch&a=operation",
				"success" : function(data) {
					if (data['code'] == 0) {
						localStorage.setItem("id", data['ctnMsg']['id']);
						boxlist.loadData([ data['ctnMsg'] ]);
						operationMsg.loadData([ data['operationMsg'] ]);
						slingdetail.loadData(data['levellist']);
						contents.to(1);
					} else {
						alert(data['msg']);
					}
				},
				"error" : function() {
					alert("数据传输失败！");
				}

			});
		}
	};

	Model.prototype.shipnameCustomRefresh = function(event) {
		var me = this;

		// 获取委托方和船名
		var shipname = this.comp('shipname');
		var ret = [];

		$.ajax({
			"type" : "post",
			"async" : false,
			"data" : {
				"type" : ""
			},
			"dataType" : "json",
			// http://192.168.1.91/xzcostacoSecond/index.php/index/damagecargo
			"url" : interface_url + "?c=Ship&a=getShipList", // PHP数据库校验用户名和密码是否正常
			"success" : function(data) {
				if (data['code'] == 0) {

					for (var i = 0; i < data['list'].length; i++) {
						ret.push(data['list'][i]['ship_name']);
					}
					$("#qbzx_work_shipname").autocomplete({
						source : ret,
						autoFocus : true
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

	Model.prototype.button3Click = function(event) {
		justep.Shell.showPage("SelectSys");
	};

	Model.prototype.sealnoImg = function(event) {

		localStorage.setItem("imgshow", 1);
		justep.Shell.showPage("levelPics");

	};

	Model.prototype.ctnImgClick = function(event) {

		localStorage.setItem("imgshow", 2);
		justep.Shell.showPage("levelPics");

	};

	Model.prototype.doorImg = function(event) {

		localStorage.setItem("imgshow", 5);
		justep.Shell.showPage("levelPics");

	};

	Model.prototype.damageImgClick = function(event) {

		localStorage.setItem("imgshow", 4);
		var level_num = event.bindingContext.$object.val('level_num');
		localStorage.setItem("level_num", level_num - 1);
		justep.Shell.showPage("levelPics");

	};

	Model.prototype.cargoImgClick = function(event) {
		localStorage.setItem("imgshow", 3);
		var level_num = event.bindingContext.$object.val('level_num');
		localStorage.setItem("level_num", level_num - 1);
		justep.Shell.showPage("levelPics");
	};

	return Model;
});
