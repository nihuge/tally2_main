define(function(require) {
	require("$UI/costacoSecond/ajax/jquery-1");
	var justep = require("$UI/system/lib/justep");
	// 引入/UI2/demo/baas/baas.js
	var Baas = require("$UI/demo/baas/baas");

	var Model = function() {
		this.callParent();
	};


	Model.prototype.transferBtnClick = function(event){
			var note = this.getElementByXid("note").value;
			var uid = localStorage.getItem('userinfoid');
			if(note==""){
				alert("留言不能为空！");
				return;
			}

		$.ajax({
				"type" : "post",
					"async" : false,
					"data" : {
					"uid":uid,
					"note":note, 
					},
					"dataType" : "json",
					//http://192.168.1.91/xztally/app.php/task/jiaoban?uid=3&business=qbzx&note=nihao
					"url" : interface_url+"?c=Common&a=transfer",
					"success" : function(data) {
					if(data['code']==0){
						alert("交班成功！");
						window.location.href = "index.w"
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
		var position = localStorage.getItem('position');
	if(position !=11){
	window.location.href="index.w";
	}else{
	window.location.href="index_employees.w";
	}
	};



	return Model;
});