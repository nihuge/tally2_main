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
		alert(danzhengdetails_id)
		$.ajax({
				"type" : "post",
				"async" : false,
				"data" : {
				
				"prove_id":danzhengdetails_id,
				},  
				"dataType" : "html",
				"url" : interface_url+"?c=CfsSearch&a=getProveMsg", 
				"success" : function(data) {
				alert(data)
					if(data['code'] == 0){
						tidanhao.loadData(data['content']['content']);
						danzheng.loadData([data['content']]);
					}else{
						alert(data['msg']);
					}
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