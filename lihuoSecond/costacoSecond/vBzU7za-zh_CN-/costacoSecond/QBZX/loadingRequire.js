define(function(require){
	require("$UI/costacoSecond/ajax/jquery-1");
	//require("$UI/costaco/ajax/baas.js");
	var justep = require("$UI/system/lib/justep");

	var Model = function(){
		this.callParent();
	};

	Model.prototype.backBtnClick = function(event){
		this.comp("windowReceiver1").windowCancel();
	};

	Model.prototype.loadingRequireDataCustomRefresh = function(event){
	var loadingRequireData = this.comp("loadingRequireData");
	var loadingRequire = localStorage.getItem('loadingRequire');
		$.ajax({
				"type" : "post",
				"async" : false,
				"data" : {
					"instruction_id":loadingRequire
				},  
				"dataType" : "json",
				"url" : interface_url+"?c=QbzxOperation&a=packingRequire", 
				"success" : function(data) {
				if(data['code']==0){
					loadingRequireData.loadData([data]);
				}else{
					alert(data['msg']);
				}
				},
				"error" : function() {
					alert("数据传输失败！");
				}

			});
	};
	return Model;
});