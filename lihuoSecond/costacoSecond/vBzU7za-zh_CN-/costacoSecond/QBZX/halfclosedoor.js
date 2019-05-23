define(function(require) {
	require("$UI/costacoSecond/ajax/jquery-1");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		// this.halfclose_door_picture = "";
		this.halfclose_picture = new Array();
		this.dom = new Array();
		this.callParent();
	};

	Model.prototype.submit = function(event) {
		var me = this;
		var ctn_id = localStorage.getItem("id");
		var uid = localStorage.getItem("userinfoid");
		var onedoor = me.halfclose_picture[0];
		if (me.halfclose_picture.length == 0) {
			justep.Util.hint("请拍摄照片！", {
				"delay" : normerHintDelay,
				"style" : "color:red;"
			});
			return;
		}
		QBZX_halfcloseDooSet(ctn_id, onedoor, "3");
		me.comp("messageDialog").show({
			"title" : "成功",
			"message" : "是否拍全关门照片！"
		});
		/*
		 * if(debugMode){ alert("拍摄半关门照片"+"\n用户id："+uid+"\n箱id："+ctn_id); }
		 * $.ajax({ "type" : "post", "async" : false, "data" : { "uid": uid,
		 * "ctn_id": ctn_id, "halfclose_door_picture" :me.halfclose_door_picture
		 * 
		 * //get提交密码字段 }, "dataType" : dataType, "url" :
		 * interface_url+"?c=QbzxOperation&a=halfclosedoor", "success" :
		 * function(data) { if(PrintReturnValue){ alert(data); return; }
		 * if(data['code']==0){ justep.Util.hint("拍摄半关门照片成功！");
		 * justep.Shell.showPage("closedoor"); }else{
		 * justep.Util.hint(data['msg'], {"delay" : normerHintDelay}); } },
		 * "error" : function(data) { justep.Util.hint("数据传输失败！", {"delay" :
		 * normerHintDelay,"style" : "color:red;"}); } });
		 */
	};

	// 拍半关门照片
	Model.prototype.onedoorImgClick = function(event) {
		var me = this;
		if (me.halfclose_picture.length < 1) {
			function onSuccess(imageURI) {
				// 参数一:this
				// 参数二：base64形式的jpg图片
				// 参数三：DIV的ID
				var imageALLURI = "data:image/jpg;base64," + imageURI;
				var divId = "images3";
				addImage(me, imageALLURI, divId, "false");
			}
			function onFail(message) {
				return message;
			}
			navigator.camera.getPicture(onSuccess, onFail, {
				quality : 50,
				sourceType : 1,
				destinationType : 0,
				targetWidth : 1024,
				targetHeight : 768,
			// 0、2为从相册文件中选择，1为拍照，DestinationType返回类型0是base64
			});
		} else {
			justep.Util.hint("已拍摄!!!", {
				"delay" : normerHintDelay
			});
		}
	};

	Model.prototype.button11Click = function(event) {
		showdiv("false");
	};

	Model.prototype.btn_deleteClick = function(event) {
		// alert("组件ID = " + localStorage.getItem("ElementsId"));
		showdiv(this, "delete", Number(localStorage.getItem("ElementsId2")));
	};

	Model.prototype.uploadgoodsImage = function(imageURI) {
		var isgoodsbad = this.comp('isgoodsbad');
		isgoodsbad.setValue('base64', "data:image/jpg;base64," + imageURI);
		// this.comp('input5').val("data:image/jpg;base64,"+imageURI);
	}

	function addImage(me_s, imageURI_s, divId_s, isDamege) {
		// 变量
		var imageCreateDId = "img";
		// 获取div
		var parentNode = document.getElementById(divId_s);
		// 往数组里添加照片元素（照片数组变动）
		me_s.halfclose_picture.push(imageURI_s);
		// 动态生成组件
		var img = document.createElement(imageCreateDId);
		// 设置id
		var imgsetID = img.getElementsByTagName(imageCreateDId);
		// （照片数组变动）
		imgsetID.id = me_s.halfclose_picture.length - 1;
		// 拼接css样式Text
		var imageCss = "width: 50px; height: 50px; margin-left: 5px;";
		// 设置css样式
		img.style.cssText = imageCss;
		// 设置src属性（照片数组、数组长度变动）
		img.src = me_s.halfclose_picture[me_s.halfclose_picture.length - 1];
		// 将设置好的组件放进div中
		parentNode.appendChild(img);
		// 将该对象加入到数组中来,为删除后重新排版服务
		me_s.dom.push(img);
		// image设置监听事件
		img.onclick = function() {
			// 保存id值，根据id值对应到（存image对象的）数组下标值
			var id = img.getElementsByTagName("img").id;
			// (存储imageId键命变动)
			localStorage.setItem("ElementsId2", id);
			// 弹出层或者跳转并将图片放进层中浏览
			showdiv(me_s, img);
		}

	}

	// 层的显示个隐藏
	function showdiv(me_ss, pictrue, id) {
		var winWidth = window.innerWidth;
		// 取消事件
		if (me_ss == "false") {
			$("#show3").css("display", "none");// show的display属性设置为none（隐藏）
			return;
		}
		// 删除事件
		if (pictrue == "delete") {
			var parentNode;
			parentNode = document.getElementById("images3");
			// 移除组件(组件对象数组变动)
			parentNode.removeChild(me_ss.dom[id]);
			// 移除照片数组的元素(照片数组变动)
			me_ss.halfclose_picture.splice(id, 1);
			// 移除组件对象数组的元素(组件对象数组变动)
			me_ss.dom.splice(id, 1);
			// 重新排版
			for (var int = id; int < me_ss.halfclose_picture.length; int++) {
				// 将各组件的src往前推，针对ui组件(组件对象数组、照片数组变动)
				me_ss.dom[int].src = me_ss.halfclose_picture[int];
				// 将ui组件的id往前推(组件对象数组变动)
				me_ss.dom[int].getElementsByTagName("img").id = int;
			}

			justep.Util.hint("删除成功！！！", {
				"delay" : normerHintDelay
			});
			$("#show3").css("display", "none");// show的display属性设置为none（隐藏）
			return;
		}

		if ($("#show3").css("display") == 'none') {// 如果show是隐藏的
			// 设置高度和宽度
			$("#show3").css("height") == winWidth;
			document.getElementById("show3").style.visibility = "visible";
			$("#show3").css("display", "block");// show的display属性设置为block（显示）
			// 获取image id
			var iamgeson = me_ss.getElementByXid('imageshow');
			$(iamgeson).attr("src", pictrue.src);
		} else {// 如果show是显示的
			$("#show3").css("display", "none");// show的display属性设置为none（隐藏）
		}
	}

	Model.prototype.backBtnClick = function(event) {
		justep.Shell.showPage("working");
	};

	Model.prototype.modelActive = function(event) {
		var me = this;
		onDeviceReady("QBZX_TABLE");
		// me.halfclose_door_picture = "";
		// me.comp('onedoor').val("");
		$('#images3').empty();
		this.dom.length = 0;
		this.dom = new Array();
		this.halfclose_picture.length = 0;
		this.halfclose_picture = new Array();
	};

	Model.prototype.modelLoad = function(event) {
	};

	Model.prototype.messageDialogYes = function(event) {
		insert_status(localStorage.getItem('id'), "3");
		justep.Shell.showPage("closedoor");
	};

	Model.prototype.messageDialogNo = function(event) {
		justep.Shell.showPage("working");
	};


	return Model;
});