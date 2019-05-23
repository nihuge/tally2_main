	define(function(require){
	require("$UI/costacoSecond/ajax/jquery-1");
	var justep = require("$UI/system/lib/justep");

	var Model = function(){
		this.callParent();
	};

	Model.prototype.data1CustomRefresh = function(event){
		var handoverData = this.comp('handoverData');
		var uid = localStorage.getItem('userinfoid');
		$.ajax({
						"type" : "post",
						"async" : false,
						"data" : {
							"uid":uid,
						},  
						"dataType" : "json",
						"url" : interface_url+"?c=Shift&a=shiftDetails",
						"success" : function(data) {
							if(data['code']==0){
								handoverData.loadData([data['content']]);
							}else {
							  alert(data['msg']);
							}
						},
						"error" : function() {
							alert("数据传输失败！");
						}

					});
	};

	Model.prototype.backBtnClick = function(event){

	/*var position = localStorage.getItem('position');
		if(position !=11){
			window.location.href="index.w?device=m#!searchContent";
		}else{
			window.location.href="index_employees.w?device=m#!searchContent";
		}*/
		justep.Shell.closePage();
	};

	return Model;
});