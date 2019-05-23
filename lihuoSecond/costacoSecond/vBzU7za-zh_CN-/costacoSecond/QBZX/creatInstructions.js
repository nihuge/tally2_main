define(function(require){
	require("$UI/costacoSecond/ajax/jquery-1");
	var justep = require("$UI/system/lib/justep");

	var Model = function(){
		this.callParent();
	};

	Model.prototype.button22Click = function(event){
		var createInstructionData = this.comp("createInstructionData");
		
		var loadingtype = this.comp("loadingtype");
//		alert(createInstructionData.val("bargeno")+createInstructionData.val("locationno")+createInstructionData.val("qbzx_forecastplanid"));
//		alert(createInstructionData.val("loadingtype"))
var uid = localStorage.getItem('userinfoid');
		var insid = this.getElementByXid("select1").value;
		var loadingtype = this.getElementByXid("select3").value;
		var locationno = this.getElementByXid("select2").value;
		//用户名和密码为空提示locationno=&planid=&loadingtype=
		if ( $.trim(locationno) === "" || $.trim(loadingtype) === "" || $.trim(insid) === "" ) {
			this.comp("messageDialog").show({
				"title" : "温馨提示",
				"message" : "值不能为空"
			});
		} else {
		
		$.ajax({
				"type" : "get",
				"async" : false,
				"data" : {
					"planid" : insid,
					"loadingtype" :loadingtype,
					"locationno": locationno,
					"uid":uid
				},
				"dataType" : "json",
				       // http://192.168.1.91/xztally/index.php/qbzx/jiadd?bargeno=&locationno=&planid=&loadingtype=
				"url" : interface_url+"?c=qbzx&a=jiadd",
				"success" : function(data) {
				alert("成功")
				window.location.href = "workplan.w";
				},	
				"error" : function() {
					alert("新建失败");
				}

			});
		}
	
	
	};
//返回
	Model.prototype.backBtnClick = function(event){
		window.location.href = "workplan.w";
	};
//获取预报计划ID的集合
	Model.prototype.forecastplanidCustomRefresh = function(event){
	var forecastplanid = this.comp("forecastplanid");
	var locationno = this.comp("locationno");
	
$.ajax({
				"type" : "get",
				"async" : false,
				"data" : {
					
				},
				"dataType" : "json",
				       // http://192.168.1.91/xztally/app.php/qbzxPlan/listplan?app=app
				"url" : interface_url+"?c=qbzxPlan&a=listplan&app=app", //PHP数据库校验用户名和密码是否正常
				"success" : function(data) {
				forecastplanid.loadData(data['list']);
				locationno.loadData(data['location']);
				},	
				"error" : function() {
					alert("新建失败");
				}

			});
	};


	return Model;
});