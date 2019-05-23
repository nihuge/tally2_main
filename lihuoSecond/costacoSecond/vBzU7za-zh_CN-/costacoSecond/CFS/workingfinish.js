define(function(require){
	require(jqUrl);
	var justep = require("$UI/system/lib/justep");

	var Model = function(){
		this.i = 0;
		this.seal_picture;
		this.callParent();
	};

	Model.prototype.backBtnClick = function(event){
		window.location.href = "working_details.w";
	};

	Model.prototype.doneWorkClick = function(event){
	var me = this;
	var uid = localStorage.getItem('userinfoid');//用户名
	var ctndetails_ID = localStorage.getItem('ctndetails_ID');//箱ID
	var remark = this.getElementByXid("input_remark").value;//批注（用于生成单证的批注）
	var sealno = this.getElementByXid("input_sealno").value;//铅封号
	var cargo_weight = this.getElementByXid("input_cargo_weight").value;
	if(remark == "" || sealno == "" || cargo_weight == ""){
		alert("输入的参数不全！");
		return;
	}
	$.ajax({
				"type" : "post",
				"async" : false,
				"data" : {
				"uid":uid,
				"ctn_id":ctndetails_ID,
				"sealno":sealno,
				"seal_picture":me.seal_picture,
				"cargo_weight":cargo_weight,
				"remark" :remark
				},
				"dataType" : "json",
				//http://192.168.1.91/xztally/app.php?c=DdOperation&a=getContainerList
				"url" : interface_url+"?c=CfsOperation&a=operationFinish", 
				"success" : function(data) {
					if(data['code'] == 0){
						window.location.href = "working.w";
					}else{
						alert(data['msg']);
					}
				},
				"error" : function() {
					alert("数据传输失败！");
				}
	
			});
	};


	Model.prototype.button_seal_pictureClick = function(event){
		
		var me = this;
		
		function onSuccess(imageURI) {
			me.comp('input_seal_picture').val("拍照成功！");
			me.seal_picture = "data:image/jpg;base64,"+imageURI;
		}
		function onFail(message) {
			return message;
		}
		navigator.camera.getPicture(onSuccess, onFail, {
			quality : 50,
			sourceType : 1,
			destinationType: 0,
			targetWidth :1024,
			targetHeight :768,
		// 0、2为从相册文件中选择，1为拍照，DestinationType返回类型0是base64
		}); 
	
	};



	Model.prototype.input4Change = function(event){
alert("dd")
	};


$('#input4').bind('input propertychange', function() {

  // 密码检验
        var password = $("#input4").val();
        alert(password)


});

	return Model;
});