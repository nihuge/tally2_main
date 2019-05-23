define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	// 加载cordova横竖屏插件
	require("cordova!cordova-plugin-screen-orientation");
	// 加载js签名文件
	require("./js/jq-signature");
	var Model = function() {
		this.callParent();
		this.signature = $("#mySignature");
		this.isFirst = true;
		this.signWidth = 500;
		this.signHeight = 200;
	};

	Model.prototype.modelLoad = function(event) {
		cordova.plugins.screenorientation.setOrientation('landscape');
		this.loadWs();
	};

	Model.prototype.loadWs = function() {
		if (this.isFirst) {
			this.signWidth = document.getElementById('panel1').offsetHeight + 25;
			this.signHeight = document.getElementById('panel1').offsetWidth;
			this.isFirst = false;
		}
		this.signature.jqSignature({
			width : this.signWidth,
			height : this.signHeight,
			border : '0px solid red',
			background : '#ffffff',
			lineColor : '#000000',
			lineWidth : 2,
			autoFit : false
		});
		// alert("宽度:" + document.getElementById('mySignature').offsetWidth +
		// "\n" + "高度:" + document.getElementById('top1').offsetHeight);
	};

	Model.prototype.btn_clearClick = function(event) {
		this.signature.jqSignature('clearCanvas');
		this.signWidth = document.getElementById('mySignature').offsetWidth;
		this.signHeight = document.getElementById('mySignature').offsetHeight;
	};

	Model.prototype.btn_getdataClick = function(event) {
		alert(this.signature.jqSignature('getDataURL'));
		// $("#img").attr('src', this.signature.jqSignature('getDataURL'));
	};

	Model.prototype.btn_refleshClick = function(event) {
		window.location.reload();
	};

	return Model;
});