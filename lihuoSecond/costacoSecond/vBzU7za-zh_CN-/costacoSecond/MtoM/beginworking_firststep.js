define(function(require) {
	require("$UI/costacoSecond/ajax/jquery-1");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
		this.i = 0;
		// 铅封照
		this.seal_picture = new Array();
		this.dom_seal = new Array();
		// 箱门照
		this.door_picture = new Array();
		this.dom_door = new Array();
		// 残损照片
		this.damage_picture = new Array();
		this.damage_dom = new Array();
		// 整箱照
		this.cargo_picture;
		this.ctndetails_ID = "";
	};

	Model.prototype.ctndetailsDataCustomRefresh = function(event) {
		var me = this;
		var ctndetailsData = this.comp('ctndetailsData');
		var ctndetails_ID = localStorage.getItem('ctndetails_ID');
		var ctnno = localStorage.getItem("working_details_ctnno");
		var sealno = localStorage.getItem("working_details_sealno" + ctndetails_ID);
		var ctnData = "{\"ctnno\":\"" + ctnno + "\",\"sealno\":\"" + sealno + "\"}";
		ctndetailsData.loadData([ JSON.parse(ctnData) ]);
	};

	Model.prototype.backBtnClick = function(event) {
		justep.Shell.showPage("working_dd");
	};

	// 下一步按钮
	Model.prototype.nextClick = function(event) {
		var me = this;
		var ctndetails_ID = localStorage.getItem('ctndetails_ID');
		var damage_remark = this.getElementByXid("input_damage_remark").value;
		var true_sealno = this.getElementByXid("input_true_sealno").value;
		var uid = localStorage.getItem('userinfoid');
		var sealPicture = me.seal_picture[0];
		var doorPicture = me.door_picture[0];

		if (localStorage.getItem('isMust_' + ctndetails_ID) == "Y") {
			// 重点箱判断各项值是否为空
			if ($.trim(true_sealno) == "") {
				justep.Util.hint("实际铅封号不能为空", {
					"delay" : normerHintDelay,
					"style" : "color:red;"
				});
				return;
			}
			if (me.seal_picture.length == 0) {
				justep.Util.hint("请拍摄铅封照片", {
					"delay" : normerHintDelay,
					"style" : "color:red;"
				});

				return;
			}
			if (me.door_picture.length == 0) {
				justep.Util.hint("请拍箱门照片", {
					"delay" : normerHintDelay,
					"style" : "color:red;"
				});
				return;
			}
		}

		array_to_str = me.damage_picture.join("----------");

		MtoM_firstSet(localStorage.getItem('ctndetails_ID'), true_sealno, me.seal_picture, me.door_picture, damage_remark, array_to_str, "1");

		justep.Shell.showPage("openDoor_dd");

	};

	// 拍摄箱门照片
	Model.prototype.button_door_pictureClick = function(event) {
		var me = this;
		if (me.door_picture.length < 1) {
			function onSuccess(imageURI) {
				// me.comp('input_door_picture').val("拍照成功！");
				// me.door_picture = "data:image/jpg;base64," + imageURI;
				// 参数一:this
				// 参数二：base64形式的jpg图片
				// 参数三：DIV的ID
				var imageALLURI = "data:image/jpg;base64," + imageURI;
				var divId = "images11_2";
				addImage(me, imageALLURI, divId, "two");
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

	Model.prototype.button_cargo_pictureClick = function(event) {
		var me = this;

		function onSuccess(imageURI) {
			me.comp('input_cargo_picture').val("拍照成功！");
			me.cargo_picture = "data:image/jpg;base64," + imageURI;
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
	};

	// 拍摄铅封照片
	Model.prototype.button_seal_pictureClick = function(event) {
		var me = this;
		if (me.seal_picture.length < 1) {
			function onSuccess(imageURI) {
				// me.comp('input_seal_picture').val("拍照成功！");
				// me.seal_picture = "data:image/jpg;base64," + imageURI;
				// 参数一:this
				// 参数二：base64形式的jpg图片
				// 参数三：DIV的ID
				var imageALLURI = "data:image/jpg;base64," + imageURI;
				var divId = "images11_1";
				addImage(me, imageALLURI, divId, "one");
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

	Model.prototype.button_damage_imgClick = function(event) {
		var me = this;
		if (me.damage_picture.length < 10) {
			function onSuccess(imageURI) {
				// me.i++;
				// me.comp('input_damage_img').val("拍照成功！" + "第" + me.i + "张");
				// me.damage_img.push("data:image/jpg;base64," + imageURI);
				// 参数一:this
				// 参数二：base64形式的jpg图片
				// 参数三：DIV的ID
				var imageALLURI = "data:image/jpg;base64," + imageURI;
				var divId = "images11_3";
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
				"delay" : normerHintDelay
			});
		}

	};
	Model.prototype.modelActive = function(event) {
		var me = this;
		onDeviceReady("MtoM_TABLE");
		this.ctndetailsDataCustomRefresh();
		this.i = 0;
		// this.damage_img = new Array();// 残损照片
		this.comp('input_damage_remark').val("");
		this.comp('input_true_sealno').val("");
		// this.comp('input_seal_picture').val("");
		// this.seal_picture = "";
		// this.comp('input_door_picture').val("");
		// this.door_picture = "";
		// this.comp('input_damage_img').val("");
		ArrayClear(me);
	};

	function ArrayClear(me) {
		// 铅封照
		$('#images11_1').empty();
		me.seal_picture.length = 0;
		me.seal_picture = new Array();
		me.dom_seal.length = 0;
		me.dom_seal = new Array();
		// 箱门照片
		$('#images11_2').empty();
		me.door_picture.length = 0;
		me.door_picture = new Array();
		me.dom_door.length = 0;
		me.dom_door = new Array();
		// 残损照片
		$('#images11_3').empty();
		me.damage_picture.length = 0;
		me.damage_picture = new Array();
		me.damage_dom.length = 0;
		me.damage_dom = new Array();
	}

	Model.prototype.modelLoad = function(event) {
		var me = this;
		this.ctndetails_ID = localStorage.getItem('ctndetails_ID');
	};

	Model.prototype.button11Click = function(event) {
		showdiv("false");
	};

	Model.prototype.btn_deleteClick = function(event) {
		// alert("组件ID = " + localStorage.getItem("ElementsId"));
		if (localStorage.getItem("isClick11") == "three") {
			var stringP = localStorage.getItem("ElementsId11").replace("damege", "");
			showdiv(this, "delete", Number(stringP));
		} else if (localStorage.getItem("isClick11") == "one") {
			var stringP = localStorage.getItem("ElementsId11").replace("seal", "");
			showdiv(this, "delete", Number(stringP));
		} else {
			var stringP = localStorage.getItem("ElementsId11").replace("door", "");
			showdiv(this, "delete", Number(stringP));
		}
	};

	function addImage(me_s, imageURI_s, divId_s, isDamege) {
		// 变量
		var imageCreateDId = "img";
		// 获取div
		var parentNode = document.getElementById(divId_s);
		// 往数组里添加照片元素（照片数组变动）
		if (isDamege == "true") {
			me_s.damage_picture.push(imageURI_s);
		} else if (isDamege == "one") {
			me_s.seal_picture.push(imageURI_s);
		} else {
			me_s.door_picture.push(imageURI_s);
		}
		// 动态生成组件
		var img = document.createElement(imageCreateDId);
		// 设置id
		var imgsetID = img.getElementsByTagName(imageCreateDId);
		// （照片数组变动）
		if (isDamege == "true") {
			imgsetID.id = "damege" + (me_s.damage_picture.length - 1);
		} else if (isDamege == "one") {
			imgsetID.id = "seal" + (me_s.seal_picture.length - 1);
		} else {
			imgsetID.id = "door" + (me_s.door_picture.length - 1);
		}
		// 拼接css样式Text
		var imageCss = "width: 50px; height: 50px; margin-left: 5px;";
		// 设置css样式
		img.style.cssText = imageCss;
		// 设置src属性（照片数组、数组长度变动）
		if (isDamege == "true") {
			img.src = me_s.damage_picture[me_s.damage_picture.length - 1];
		} else if (isDamege == "one") {
			img.src = me_s.seal_picture[me_s.seal_picture.length - 1];
		} else {
			img.src = me_s.door_picture[me_s.door_picture.length - 1];
		}
		// 将设置好的组件放进div中
		parentNode.appendChild(img);
		// 将该对象加入到数组中来,为删除后重新排版服务
		if (isDamege == "true") {
			me_s.damage_dom.push(img);
		} else if (isDamege == "one") {
			me_s.dom_seal.push(img);
		} else {
			me_s.damage_dom.push(img);
		}
		// image设置监听事件
		if (isDamege == "true") {
			img.onclick = function() {
				// 保存id值，根据id值对应到（存image对象的）数组下标值
				var id = img.getElementsByTagName("img").id;
				// (存储imageId键命变动)
				localStorage.setItem("isClick11", "three");
				localStorage.setItem("ElementsId11", id);
				// 弹出层或者跳转并将图片放进层中浏览
				showdiv(me_s, img);
			}
		} else if (isDamege == "one") {
			img.onclick = function() {
				// 保存id值，根据id值对应到（存image对象的）数组下标值
				var id = img.getElementsByTagName("img").id;
				// (存储imageId键命变动)
				localStorage.setItem("isClick11", "one");
				localStorage.setItem("ElementsId11", id);
				// 弹出层或者跳转并将图片放进层中浏览
				showdiv(me_s, img);
			}
		} else {
			img.onclick = function() {
				// 保存id值，根据id值对应到（存image对象的）数组下标值
				var id = img.getElementsByTagName("img").id;
				// (存储imageId键命变动)
				localStorage.setItem("isClick11", "two");
				localStorage.setItem("ElementsId11", id);
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
			$("#show11").css("display", "none");// show的display属性设置为none（隐藏）
			return;
		}
		// 删除事件
		if (pictrue == "delete") {
			var parentNode;
			if (localStorage.getItem("isClick11") == "three") {
				parentNode = document.getElementById("images11_3");
			} else if (localStorage.getItem("isClick11") == "one") {
				parentNode = document.getElementById("images11_1");
			} else {
				parentNode = document.getElementById("images11_2");
			}
			// 移除组件(组件对象数组变动)
			if (localStorage.getItem("isClick11") == "three") {
				parentNode.removeChild(me_ss.damage_dom[id]);
			} else if (localStorage.getItem("isClick11") == "one") {
				parentNode.removeChild(me_ss.dom_seal[id]);
			} else {
				parentNode.removeChild(me_ss.damage_dom[id]);
			}
			// 移除照片数组的元素(照片数组变动)
			if (localStorage.getItem("isClick11") == "three") {
				me_ss.damage_picture.splice(id, 1);
			} else if (localStorage.getItem("isClick11") == "one") {
				me_ss.seal_picture.splice(id, 1);
			} else {
				me_ss.door_picture.splice(id, 1);
			}
			// 移除组件对象数组的元素(组件对象数组变动)
			if (localStorage.getItem("isClick11") == "three") {
				me_ss.damage_dom.splice(id, 1);
			} else if (localStorage.getItem("isClick11") == "one") {
				me_ss.dom_seal.splice(id, 1);
			} else {
				me_ss.damage_dom.splice(id, 1);
			}
			// 重新排版
			var intNum = 0;
			if (localStorage.getItem("isClick11") == "three") {
				intNum = me_ss.damage_picture.length;
			} else if (localStorage.getItem("isClick11") == "one") {
				intNum = me_ss.dom_seal.length;
			}
			for (var int = id; int < intNum; int++) {
				// 将各组件的src往前推，针对ui组件(组件对象数组、照片数组变动)
				if (localStorage.getItem("isClick11") == "three") {
					if (me_ss.damage_picture.length > 0) {
						me_ss.damage_dom[int].src = me_ss.damage_picture[int];
					}
				} else if (localStorage.getItem("isClick11") == "one") {
					if (me_ss.seal_picture.length > 0) {
						me_ss.dom_seal[int].src = me_ss.dom_seal[int];
					}
				} else {
					me_ss.damage_dom[int].src = me_ss.door_picture[int];
				}
				// 将ui组件的id往前推(组件对象数组变动)
				if (localStorage.getItem("isClick11") == "three") {
					me_ss.damage_dom[int].getElementsByTagName("img").id = "damege" + int;
				} else if (localStorage.getItem("isClick11") == "one") {
					me_ss.dom_seal[int].getElementsByTagName("img").id = "seal" + int;
				} else {
					me_ss.damage_dom[int].getElementsByTagName("img").id = "door" + int;
				}
			}
			justep.Util.hint("删除成功！！！", {
				"delay" : normerHintDelay
			});
			$("#show11").css("display", "none");// show的display属性设置为none（隐藏）
			return;
		}

		if ($("#show11").css("display") == 'none') {// 如果show是隐藏的
			// 设置高度和宽度
			$("#show11").css("height") == winWidth;
			document.getElementById("show11").style.visibility = "visible";
			$("#show11").css("display", "block");// show的display属性设置为block（显示）
			// 获取image id
			var iamgeson = me_ss.getElementByXid('imageshow');
			$(iamgeson).attr("src", pictrue.src);
		} else {// 如果show是显示的
			$("#show11").css("display", "none");// show的display属性设置为none（隐藏）
		}
	}

	return Model;
});