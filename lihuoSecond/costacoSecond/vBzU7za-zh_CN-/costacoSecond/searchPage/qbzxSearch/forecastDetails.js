define(function(require){
	require("$UI/costacoSecond/ajax/jquery-1");
	var justep = require("$UI/system/lib/justep");

	var Model = function(){
		this.callParent();
	};

	Model.prototype.backBtnClick = function(event){
		justep.Shell.showPage("planSearch");
	};

	Model.prototype.forecastdetailsCustomRefresh = function(event){
	var forecastdetails = this.comp('forecastdetails');
	var goodlist = this.comp('goodlist');
	var boxlist = this.comp('boxlist');
	var planid = localStorage.getItem("findplan");
	$.ajax({
				"type" : "post",
				"async" : false,
				"data" : {
					"plan_id": planid
				},  
				"dataType" : "json",
				   
				//http://121.41.22.2/tally/app.php?c=QbzxPlan&a=findone&planid=25
				"url" : interface_url+"?c=QbzxSearch&a=planDetail",
				"success" : function(data) {
					forecastdetails.loadData([data['content']]);
					goodlist.loadData(data['cargolist']);
					boxlist.loadData(data['ctnlist']);
				},
				"error" : function() {
					alert("数据传输失败！");
				}

			});
	};

	return Model;
});