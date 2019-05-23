define(function(require) {
	// require("$UI/costaco/ajax/jquery-1");
	var justep = require("$UI/system/lib/justep");
	require("$UI/costacoSecond/ajax/jquery-ui.min");
	var Model = function() {
		this.callParent();
	};

	Model.prototype.searchBtnClick = function(event) {
		var contents = this.comp("contents1");
		var boxlist = this.comp('boxlist');
		var operationDetails = this.comp('operationDetails');
		var slingdetail = this.comp('slingdetail');
		var contno = this.getElementByXid("contno").value;
		var voyage = this.getElementByXid("voyage").value;
		var shipname = $("#dd_work_shipname").val();
		if (contno == "" || voyage == "" || shipname == "") {
			alert("查询条件不能为空！");
			return;
		} else {

			$.ajax({
				"type" : "post",
				"async" : false,
				"data" : {
					"ctnno" : contno,
					"vslname" : shipname,
					"voyage" : voyage
				},
				"dataType" : "json",
				// http://192.168.1.91/xztally/app.php?c=DdOperation&a=operation
				"url" : interface_url + "?c=DdSearch&a=operation",
				"success" : function(data) {
					if (data['code'] == 0) {
						localStorage.setItem("Done_containerno", data['ctn_msg']['id']);
						boxlist.loadData([ data['ctn_msg'] ]);
						slingdetail.loadData(data['list']);
						operationDetails.loadData([ data['operation_msg'] ])
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

		var ret = [];
		var me = this;
		// 获取委托方和船名
		var shipname = this.comp('shipname');
		$.ajax({
			"type" : "post",
			"async" : false,
			"data" : {
				"type" : 1,
			},
			"dataType" : "json",
			// http://192.168.1.91/xztally/app.php/select/forqbzxplan
			"url" : interface_url + "?c=Ship&a=getShipList",
			"success" : function(data) {
				for (var i = 0; i < data['list'].length; i++) {
					ret.push(data['list'][i]['ship_name']);
				}
				$("#dd_work_shipname").autocomplete({
					source : ret
				});
			},
			"error" : function() {
				alert("数据传输失败！");
			}
		});
	};

	Model.prototype.button3Click = function(event) {
		justep.Shell.showPage("SelectSys");
	};

	Model.prototype.doorBtnClick = function(event) {
		localStorage.setItem("imgshow", 5);
		justep.Shell.showPage("levelPics_dd");
	};

	Model.prototype.damageBtnClick = function(event) {
		localStorage.setItem("imgshow", 4);
		var level_num = event.bindingContext.$object.val('level_num');
		localStorage.setItem("level_num", level_num - 1);
		justep.Shell.showPage("levelPics_dd");
	};

	Model.prototype.cargoBtnClick = function(event) {
		localStorage.setItem("imgshow", 3);
		var level_num = event.bindingContext.$object.val('level_num');
		localStorage.setItem("level_num", level_num - 1);
		justep.Shell.showPage("levelPics_dd");
	};

	Model.prototype.sealBtnClick = function(event) {
		localStorage.setItem("imgshow", 1);
		justep.Shell.showPage("levelPics_dd");
	};

	Model.prototype.emptyBtnClick = function(event) {
		localStorage.setItem("imgshow", 2);
		justep.Shell.showPage("levelPics_dd");
	};

	Model.prototype.box_afterBtnClick = function(event) {
		localStorage.setItem("imgshow", 6);
		justep.Shell.showPage("levelPics_dd");
	};

	Model.prototype.boxBtnClick = function(event) {
		localStorage.setItem("imgshow", 7);
		justep.Shell.showPage("levelPics_dd");
	};

	return Model;
});