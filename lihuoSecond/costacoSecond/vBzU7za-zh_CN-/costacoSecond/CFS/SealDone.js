define(function(require) {
	require("$UI/costacoSecond/ajax/jquery-1");
	require("$UI/costacoSecond/ajax/db");
	var justep = require("$UI/system/lib/justep");
	var Model = function() {
		this.callParent();
		this.cargoweight = "";
		this.array_one = new Array();
		this.array_one_dom = new Array();
	};
	// 返回按钮
	Model.prototype.backbtn = function(event) {
		justep.Shell.showPage("working_cfs");
	};

	// 提交
	Model.prototype.submitbtn = function(event) {

		var me = this;
		var ctndetails_ID = localStorage.getItem('ctndetails_ID');// 箱ID
		var uid = localStorage.getItem('userinfoid');
		// 货物重量
		me.cargoweight = this.getElementByXid('input1').value;
		// 全关门照片
		// var twodoor = me.array_one[0];

		if ($.trim(me.cargoweight) == "" || $.trim(me.cargoweight) == null) {

			justep.Util.hint("请输入货物重量！", {
				"delay" : normerHintDelay,
				"style" : "color:red;"
			});
			return;
		} else {
			if (me.array_one.length == 0) {
				justep.Util.hint("请拍摄全关门照片照片！", {
					"delay" : normerHintDelay,
					"style" : "color:red;"
				});
				return;
			}

		}
		me.comp("messageDialog").show({
			"title" : "温馨提示",
			"message" : "是否铅封？"
		});

	};

	Model.prototype.twodoorImgClick = function(event) {

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
				localStorage.setItem("ceng_div_id", "show34");
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
			justep.Util.hint("已经拍摄！！！", {
				"delay" : normerHintDelay
			});
		}
	};

	// 获取箱详情
	Model.prototype.boxDetailsCustomRefresh = function(event) {
		var me = this;
		var boxDetails = this.comp('boxDetails');
		var ctndetails_ID = localStorage.getItem('ctndetails_ID');// 箱ID

		$.ajax({
			"type" : "post",
			"async" : false,
			"data" : {

				// "tp" : "data:image/jpg;base64,"+imageURI,
				"ctn_id" : ctndetails_ID,

			},
			"dataType" : "json",
			// http://192.168.1.91/xztally/app.php?c=CfsOperation&a=getContainerDetail
			"url" : interface_url + "?c=CfsOperation&a=getContainerDetail", // PHP数据库校验用户名和密码是否正常
			"success" : function(data) {

				if (data['code'] == 0) {
					var sealno = data['content']['sealno'];
					boxDetails.loadData([ data['content'] ]);
				} else {
					justep.Util.hint(data['msg'], {
						"delay" : normerHintDelay
					});
				}
			},
			"error" : function() {
				// justep.Util.hint("数据传输失败！", {"delay" :
				// normerHintDelay,"style" : "color:red;"});
			}

		});
	};

	Model.prototype.messageDialogYes = function(event) {
		var me = this;
		var flag = 0;
		localStorage.setItem('flagQF', flag);
		localStorage.setItem(localStorage.getItem('ctndetails_ID') + "level_num", 0);
		CFS_SealDoneSet(localStorage.getItem('ctndetails_ID'), me.array_one[0], me.cargoweight, "4");
		justep.Shell.showPage("forecastQF_cfs");
	};

	Model.prototype.messageDialogNo = function(event) {
		// justep.Shell.showPage("working_cfs");
	};

	Model.prototype.modelActive = function(event) {
		reflasArray(this);
		this.comp('input1').val("");
		this.twodoor = "";

	};

	function reflasArray(me) {
	onDeviceReady("CFS_TABLE");
		$('#images34_1').empty();
		// 显示小照片的层div
		localStorage.setItem("image_one_id", "images34_1");
		// localStorage.setItem("image_two_id", "images32");
		// localStorage.setItem("image_three_id", "images33");
		me.array_one.length = 0;
		me.array_one_dom.length = 0;
		me.array_one = new Array();
		me.array_one_dom = new Array();
	}

	Model.prototype.modelLoad = function(event) {
	};

	Model.prototype.messageDialog1Yes = function(event) {
		// 删除办关门、全关门缓存信息
		var status = "3";
		deleteRow_backGuan(localStorage.getItem('ctndetails_ID'), status, delete_success);
		function delete_success() {
			// 修改状态表
			insert_status(localStorage.getItem('ctndetails_ID'), "2", true, isBackGuan);
			function isBackGuan() {
				justep.Shell.showPage("working_details_cfs");
				// justep.Shell.closePage();
			}
		}
	};

	Model.prototype.btn_back_guanClick = function(event) {
		var me = this;
		me.comp("messageDialog1").show({
			"title" : "温馨提示",
			"message" : "是否返回关列表？返回后半关门数据需要重新录入"
		});
	};

	Model.prototype.messageDialog5Yes = function(event) {
		var me = this;
		// 调用允许超重请求
		$.ajax({
			"type" : "post",
			"async" : false,
			"data" : {
				"ctn_id" : localStorage.getItem('ctndetails_ID')
			},
			"dataType" : dataType,
			"url" : interface_url + "?c=CfsOperation&a=overweight",
			"success" : function(data) {
				if (data['code'] == 0) {
					if (data['overweight'] == "Y") {

						justep.Util.hint("请求成功,允许超重!", {
							'delay' : 3000
						});

						me.comp("messageDialog").show({
							"title" : "温馨提示",
							"message" : "是否铅封？"
						});
					} else {
						justep.Util.hint("不允许超重，请联系管理员！", {
							"delay" : normerHintDelay,
							"style" : "color:red;"
						});
					}
				} else {
					justep.Util.hint("请求失败: " + data['msg'], {
						"delay" : normerHintDelay,
						"style" : "color:red;"
					});
				}
			},
			"error" : function() {
				justep.Util.hint("数据传输失败！", {
					"delay" : normerHintDelay,
					"style" : "color:red;"
				});

			}
		});
	};

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