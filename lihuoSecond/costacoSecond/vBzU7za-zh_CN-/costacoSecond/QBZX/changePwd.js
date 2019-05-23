define(function(require){
	require("$UI/costacoSecond/ajax/jquery-1");
	var justep = require("$UI/system/lib/justep");

	var Model = function(){
		this.callParent();
	};
//确认修改密码事件
	Model.prototype.button2Click = function(event){
	var pwdInfo = this.comp('pwdInfo');
	//获取旧密码
	var oldPwd = pwdInfo.val('oldPwd');
	//获取新密码
	var newPwd = pwdInfo.val('newPwd');
	//获取再次 确认新密码
	var againNewPwd = pwdInfo.val('againNewPwd');
	//获取登录密码
	var userpassword = localStorage.getItem('userpassword');
	var userinfoid = localStorage.getItem('userinfoid');
	if($.trim(newPwd) === '' || $.trim(againNewPwd) === ''){
	alert("输入的密码不能为空！");
	return;
	
	}else if(newPwd==0){
		alert("密码不合法");
	return;
	}
	
	//alert("旧密码："+oldPwd+"新密码："+newPwd+"确认密码："+againNewPwd+"实际登陆密码："+userpassword);
	
	if(oldPwd == userpassword){
	if($.trim(pwdInfo.val('oldPwd')) === ''){
	alert('输入密码不能为空！');
	
	}else{
		if(newPwd === againNewPwd){
		//alert('修改成功');
		
		$.ajax({
				"type" : "post",
				"async" : false,
				"data" : {
					"username":userinfoid,
					"oldpwd":oldPwd,
					"newpwd":newPwd,
					
				},  
				"dataType" : "json",
				//http://192.168.1.91/xztally/index.php/index/pwdup
				"url" : interface_url+"?c=index&a=pwdup",
				"success" : function(data) {
					alert("修改成功！");
					localStorage.removeItem("userpassword");
				window.location.href = "login.w";
				},
				"error" : function() {
					alert("数据传输失败！");
				}

			});
		}else{
		
		alert("两次密码输入不一致！");
		}
	
	}
		
		
	}else{
	alert("旧密码输入不正确！");
	}
	};

	Model.prototype.backBtnClick = function(event){
window.location.href = "index.w";
	};

	return Model;
});