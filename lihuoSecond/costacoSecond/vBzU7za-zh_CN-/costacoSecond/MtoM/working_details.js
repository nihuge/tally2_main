define(function(require) {
	require("$UI/costacoSecond/ajax/jquery-1");
	var justep = require("$UI/system/lib/justep");
	// 引入/UI2/demo/baas/baas.js
	var Baas = require("$UI/demo/baas/baas");
	require("$UI/system/lib/cordova/cordova");
	require("res!./img");
	require("css!$UI/okchexl/device/common/pub").load();
	require("cordova!org.apache.cordova.camera");
	require("cordova!org.apache.cordova.inappbrowser");
	require("cordova!org.apache.cordova.file");
	require("cordova!org.apache.cordova.file-transfer");
	require("css!$UI/demo/device/common/pub").load();
	var Model = function() {
		this.STORE_ID = "com.justep.demo.advice.cameradata";
		this.i = 0;
		this.j = 0;
		this.good_picture = new Array();
		this.dom = new Array();
		this.damage_picture = new Array();// 残损照片
		this.damage_dom = new Array();
		this.callParent();
		this.get_ctn_id = "";
		this.step = "";
		this.oid = "";
		this.ctndetails_ID = "";
		this.isRefresh = true;
		fleshAndReLoad = 0;
	};

	Model.prototype.modelLoad = function(event) {
		fleshAndReLoad = 0;
		var me = this;
		var ctndetails_ID = localStorage.getItem('ctndetails_ID');
		var containerno = localStorage.getItem('working_details_ctnno');
		// var blno = localStorage.getItem('working_details_blno' +
		// localStorage.getItem('ctndetails_ID'));
		// this.comp("input_blno").val(blno);
		this.getElementByXid("span13").innerText = containerno;
		this.getElementByXid("span1").innerText = containerno;
		this.oid = localStorage.getItem('working_details_oid' + ctndetails_ID);
	};

	Model.prototype.getLevel = function(getArray) {
		var ctndetails_ID = localStorage.getItem('ctndetails_ID');
		var levelList = new Array();
		this.db.transaction(function(tx) {
			tx.executeSql("select * from operation_table where step =" + 3 + " AND ctn_id=" + ctndetails_ID, [], function(tx, res) {
				if (res.rows.length > 0) {
					for (var i = 0; i < res.rows.length; i++) {
						var obj = JSON.parse(res.rows.item(i).operation_data);
						levelList.push(obj);
					}
				}
				getArray(levelList);
			});
		}, function(e) {
			alert("ERROR: " + e.message);
		});
	}

	// 查看是否有有关关的缓存 并获取关列表
	Model.prototype.LevelListDataCustomRefresh = function(getLevelData) {
		var me = this;
		onDeviceReady("MtoM_TABLE");
		if (this.isRefresh) {
			// 判断是否有缓存,如果有就显示缓存，没就拜拜咯
			// me.selectIngSlign(localStorage.getItem('ctndetails_ID'));
			select_guan_list(this, localStorage.getItem('ctndetails_ID'));
		} else {
			// 刷新的时候上传缓存啊，然后显示全部啊
			// me.selectIngSlign(localStorage.getItem('ctndetails_ID'), true);
			select_guan_list(this, localStorage.getItem('ctndetails_ID'), true);
		}
	};

	Model.prototype.showsling = function(sling_working_details) {
		this.getElementByXid("span14").innerText = sling_working_details
	};

	// orderData的自定义保存事件onCustomSave

	// 显示图片和视频
	Model.prototype.col16Click = function(event) {
		var data = this.comp("fileData");
		var url = data.getValue("filePath");

		if (justep.Browser.isX5App && justep.Browser.isAndroid) {
			window.open(url, "_system");
			// window.open(url,"_blank");
			// window.open(url, '_blank',
			// 'toolbarposition=top,location=no,enableViewportScale=yes');
		} else {
			window.open(url, '_blank', 'toolbarposition=top,location=no,enableViewportScale=yes');
		}

	};

	// 删除照片
	Model.prototype.col30Click = function(event) {
		this.comp("fileData").clear();
		localStorage.setItem(this.STORE_ID, "");
	};

	// 确认提交
	Model.prototype.button9Click = function(event) {
		var me = this;
		me.uploadImage(me.comp("fileData").loadData(JSON.parse(localStorage.getItem(me.STORE_ID))));
	};

	// 拍照
	Model.prototype.paizhaoClick = function(event) {
		var me = this;
		var data = this.comp("fileData");
		function onSuccess(imageURI) {
			data.newData({
				index : 0
			});
			data.setValue("filePath", imageURI);
			data.setValue("fileName", imageURI.substr(imageURI.lastIndexOf('/') + 1));
			data.setValue('createTime', justep.Date.toString(new Date(), justep.Date.DEFAULT_FORMAT));
			me.uploadImage(imageURI);
		}
		function onFail(message) {
			return message;
		}
		navigator.camera.getPicture(onSuccess, onFail, {
			quality : 50,
			sourceType : 1,
		// destinationType: 0,
		// 0、2为从相册文件中选择，1为拍照，DestinationType返回类型0是base64
		});
	};

	// 删除照片
	Model.prototype.DelClick = function(event) {
		this.comp("fileData").clear();
		localStorage.setItem(this.STORE_ID, "");
	};
	// Model.prototype.deleteBtnClick = function(event){

	// this.comp('orderDate').deleteData(this.comp('orderDate').getFirstRow());
	// 行删除
	// var data = this.comp("orderDate");
	// var row = event.bindingContext.$object;
	// data.deleteData([ row ], {
	// "async" : true,
	// "onSuccess" : function() {
	// data.saveData();
	// }
	// });
	// };

	// 关号跳转查看详细
	Model.prototype.li1Click = function(event) {

	};

	// 跳转detail
	Model.prototype.listLineClick = function(event) {
		// 调用对话框编辑，并传入当前行数据
		var row = event.bindingContext.$object;
		this.comp("detailDialog").open({
			"data" : {
				"operator" : "edit",
				"rowData" : row.toJson()
			}
		});
	};

	// 删除关
	Model.prototype.delLevelClick = function(event) {
		this.comp("messageDialog").show({
			"title" : "温馨提示",
			"message" : "是否删除？"
		});
	};

	// 确认删除
	Model.prototype.messageDialogYes = function(event) {
		var me = this;
		this.ctndetails_ID = localStorage.getItem('ctndetails_ID');
		var LevelListData = this.comp("LevelListData");
		var lastLevelID = LevelListData.getLastRow().val("id");
		var uid = localStorage.getItem('userinfoid');
		var oid = localStorage.getItem('working_details_oid' + this.ctndetails_ID);
		deleteMtoMGuanLast(me, uid, oid, lastLevelID);
	};

	Model.prototype.button6Click = function(event) {
		var qbzx_operationid = localStorage.getItem("qbzx_operationid");
		$("#input8").val(qbzx_operationid);
	};

	// 残损照片提交
	// http://192.168.1.91/xzcostacoSecond/index.php/index/damagecargo
	Model.prototype.button3Click = function(event) {
		var me = this;
		var data = this.comp("fileData");
		function onSuccess(imageURI) {
			me.uploadImg(imageURI);
		}
		function onFail(message) {
			return message;
		}
		navigator.camera.getPicture(onSuccess, onFail, {
			quality : 10,
			sourceType : 1,
			destinationType : 0,
		// 0、2为从相册文件中选择，1为拍照，DestinationType返回类型0是base64
		});
	};

	Model.prototype.uploadImg = function(imageURI) {
		var qbzx_operationid = localStorage.getItem("qbzx_operationid");
		var sling_working_details = localStorage.getItem('sling_working_details');
		$.ajax({
			"type" : "post",
			"async" : false,
			"data" : {

				"tp" : "data:image/jpg;base64," + imageURI,
				"operationid" : qbzx_operationid,
				"sling" : sling_working_details,
			},
			"dataType" : "json",
			"url" : interface_url + "?c=index&a=damagecargo", // PHP数据库校验用户名和密码是否正常
			"success" : function(data) {

				alert(data)

			},
			"error" : function() {
				justep.Util.hint("数据传输失败！", {
					"delay" : normerHintDelay,
					"style" : "color:red;"
				});
			}

		});
	}

	// 拍摄关照片
	Model.prototype.button7Click = function(event) {
		var me = this;
		var data = this.comp("fileData");
		function onSuccess(imageURI) {
			// data.newData({index : 0});
			// data.setValue("filePath", imageURI);
			// data.setValue("fileName",
			// imageURI.substr(imageURI.lastIndexOf('/') + 1));
			// data.setValue('createTime', justep.Date.toString(new Date(),
			// justep.Date.DEFAULT_FORMAT ));
			me.upload(imageURI);
		}
		function onFail(message) {
			return message;
		}
		navigator.camera.getPicture(onSuccess, onFail, {
			quality : 10,
			sourceType : 1,
			destinationType : 0,
		// 0、2为从相册文件中选择，1为拍照，DestinationType返回类型0是base64
		});

	};

	Model.prototype.upload = function(imageURI) {
		$("#workSlingImg").val("data:image/jpg;base64," + imageURI);
	}

	// 拍摄铅封
	Model.prototype.button11Click = function(event) {
		var me = this;
		var data = this.comp("fileData");
		function onSuccess(imageURI) {
			// data.newData({index : 0});
			// data.setValue("filePath", imageURI);
			// data.setValue("fileName",
			// imageURI.substr(imageURI.lastIndexOf('/') + 1));
			// data.setValue('createTime', justep.Date.toString(new Date(),
			// justep.Date.DEFAULT_FORMAT ));
			me.qianfeng(imageURI);
		}
		function onFail(message) {
			return message;
		}
		navigator.camera.getPicture(onSuccess, onFail, {
			quality : 10,
			sourceType : 1,
			destinationType : 0,
		// 0、2为从相册文件中选择，1为拍照，DestinationType返回类型0是base64
		});

	};

	Model.prototype.qianfeng = function(imageURI) {
		$("#qianfengImg").val("data:image/jpg;base64," + imageURI);
	}
	// 拍摄货照片
	Model.prototype.button8Click = function(event) {
		var me = this;
		function onSuccess(imageURI) {
			// data.newData({index : 0});
			// data.setValue("filePath", imageURI);
			// data.setValue("fileName",
			// imageURI.substr(imageURI.lastIndexOf('/') + 1));
			// data.setValue('createTime', justep.Date.toString(new Date(),
			// justep.Date.DEFAULT_FORMAT ));
			// var dispatchingOrderDetailsData =
			// this.comp("dispatchingOrderDetailsData");
			me.uploadgoodsImage(imageURI);
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

	Model.prototype.uploadgoodsImage = function(imageURI) {
		var isgoodsbad = this.comp('isgoodsbad');
		isgoodsbad.setValue('base64', "data:image/jpg;base64," + imageURI);
		// this.comp('input5').val("data:image/jpg;base64,"+imageURI);

	}

	// 下一关
	Model.prototype.nextSlingClick = function(event) {
		var me = this;
		var LevelData = this.comp('LevelData');
		var uid = localStorage.getItem('userinfoid');
		var tidanhao = this.getElementByXid('select1').value;
		num = this.getElementByXid('input_num').value;
		damage_num = this.getElementByXid('input_damage_num').value;
		// input_damage_picture =
		// this.getElementByXid("input_damage_picture").value;
		// me.cache();
		// me.upCacheData();
		if (tidanhao == "请选择提单号" || $.trim(tidanhao) == "") {

			justep.Util.hint("请选择提单号！", {
				"delay" : normerHintDelay,
				"style" : "color:red;"
			});

			return;
		}
		if ($.trim(me.getElementByXid('input_num').value) == "") {
			justep.Util.hint("请输入货物件数！", {
				"delay" : normerHintDelay,
				"style" : "color:red;"
			});

			return;
		}

		if (me.good_picture.length != 0 || localStorage.getItem('isMust_' + localStorage.getItem('ctndetails_ID')) != "Y") {
			goods_array_to_str = me.good_picture.join("----------");
		} else {
			goods_array_to_str = "";
			justep.Util.hint("请拍摄货物照片！", {
				"delay" : normerHintDelay,
				"style" : "color:red;"
			});
			return;
		}

		if (LevelData.val('hasbad') == 1 && ($.trim(damage_num) == "" || me.damage_picture.length == 0)) {
			justep.Util.hint("请输入残损件数或残损照片", {
				"delay" : normerHintDelay,
				"style" : "color:red;"
			});

			return;
		} else if (LevelData.val('hasbad') == 0) {
			damage_num == "";
			me.damage_picture.length = 0;
		}
		localStorage.setItem(localStorage.getItem('ctndetails_ID') + "level_num", Number(localStorage.getItem(localStorage.getItem('ctndetails_ID') + "level_num")) + 1);
		me.getElementByXid("span14").innerText = Number(localStorage.getItem(localStorage.getItem('ctndetails_ID') + "level_num")) + 1;

		var level_num = Number(localStorage.getItem(localStorage.getItem('ctndetails_ID') + "level_num"));

		if (me.damage_picture.length != 0) {
			array_to_str = me.damage_picture.join("----------");
		} else {
			array_to_str = "";
		}

		MtoM_secondSet(localStorage.getItem('ctndetails_ID'), level_num, me.oid, num, damage_num, array_to_str, "3", true, me, tidanhao, goods_array_to_str);

		me.comp('input_num').val("");
		// me.comp('input_level_img').val("");
		me.comp("input_damage_num").val("");
		// me.comp("input_damage_picture").val("");
		reFlashArray(me);
		LevelData.setValue("hasbad", 0);
		me.damage_picture.length = 0;
		me.good_picture.length = 0;
		me.i = 0;
		me.j = 0;

	};

	// 返回代办界面
	Model.prototype.backClick = function(event) {
		this.isRefresh = true;
		justep.Shell.showPage("working_dd");
	};

	Model.prototype.button5Click = function(event) {
		this.isRefresh = true;
		justep.Shell.showPage("working_dd");
	};

	Model.prototype.button_damage_pictureClick = function(event) {
		var me = this;
		if (me.damage_picture.length < 10) {
			function onSuccess(imageURI) {
				var imageALLURI = "data:image/jpg;base64," + imageURI;
				var divId = "damgeimages13";
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

	// 完成页面
	Model.prototype.button1Click = function(event) {
		var me = this;
		if (localStorage.getItem(localStorage.getItem('ctndetails_ID') + "level_num") == null || Number(localStorage.getItem(localStorage.getItem('ctndetails_ID') + "level_num")) == 0) {
			justep.Util.hint("请先录关", {
				"delay" : normerHintDelay
			});
			return;
		}
		this.isRefresh = true;
		insert_status(localStorage.getItem('ctndetails_ID'), "4");
		justep.Shell.showPage("workingfinish_dd");
	};

	Model.prototype.modelActive = function(event) {
		onDeviceReady("MtoM_TABLE");
		this.ctndetails_ID = localStorage.getItem('ctndetails_ID');
		this.oid = localStorage.getItem('working_details_oid' + this.ctndetails_ID);
		var containerno = localStorage.getItem('working_details_ctnno');
		var blno = localStorage.getItem('working_details_blno' + this.ctndetails_ID);
		// 刷新提单号
		this.blnoCustomRefresh();
		// this.i = 0;
		// this.j = 0;
		fleshAndReLoad = 0;
		reFlashArray(this);
		// this.damage_picture = new Array();// 残损照片
		// this.comp("input_blno").val(blno);
		this.getElementByXid("span13").innerText = containerno;
		this.getElementByXid("span1").innerText = containerno;
		this.comp('input_num').val("");
		// this.comp('input_level_img').val("");
		// this.comp('input_damage_picture').val("");
		this.getElementByXid("span14").innerText = Number(localStorage.getItem(localStorage.getItem('ctndetails_ID') + "level_num")) + 1;
		this.LevelListDataCustomRefresh();
		this.isRefresh = false;
	};

	Model.prototype.blnoCustomRefresh = function(event) {
		var tidanhao = this.comp("blnoData");
		var bilno = JSON.parse(localStorage.getItem('working_details_blno' + localStorage.getItem('planId_DD')));
		if (bilno != null && bilno != "") {
			tidanhao.loadData(bilno);
		}
	};

	Model.prototype.button_level_img = function(event) {
		var me = this;
		if (me.good_picture.length < 1) {
			function onSuccess(imageURI) {
				// 参数一:this
				// 参数二：base64形式的jpg图片
				// 参数三：DIV的ID
				var imageALLURI = "data:image/jpg;base64," + imageURI;
				var divId = "images13";
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

	function addImage(me_s, imageURI_s, divId_s, isDamege) {
		// 变量
		var imageCreateDId = "img";
		// 获取div
		var parentNode = document.getElementById(divId_s);
		// 往数组里添加照片元素（照片数组变动）
		if (isDamege == "true") {
			me_s.damage_picture.push(imageURI_s);
		} else {
			me_s.good_picture.push(imageURI_s);
		}
		// 动态生成组件
		var img = document.createElement(imageCreateDId);
		// 设置id
		var imgsetID = img.getElementsByTagName(imageCreateDId);
		// （照片数组变动）
		if (isDamege == "true") {
			imgsetID.id = "damege" + (me_s.damage_picture.length - 1);
		} else {
			imgsetID.id = me_s.good_picture.length - 1;
		}
		// 拼接css样式Text
		var imageCss = "width: 50px; height: 50px; margin-left: 5px;";
		// 设置css样式
		img.style.cssText = imageCss;
		// 设置src属性（照片数组、数组长度变动）
		if (isDamege == "true") {
			img.src = me_s.damage_picture[me_s.damage_picture.length - 1];
		} else {
			img.src = me_s.good_picture[me_s.good_picture.length - 1];
		}
		// 将设置好的组件放进div中
		parentNode.appendChild(img);
		// 将该对象加入到数组中来,为删除后重新排版服务
		if (isDamege == "true") {
			me_s.damage_dom.push(img);
		} else {
			me_s.dom.push(img);
		}
		// image设置监听事件
		if (isDamege == "true") {
			img.onclick = function() {
				// 保存id值，根据id值对应到（存image对象的）数组下标值
				var id = img.getElementsByTagName("img").id;
				// (存储imageId键命变动)
				localStorage.setItem("isDamageClick13", "true");
				localStorage.setItem("DamegeElementsId13", id);
				// 弹出层或者跳转并将图片放进层中浏览
				showdiv(me_s, img);
			}
		} else {
			img.onclick = function() {
				// 保存id值，根据id值对应到（存image对象的）数组下标值
				var id = img.getElementsByTagName("img").id;
				// (存储imageId键命变动)
				localStorage.setItem("isDamageClick13", "false");
				localStorage.setItem("ElementsId13", id);
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
			$("#show13").css("display", "none");// show的display属性设置为none（隐藏）
			return;
		}
		// 删除事件
		if (pictrue == "delete") {
			var parentNode;
			if (localStorage.getItem("isDamageClick13") == "true") {
				parentNode = document.getElementById("damgeimages13");
			} else {
				parentNode = document.getElementById("images13");
			}
			// 移除组件(组件对象数组变动)
			if (localStorage.getItem("isDamageClick13") == "true") {
				parentNode.removeChild(me_ss.damage_dom[id]);
			} else {
				parentNode.removeChild(me_ss.dom[id]);
			}
			// 移除照片数组的元素(照片数组变动)
			if (localStorage.getItem("isDamageClick13") == "true") {
				me_ss.damage_picture.splice(id, 1);
			} else {
				me_ss.good_picture.splice(id, 1);
			}
			// 移除组件对象数组的元素(组件对象数组变动)
			if (localStorage.getItem("isDamageClick13") == "true") {
				me_ss.damage_dom.splice(id, 1);
			} else {
				me_ss.dom.splice(id, 1);
			}
			var intNum = 0;
			if (localStorage.getItem("isDamageClick13") == "true") {
				intNum = me_ss.damage_picture.length;
			} else {
				intNum = me_ss.good_picture.length;
			}
			// 重新排版
			for (var int = id; int < intNum; int++) {
				// 将各组件的src往前推，针对ui组件(组件对象数组、照片数组变动)
				if (localStorage.getItem("isDamageClick13") == "true") {
					if (me_ss.damage_picture.length > 0) {
						me_ss.damage_dom[int].src = me_ss.damage_picture[int];
					}
				} else {
					me_ss.dom[int].src = me_ss.good_picture[int];
				}
				// 将ui组件的id往前推(组件对象数组变动)
				if (localStorage.getItem("isDamageClick13") == "true") {
					me_ss.damage_dom[int].getElementsByTagName("img").id = "damege" + int;
				} else {
					me_ss.dom[int].getElementsByTagName("img").id = int;
				}
			}
			justep.Util.hint("删除成功！！！", {
				"delay" : normerHintDelay
			});
			$("#show13").css("display", "none");// show的display属性设置为none（隐藏）
			return;
		}

		if ($("#show13").css("display") == 'none') {// 如果show是隐藏的
			// 设置高度和宽度
			$("#show13").css("height") == winWidth;
			document.getElementById("show13").style.visibility = "visible";
			$("#show13").css("display", "block");// show的display属性设置为block（显示）
			// 获取image id
			var iamgeson = me_ss.getElementByXid('imageshow');
			$(iamgeson).attr("src", pictrue.src);
		} else {// 如果show是显示的
			$("#show13").css("display", "none");// show的display属性设置为none（隐藏）
		}
	}

	Model.prototype.button11Click = function(event) {
		showdiv("false");
	};

	Model.prototype.btn_deleteClick = function(event) {
		// alert("组件ID = " + localStorage.getItem("ElementsId13"));
		if (localStorage.getItem("isDamageClick13") == "true") {
			var stringP = localStorage.getItem("DamegeElementsId13").replace("damege", "");
			showdiv(this, "delete", Number(stringP));

		} else {
			showdiv(this, "delete", Number(localStorage.getItem("ElementsId13")));
		}
	};

	function reFlashArray(me_s) {
		$('#images13').empty();
		$('#damgeimages13').empty();
		me_s.good_picture.slice(0, me_s.good_picture.length);
		me_s.dom.slice(0, me_s.dom.length);
		me_s.damage_picture.slice(0, me_s.damage_picture.length);
		me_s.damage_dom.slice(0, me_s.damage_dom.length);
		me_s.good_picture = new Array();
		me_s.dom = new Array();
		me_s.damage_picture = new Array();
		me_s.damage_dom = new Array();
	}

	Model.prototype.reflash_blnoClick = function(event) {
		MtoMGetBlno(this, localStorage.getItem('planId_DD'), setBlno);
	};

	function setBlno(me_s) {
		var tidanhao = me_s.comp("blnoData");
		var bilno = JSON.parse(localStorage.getItem('working_details_blno' + localStorage.getItem('planId_DD')));
		if (bilno != null && bilno != "") {
			tidanhao.loadData(bilno);
		}
	}

	return Model;
});