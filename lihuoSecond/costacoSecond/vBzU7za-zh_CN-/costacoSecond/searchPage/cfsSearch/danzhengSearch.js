define(function(require) {
	require("$UI/costacoSecond/ajax/jquery-1");
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
				"type" : 1,
			},
			"dataType" : "json",
			// http://192.168.1.91/xztally/app.php/select/forqbzxplan
			"url" : interface_url + "?c=Ship&a=getShipList",
			"success" : function(data) {
				if (data['code'] == 0) {
					// 把返回所有的ship_name遍历到数组中
					for (var i = 0; i < data['list'].length; i++) {
						ret.push(data['list'][i]['ship_name']);
					}
					$("#cfs_danzheng_shipname").autocomplete({
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

	Model.prototype.searchClick = function(event) {
		var contents1 = this.comp('contents1');
		var danzhengList = this.comp('danzhengList');

		var shipname = $("#cfs_danzheng_shipname").val();
		var vayage = this.getElementByXid("vayage").value;
		var boxNo = this.getElementByXid("boxNo").value;
		// alert("shipname:"+shipname+"vayage:"+vayage+"boxNo:"+boxNo);return;
		$.ajax({
			"type" : "post",
			"async" : false,
			"data" : {
				"ctnno" : boxNo,
				"ship_name" : shipname,
				"voyage" : vayage,
			},
			"dataType" : "json",
			// http://192.168.1.91/xztally/app.php?c=DdSearch&a=document
			// http://121.41.22.2/tally/app.php?c=select&a=ctncertifylist&ctn_no=SFDGASRE1231&ship=37&vargo=HC20160603
			"url" : interface_url + "?c=CfsSearch&a=prove", // PHP数据库校验用户名和密码是否正常
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
		var id = event.bindingContext.$object.val('id');
		// alert(ctn_id+"==="+ship+"==="+vargo);
		localStorage.setItem('danzhengdetails_id', id);
		// window.location.href = "danzhengDetails.w"
		justep.Shell.showPage("danzhengDetails_cfs");
	};

	Model.prototype.button2Click = function(event) {
		justep.Shell.showPage("SelectSys");
	};

	return Model;
});