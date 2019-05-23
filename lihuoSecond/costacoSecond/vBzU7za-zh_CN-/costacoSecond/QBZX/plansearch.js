define(function(require){
	require("$UI/costacoSecond/ajax/jquery-1");
		//require("$UI/costaco/ajax/jquery-ui.min");
	var justep = require("$UI/system/lib/justep");

	var Model = function(){
		this.callParent();
	};

	Model.prototype.shipInfoCustomRefresh = function(event){
	var me = this;
	//获取委托方和船名
	var shipInfo = this.comp('shipInfo');
	var customerInfo = this.comp('customerInfo');



$.ajax({
				"type" : "post",
				"async" : false,
				"data" : {
				
				},  
				"dataType" : "json",
				//http://192.168.1.91/xztally/app.php/select/forqbzxplan
				"url" : interface_url+"?c=select&a=forqbzxplan", //PHP数据库校验用户名和密码是否正常
				"success" : function(data) {
				shipInfo.loadData(data['ship']);
				customerInfo.loadData(data['customer']);
				},
				"error" : function() {
					alert("数据传输失败！");
				}

			});
	};
	

	Model.prototype.locationCustomRefresh = function(event){
	
	var location = this.comp('location');
	$.ajax({
				"type" : "post",
				"async" : false,
				"data" : {
					
				},  
				"dataType" : "json",
				//http://192.168.1.91/xztally/app.php/index/foundation"
				"url" : interface_url+"?c=index&a=foundation", //PHP数据库校验用户名和密码是否正常
				"success" : function(data) {
					location.loadData(data['location'])
				
				},
				"error" : function() {
					alert("数据传输失败！");
				}

			});

	

	};
//查询按钮
	Model.prototype.button1Click = function(event){
	 var instructionsData = this.comp('instructionsData');
	var voyage = this.getElementByXid("input3").value;
		var entrusttime = this.getElementByXid("input1").value;
		var locationcode = this.getElementByXid("select1").value;
		var shipcode = this.getElementByXid("select3").value;
		var customercode = this.getElementByXid("select2").value;
	
	
	//alert(locationcode+"--"+entrusttime+"=="+shipcode+"=="+voyage+"--"+customercode);
	$.ajax({
				"type" : "post",
				"async" : false,
				"data" : {
					"shipname":shipcode,
					"voyage":voyage,
					"locationno":locationcode,
					"entrustdept":customercode,
					"entrusttime":entrusttime
					
				},  
				"dataType" : "json",
				//http://192.168.1.91/xztally/app.php/select/qbzxplan
				"url" : interface_url+"?c=select&a=qbzxplan",
				"success" : function(data) {
					instructionsData.loadData(data);
					instructionsData.refreshData();
				
				},
				"error" : function() {
					alert("数据传输失败！");
				}

			});
	};
//返回界面
	Model.prototype.button3Click = function(event){
	var position = localStorage.getItem('position');
		if(position !=11){
			window.location.href="index.w?device=m#!searchContent";
		}else{
			window.location.href="index_employees.w?device=m#!searchContent";
		}
	};





	Model.prototype.li1Click = function(event){
	var qbzx_forecastplanid = event.bindingContext.$object.val('qbzx_forecastplanid');
	localStorage.setItem('findplan', qbzx_forecastplanid);
	//alert(qbzx_forecastplanid)
		window.location.href="forecastDetails.w";
	};



	return Model;
});