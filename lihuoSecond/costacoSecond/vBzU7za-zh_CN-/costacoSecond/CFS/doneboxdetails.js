define(function(require) {
	require("$UI/costacoSecond/ajax/jquery-1");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.levellistCustomRefresh = function(event) {
		// 查看关详情
		var levellist = this.comp("levellist");
		var operationMsg = this.comp("operationMsg");
		var containerMsg = this.comp("containerMsg");
		var Done_containerno = localStorage.getItem('Done_containerno');
		if (debugMode) {
			alert("--查看完成箱详情的接口--" + "\n箱id：" + Done_containerno);
		}
		$.ajax({
			"type" : "post",
			"async" : false,
			"data" : {

				"ctn_id" : Done_containerno
			},
			"dataType" : "json",// dataType,
			// 作业详情
			"url" : interface_url + "?c=CfsOperation&a=getContainerMsg",
			"success" : function(data) {
				if (PrintReturnValue) {
					alert(data);
					return;
				}
				if (data['code'] == 0) {
					containerMsg.loadData(data['containerMsg']);
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

	// 返回完成列表
	Model.prototype.button4Click = function(event) {
		window.location.href = "working.w";
	};
	// 页面加载执行
	Model.prototype.modelLoad = function(event) {
		// var containerno = localStorage.getItem('Done_containerno');
		// this.getElementByXid("span9").innerText=containerno;
	};

	Model.prototype.a1Click = function(event) {
		var contents = this.comp('contents');
		contents.to(1);
	};

	Model.prototype.button5Click = function(event) {
		justep.Shell.showPage("working_cfs");
	};

	Model.prototype.modelActive = function(event) {
		var ctn = localStorage.getItem('CFS_Done_ctn');
		this.comp('titleBar2').set({
			'title' : ctn
		});

		this.levellistCustomRefresh();
	};

	Model.prototype.sealnoImg = function(event) {
		localStorage.setItem("imgshow", 1);
		justep.Shell.showPage("levelPics_cfs");
	};
	Model.prototype.ctnImgClick = function(event) {
		localStorage.setItem("imgshow", 2);
		justep.Shell.showPage("levelPics_cfs");
	};
	Model.prototype.cargoImgClick = function(event) {
		localStorage.setItem("imgshow", 3);
		var level_num = event.bindingContext.$object.val('level_num');
		localStorage.setItem("level_num", level_num - 1);
		justep.Shell.showPage("levelPics_cfs");
	};

	Model.prototype.damageImgClick = function(event) {
		localStorage.setItem("imgshow", 4);
		var level_num = event.bindingContext.$object.val('level_num');
		localStorage.setItem("level_num", level_num - 1);
		justep.Shell.showPage("levelPics_cfs");
	};

	Model.prototype.doorImg = function(event) {
		localStorage.setItem("imgshow", 5);
		justep.Shell.showPage("levelPics_cfs");
	};

	return Model;
});