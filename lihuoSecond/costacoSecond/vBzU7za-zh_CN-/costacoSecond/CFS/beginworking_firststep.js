define(function(require) {
	require("$UI/costacoSecond/ajax/jquery-1");
	require("$UI/costacoSecond/ajax/db");
	var justep = require("$UI/system/lib/justep");
	require("cordova!com.brodysoft.sqlitePlugin");
	var Model = function() {
		this.callParent();
		this.i = 0;
		this.empty_weight = "";
		this.weight_max = "";
		this.lst = "";
		this.empty_picture_to_str = "";
		this.array_one = new Array();
		this.array_one_dom = new Array();

	};

	Model.prototype.modelLoad = function(event) {
	};

	Model.prototype.backBtnClick = function(event) {
		// justep.Shell.closePage();
		justep.Shell.showPage("working_cfs");
	};

	Model.prototype.nextClick = function(event) {
		var me = this;
		var ctndetails_ID = localStorage.getItem('ctndetails_ID');
		var uid = localStorage.getItem('userinfoid');
		me.empty_weight = this.getElementByXid('input_empty_weight').value;
		// me.weight_max = this.getElementByXid('input_weight_max').value;
		// me.lst = this.getElementByXid('select1').value;
		if (me.empty_weight == "" || me.empty_weight == null) {
			justep.Util.hint("请输入空箱重量！", {
				"delay" : normerHintDelay,
				"style" : "color:red;"
			});
			return;
		}

		if (me.array_one.length == 0) {
			justep.Util.hint("请拍摄空箱照片！", {
				"delay" : normerHintDelay,
				"style" : "color:red;"
			});
			return;
		} else {
			me.empty_picture_to_str = me.array_one.join("----------");
		}

		me.messageDialog1Yes();
	};

	Model.prototype.messageDialog1Yes = function(event) {
		var me = this;
		// 将数组转化为字符串，通过特定的符号来连接
		CFS_firstSet(localStorage.getItem('ctndetails_ID'), me.empty_weight, 0, "", me.empty_picture_to_str, "1");
		justep.Shell.showPage("working_details_cfs");
	};

	Model.prototype.empty_pictureClick = function(event) {
		var me = this;
		if (me.array_one.length < 10) {
			function onSuccess(imageURI) {
				// 参数一:this
				// 参数二：base64形式的jpg图片
				// 参数三：DIV的ID
				// 参数四:区别同一个界面都多处拍照
				// 参数五：弹出层div的id
				var imageALLURI = "data:image/jpg;base64," + imageURI;
				var divId = localStorage.getItem("image_one_id");
				// 弹出层div的id,先保存到本地,键名定死,为删除服务
				localStorage.setItem("ceng_div_id", "show31");
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
			justep.Util.hint("不能超过十张！", {
				"delay" : normerHintDelay,
				"style" : "color:red;"
			});
		}

	};
	Model.prototype.modelActive = function(event) {
		onDeviceReady("CFS_TABLE");
		this.comp('input_empty_weight').val("");
		reflasArray(this);
	};

	function reflasArray(me) {
		$('#images31').empty();
		// 显示小照片的层div
		localStorage.setItem("image_one_id", "images31");
		localStorage.setItem("image_two_id", "images32");
		localStorage.setItem("image_three_id", "images33");
		me.array_one.length = 0;
		me.array_one_dom.length = 0;
		me.array_one = new Array();
		me.array_one_dom = new Array();
	}

	// Model.prototype.button1Click = function(event) {
	// this.db.deleteTable("CFS_TABLE");
	// };

	Model.prototype.laborServiceTeamCustomRefresh = function(event) {
		var laborServiceTeam = this.comp("laborServiceTeam");
		laborServiceTeam.loadData(JSON.parse(localStorage.getItem("LST")));
	};

	document.addEventListener("deviceready", function() {
		var exitAppTicker = 0;
		var listener = function() {
			justep.Shell.closePage();
		};
		document.addEventListener('backbutton', listener, false);
		$(window).on('beforeunload', function() {
			document.removeEventListener('backbutton', listener, false);
		});
	}, false);

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

	return Model;
});