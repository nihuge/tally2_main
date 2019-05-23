define(function(require){
	require("$UI/costacoSecond/ajax/jquery-1");
	var justep = require("$UI/system/lib/justep");

	var Model = function(){
		this.callParent();
	};

	Model.prototype.td2Click = function(event){
		localStorage.setItem('selectSys', 2)
	window.location.href="plansearch.w";
	};
//作业指令查询
	Model.prototype.td11Click = function(event){
		localStorage.setItem('selectSys', 2)
	window.location.href="instructionsearch.w";
	};
//派工查询
	Model.prototype.td12Click = function(event){
		localStorage.setItem('selectSys', 2)
	window.location.href="dispatchSearch.w";
	};
//作业明细查询
	Model.prototype.td1Click = function(event){
		localStorage.setItem('selectSys', 2)
	window.location.href="workDetailsSearch.w";
	};
//交接记录查询
	Model.prototype.td16Click = function(event){
		localStorage.setItem('selectSys', 2)
	window.location.href="historicalHandoverSearch.w";
	};
//单证查询
	Model.prototype.td4Click = function(event){
localStorage.setItem('selectSys', 2)
	window.location.href="danzhengSearch.w";
	};

	Model.prototype.backBtnClick = function(event){
window.location.href="SelectSys.w";
	};

	return Model;
});