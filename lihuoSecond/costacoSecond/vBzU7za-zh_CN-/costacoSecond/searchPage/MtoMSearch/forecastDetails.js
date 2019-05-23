define(function(require){
	require("$UI/costacoSecond/ajax/jquery-1");
	var justep = require("$UI/system/lib/justep");

	var Model = function(){
		this.callParent();
	};

	Model.prototype.backBtnClick = function(event){
		justep.Shell.closePage();
	};

	Model.prototype.forecastdetailsCustomRefresh = function(event){
	var forecastdetails = this.comp('forecastdetails');
	var boxlist = this.comp('boxlist');
	var planid = localStorage.getItem("findplan");
	$.ajax({
				"type" : "post",
				"async" : false,
				"data" : {
					"id": planid
				},  
				"dataType" : "json",
				"url" : interface_url+"?c=DdPlan&a=getPlanMsg",
				"success" : function(data) {
				forecastdetails.loadData([data['content']]);
				boxlist.loadData(data['content']['ctns']);
				},
				"error" : function() {
					alert("数据传输失败！");
				}

			});
	};

	return Model;
});