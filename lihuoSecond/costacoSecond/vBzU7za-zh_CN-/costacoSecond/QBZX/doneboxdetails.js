define(function(require) {
	require("$UI/costacoSecond/ajax/jquery-1");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.containerMsgCustomRefresh = function(event) {
		// 查看关详情
		var levellist = this.comp("levellist");
		var operationMsg = this.comp("operationMsg");
		var containerMsg = this.comp("containerMsg");
		var ctn_id = localStorage.getItem('id');
		// 作业表详情
		$.ajax({
			"type" : "POST",
			"async" : false,
			"data" : {
				"ctn_id" : ctn_id
			},
			"dataType" : "json",
			"url" : interface_url + "?c=QbzxOperation&a=getContainerMsg",
			"success" : function(data) {
				if (PrintReturnValue) {
					alert(data);
					return;
				}
				if (data['code'] == 0) {
					containerMsg.loadData([ data['containerMsg'] ]);
					operationMsg.loadData([ data['operationMsg'] ])
					levellist.loadData(data['levellist']);
				} else {
					justep.Util.hint(data['msg'], {"delay" : normerHintDelay});
				}
			},
			"error" : function() {
				justep.Util.hint("数据传输失败！", {"delay" : normerHintDelay,"style" : "color:red;"});
			}

		});

	};
	Model.prototype.button4Click = function(event) {
		justep.Shell.closePage();
		justep.Shell.showPage("working");
	};
	// 页面加载执行
	Model.prototype.modelLoad = function(event) {
		var containerno = localStorage.getItem('ctnno');
		this.getElementByXid("span9").innerText = containerno;
	};

	Model.prototype.sealnoImg = function(event) {
		localStorage.setItem("imgshow", 1);
		justep.Shell.showPage("levelPics");
	};
	Model.prototype.ctnImgClick = function(event) {
		localStorage.setItem("imgshow", 2);
		justep.Shell.showPage("levelPics");
	};
	Model.prototype.cargoImgClick = function(event) {
		localStorage.setItem("imgshow", 3);
		var level_num = event.bindingContext.$object.val('level_num');
		localStorage.setItem("level_num", level_num - 1);
		justep.Shell.showPage("levelPics");
	};

	Model.prototype.damageImgClick = function(event) {
		localStorage.setItem("imgshow", 4);
		var level_num = event.bindingContext.$object.val('level_num');
		localStorage.setItem("level_num", level_num - 1);
		justep.Shell.showPage("levelPics");
	};

	Model.prototype.doorImg = function(event) {
		localStorage.setItem("imgshow", 5);
		justep.Shell.showPage("levelPics");
	};

	Model.prototype.modelActive = function(event) {
		var ctn = localStorage.getItem('QBZX_Done_ctn');
		this.comp('titleBar2').set({
			'title' : ctn
		});
	};

	return Model;
});