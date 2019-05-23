define(function(require) {
	require(jqUrl);
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.InsDetailsCustomRefresh = function(event) {
		var InsDetails = this.comp('InsDetails');
		var instructionId = localStorage.getItem('instructionId');
		$.ajax({
			"type" : "post",
			"async" : false,
			"data" : {
				"id" : instructionId
			},
			"dataType" : "json",
			// http://192.168.1.91/xztally/app.php?c=DdOperation&a=operation
			"url" : interface_url + "?c=CfsInstruction&a=getInstructionMsg",
			"success" : function(data) {
				if (data['code'] == 0) {
					InsDetails.loadData([ data['content'] ]);

				} else {
					alert(data['msg']);
				}
			},
			"error" : function() {
				alert("数据传输失败！");
			}

		});
	};

	Model.prototype.backBtnClick = function(event) {
		justep.Shell.closePage();
	};

	Model.prototype.goodsCustomRefresh = function(event) {

		var goods = this.comp('goods');
		var instructionId = localStorage.getItem('instructionId');
		$.ajax({
			"type" : "post",
			"async" : false,
			"data" : {
				"instruction_id" : instructionId
			},
			"dataType" : "json",
			// http://192.168.1.91/xztally/app.php?c=DdOperation&a=operation
			"url" : interface_url + "?c=CfsOperation&a=getCargoList",
			"success" : function(data) {
				if (data['code'] == 0) {
					goods.loadData(data['list']);
				} else {
					alert(data['msg']);
				}
			},
			"error" : function() {
				alert("数据传输失败！");
			}
		});
	};

	// 获取箱列表
	Model.prototype.boxDetailsCustomRefresh = function(event) {
		var boxDetails = this.comp('boxDetails');
		var instructionId = localStorage.getItem('instructionId');
		$.ajax({
			"type" : "post",
			"async" : false,
			"data" : {
				"instruction_id" : instructionId
			},
			"dataType" : "json",
			// http://192.168.1.91/xztally/app.php?c=DdOperation&a=operation
			"url" : interface_url + "?c=CfsOperation&a=getContainer",
			"success" : function(data) {
				if (data['code'] == 0) {
					boxDetails.loadData(data['list']);
				} else {
					alert(data['msg']);
				}
			},
			"error" : function() {
				alert("数据传输失败！");
			}

		});
	};

	return Model;
});