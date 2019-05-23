define(function(require) {
	require("$UI/costacoSecond/ajax/jquery-1");
	require("cordova!com.brodysoft.sqlitePlugin");
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
		this.array_one = new Array();
		this.array_one_dom = new Array();
		this.array_two = new Array();
		this.array_two_dom = new Array();
		this.callParent();
		this.isRefresh = true;
		fleshAndReLoad = 0;
	};

	Model.prototype.modelLoad = function(event) {
		fleshAndReLoad = 0;
		var containerno = localStorage.getItem('working_details_ctnno');
		var blno = localStorage.getItem('working_details_blno');
		this.getElementByXid("span13").innerText = containerno;
		this.getElementByXid("span1").innerText = containerno;
	};

	// 获取关列表
	Model.prototype.LevelListDataCustomRefresh = function(event) {
		var me = this;
		if (this.isRefresh) {
			// 判断是否有缓存,如果有就显示缓存，没就拜拜咯
			// me.selectIngSlign(localStorage.getItem('ctndetails_ID'));
			select_guan_list(this, localStorage.getItem('ctndetails_ID'));
			this.isRefresh = false;
		} else {
			// 刷新的时候上传缓存啊，然后显示全部啊
			// me.selectIngSlign(localStorage.getItem('ctndetails_ID'), true);
			select_guan_list(this, localStorage.getItem('ctndetails_ID'), true);
		}

	};

	Model.prototype.showsling = function(sling_working_details) {
		// this.getElementByXid("span14").innerText = sling_working_details
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
			// alert(imageURI);
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

	Model.prototype.workingDetailsDataDeleteError = function(event) {
		// alert(" 回家");
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
		var LevelListData = this.comp("LevelListData");
		var lastLevelID = LevelListData.getLastRow().val("id");
		var uid = localStorage.getItem('userinfoid');
		var oid = localStorage.getItem('working_details_oid');
		// 删除关的操作
		deleteGuanLast(me, uid, oid, lastLevelID);
	};

	Model.prototype.button6Click = function(event) {
		var qbzx_operationid = localStorage.getItem("qbzx_operationid");
		$("#input8").val(qbzx_operationid);
	};

	// 残损照片提交
	// http://192.168.1.91/xztally/index.php/index/damagecargo
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
	}

	// 下一关
	Model.prototype.nextSlingClick = function(event) {
		var me = this;
		var LevelData = this.comp('LevelData');
		// 获取作业id
		var oid = localStorage.getItem('working_details_oid');
		// var input_damage_img =
		// this.getElementByXid("input_damage_img").value;
		// 提单号
		var blno = this.getElementByXid("select1").value;
		// 货物件数
		var num = this.getElementByXid("input_num").value;
		// 货物照片（二期改为多张）
		var goods_picturestr = "";
		// 是否有残损
		var isBad = LevelData.val('hasbad');
		// 残损件数
		var damage_num = this.getElementByXid("input_damage_num").value;
		// 残损照片
		var damage_picture_to_str = "";
		// 判断提单号
		var tidanhaoJY = false;
		// 获取保存本地的提单号，校验，防止界面乱跳后数据异常
		var instruction_id = localStorage.getItem('working_details_instruction_id');
		var tidanhao_data = localStorage.getItem(instruction_id);
		var get_tidanhao_data = JSON.parse(tidanhao_data);

		if ($.trim(blno) == "" || $.trim(blno) == null) {
			justep.Util.hint("请选择提单号！", {
				"delay" : normerHintDelay,
				"style" : "color:red;"
			});
			return;
		} else {
			for (var i = 0; i < get_tidanhao_data.length; i++) {
				if (get_tidanhao_data[i]['blno'] == blno) {
					tidanhaoJY = true;
				}
			}
		}
		if ($.trim(num) == "" || $.trim(num) == null) {
			justep.Util.hint("请输入货物件数！", {
				"delay" : normerHintDelay,
				"style" : "color:red;"
			});
			return;
		}

		if (me.array_one.length == 0) {
			justep.Util.hint("请拍摄货物照片！", {
				"delay" : normerHintDelay,
				"style" : "color:red;"
			});
			return;
		} else {
			goods_picturestr = me.array_one.join("----------");
		}

		if (isBad == 1) {
			if ($.trim(damage_num) == "" || $.trim(damage_num) == null) {
				justep.Util.hint("请输入残损件数！", {
					"delay" : normerHintDelay,
					"style" : "color:red;"
				});
				return;
			}
			if (me.array_two.length == 0) {
				justep.Util.hint("请拍残损照片！", {
					"delay" : normerHintDelay,
					"style" : "color:red;"
				});
				return;
			} else {
				damage_picture_to_str = me.array_two.join("----------");
			}

		} else {
			damage_num = "0";
		}

		if (tidanhaoJY) {
			localStorage.setItem(localStorage.getItem('ctndetails_ID') + "level_num", Number(localStorage.getItem(localStorage.getItem('ctndetails_ID') + "level_num")) + 1);
			this.getElementByXid("span14").innerText = Number(localStorage.getItem(localStorage.getItem('ctndetails_ID') + "level_num")) + 1;
			// 添加关号
			var level_num = 0;
			// 存缓存
			CFS_secondSet(localStorage.getItem('ctndetails_ID'), goods_picturestr, oid, num, damage_num, damage_picture_to_str, blno, "2", localStorage.getItem(localStorage.getItem('ctndetails_ID')
					+ "level_num"), true, me);
			me.clearData();
		} else {
			justep.Util.hint("提单异常，请刷新提单号！", {
				"delay" : normerHintDelay,
				"style" : "color:red;"
			});
		}

	};

	Model.prototype.clearData = function() {
		var me = this;
		me.comp("input_num").val("");
		me.comp("input_damage_num").val("");
		reflasArray(me);
	}
	// 返回代办界面
	Model.prototype.backClick = function(event) {
		this.isRefresh = true;
		// justep.Shell.closePage();
		justep.Shell.showPage("working_cfs");
	};

	Model.prototype.button5Click = function(event) {
		justep.Shell.showPage("working_cfs");
		// window.location.href = "working.w";
	};

	Model.prototype.button_damage_imgClick = function(event) {
		var me = this;
		if (me.array_two.length < 10) {
			function onSuccess(imageURI) {
				// 参数一:this
				// 参数二：base64形式的jpg图片
				// 参数三：DIV的ID
				// 参数四:区别同一个界面都多处拍照
				// 参数五：弹出层div的id
				var imageALLURI = "data:image/jpg;base64," + imageURI;
				var divId = localStorage.getItem("image_two_id");
				// 弹出层div的id,先保存到本地,键名定死,为删除服务
				localStorage.setItem("ceng_div_id", "show32");
				var ceng_div_id = localStorage.getItem("ceng_div_id");
				addImage(me, imageALLURI, divId, "two", ceng_div_id);
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
		var ces = Number(localStorage.getItem(localStorage.getItem('ctndetails_ID') + "level_num")) + 1;
		if (ces > 1) {
			var me = this;
			this.isRefresh = true;
			justep.Shell.showPage("halfcloseDoor_cfs");
		} else {
			justep.Util.hint("请先录关！", {
				"delay" : normerHintDelay
			});
		}
	};
	// 获取提单号
	Model.prototype.tidanhaoCustomRefresh = function(event) {
		var tidanhao = this.comp("tidanhao");
		var instruction_id = localStorage.getItem('working_details_instruction_id');
		var tidanhao_data = localStorage.getItem(instruction_id);
		var get_tidanhao_data = JSON.parse(tidanhao_data);
		if (get_tidanhao_data != null) {
			tidanhao.loadData(get_tidanhao_data);
			// 自动带入提单号
			if (localStorage.getItem("select2_" + localStorage.getItem('ctndetails_ID')) != null) {
				var data25 = JSON.parse(localStorage.getItem(instruction_id));
				var count = 0;
				for (var int = 0; int < data25.length; int++) {
					if (localStorage.getItem("select2_" + localStorage.getItem('ctndetails_ID')) == data25[int]['blno']) {
						count = int + 1;
						break;
					}
				}
				
				this.getElementByXid("select1")[count].selected = true;
			}
		} else {
			tidanhao.clear();
		}

	};
	Model.prototype.select1Change = function(event) {
		localStorage.setItem("select2_" + localStorage.getItem('ctndetails_ID'), event.value);
	};

	// 拍摄货物照片
	Model.prototype.button_level_img = function(event) {
		var me = this;
		if (me.array_one.length < 1) {
			function onSuccess(imageURI) {
				// 参数一:this
				// 参数二：base64形式的jpg图片
				// 参数三：DIV的ID
				// 参数四:区别同一个界面都多处拍照
				// 参数五：弹出层div的id
				var imageALLURI = "data:image/jpg;base64," + imageURI;
				var divId = localStorage.getItem("image_one_id");
				// 弹出层div的id,先保存到本地,键名定死,为删除服务
				localStorage.setItem("ceng_div_id", "show32");
				var ceng_div_id = localStorage.getItem("ceng_div_id");
				addImage(me, imageALLURI, divId, "one", ceng_div_id);
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
		onDeviceReady("CFS_TABLE");
		this.tidanhaoCustomRefresh();
		this.comp("input_num").val("");
		this.comp("input_damage_num").val("");
		reflasArray(this);
		fleshAndReLoad = 0;
		this.isRefresh = true;
		this.LevelListDataCustomRefresh();
		var containerno = localStorage.getItem('working_details_ctnno');
		var blno = localStorage.getItem('working_details_blno');
		this.getElementByXid("span13").innerText = containerno;
		this.getElementByXid("span1").innerText = containerno;
		this.getElementByXid("span14").innerText = Number(localStorage.getItem(localStorage.getItem('ctndetails_ID') + "level_num")) + 1;

	};

	function reflasArray(me) {
		$('#images32_1').empty();
		$('#images32_2').empty();
		// 显示小照片的层div
		localStorage.setItem("image_one_id", "images32_1");
		localStorage.setItem("image_two_id", "images32_2");
		me.array_one.length = 0;
		me.array_one_dom.length = 0;
		me.array_one = new Array();
		me.array_one_dom = new Array();

		me.array_two.length = 0;
		me.array_two_dom.length = 0;
		me.array_two = new Array();
		me.array_two_dom = new Array();
	}

	// 删除指定的某一列关缓
	Model.prototype.delete_RowCahca = function() {
		var me = this;
		var LevelListData = this.comp("LevelListData");
		me.db = new DB();
		me.db.onDeviceReady("CFS_TABLE");
		me.db.delete_slige(delet_ctn_data_last, localStorage.getItem('ctndetails_ID'));
		function delet_ctn_data_last() {
			if (localStorage.getItem(localStorage.getItem('ctndetails_ID') + "level_num") > 0) {
				localStorage.setItem(localStorage.getItem('ctndetails_ID') + "level_num", Number(localStorage.getItem(localStorage.getItem('ctndetails_ID') + "level_num")) - 1);
				me.getElementByXid("span14").innerText = Number(localStorage.getItem(localStorage.getItem('ctndetails_ID') + "level_num")) + 1;
			}
			me.getCachData();
		}
	}

	Model.prototype.button11Click = function(event) {
		showdiv("false", "", "", localStorage.getItem("ceng_div_id"));
	};

	Model.prototype.btn_deleteClick = function(event) {
		// alert("组件ID = " + localStorage.getItem("ElementsId"));
		if (localStorage.getItem("Click") == "one") {
			var stringP = localStorage.getItem("image_id").replace("one", "");
			showdiv(this, "delete", Number(stringP), localStorage.getItem("ceng_div_id"));
		} else if (localStorage.getItem("Click") == "two") {
			var stringP = localStorage.getItem("image_id").replace("two", "");
			showdiv(this, "delete", Number(stringP), localStorage.getItem("ceng_div_id"));
		} else {
			var stringP = localStorage.getItem("image_id").replace("three", "");
			showdiv(this, "delete", Number(stringP), localStorage.getItem("ceng_div_id"));
		}
	};

	function addImage(me_s, imageURI_s, divId_s, array_position, ceng_div_id) {
		// 变量
		var imageCreateDId = "img";
		// 获取div
		var parentNode = document.getElementById(divId_s);
		// 往数组里添加照片元素（照片数组变动）
		if (array_position == "one") {
			me_s.array_one.push(imageURI_s);
		} else if (array_position == "two") {
			me_s.array_two.push(imageURI_s);
		} else {
			me_s.array_three.push(imageURI_s);
		}
		// 动态生成组件
		var img = document.createElement(imageCreateDId);
		// 设置id
		var imgsetID = img.getElementsByTagName(imageCreateDId);
		// （照片数组变动）
		if (array_position == "one") {
			imgsetID.id = array_position + (me_s.array_one.length - 1);
		} else if (array_position == "two") {
			imgsetID.id = array_position + (me_s.array_two.length - 1);
		} else {
			imgsetID.id = array_position + (me_s.array_three.length - 1);
		}
		// 拼接css样式Text
		var imageCss = "width: 50px; height: 50px; margin-left: 5px;";
		// 设置css样式
		img.style.cssText = imageCss;
		// 设置src属性（照片数组、数组长度变动）
		if (array_position == "one") {
			img.src = me_s.array_one[me_s.array_one.length - 1];
		} else if (array_position == "two") {
			img.src = me_s.array_two[me_s.array_two.length - 1];
		} else {
			img.src = me_s.array_three[me_s.array_three.length - 1];
		}
		// 将设置好的组件放进div中
		parentNode.appendChild(img);
		// 将该对象加入到数组中来,为删除后重新排版服务
		if (array_position == "one") {
			me_s.array_one_dom.push(img);
		} else if (array_position == "two") {
			me_s.array_two_dom.push(img);
		} else {
			me_s.array_three_dom.push(img);
		}
		// image设置监听事件
		if (array_position == "one") {
			img.onclick = function() {
				// 保存id值，根据id值对应到（存image对象的）数组下标值
				var id = img.getElementsByTagName("img").id;
				// (存储imageId键命变动)
				localStorage.setItem("Click", "one");
				// 点击存储当前image对象的id属性，用于删除指定的图片
				localStorage.setItem("image_id", id);
				// 弹出层或者跳转并将图片放进层中浏览
				showdiv(me_s, img, "", ceng_div_id);
			}
		} else if (array_position == "two") {
			img.onclick = function() {
				// 保存id值，根据id值对应到（存image对象的）数组下标值
				var id = img.getElementsByTagName("img").id;
				// (存储imageId键命变动)
				localStorage.setItem("Click", "two");
				// 点击存储当前image对象的id属性，用于删除指定的图片
				localStorage.setItem("image_id", id);
				// 弹出层或者跳转并将图片放进层中浏览
				showdiv(me_s, img, "", ceng_div_id);
			}
		} else {
			img.onclick = function() {
				// 保存id值，根据id值对应到（存image对象的）数组下标值
				var id = img.getElementsByTagName("img").id;
				// (存储imageId键命变动)
				localStorage.setItem("Click", "three");
				// 点击存储当前image对象的id属性，用于删除指定的图片
				localStorage.setItem("image_id", id);
				// 弹出层或者跳转并将图片放进层中浏览
				showdiv(me_s, img, "", ceng_div_id);
			}
		}

	}

	/**
	 * showdiv 参数一：当前对象 参数二：功能1（若为对象，显示层功能，后面参数不填），功能2（若为“delete”有删除等功能，后面参数必填）
	 * 参数三：当前被点击对象在数组中的下标值 参数四：弹出层div组件的id名
	 */
	function showdiv(me_ss, pictrue, id_positon, div_id) {
		var div_id_s = "#" + div_id;
		var winWidth = window.innerWidth;
		// 取消事件
		if (me_ss == "false") {
			$(div_id_s).css("display", "none");// show的display属性设置为none（隐藏）
			return;
		}
		// 删除事件
		if (pictrue == "delete") {
			var parentNode;
			if (localStorage.getItem("Click") == "one") {
				parentNode = document.getElementById(localStorage.getItem("image_one_id"));
			} else if (localStorage.getItem("Click") == "two") {
				parentNode = document.getElementById(localStorage.getItem("image_two_id"));
			} else {
				parentNode = document.getElementById(localStorage.getItem("image_three_id"));
			}
			// 移除组件(组件对象数组变动)
			if (localStorage.getItem("Click") == "one") {
				parentNode.removeChild(me_ss.array_one_dom[id_positon]);
			} else if (localStorage.getItem("Click") == "two") {
				parentNode.removeChild(me_ss.array_two_dom[id_positon]);
			} else {
				parentNode.removeChild(me_ss.array_three_dom[id_positon]);
			}
			// 移除照片数组的元素(照片数组变动)
			if (localStorage.getItem("Click") == "one") {
				me_ss.array_one.splice(id_positon, 1);
			} else if (localStorage.getItem("Click") == "two") {
				me_ss.array_two.splice(id_positon, 1);
			} else {
				me_ss.array_three.splice(id_positon, 1);
			}
			// 移除组件对象数组的元素(组件对象数组变动)
			if (localStorage.getItem("Click") == "one") {
				me_ss.array_one_dom.splice(id_positon, 1);
			} else if (localStorage.getItem("Click") == "two") {
				me_ss.array_two_dom.splice(id_positon, 1);
			} else {
				me_ss.array_three_dom.splice(id_positon, 1);
			}
			// 重新排版
			var intNum = 0;
			if (localStorage.getItem("Click") == "one") {
				intNum = me_ss.array_one.length;
			} else if (localStorage.getItem("Click") == "two") {
				intNum = me_ss.array_two_dom.length;
			}
			for (var int = id_positon; int < intNum; int++) {
				// 将各组件的src往前推，针对ui组件(组件对象数组、照片数组变动)
				if (localStorage.getItem("Click") == "one") {
					if (me_ss.array_one.length > 0) {
						me_ss.array_one_dom[int].src = me_ss.array_one[int];
					}
				} else if (localStorage.getItem("Click") == "two") {
					if (me_ss.array_two.length > 0) {
						me_ss.array_two_dom[int].src = me_ss.array_two_dom[int];
					}
				} else {
					me_ss.array_three_dom[int].src = me_ss.array_three[int];
				}
				// 将ui组件的id往前推(组件对象数组变动)
				if (localStorage.getItem("Click") == "one") {
					me_ss.array_one_dom[int].getElementsByTagName("img").id = localStorage.getItem("Click") + int;
				} else if (localStorage.getItem("Click") == "two") {
					me_ss.array_two_dom[int].getElementsByTagName("img").id = localStorage.getItem("Click") + int;
				} else {
					me_ss.array_three_dom[int].getElementsByTagName("img").id = localStorage.getItem("Click") + int;
				}
			}
			justep.Util.hint("删除成功！！！", {
				"delay" : normerHintDelay
			});
			$(div_id_s).css("display", "none");// show的display属性设置为none（隐藏）
			return;
		}

		if ($(div_id_s).css("display") == 'none') {// 如果show是隐藏的
			// 设置高度和宽度
			$(div_id_s).css("height") == winWidth;
			document.getElementById(div_id).style.visibility = "visible";
			$(div_id_s).css("display", "block");// show的display属性设置为block（显示）
			// 获取image id
			var iamgeson = me_ss.getElementByXid('imageshow');
			$(iamgeson).attr("src", pictrue.src);
		} else {// 如果show是显示的
			$(div_id_s).css("display", "none");// show的display属性设置为none（隐藏）
		}
	}

	Model.prototype.reflash_blnoClick = function(event) {
		CFSGetBlno(this, localStorage.getItem('working_details_instruction_id'), setBlno);

	};

	function setBlno(me_s) {
		var tidanhao = me_s.comp("tidanhao");
		var get_tidanhao_data = JSON.parse(localStorage.getItem(localStorage.getItem('working_details_instruction_id')));
		tidanhao.loadData(get_tidanhao_data);
	}

	return Model;
});