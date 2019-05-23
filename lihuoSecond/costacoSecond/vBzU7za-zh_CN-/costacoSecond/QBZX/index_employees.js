define(function(require) {
	require("$UI/costacoSecond/ajax/jquery-1");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	// 收工
	Model.prototype.button5Click = function(event) {
		/*
		 * var row = event.bindingContext.$object;
		 * this.comp("data1").deleteData(row);
		 */
		window.location.href = "downwork.w";
	};

	Model.prototype.data1Create = function(event) {
		event.source.limit = 2;
	};

	Model.prototype.data1CustomSave = function(event) {
		comsole.log(event.source.toJson(true));
	};

	Model.prototype.button6Click = function(event) {
		/*
		 * var value = localStorage.getItem("key"); alert(value);
		 */
		window.location.href = "SelectSys.w";
	};

	// 签到
	Model.prototype.td5Click = function(event) {
		window.location.href = "SignIn.w";
	};

	Model.prototype.td7Click = function(event) {
		// 作业计划
		window.location.href = "workplan.w";
	};

	Model.prototype.td6Click = function(event) {
		// alert("我是派工");
	};

	Model.prototype.td8Click = function(event) {
		// 装箱作业
		// window.open("working.w", "_blank")
		this.comp('working').open();
	};

	Model.prototype.td9Click = function(event) {
		// alert("我是表格5");
	};

	Model.prototype.td10Click = function(event) {
		window.location.href = "downwork.w";
	};

	// 签到按钮
	Model.prototype.button7Click = function(event) {

	};

	// 跳转指令查询界面
	Model.prototype.td11Click = function(event) {
		window.location.href = "instructionsearch.w";
	};

	// 个人信息加载
	Model.prototype.infoCustomRefresh = function(event) {
		var info = this.comp('info');

		var username = localStorage.getItem('username');
		var gb = localStorage.getItem('group_name');
		var zhclasses = localStorage.getItem('zhclasses');
		var date = localStorage.getItem('date');
		var bm = localStorage.getItem('bm');
		var position = localStorage.getItem('position');
		var staffno = localStorage.getItem('staffno');
		var data = [ {
			"name" : username,
			"bm" : bm,
			"gb" : gb,
			"time" : date,
			"day" : zhclasses,
			"position" : position,
			"staffno" : staffno
		} ];
		if (username == null) {
			alert("用户未登录，请登录！");
			window.location.href = "login.w";
			return;
		} else {

			info.loadData(data);
		}
	};

	// 退出登录
	Model.prototype.button1Click = function(event) {
		localStorage.clear();
		window.location.href = "login.w";
	};

	/*
	 * Model.prototype.xtttClick = function(event){ alert("d"); var url =
	 * "$UI2/costaco/qbzx/login.w"; justep.Shell.showPage(url); };
	 */

	// 委托计划查询
	Model.prototype.td2Click = function(event) {
		window.location.href = "plansearch.w";
	};

	// 跳转修改密码页面
	Model.prototype.gruopItem1Click = function(event) {
		window.location.href = "changePwd.w";
	};

	Model.prototype.td16Click = function(event) {
		window.location.href = "handoverSearch.w";
	};

	Model.prototype.td1Click = function(event) {
		window.location.href = "workDetailsSearch.w";
	};

	Model.prototype.td12Click = function(event) {
		window.location.href = "dispatchSearch.w";
	};

	Model.prototype.td4Click = function(event) {
		window.location.href = "danzhengSearch.w";
	};

	return Model;
});