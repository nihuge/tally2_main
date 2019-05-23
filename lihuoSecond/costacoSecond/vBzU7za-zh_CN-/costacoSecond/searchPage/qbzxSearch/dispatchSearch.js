define(function(require){
	require("$UI/tally/ajax/jquery-1");
	var justep = require("$UI/system/lib/justep");
	var Model = function(){
		this.callParent();
	};
	//加载部门
	Model.prototype.departmentDataCustomRefresh = function(event){
	
	uid = localStorage.getItem('userinfoid');
		var departmentData = event.source;
		$.ajax({
			"type" : "POST",
			"async" : false,
			"data" : {
				
			},
			"dataType" : "json",
			         //http://192.168.1.91/xztally/index.php/index/tallydept?uid=1
			"url" : interface_url+"?c=Department&a=getTopDepartmentList", // 获取所有部门
			"success" : function(data) {
				departmentData.loadData(data['list']);
				// var v = data1.getValue(row.val('departmentinfoid'));//获取ID列的定义
				//alert(data.idColumn+' label:'+IDColDef.label+',name:'+IDColDef.name+',type:'+IDColDef.type);
				//	alert(v);
			},
			"error" : function() {
				alert("数据传输失败！");
			}
			
		});
	

	};
//获取班组信息
	Model.prototype.select1Change = function(event){
	//alert(this.getElementByXid("select1").value)
		var groupData = this.comp('groupData');
		$.ajax({
			"type" : "POST",
			"async" : false,
			"data" : {

			"pid":this.getElementByXid("select1").value
			},
			"dataType" : "json",
			
			"url" : interface_url+"?c=Department&a=getChildDepartmentList",
			"success" : function(data) {
				groupData.loadData(data['childlist']);
			},
			"error" : function() {
				alert("数据传输失败！");
			}

		});
	};

	Model.prototype.search = function(event){
	var data5 = this.comp('data5');
	var contents = this.comp("contents1");
	var ganddate = this.getElementByXid("input2").value;
	var group_id = this.getElementByXid("select2").value;
	var classes = this.getElementByXid("select3").value;
	if(true){
		alert("--派工查询接口--"+"\n派工时间:"+ganddate+"\n班组id:"+group_id+"\n班次:"+classes)
	}
	if(ganddate==""||group_id==""||classes==""){
		alert("查询条件不能为空！");
		return;
	}
	$.ajax({
			"type" : "post",
			"async" : false,
			"data" : {
				"department_id":group_id,
				"classes":classes,
				"date":ganddate
			},
			"dataType" : "json",
			"url" : interface_url+"?c=Dispatch&a=dispatchSearch", 
			"success" : function(data) {
				if(data['code']==0){
					data5.loadData(data['list']);
					data5.refreshData();
					contents.to(1);
				}else{
					alert(data['msg']);
				}
			},
			"error" : function() {
				alert("数据传输失败！");
			}

		});
	};

	

	Model.prototype.button2Click = function(event){/*
		var position = localStorage.getItem('position');
		if(position !=11){
			window.location.href="index.w?device=m#!searchContent";
		}else{
			window.location.href="index_employees.w?device=m#!searchContent";
		}*/
			justep.Shell.closePage();
		};

	

	

	return Model;
});