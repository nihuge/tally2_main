define(function(require) {
	require("$UI/costacoSecond/ajax/jquery-1");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {

		this.empty_picture = new Array();
		this.dom_mpty = new Array();

		this.damage_after_img = new Array();// 残损照片
		this.damage_dom = new Array();

		this.callParent();
		this.ctndetails_ID = "";
	};

	Model.prototype.backBtnClick = function(event) {
		justep.Shell.showPage("working_details_dd");
	};

	Model.prototype.doneWorkClick = function(event) {
		var me = this;
		var ctndetails_ID = localStorage.getItem('ctndetails_ID');
		var damage_after_remark = this.getElementByXid("input_damage_after_remark").value;
		var remark = this.getElementByXid("input_remark").value;
		var array_to_str = "";

		if (localStorage.getItem('isMust_' + localStorage.getItem('ctndetails_ID')) == "Y") {
			if (me.empty_picture == "") {
				justep.Util.hint("请拍摄空箱照片", {
					"delay" : normerHintDelay,
					"style" : "color:red;"
				});
				return;
			}
		}

		if (me.damage_after_img.length != 0) {
			array_to_str = me.damage_after_img.join("----------");
		} else {
			array_to_str = "";
		}

		MtoM_finish(ctndetails_ID, me.empty_picture, damage_after_remark, array_to_str, remark, "4");
		// justep.Shell.showPage("supplementary_mtom");//跳转拍摄补充照片
		justep.Shell.showPage("working_dd");
	};

	Model.prototype.button_damage_imgClick = function(event) {
		var me = this;
		if (me.damage_after_img.length < 10) {
			var me = this;
			function onSuccess(imageURI) {
				// 参数一:this
				// 参数二：base64形式的jpg图片
				// 参数三：DIV的ID
				var imageALLURI = "data:image/jpg;base64," + imageURI;
				var divId = "images14_2";
				addImage(me, imageALLURI, divId, "true");
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
			justep.Util.hint("不能超过十张！", {
				"delay" : normerHintDelay,
				"style" : "color:red;"
			});
		}

	};

	Model.prototype.button_empty_pictureClick = function(event) {
		var me = this;
		if (me.empty_picture.length < 1) {
			function onSuccess(imageURI) {
				// 参数一:this
				// 参数二：base64形式的jpg图片
				// 参数三：DIV的ID
				var imageALLURI = "data:image/jpg;base64," + imageURI;
				var divId = "images14_1";
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
			justep.Util.hint("已拍摄！！！", {
				"delay" : normerHintDelay
			});
		}
	};

	Model.prototype.modelActive = function(event) {
		var me = this;
		onDeviceReady("MtoM_TABLE");
		this.ctndetails_ID = localStorage.getItem('ctndetails_ID');
		this.damage_after_img = new Array();// 残损照片数组
		this.empty_picture = "";
		this.comp('input_damage_after_remark').val("");
		this.comp('input_remark').val("");
		reFlashArray(me);
		// this.comp('input_empty_picture').val("");
		// this.comp('input_damage_after_img').val("");
	};

	Model.prototype.modelLoad = function(event) {
	};

	function addImage(me_s, imageURI_s, divId_s, isDamege) {
		// 变量
		var imageCreateDId = "img";
		// 获取div
		var parentNode = document.getElementById(divId_s);
		// 往数组里添加照片元素（照片数组变动）
		if (isDamege == "true") {
			me_s.damage_after_img.push(imageURI_s);
		} else {
			me_s.empty_picture.push(imageURI_s);
		}
		// 动态生成组件
		var img = document.createElement(imageCreateDId);
		// 设置id
		var imgsetID = img.getElementsByTagName(imageCreateDId);
		// （照片数组变动）
		if (isDamege == "true") {
			imgsetID.id = "damege" + (me_s.damage_after_img.length - 1);
		} else {
			imgsetID.id = me_s.empty_picture.length - 1;
		}
		// 拼接css样式Text
		var imageCss = "width: 50px; height: 50px; margin-left: 5px;";
		// 设置css样式
		img.style.cssText = imageCss;
		// 设置src属性（照片数组、数组长度变动）
		if (isDamege == "true") {
			img.src = me_s.damage_after_img[me_s.damage_after_img.length - 1];
		} else {
			img.src = me_s.empty_picture[me_s.empty_picture.length - 1];
		}
		// 将设置好的组件放进div中
		parentNode.appendChild(img);
		// 将该对象加入到数组中来,为删除后重新排版服务
		if (isDamege == "true") {
			me_s.damage_dom.push(img);
		} else {
			me_s.dom_mpty.push(img);
		}
		// image设置监听事件
		if (isDamege == "true") {
			img.onclick = function() {
				// 保存id值，根据id值对应到（存image对象的）数组下标值
				var id = img.getElementsByTagName("img").id;
				// (存储imageId键命变动)
				localStorage.setItem("isDamageClick14", "true");
				localStorage.setItem("ElementsId14", id);
				// 弹出层或者跳转并将图片放进层中浏览
				showdiv(me_s, img);
			}
		} else {
			img.onclick = function() {
				// 保存id值，根据id值对应到（存image对象的）数组下标值
				var id = img.getElementsByTagName("img").id;
				// (存储imageId键命变动)
				localStorage.setItem("isDamageClick14", "false");
				localStorage.setItem("ElementsId14", id);
				// 弹出层或者跳转并将图片放进层中浏览
				showdiv(me_s, img);
			}
		}

	}

	// 层的显示个隐藏
	function showdiv(me_ss, pictrue, id) {
		var winWidth = window.innerWidth;
		// 取消事件
		if (me_ss == "false") {
			$("#show14").css("display", "none");// show的display属性设置为none（隐藏）
			return;
		}
		// 删除事件
		if (pictrue == "delete") {
			var parentNode;
			if (localStorage.getItem("isDamageClick14") == "true") {
				parentNode = document.getElementById("images14_2");
			} else {
				parentNode = document.getElementById("images14_1");
			}
			// 移除组件(组件对象数组变动)
			if (localStorage.getItem("isDamageClick14") == "true") {
				parentNode.removeChild(me_ss.damage_dom[id]);
			} else {
				parentNode.removeChild(me_ss.dom_mpty[id]);
			}
			// 移除照片数组的元素(照片数组变动)
			if (localStorage.getItem("isDamageClick14") == "true") {
				me_ss.damage_after_img.splice(id, 1);
			} else {
				me_ss.empty_picture.splice(id, 1);
			}
			// 移除组件对象数组的元素(组件对象数组变动)
			if (localStorage.getItem("isDamageClick14") == "true") {
				me_ss.damage_dom.splice(id, 1);
			} else {
				me_ss.dom_mpty.splice(id, 1);
			}
			var intNum = 0;
			if (localStorage.getItem("isDamageClick14") == "true") {
				intNum = me_ss.damage_after_img.length;
			} else {
				intNum = me_ss.empty_picture.length;
			}
			// 重新排版
			for (var int = id; int < intNum; int++) {
				// 将各组件的src往前推，针对ui组件(组件对象数组、照片数组变动)
				if (localStorage.getItem("isDamageClick14") == "true") {
					if (me_ss.damage_after_img.length > 0) {
						me_ss.damage_dom[int].src = me_ss.damage_after_img[int];
					}
				} else {
					me_ss.dom_mpty[int].src = me_ss.empty_picture[int];
				}
				// 将ui组件的id往前推(组件对象数组变动)
				if (localStorage.getItem("isDamageClick14") == "true") {
					me_ss.damage_dom[int].getElementsByTagName("img").id = "damege" + int;
				} else {
					me_ss.dom_mpty[int].getElementsByTagName("img").id = int;
				}
			}
			justep.Util.hint("删除成功！！！", {
				"delay" : normerHintDelay
			});
			$("#show14").css("display", "none");// show的display属性设置为none（隐藏）
			return;
		}

		if ($("#show14").css("display") == 'none') {// 如果show是隐藏的
			// 设置高度和宽度
			$("#show14").css("height") == winWidth;
			document.getElementById("show14").style.visibility = "visible";
			$("#show14").css("display", "block");// show的display属性设置为block（显示）
			// 获取image id
			var iamgeson = me_ss.getElementByXid('imageshow');
			$(iamgeson).attr("src", pictrue.src);
		} else {// 如果show是显示的
			$("#show14").css("display", "none");// show的display属性设置为none（隐藏）
		}
	}

	Model.prototype.button11Click = function(event) {
		showdiv("false");
	};

	Model.prototype.btn_deleteClick = function(event) {
		// alert("组件ID = " + localStorage.getItem("ElementsId13"));
		if (localStorage.getItem("isDamageClick14") == "true") {
			var stringP = localStorage.getItem("ElementsId14").replace("damege", "");
			showdiv(this, "delete", Number(stringP));

		} else {

			showdiv(this, "delete", Number(localStorage.getItem("ElementsId14")));
		}
	};

	function reFlashArray(me_s) {
		$('#images14_1').empty();
		$('#images14_2').empty();
		me_s.dom_mpty.length = 0;
		me_s.dom_mpty = new Array();
		me_s.empty_picture.length = 0;
		me_s.empty_picture = new Array();

		me_s.damage_dom.length = 0;
		me_s.damage_dom = new Array();
		me_s.damage_after_img.length = 0;
		me_s.damage_after_img = new Array();
	}

	return Model;
});