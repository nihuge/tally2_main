define(function(require) {
	require("$UI/costacoSecond/ajax/jquery-1");
	var justep = require("$UI/system/lib/justep");
	var ShellImpl = require('$UI/system/lib/portal/shellImpl');
	var Model = function() {
		this.callParent();
	};

	Model.prototype.levellistCustomRefresh = function(event) {
		// 查看关详情
		var levellist = this.comp("levellist");
		var operationMsg = this.comp("operationMsg");
		var containerMsg = this.comp("containerMsg");
		var ctn_id = localStorage.getItem('Done_containerno');
		// 作业表详情
		$.ajax({
			"type" : "post",
			"async" : false,
			"data" : {
				"ctn_id" : ctn_id
			},
			"dataType" : "json",
			"url" : interface_url + "?c=DdOperation&a=getContainerMsg",
			"success" : function(data) {
				// alert(data)
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

	// 返回完成列表
	Model.prototype.button4Click = function(event) {
		window.location.href = "working.w";
	};

	Model.prototype.button5Click = function(event) {
		justep.Shell.closePage();
	};
	/*
	 * Model.prototype.sealnoImg = function(event) {
	 * localStorage.setItem("imgshow", 1);
	 * justep.Shell.showPage("levelPics_dd"); }; Model.prototype.cargoImgClick =
	 * function(event) { localStorage.setItem("imgshow", 3); var level_num =
	 * event.bindingContext.$object.val('level_num');
	 * localStorage.setItem("level_num", level_num - 1);
	 * justep.Shell.showPage("levelPics_dd"); };
	 * 
	 * Model.prototype.damageImgClick = function(event) {
	 * localStorage.setItem("imgshow", 4); var level_num =
	 * event.bindingContext.$object.val('level_num');
	 * localStorage.setItem("level_num", level_num - 1);
	 * justep.Shell.showPage("levelPics_dd"); };
	 * 
	 * Model.prototype.doorImg = function(event) {
	 * localStorage.setItem("imgshow", 5);
	 * justep.Shell.showPage("levelPics_dd"); };
	 */

	// -----------------------------------------------------------------
	// 空箱照片-2
	Model.prototype.empty_pictureClick = function(event) {
		localStorage.setItem("imgshow", 2);
		justep.Shell.showPage("levelPics_dd");
	};
	// 箱门照片-5
	Model.prototype.door_pictureClick = function(event) {
		localStorage.setItem("imgshow", 5);
		justep.Shell.showPage("levelPics_dd");
	};
	// 箱残损照片-7
	Model.prototype.damage_pictureClick = function(event) {
		localStorage.setItem("imgshow", 7);
		justep.Shell.showPage("levelPics_dd");
	};
	// 作业中箱残损照片-6
	Model.prototype.damage_after_pictureClick = function(event) {
		localStorage.setItem("imgshow", 6);
		justep.Shell.showPage("levelPics_dd");
	};
	// 货物照片-3
	Model.prototype.cargo_pictureClick = function(event) {
		localStorage.setItem("imgshow", 3);
		justep.Shell.showPage("levelPics_dd");
	};
	// 铅封照片-1
	Model.prototype.seal_pictureClick = function(event) {
		localStorage.setItem("imgshow", 1);
		justep.Shell.showPage("levelPics_dd");
	};
	// 货残损照片-4
	Model.prototype.damageImgClick = function(event) {
		localStorage.setItem("imgshow", 4);
		var level_num = event.bindingContext.$object.val('level_num');
		localStorage.setItem("level_num", level_num - 1);
		justep.Shell.showPage("levelPics_dd");
	};

	Model.prototype.modelActive = function(event) {
		var ctn = localStorage.getItem('Done_ctn');
		this.comp('titleBar2').set({
			'title' : ctn
		});
	};

	return Model;
});