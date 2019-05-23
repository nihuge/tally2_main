define(function(require){
	require("$UI/costacoSecond/ajax/jquery-1");
	var justep = require("$UI/system/lib/justep");

	var Model = function(){
		this.callParent();
	};

	Model.prototype.danzhengCustomRefresh = function(event){
		var danzheng = this.comp('danzheng');
		var tidanhao = this.comp('tidanhao');
	
		var danzheng_id = localStorage.getItem('danzheng_id');
		$.ajax({
				"type" : "post",
				"async" : false,
				"data" : {
					"prove_id": danzheng_id
				},  
				"dataType" : "json",
				"url" : interface_url+"?c=QbzxSearch&a=proveDetail",
				"success" : function(data) {
					if(data['code']== 0 ){
						danzheng.loadData([data['proveMsg']]);
						tidanhao.loadData(data['content']);
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