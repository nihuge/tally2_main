define(function(require){
	require("$UI/costacoSecond/ajax/jquery-1");
	var justep = require("$UI/system/lib/justep");

	var Model = function(){
		this.callParent();
	};

	Model.prototype.danzhengCustomRefresh = function(event){
		var danzheng = this.comp('danzheng');
		var tidanhao = this.comp('tidanhao');
		var danzhengdetails_id = localStorage.getItem('danzhengdetails_id');
		$.ajax({
				"type" : "post",
				"async" : false,
				"data" : {
				
				"id":danzhengdetails_id,
				},  
				"dataType" : "json",
				//http://121.41.22.2/tally/app.php?c=select&a=ctncertifylist&ctn_no=GFSDA11235&ship=37&vargo=HC20160603
				"url" : interface_url+"?c=DdSearch&a=getDocumentMsg", //PHP数据库校验用户名和密码是否正常
				"success" : function(data) {
				danzheng.loadData([data['content']]);
				tidanhao.loadData([data['content']['content']]);
				},
				"error" : function() {
					alert("数据传输失败！");
				}

			});
	};

	Model.prototype.backBtnClick = function(event){
		justep.Shell.closePage();
	};

	return Model;
});