define(function(require){
	require("$UI/costacoSecond/ajax/jquery-1");
	var justep = require("$UI/system/lib/justep");
	var Model = function(){
		this.id = "";
		this.callParent();
	};
	//指令详情
	Model.prototype.insDetailDataCustomRefresh = function(event){
		var value = localStorage.getItem('workPlanID_details');
		localStorage.setItem('insid', value);
		var boxList = this.comp("boxList");
		var forecastPlanData = this.comp("forecastPlanData");
		var insDetailData = this.comp("insDetailData");
		var cargolist = this.comp("cargolist");
		$.ajax({
				"type" : "POST",
				"async" : false,
				"data" : {
					
					"instruction_id":value
				},
				"dataType" : "json",
				//
				"url" : interface_url+"?c=QbzxSearch&a=instructionDetail", 
				"success" : function(data) {
					if(data['code'] == 0){
						forecastPlanData.loadData([data['planMsg']]);
						boxList.loadData(data['ctnlist']);
						insDetailData.loadData([data['instructionMsg']]);
						cargolist.loadData(data['cargolist']);
						forecastPlanData.refreshData();
						boxList.refreshData();
						cargolist.refreshData();
					}else{
						alert(data['msg']);
					}
					
				},
				"error" : function() {
					alert("数据传输失败！");
				}

			});
	};
	Model.prototype.backClick = function(event){
		window.location.href = "workplan.w";
	};

	//跳转到箱	
	Model.prototype.tocontentboxlist = function() {
		var boxList = this.comp("boxList");
		var contents = this.comp('contents');
		contents.to('boxlist');
		boxList.refreshData();
	};
	

	Model.prototype.back = function(event){
		justep.Shell.closePage();
	};

	
	
	
	//查看箱详情
	Model.prototype.col8Click = function(event){
		var ship = event.bindingContext.$object.val('ship');
		var voyage = event.bindingContext.$object.val('voyage');
		var containerno = event.bindingContext.$object.val('containerno');
		var qbzx_operationid = event.bindingContext.$object.val('qbzx_operationid');
		
		//alert(ship+voyage+containerno+qbzx_operationid);
		localStorage.setItem('boxdetails_ship',ship);
		localStorage.setItem('boxdetails_voyage',voyage);
		localStorage.setItem('boxdetails_containerno',containerno);
		localStorage.setItem('boxdetails_qbzx_operationid',qbzx_operationid);
		
		window.location.href = "boxsDetails.w";
	};
	
	Model.prototype.button11Click = function(event){
		justep.Shell.closePage();
	};
	
	
	Model.prototype.modelActive = function(event){
		this.insDetailDataCustomRefresh();
	};
	
	
	
	return Model;
});