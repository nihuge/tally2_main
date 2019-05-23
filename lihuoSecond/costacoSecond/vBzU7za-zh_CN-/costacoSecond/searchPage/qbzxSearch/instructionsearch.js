define(function(require) {
	// require("$UI/costaco/ajax/jquery-1");
	var justep = require("$UI/system/lib/justep");
	require("$UI/costacoSecond/ajax/jquery-ui.min");
	var Model = function() {
		this.callParent();
	};

	Model.prototype.locationCustomRefresh = function(event) {

		var location = this.comp('location');
		$.ajax({
			"type" : "post",
			"async" : false,
			"data" : {

			},
			"dataType" : "json",

			// http://192.168.1.91/xzcostacoSecond/app.php/index/foundation
			"url" : interface_url + "?c=Location&a=getLocationList",
			"success" : function(data) {
				location.loadData(data['list'])

			},
			"error" : function() {
				alert("数据传输失败！");
			}

		});

	};
	// 查询按钮
	Model.prototype.button1Click = function(event) {
		var ordertime = this.getElementByXid("input3").value;
		var locationno = this.getElementByXid("select1").value;
		var status = this.getElementByXid("select3").value;
		var ship = $("#qbzx_ins_shipname").val();
		var voyage = this.getElementByXid("input1").value;
		var instructionsData = this.comp('instructionsData');
		if (false) {
			alert("--指令查询接口--" + "\nordertime：" + ordertime + "\nship_id:" + ship + "\nvoyage:" + voyage + "\nlocation_id:" + locationno + "\nstatus:" + status);
		}
		$.ajax({
			"type" : "post",
			"async" : false,
			"data" : {
				"ship_id" : ship,
				"voyage" : voyage,
				"location_id" : locationno,
				"ordertime" : ordertime,
				"status" : status
			},
			"dataType" : "json",
			"url" : interface_url + "?c=QbzxSearch&a=instruction",
			"success" : function(data) {
				if (data['code'] == 0) {
					instructionsData.loadData(data['list']);
					instructionsData.refreshData();
				} else {
					alert(data['msg']);
				}

			},
			"error" : function() {
				alert("数据传输失败！");
			}

		});
	};
	// 跳转查询页面
	Model.prototype.button3Click = function(event) {
		justep.Shell.showPage("SelectSys");
	};

	Model.prototype.shipInfoCustomRefresh = function(event) {

		var me = this;
		// 获取委托方和船名
		var shipInfo = this.comp('shipInfo');
		var customerInfo = this.comp('customerInfo');
		var ret = [];

		$.ajax({
			"type" : "POST",
			"async" : false,
			"data" : {
				"type" : ""
			},
			"dataType" : "json",
			// http://192.168.1.91/xzcostacoSecond/app.php/select/forqbzxplan
			"url" : interface_url + "?c=Ship&a=getShipList", // PHP数据库校验用户名和密码是否正常
			"success" : function(data) {
				if (data['code'] == 0) {

					for (var i = 0; i < data['list'].length; i++) {
						ret.push(data['list'][i]['ship_name']);
					}
					$("#qbzx_ins_shipname").autocomplete({
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

	Model.prototype.li1Click = function(event) {
		localStorage.setItem('searchInstructionFlag', 1);
		var value = event.bindingContext.$object.val('id');
		localStorage.setItem('workPlanID_details', value);
		localStorage.setItem('insid', value);
		justep.Shell.showPage("searchInstructionDetails");
	};

	return Model;
});