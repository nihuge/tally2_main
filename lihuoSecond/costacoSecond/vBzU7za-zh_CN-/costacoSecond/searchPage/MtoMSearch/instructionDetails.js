define(function(require){
	require("$UI/costacoSecond/ajax/jquery-1");
	var justep = require("$UI/system/lib/justep");
	var Model = function(){
		this.id = "";
		this.callParent();
	};
	//指令详情
	Model.prototype.instructionDetailsDataCustomRefresh = function(event){
		var value = localStorage.getItem('instructionId');
	
		var instructionDetailsData = this.comp("instructionDetailsData");
		$.ajax({
				"type" : "post",
				"async" : false,
				"data" : {
					
				"id":value,
				},
				"dataType" : "json",
				"url" : interface_url+"?c=DdInstruction&a=getInstructionMsg", 
				"success" : function(data) {
				instructionDetailsData.loadData([data['content']]);
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