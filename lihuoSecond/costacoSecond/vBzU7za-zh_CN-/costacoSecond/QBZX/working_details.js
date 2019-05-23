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
		this.uid = "";
		this.ctn_id = "";
		this.ctnno = "";
		this.instruction_id = "";
		this.i = 0;
		this.j = 0;
		fleshAndReLoad = 0;
		this.good_picture = new Array();
		this.dom = new Array();
		this.damage_picture = new Array();
		this.damage_dom = new Array();
		// 选择手否损坏
		this.goods = "";
		this.business = "qbzx";
		this.ajaxTimeOut;
		this.mark = false;
		this.damageimg = "";
		this.qbzx_operationid = "";
		this.isgoodsbadvalue = "";
		this.workingDetailsData = "";
		this.callParent();
		this.isRefresh = true;
	};

	// 获取参数
	Model.prototype.getParameter = function(event) {
		this.uid = localStorage.getItem("userinfoid");
		this.ctn_id = localStorage.getItem("id");
		this.ctnno = localStorage.getItem("ctnno");
		this.instruction_id = localStorage.getItem("instruction_id");
		this.qbzx_operationid = localStorage.getItem("operation_id");
	}

	Model.prototype.modelLoad = function(event) {
		var me = this;
		me.getParameter();
		fleshAndReLoad = 0;
		this.isRefresh = true;
		// this.isgoodsbadvalueCustomRefresh();
		this.isgoodsbadvalue = this.comp('isgoodsbadvalue');
		this.localnameData = this.comp('localnameData');
		this.workingDetailsData = this.comp("workingDetailsData");
		this.getElementByXid("span13").innerText = this.ctnno;
		this.getElementByXid("span1").innerText = this.ctnno;
		/*
		 * document.addEventListener("deviceready", onDeviceReady, false); //
		 * 设备就绪 function onDeviceReady() { me.db =
		 * window.sqlitePlugin.openDatabase({ name : "my.db" });
		 * me.db.transaction(function(tx) { tx.executeSql('DROP TABLE IF EXISTS
		 * operation_level_table'); }); me.db.transaction(function(tx) {
		 * tx.executeSql('DROP TABLE IF EXISTS damage_pic_table'); });
		 * me.db.transaction(function(tx) { tx.executeSql('CREATE TABLE IF NOT
		 * EXISTS operation_level_table (billno varchar(20),operation_id
		 * int(10), level_num int(10),cargo_number int(10),cargo_picture
		 * varchar(255),damage_picture varchar(255),damage_num
		 * int(10),damage_explain varchar(255),transport int(10),ship_id
		 * int(10),location_id int(10),car char(20),remark varchar(255))'); });
		 * me.db.transaction(function(tx) { tx.executeSql('CREATE TABLE IF NOT
		 * EXISTS damage_pic_table (damage_picture varchar(255),operation_id
		 * int(10))'); }); }
		 */
	};

	// 获取提单号
	Model.prototype.isgoodsbadvalueCustomRefresh = function(event) {
		var me = this;
		var isgoodsbad = this.comp("isgoodsbad");
		var isgoodsbadvalue = this.comp('isgoodsbadvalue');
		var instruction_id = localStorage.getItem("instruction_id");
		// var billno = localStorage.getItem("getbillno");
		// isgoodsbad.setValue("orderNo", billno);
		// isgoodsbad.setValue("orderNo", me.getbillno);
		// alert("提单号："+me.getbillno)
		// alert(localStorage.getItem("goods" + instruction_id))
		var data = JSON.parse(localStorage.getItem("goods" + instruction_id));
		if (data != null) {
			isgoodsbadvalue.loadData(data['content']);
			// 自动带入提单号
			if (localStorage.getItem("select1_" + localStorage.getItem('id')) != null) {
				var data25 = JSON.parse(localStorage.getItem("goods" + instruction_id));
				var count = 0;
				for (var int = 0; int < data25['content'].length; int++) {
					if (localStorage.getItem("select1_" + localStorage.getItem('id')) == data25['content'][int]['billno']) {
						count = int + 1;
						break;
					}
				}
				this.getElementByXid("select1")[count].selected = true;
				selectChange(this);
			}
		} else {
			isgoodsbadvalue.clear();
		}

		// alert(localStorage.getItem("goods" + instruction_id))
		// alert(data25['content'][0]['location_id'])
		// alert(data25['content'][0]['billno'])
		// if (data['content'][0]['billno'] == localStorage.getItem("select1_" +
		// localStorage.getItem('id'))) {
		// alert("123")
		// }

		/*
		 * $.ajax({ "type" : "post", "data" : { "instruction_id": instruction_id },
		 * "dataType" : "json", "timeout":5000, "url" :
		 * interface_url+"?c=QbzxOperation&a=billnolist", "success" :
		 * function(data) { if(data['code']==0){
		 * me.isgoodsbadvalue.loadData(data['list']);
		 * isgoodsbad.setValue("orderNo",me.getbillno); }else{
		 * alert(data['msg']+" 提单号获取失败"); } }, "complete" :
		 * function(XMLHttpRequest,status){ if(status == 'timeout' || status ==
		 * 'error'){ var data = JSON.parse(localStorage.getItem("goods" +
		 * instruction_id)); isgoodsbadvalue.loadData(data);
		 * //alert("goods"+instruction_id) //alert("123
		 * "+localStorage.getItem("goods"+instruction_id)) var data =
		 * JSON.parse(localStorage.getItem("goods"+me.instruction_id));
		 * //alert("456 "+data); isgoodsbadvalue.loadData(data['content']);
		 * //isgoodsbad.setValue("orderNo",me.getbillno); //ajaxTimeOut.abort(); } }
		 * });
		 */
	};

	// 显示船名
	Model.prototype.select1Change = function(event) {
		localStorage.setItem("select1_" + localStorage.getItem('id'), event.value);
		selectChange(this);
	};

	// 获取关列表
	Model.prototype.workingDetailsDataCustomRefresh = function(event) {
		var me = this;
		onDeviceReady("QBZX_TABLE");
		if (this.isRefresh) {
			// 判断是否有缓存,如果有就显示缓存，没就拜拜咯
			select_guan_list(me, localStorage.getItem('id'));
		} else {
			// 刷新的时候上传缓存啊，然后显示全部啊
			select_guan_list(me, localStorage.getItem('id'), true);
		}
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
		var uid = localStorage.getItem('userinfoid');
		var lastoperationid = me.workingDetailsData.getLastRow().val("operationid");
		var level_id = me.workingDetailsData.getLastRow().val("id");
		var qbzx_operationid = localStorage.getItem('operation_id');
		// var guan = JSON.parse(localStorage.getItem(qbzx_operationid+"guan"));
		// if(guan == null || guan.length == 0){
		deleteQBZXGuanLast(me, uid, qbzx_operationid, level_id);
	};

	Model.prototype.button6Click = function(event) {
		var qbzx_operationid = localStorage.getItem("qbzx_operationid");
		$("#input8").val(qbzx_operationid);
	};

	// 残损照片提交
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

	/*
	 * Model.prototype.uploadImg = function(imageURI) { var qbzx_operationid =
	 * localStorage.getItem("qbzx_operationid"); var sling_working_details =
	 * localStorage.getItem('sling_working_details'); $.ajax({ "type" : "post",
	 * "async" : false, "data" : {
	 * 
	 * "tp" : "data:image/jpg;base64,"+imageURI, "operationid" :
	 * qbzx_operationid, "sling" : sling_working_details, }, "dataType" :
	 * "json", "url" : interface_url+"?c=index&a=damagecargo",
	 * //PHP数据库校验用户名和密码是否正常 "success" : function(data) {
	 * 
	 * 
	 * alert(data) }, "error" : function() { justep.Util.hint("数据传输失败！",
	 * {"delay" : normerHintDelay,"style" : "color:red;"}); } }); }
	 */

	// 拍摄货照片
	Model.prototype.button8Click = function(event) {
		var me = this;
		if (me.good_picture.length < 1) {
			function onSuccess(imageURI) {
				// 参数一:this
				// 参数二：base64形式的jpg图片
				// 参数三：DIV的ID
				var imageALLURI = "data:image/jpg;base64," + imageURI;
				var divId = "images";
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
				localStorage.setItem("isDamageClick", "true");
				localStorage.setItem("DamegeElementsId", id);
				// 弹出层或者跳转并将图片放进层中浏览
				showdiv(me_s, img);
			}
		} else {
			img.onclick = function() {
				// 保存id值，根据id值对应到（存image对象的）数组下标值
				var id = img.getElementsByTagName("img").id;
				// (存储imageId键命变动)
				localStorage.setItem("isDamageClick", "false");
				localStorage.setItem("ElementsId", id);
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
			$("#show2").css("display", "none");// show的display属性设置为none（隐藏）
			return;
		}
		// 删除事件
		if (pictrue == "delete") {
			var parentNode;
			if (localStorage.getItem("isDamageClick") == "true") {
				parentNode = document.getElementById("damgeimages");
			} else {
				parentNode = document.getElementById("images");
			}
			// 移除组件(组件对象数组变动)
			if (localStorage.getItem("isDamageClick") == "true") {
				parentNode.removeChild(me_ss.damage_dom[id]);
			} else {
				parentNode.removeChild(me_ss.dom[id]);
			}
			// 移除照片数组的元素(照片数组变动)
			if (localStorage.getItem("isDamageClick") == "true") {
				me_ss.damage_picture.splice(id, 1);
			} else {
				me_ss.good_picture.splice(id, 1);
			}
			// 移除组件对象数组的元素(组件对象数组变动)
			if (localStorage.getItem("isDamageClick") == "true") {
				me_ss.damage_dom.splice(id, 1);
			} else {
				me_ss.dom.splice(id, 1);
			}
			var intNum = 0;
			if (localStorage.getItem("isDamageClick") == "true") {
				intNum = me_ss.damage_picture.length;
			} else {
				intNum = me_ss.good_picture.length;
			}
			// 重新排版
			for (var int = id; int < intNum; int++) {
				// 将各组件的src往前推，针对ui组件(组件对象数组、照片数组变动)
				if (localStorage.getItem("isDamageClick") == "true") {
					if (me_ss.damage_picture.length > 0) {
						me_ss.damage_dom[int].src = me_ss.damage_picture[int];
					}
				} else {
					me_ss.dom[int].src = me_ss.good_picture[int];
				}
				// 将ui组件的id往前推(组件对象数组变动)
				if (localStorage.getItem("isDamageClick") == "true") {
					me_ss.damage_dom[int].getElementsByTagName("img").id = "damege" + int;
				} else {
					me_ss.dom[int].getElementsByTagName("img").id = int;
				}
			}
			justep.Util.hint("删除成功！！！", {
				"delay" : normerHintDelay
			});
			$("#show2").css("display", "none");// show的display属性设置为none（隐藏）
			return;
		}

		if ($("#show2").css("display") == 'none') {// 如果show是隐藏的
			// 设置高度和宽度
			$("#show2").css("height") == winWidth;
			document.getElementById("show2").style.visibility = "visible";
			$("#show2").css("display", "block");// show的display属性设置为block（显示）
			// 获取image id
			var iamgeson = me_ss.getElementByXid('imageshow');
			$(iamgeson).attr("src", pictrue.src);
		} else {// 如果show是显示的
			$("#show2").css("display", "none");// show的display属性设置为none（隐藏）
		}
	}

	Model.prototype.button11Click = function(event) {
		showdiv("false");
	};

	Model.prototype.btn_deleteClick = function(event) {
		// alert("组件ID = " + localStorage.getItem("ElementsId"));
		if (localStorage.getItem("isDamageClick") == "true") {
			var stringP = localStorage.getItem("DamegeElementsId").replace("damege", "");
			showdiv(this, "delete", Number(stringP));

		} else {
			showdiv(this, "delete", Number(localStorage.getItem("ElementsId")));
		}
	};

	Model.prototype.uploadgoodsImage = function(imageURI) {
		var isgoodsbad = this.comp('isgoodsbad');
		isgoodsbad.setValue('base64', "data:image/jpg;base64," + imageURI);
		// this.comp('input5').val("data:image/jpg;base64,"+imageURI);
	}

	// 输入完成，下一关按钮
	Model.prototype.button13Click = function(event) {
		var me = this;
		var uid = me.uid;
		var qbzx_operationid = localStorage.getItem("operation_id");
		var isgoodsbad = this.comp('isgoodsbad');
		var isgoodsbadvalue = this.comp('isgoodsbadvalue');

		// 获取提单号
		var orderno = this.getElementByXid('select1').value;
		// 运输方式0：船到箱；1：场到箱；2车到箱
		var transport = isgoodsbad.val('transport');
		// 船舶名、场地、车到箱
		var ship_id = this.getElementByXid('select2').value;
		var localname = this.getElementByXid('select3').value;
		var car = this.getElementByXid('car').value;
		// 获取货物数量
		var cargonumber = this.getElementByXid('input1').value;
		// 货物照片
		var good_pictureToStr = "";
		// 备注
		var remark = this.getElementByXid('beizhu').value;
		// 选择是否残损
		var goods = isgoodsbad.val('goods');
		// 残损件数
		var damageno = this.getElementByXid('input3').value;
		// 残损照片
		var damage_pictureToStr = "";
		// 残损说明
		var damage_remark = this.getElementByXid('remark').value;

		if ($.trim(orderno) == "" || $.trim(orderno) == null) {
			justep.Util.hint("请选择提单号！", {
				"delay" : normerHintDelay,
				"style" : "color:red;"
			});
			return;
		}

		if (transport == "undefined") {
			justep.Util.hint("请选择运输方式！", {
				"delay" : normerHintDelay,
				"style" : "color:red;"
			});
			return;
		} else {
			if (transport == "0") {
				if ($.trim(ship_id) == "" || $.trim(ship_id) == null) {
					justep.Util.hint("请选择船舶！", {
						"delay" : normerHintDelay,
						"style" : "color:red;"
					});
					return;
				} else {
					localname = "";
					car = "";
				}
			}
			if (transport == "1") {
				if ($.trim(localname) == "" || $.trim(localname) == null) {
					justep.Util.hint("请选择场地！", {
						"delay" : normerHintDelay,
						"style" : "color:red;"
					});
					return;
				} else {
					ship_id = "";
					car = "";
				}
			}

			if (transport == "2") {
				if ($.trim(car) == "" || $.trim(car) == null) {
					alert("请输入车牌号！");
					justep.Util.hint("请输入车牌号！", {
						"delay" : normerHintDelay,
						"style" : "color:red;"
					});
					return;
				} else {
					ship_id = "";
					localname = "";
				}
			}

			if ($.trim(cargonumber) == "" || $.trim(cargonumber) == null) {
				justep.Util.hint("请输入货物件数！", {
					"delay" : normerHintDelay,
					"style" : "color:red;"
				});
				return;
			}
			if (me.good_picture.length == 0) {
				justep.Util.hint("请拍摄货物照片！", {
					"delay" : normerHintDelay,
					"style" : "color:red;"
				});
				return;
			} else {
				good_pictureToStr = me.good_picture.join("----------");
			}

			// 判断残损
			if (goods == "1") {
				if ($.trim(damageno) == "" || $.trim(damageno) == null) {
					justep.Util.hint("请输入残损件数！", {
						"delay" : normerHintDelay,
						"style" : "color:red;"
					});
					return;
				}
				if (me.damage_picture.length == 0) {
					justep.Util.hint("请拍摄残损照片！", {
						"delay" : normerHintDelay,
						"style" : "color:red;"
					});
				} else {
					damage_pictureToStr = me.damage_picture.join("----------");
				}
			} else {
				damageno = 0;
			}
		}

		// alert("提单号: " + orderno + "\n运输方式：" + transport + "\n船舶ID：" + ship_id
		// + "\n场地ID：" + localname + "\n车牌号：" + car + "\n货物件数：" + cargonumber +
		// "\n备注：" + remark + "\n残损是否：" + goods + "\n残损件数："
		// + damageno + "\n残损说明：" + damage_remark);

		localStorage.setItem(localStorage.getItem('id') + "level_num", Number(localStorage.getItem(localStorage.getItem('id') + "level_num")) + 1);
		this.getElementByXid("span14").innerText = Number(localStorage.getItem(localStorage.getItem('id') + "level_num")) + 1;
		// 添加关号
		var level_num = 0;
		QBZX_secondSet(localStorage.getItem('id'), orderno, qbzx_operationid, cargonumber, good_pictureToStr, damageno, damage_pictureToStr, remark, transport, damage_remark, ship_id, localname, car,
				"2", localStorage.getItem(localStorage.getItem('id') + "level_num"), true, me);
		Model.prototype.clear(me);
	};

	// 清空录入关的数据
	Model.prototype.clear = function(me) {
		var isgoodsbad = me.comp('isgoodsbad');
		// me.comp('input_damage_picture').val("");
		me.comp('beizhu').val("");
		me.comp('remark').val("");
		me.comp('input1').val("");
		// me.i = 0;
		// me.j = 0;
		reFlashArray(me);
		// me.comp('input5').val("");
		me.comp('input3').val("");
		isgoodsbad.setValue('goods', "0");
	}

	// 完成装箱，跳转页面
	Model.prototype.button14Click = function(event) {
		var ces = Number(localStorage.getItem(localStorage.getItem('id') + "level_num")) + 1;
		if (ces > 1) {
			var me = this;
			this.isRefresh = true;
			justep.Shell.showPage("halfclosedoor");
		} else {
			justep.Util.hint("请先录关！", {
				"delay" : normerHintDelay
			});
		}
	};

	// 拍摄残损照片
	Model.prototype.damage_pictureClick = function(event) {
		var me = this;
		if (me.damage_picture.length < 10) {
			function onSuccess(imageURI) {
				var imageALLURI = "data:image/jpg;base64," + imageURI;
				var divId = "damgeimages";
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

	// 查看关详情
	Model.prototype.button12Click = function(event) {

	};

	// 返回代办界面
	Model.prototype.backClick = function(event) {
		var workingbackBtnFlag = localStorage.getItem('workingbackBtnFlag');
		if (this.mark) {
			this.ajaxTimeOut.abort();
		}
		justep.Shell.showPage("working");
	};

	Model.prototype.button5Click = function(event) {
		var workingbackBtnFlag = localStorage.getItem('workingbackBtnFlag');
		if (this.mark) {
			// alert("stop");
			this.ajaxTimeOut.abort();
		}
		justep.Shell.showPage("working");
	};

	Model.prototype.modelActive = function(event) {
		// this.comp('select2').val("");
		onDeviceReady("QBZX_TABLE");
		// this.isgoodsbadCustomRefresh();
		showdiv("false");
		reFlashArray(this);
		$('#images').empty();
		$('#damgeimages').empty();
		// this.comp('select3').val("");
		this.modelLoad();
		this.isgoodsbadvalueCustomRefresh();
		// this.isgoodsbadvalueCustomRefresh();
		this.workingDetailsDataCustomRefresh();
		this.isRefresh = false;
		this.getElementByXid("span14").innerText = Number(localStorage.getItem(localStorage.getItem('id') + "level_num")) + 1;
		// this.getElementByXid("select1").innerText = "你好";
		// this.getlocalname();
	};

	function reFlashArray(me_s) {
		$('#images').empty();
		$('#damgeimages').empty();
		me_s.good_picture.slice(0, me_s.good_picture.length);
		me_s.dom.slice(0, me_s.dom.length);
		me_s.damage_picture.slice(0, me_s.damage_picture.length);
		me_s.damage_dom.slice(0, me_s.damage_dom.length);
		me_s.good_picture = new Array();
		me_s.dom = new Array();
		me_s.damage_picture = new Array();
		me_s.damage_dom = new Array();
	}
	Model.prototype.isgoodsbadCustomRefresh = function(event) {
		var isgoodsbad = this.comp('isgoodsbad');
		// alert(localStorage.getItem("operation_id"))
		$.ajax({
			"type" : "post",
			"timeout" : 3000,
			"data" : {
				"operation_id" : localStorage.getItem("operation_id")
			},
			"dataType" : "json",
			// http://121.41.22.2/tally/app.php?c=Qbzx&a=getLocationListByBill
			"url" : interface_url + "?c=QbzxOperation&a=getlastlevel", // PHP数据库校验用户名和密码是否正常
			"success" : function(data) {
				// alert(data['content']['billno'])
				isgoodsbad.loadData([ data['content'] ]);
			},
			"error" : function() {

			}
		});
	};
	Model.prototype.reflash_blnoClick = function(event) {
		QBZXGetBlno(this, localStorage.getItem("instruction_id"), setBlno);
	};

	function setBlno(me_s) {
		var isgoodsbadvalue = me_s.comp('isgoodsbadvalue');
		var instruction_id = localStorage.getItem("instruction_id");
		var data = JSON.parse(localStorage.getItem("goods" + instruction_id));
		if (data != null) {
			isgoodsbadvalue.loadData(data['content']);
		}
	}

	return Model;
});
define(function(require) {
	var $ = require("jquery");
	var Model = function() {
		this.callParent();
	};
	Model.prototype.button14Click = function(event) {

	};

	return Model;
});
