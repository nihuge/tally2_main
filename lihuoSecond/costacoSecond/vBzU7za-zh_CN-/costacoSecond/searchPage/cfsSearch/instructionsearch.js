define(function(require) {
	/* require("$UI/costaco/ajax/jquery-1"); */
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

			// ?c=Location&a=getLocationList
			"url" : interface_url + "?c=Location&a=getLocationList",
			"success" : function(data) {
				location.loadData(data['list']);

			},
			"error" : function() {
				alert("数据传输失败！");
			}

		});

	};
	// 查询按钮
	Model.prototype.searchClick = function(event) {
		var ordertime = this.getElementByXid("input3").value;
		var locationno = this.getElementByXid("select1").value;
		var status = this.getElementByXid("select3").value;
		var ship = $("#cfs_ins_shipname").val();
		var voyage = this.getElementByXid("input1").value;
		var instructionsData = this.comp('instructionsData');
		// alert(ordertime+"--"+locationno+"=="+status+"==");

		$.ajax({
			"type" : "post",
			"async" : false,
			"data" : {
				"vslname" : ship,
				"voyage" : voyage,
				"location_id" : locationno,
				"date" : ordertime,
				"status" : status
			},
			"dataType" : "json",
			// http://192.168.1.91/xztally/app.php/select/qbzxins
			"url" : interface_url + "?c=CfsSearch&a=instruction",
			"success" : function(data) {
				instructionsData.loadData(data['list']);
				instructionsData.refreshData();

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
			"type" : "post",
			"async" : false,
			"data" : {
				"type" : 1,
			},
			"dataType" : "json",
			// http://192.168.1.91/xztally/app.php/select/forqbzxplan
			"url" : interface_url + "?c=Ship&a=getShipList", // PHP数据库校验用户名和密码是否正常
			"success" : function(data) {
				if (data['code'] == 0) {
					// 把返回所有的ship_name遍历到数组中
					for (var i = 0; i < data['list'].length; i++) {
						ret.push(data['list'][i]['ship_name']);
					}
					$("#cfs_ins_shipname").autocomplete({
						source : ret
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

		var id = event.bindingContext.$object.val('id');
		localStorage.setItem('instructionId', id);

		// window.location.href = "instructionDetails.w";
		this.comp("openInstructiondetail").open();
	};

	return Model;
});