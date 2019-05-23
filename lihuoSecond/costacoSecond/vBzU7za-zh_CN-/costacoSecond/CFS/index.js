define(function(require) {
	require("$UI/costacoSecond/ajax/jquery-1");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

		

	
//收工
	Model.prototype.button5Click = function(event) {
		/*var row = event.bindingContext.$object;
		this.comp("data1").deleteData(row);*/
		justep.Shell.showPage("downwork");
	};


	Model.prototype.data1Create = function(event) {
		event.source.limit = 2;
	};

	Model.prototype.data1CustomSave = function(event) {
		comsole.log(event.source.toJson(true));
	};
	//返回选择系统页面
	Model.prototype.homeClick = function(event) {
		justep.Shell.showPage("SelectSys");
	};

//签到
	Model.prototype.td5Click = function(event){
	
		justep.Shell.showPage("SignIn");
		//window.location.href="SignIn.w";
	};

	Model.prototype.td7Click = function(event){
		//作业计划
		justep.Shell.showPage("DispatchList_cfs");
	};

	Model.prototype.td6Click = function(event){
		//alert("我是派工");
	};

	Model.prototype.td8Click = function(event){
		
		 justep.Shell.showPage("working_cfs");
	};

	Model.prototype.td9Click = function(event){
		//alert("我是表格5");
	};

	Model.prototype.td10Click = function(event){
		justep.Shell.showPage("downwork");
	};

	
//签到按钮
	Model.prototype.button7Click = function(event){
		
	};

	
//跳转指令查询界面
	Model.prototype.td11Click = function(event){
		justep.Shell.showPage("instructionSeacher_cfs");
	};


	//个人信息加载

	
	Model.prototype.userinfoCustomRefresh = function(event){
		var me = this;
		var userinfo = me.comp('userinfo');
		var siginData = me.comp('siginData');
		var username = localStorage.getItem('staffno');
		var uid = localStorage.getItem('userinfoid');
		if(debugMode){
			alert("--个人信息接口--"+"\n用户id："+uid);
		}
		if(username==null){
			alert("用户未登录，请登录！");
			justep.Shell.showPage("main");
			return;
		}else{
			$.ajax({
				"type" : "post",
				"async" : false,
				"data" : {
					"uid" : uid
				},
				"dataType" : dataType,
				
				"url" : interface_url+"?c=User&a=getUserMsg", // PHP数据库校验用户名和密码是否正常
				"success" : function(data) {
					if(PrintReturnValue){
						alert(data);
						return;
					}
					userinfo.loadData([data['content']]);
					siginData.loadData([data['content']['shift']]);
				},
				"error" : function() {
					alert("数据传输失败！");
				}

		});
		}
		
	};


	
//退出登录
	Model.prototype.button1Click = function(event){
			localStorage.clear();
			justep.Shell.showPage("login");
	};


	

	/*Model.prototype.xtttClick = function(event){
	alert("d");
	 var url = "$UI2/costaco/qbzx/login.w";
	justep.Shell.showPage(url);
	};*/


	
//委托计划查询
	Model.prototype.td2Click = function(event){
		justep.Shell.showPage("plansearch_cfs");
	};


	
//跳转修改密码页面
	Model.prototype.gruopItem1Click = function(event){
		justep.Shell.showPage("changePwd");
		//window.location.href="changePwd.w";
	};


	

	Model.prototype.td16Click = function(event){
		justep.Shell.showPage("handoverSearch");
	};


	

	Model.prototype.td1Click = function(event){
		justep.Shell.showPage("workDetailsSearch_cfs");
	};


	

	Model.prototype.td12Click = function(event){
		justep.Shell.showPage("dispatchSearch");
	};


	

	Model.prototype.td4Click = function(event){
		justep.Shell.showPage("danzhengSearch_cfs");
	};


	Model.prototype.modelActive = function(event){
		this.userinfoCustomRefresh();
	};


	return Model;
});