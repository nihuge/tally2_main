define(function(require) {
	// require("$UI/costaco/ajax/jquery-1");
	var justep = require("$UI/system/lib/justep");
	require("$UI/costacoSecond/ajax/jquery-ui.min");
	var Model = function() {
		this.callParent();
	};

	// 获取船名
	Model.prototype.shipInfoCustomRefresh = function(event) {
		var me = this;
		var ret = [];
		var shipInfo = this.comp('shipInfo');
		$.ajax({
			"type" : "post",
			"async" : true,
			"data" : {
				"type" : "",
			},
			"dataType" : "json",
			// http://192.168.1.91/xztally/app.php?c=Ship&a=getShipList
			"url" : interface_url + "?c=Ship&a=getShipList", // PHP数据库校验用户名和密码是否正常
			"success" : function(data) {
				// 遍历json,将ship_name放进ret数组
				if (data['code'] == 0) {
					for (var i = 0; i < data['list'].length; i++) {
						ret.push(data['list'][i]['ship_name']);
					}
					$("#dd_plan_shipname").autocomplete({
						source : ret,

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

	// 获取作业场地
	Model.prototype.locationDataCustomRefresh = function(event) {

		var location = this.comp('locationData');
		$.ajax({
			"type" : "post",
			"async" : false,
			"data" : {

			},
			"dataType" : "json",
			// ?c=Location&a=getLocationList
			"url" : interface_url + "?c=Location&a=getLocationList", // PHP数据库校验用户名和密码是否正常
			"success" : function(data) {
				location.loadData(data['list']);

			},
			"error" : function() {
				alert("数据传输失败！");
			}

		});
	};
	// 获取委托单位
	Model.prototype.customerInfoCustomRefresh = function(event) {

		var customerInfo = this.comp('customerInfo');
		$.ajax({
			"type" : "post",
			"async" : false,
			"data" : {

			},
			"dataType" : "json",
			// ?c=Customer&a=getCustomerList
			"url" : interface_url + "?c=Customer&a=getCustomerList", // PHP数据库校验用户名和密码是否正常
			"success" : function(data) {
				customerInfo.loadData(data['list'])

			},
			"error" : function() {
				alert("数据传输失败！");
			}

		});

	};

	// 查询按钮
	Model.prototype.searchBtnClick = function(event) {
		var planDetailsData = this.comp('planDetailsData');
		var voyage = this.getElementByXid("voyage").value;
		var entrusttime = this.getElementByXid("entrusttime").value;
		var locationcode = this.getElementByXid("location").value;
		var shipcode = $("#input1").val();
		var customercode = this.getElementByXid("customer").value;

		if (debugMode) {
			alert("--门到门预报查询接口--" + "\n拆箱地点id：" + locationcode + "\n委托时间：" + entrusttime + "\n船id：" + shipcode + "\n航次：" + voyage + "\n委托单位：" + customercode);
		}
		$.ajax({
			"type" : "post",
			"async" : false,
			"data" : {
				"vslname" : shipcode,
				"voyage" : voyage,
				"unpackagingplace" : locationcode,
				"applyname" : customercode,
				"orderdate" : entrusttime

			},
			"dataType" : "json",
			// http://192.168.1.91/xztally/app.php?c=DdSearch&a=plan

			"url" : interface_url + "?c=DdSearch&a=plan",
			"success" : function(data) {
				if (data['code'] == 0) {
					planDetailsData.loadData(data['list']);
					planDetailsData.refreshData();
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
		var forecastplanid = event.bindingContext.$object.val('id');
		localStorage.setItem('findplan', forecastplanid);
		// alert(qbzx_forecastplanid)
		// window.location.href="forecastDetails.w";
		// window.open("forecastDetails.w");
		justep.Shell.showPage("forecastDetails_dd")
	};

	Model.prototype.modelActive = function(event) {
		this.shipInfoCustomRefresh();
	};

	return Model;
});