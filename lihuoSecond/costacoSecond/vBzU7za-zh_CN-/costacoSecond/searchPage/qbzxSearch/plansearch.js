define(function(require) {
	// require("$UI/costaco/ajax/jquery-1");
	require("$UI/costacoSecond/ajax/jquery-ui.min");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.shipInfoCustomRefresh = function(event) {
		var me = this;
		// 获取委托方和船名
		var shipInfo = this.comp('shipInfo');
		var ret = [];
		$.ajax({
			"type" : "post",
			"async" : true,
			"data" : {

			},
			"dataType" : "json",
			// http://192.168.1.91/xzcostacoSecond/app.php/select/forqbzxplan
			"url" : interface_url + "?c=Ship&a=getShipList", // PHP数据库校验用户名和密码是否正常
			"success" : function(data) {
				if (data['code'] == 0) {

					for (var i = 0; i < data['list'].length; i++) {
						ret.push(data['list'][i]['ship_name']);
					}
					$("#input1").autocomplete({
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

	Model.prototype.locationCustomRefresh = function(event) {

		var location = this.comp('location');
		$.ajax({
			"type" : "post",
			"async" : false,
			"data" : {

			},
			"dataType" : "json",
			// http://192.168.1.91/xzcostacoSecond/app.php/index/foundation"
			"url" : interface_url + "?c=Location&a=getLocationList", // PHP数据库校验用户名和密码是否正常
			"success" : function(data) {
				if (data['code'] == 0) {
					location.loadData(data['list'])
				} else {
					alert(data['msg']);
				}

			},
			"error" : function() {
				alert("数据传输失败！");
			}

		});

	};
	// 查询按钮
	Model.prototype.button1Click = function(event) {
		var instructionsData = this.comp('instructionsData');
		var voyage = this.getElementByXid("input3").value;
		var entrusttime = this.getElementByXid("input1").value;
		var locationcode = this.getElementByXid("select1").value;
		var shipcode = $("#input1").val();
		var customercode = this.getElementByXid("select2").value;

		if (debugMode) {
			alert("--委托查询接口--" + "\n作业场地id：" + locationcode + "\n预报时间：" + entrusttime + "\n船id：" + shipcode + "\n航次：" + voyage + "\n委托id：" + customercode);
		}
		$.ajax({
			"type" : "post",
			"async" : false,
			"data" : {
				"ship_id" : shipcode,
				"voyage" : voyage,
				"location_id" : locationcode,
				"entrust_company" : customercode,
				"entrust_time" : entrusttime
			},
			"dataType" : "json",
			// http://192.168.1.91/xzcostacoSecond/app.php/select/qbzxplan
			"url" : interface_url + "?c=QbzxSearch&a=qbzxplan",
			"success" : function(data) {
				// alert(data['list'].length);
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
	// 返回界面
	Model.prototype.button3Click = function(event) {
		justep.Shell.showPage("SelectSys");
	};

	Model.prototype.li1Click = function(event) {
		var qbzx_forecastplanid = event.bindingContext.$object.val('id');
		localStorage.setItem('findplan', qbzx_forecastplanid);
		// alert(qbzx_forecastplanid)
		justep.Shell.showPage("forecastDetails");
	};

	Model.prototype.customerInfoCustomRefresh = function(event) {
		var customerInfo = this.comp('customerInfo');
		$.ajax({
			"type" : "post",
			"async" : false,
			"data" : {

			},
			"dataType" : "json",
			"url" : interface_url + "?c=Customer&a=getCustomerList",
			"success" : function(data) {
				if (data['code'] == 0) {
					customerInfo.loadData(data['list']);
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
		this.shipInfoCustomRefresh();
	};

	return Model;
});