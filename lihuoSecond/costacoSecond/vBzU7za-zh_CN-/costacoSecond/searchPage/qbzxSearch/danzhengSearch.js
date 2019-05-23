define(function(require) {
	// require("$UI/costaco/ajax/jquery-1");
	require("$UI/costacoSecond/ajax/jquery-ui.min");
	var justep = require("$UI/system/lib/justep");
	// require("$UI/costaco/ajax/autocomplete.min");
	var Model = function() {
		this.callParent();
	};

	Model.prototype.shipInfoCustomRefresh = function(event) {
		var me = this;
		var ret = [];
		var shipInfo = this.comp('shipInfo');
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
					// 把返回所有的ship_name遍历到数组中
					for (var i = 0; i < data['list'].length; i++) {
						ret.push(data['list'][i]['ship_name']);
					}
					$("#input1").autocomplete({
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

	Model.prototype.button1Click = function(event) {
		var contents1 = this.comp('contents1');
		var danzhengList = this.comp('danzhengList');
		var shipname = $("#input1").val();
		var vayage = this.getElementByXid("vayage").value;
		var boxNo = this.getElementByXid("boxNo").value;
		if (true) {
			alert("--单证查询接口--" + "\n船id：" + shipname + "\n航次：" + vayage + "\n箱号id：" + boxNo)
		}
		$.ajax({
			"type" : "post",
			"async" : false,
			"data" : {
				"ctnno" : boxNo,
				"ship_name" : shipname,
				"voyage" : vayage
			},
			"dataType" : "json",
			"url" : interface_url + "?c=QbzxSearch&a=prove",
			"success" : function(data) {
				if (data['code'] == 0) {
					danzhengList.loadData(data['list']);
					danzhengList.refreshData();
					contents1.to(1);
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
		var danzheng_id = event.bindingContext.$object.val('id');
		var ship = event.bindingContext.$object.val('ship');
		var vargo = event.bindingContext.$object.val('vargo');
		// alert(ctn_id+"==="+ship+"==="+vargo);
		localStorage.setItem('danzheng_id', danzheng_id);
		localStorage.setItem('ship', ship);
		localStorage.setItem('vargo', vargo);

		justep.Shell.showPage("danzhengDetails");
	};

	Model.prototype.button2Click = function(event) {
		justep.Shell.showPage("SelectSys");
	};

	return Model;
});