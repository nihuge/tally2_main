define(function(require) {
	require("$UI/costacoSecond/ajax/jquery-1");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.uid = "";
		this.ctn_id = "";
		this.cargoweight = "";
		this.sealno = "";
		this.sealImg = "";
		this.remark = "";
		this.callParent();
		this.seal_picture = new Array();
		this.dom = new Array();
	};

	Model.prototype.backBtnClick = function(event) {
		window.location.href = "working.w"
	};

	Model.prototype.button1Click = function(event) {
		var sealno = this.getElementByXid("input1").value;
		var uid = localStorage.getItem('userinfoid');
		var qbzx_operationid = localStorage.getItem("qbzx_operationid");
		// alert(uid+qbzx_operationid+"ssssssss"+sealno);
		if ($.trim(sealno) === "") {
			alert("请输入铅封号");
		} else {
			$.ajax({
				"type" : "post",
				"async" : false,
				"data" : {
					"uid" : uid,
					"oid" : qbzx_operationid,
					"sealno" : sealno,
				},
				"dataType" : "json",
				// http://192.168.1.91/xztally/index.php/index/damagecargo
				"url" : interface_url + "?c=qbzx&a=workorder", // PHP数据库校验用户名和密码是否正常
				"success" : function(data) {
					alert("ok");
				},
				"error" : function() {
					justep.Util.hint("数据传输失败！", {
						"delay" : normerHintDelay,
						"style" : "color:red;"
					});
				}
			});
		}
	};

	// 拍摄铅封照片
	Model.prototype.button22Click = function(event) {
		var me = this;
		if (me.seal_picture.length < 1) {
			function onSuccess(imageURI) {
				// 参数一:this
				// 参数二：base64形式的jpg图片
				// 参数三：DIV的ID
				var imageALLURI = "data:image/jpg;base64," + imageURI;
				var divId = "images5";
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
		showdiv(this, "delete", Number(localStorage.getItem("ElementsId5")));
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
		me_s.seal_picture.push(imageURI_s);
		// 动态生成组件
		var img = document.createElement(imageCreateDId);
		// 设置id
		var imgsetID = img.getElementsByTagName(imageCreateDId);
		// （照片数组变动）
		imgsetID.id = me_s.seal_picture.length - 1;
		// 拼接css样式Text
		var imageCss = "width: 50px; height: 50px; margin-left: 5px;";
		// 设置css样式
		img.style.cssText = imageCss;
		// 设置src属性（照片数组、数组长度变动）
		img.src = me_s.seal_picture[me_s.seal_picture.length - 1];
		// 将设置好的组件放进div中
		parentNode.appendChild(img);
		// 将该对象加入到数组中来,为删除后重新排版服务
		me_s.dom.push(img);
		// image设置监听事件
		img.onclick = function() {
			// 保存id值，根据id值对应到（存image对象的）数组下标值
			var id = img.getElementsByTagName("img").id;
			// (存储imageId键命变动)
			localStorage.setItem("ElementsId5", id);
			// 弹出层或者跳转并将图片放进层中浏览
			showdiv(me_s, img);
		}

	}

	// 层的显示个隐藏
	function showdiv(me_ss, pictrue, id) {
		var winWidth = window.innerWidth;
		// 取消事件
		if (me_ss == "false") {
			$("#show5").css("display", "none");// show的display属性设置为none（隐藏）
			return;
		}
		// 删除事件
		if (pictrue == "delete") {
			var parentNode;
			parentNode = document.getElementById("images5");
			// 移除组件(组件对象数组变动)
			parentNode.removeChild(me_ss.dom[id]);
			// 移除照片数组的元素(照片数组变动)
			me_ss.seal_picture.splice(id, 1);
			// 移除组件对象数组的元素(组件对象数组变动)
			me_ss.dom.splice(id, 1);
			// 重新排版
			for (var int = id; int < me_ss.seal_picture.length; int++) {
				// 将各组件的src往前推，针对ui组件(组件对象数组、照片数组变动)
				me_ss.dom[int].src = me_ss.seal_picture[int];
				// 将ui组件的id往前推(组件对象数组变动)
				me_ss.dom[int].getElementsByTagName("img").id = int;
			}
			justep.Util.hint("删除成功！！！", {
				"delay" : normerHintDelay
			});
			$("#show5").css("display", "none");// show的display属性设置为none（隐藏）
			return;
		}

		if ($("#show5").css("display") == 'none') {// 如果show是隐藏的
			// 设置高度和宽度
			$("#show5").css("height") == winWidth;
			document.getElementById("show5").style.visibility = "visible";
			$("#show5").css("display", "block");// show的display属性设置为block（显示）
			// 获取image id
			var iamgeson = me_ss.getElementByXid('imageshow');
			$(iamgeson).attr("src", pictrue.src);
		} else {// 如果show是显示的
			$("#show5").css("display", "none");// show的display属性设置为none（隐藏）
		}
	}

	Model.prototype.uploadsealImage = function(imageURI) {
		this.sealImg = "data:image/jpg;base64," + imageURI;
		this.comp('input8').val("已拍");
		// var Donebox = this.comp('Donebox');
		// Donebox.setValue('sealImg', "data:image/jpg;base64," + imageURI);
	}

	// 铅封，跳转到代办列表
	Model.prototype.okClick = function(event) {
		this.UpDataQF(false);
	};

	Model.prototype.UpDataQF = function(isZBQF) {
		var me = this;
		if (isZBQF) {
			localStorage.setItem("isStop" + localStorage.getItem('id'), isZBQF);
		} else {
			localStorage.setItem("isStop" + localStorage.getItem('id'), isZBQF);
		}
		// alert(localStorage.getItem("isStop" + localStorage.getItem('id')));

		var uid = localStorage.getItem('userinfoid');
		var ctn_id = localStorage.getItem('id');// 箱ID
		var Donebox = this.comp('Donebox');
		// 货物重量
		me.cargoweight = this.getElementByXid('input1').value;
		// 铅封号
		me.sealno = this.getElementByXid("input4").value;
		// 铅封照片
		me.sealImg = me.seal_picture[0];
		// 批注
		me.remark = this.getElementByXid('textarea').value;

		if ($.trim(me.cargoweight) == "" || Number($.trim(me.cargoweight)) <= 0) {

			justep.Util.hint("请输入重量!", {
				"delay" : normerHintDelay,
				"style" : "color:red;"
			});
			return;
		} else {
			if (isZBQF) {
				// 暂不铅封可选
			} else {
				if ($.trim(me.sealno) == "") {

					justep.Util.hint("请输入铅封号", {
						"delay" : normerHintDelay,
						"style" : "color:red;"
					});
					return;
				}
			}

			if (isZBQF) {
				// 暂不铅封可选
			} else {
				if ($.trim(me.sealImg) == "" || me.seal_picture.length == 0) {

					justep.Util.hint("请拍摄铅封照片", {
						"delay" : normerHintDelay,
						"style" : "color:red;"
					});
					return;
				}
			}

			// if (Number(me.cargoweight) >
			// Number(localStorage.getItem('empty_weight_max' + ctn_id))) {
			// // 跳出选择对话框
			// me.comp("messageDialog1").show({
			// "title" : "温馨提示",
			// "message" : "CZ"
			// });
			// return;
			// }
		}

		me.messageDialog3Yes();

		// if (isZBQF) {
		//			
		// } else {
		// me.messageDialog3Yes();
		// // me.comp("messageDialog3").show({
		// // "title" : "温馨提示",
		// // "message" : "是否拍摄补充照片？"
		// // });
		// }

	}

	Model.prototype.messageDialog3Yes = function(event) {
		var me = this;
		// alert("货物重量：" + me.cargoweight + "\n铅封号：" + me.sealno + "\n批注：：" +
		// me.remark + "\n铅照片：" + me.sealImg);
		// return;
		// 铅封，暂时不铅封多一个参数
		QBZX_forecastQFSet(localStorage.getItem('id'), me.remark, me.sealno, me.sealImg, me.cargoweight, "5");
		localStorage.setItem(localStorage.getItem('id') + "level_num", 0);
		// if (localStorage.getItem("isStop" + localStorage.getItem('id')) ==
		// "true") {
		// 
		// } else {
		// justep.Shell.showPage("supplementary");
		// }
		// justep.Shell.closePage();
		justep.Shell.showPage("working");
	};

	// 预定铅封
	Model.prototype.yudingClick = function(event) {
		var me = this;
		var cargoweight = this.getElementByXid('input1').value;
		var Donebox = this.comp('Donebox');
		var sealno = Donebox.val('sealno');
		if ($.trim(sealno) === "" || $.trim(cargoweight) === "") {

			justep.Util.hint("请输入铅封号和货物重量！", {
				"delay" : normerHintDelay,
				"style" : "color:red;"
			});
		} else {
			$.ajax({
				"type" : "post",
				"async" : false,
				"data" : {
					"uid" : me.uid,
					"ctn_id" : me.ctn_id,
					"sealno" : sealno,
					"cargo_weight" : cargoweight
				},
				"dataType" : "json",
				// http://192.168.1.91/xztally/index.php/qbzx/workorder?uid=1&oid=281&sealno=
				"url" : interface_url + "?c=QbzxOperation&a=reservation",
				"success" : function(data) {
					if (data['code'] == 0) {
						justep.Util.hint("预定铅封成功！");
						justep.Shell.closePage();
					} else {
						justep.Util.hint(data['msg'], {
							"delay" : normerHintDelay
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
		}
	};

	// 暂不铅封
	Model.prototype.noqianfenClick = function(event) {
		var qbzx_operationid = localStorage.getItem("qbzx_operationid");
		var cargoweight = this.getElementByXid('input1').value;
		if ($.trim(cargoweight) === "") {

			justep.Util.hint("请输入货物重量！", {
				"delay" : normerHintDelay,
				"style" : "color:red;"
			});
			return;
		}
		$.ajax({
			"type" : "post",
			"async" : false,
			"data" : {

				// "tp" : "data:image/jpg;base64,"+imageURI,
				"oid" : qbzx_operationid,
				"cargoweight" : cargoweight
			},
			"dataType" : "json",
			// http://192.168.1.91/xztally/index.php/index/damagecargo
			"url" : interface_url + "?c=qbzx&a=workwait", // PHP数据库校验用户名和密码是否正常
			"success" : function(data) {
				window.location.href = "working.w"
			},
			"error" : function() {
				justep.Util.hint("数据传输失败！", {
					"delay" : normerHintDelay,
					"style" : "color:red;"
				});
			}
		});
	};

	// 页面初始化赋值
	Model.prototype.modelLoad = function(event) {
		var isgoodsbad = this.comp('isgoodsbad');
		// 获取默认选中选项
		var flag = localStorage.getItem('flagQF');
		var sealno = localStorage.getItem('sealno');
		var cargoweight = localStorage.getItem('cargo_weight');
		this.uid = localStorage.getItem('userinfoid');
		this.ctn_id = localStorage.getItem('id');
		// this.comp('input1').val(cargoweight);
		isgoodsbad.setValue("isdone", flag);
		if ($.trim(sealno) === "") {
			this.comp('input4').set({
				"disabled" : false
			});
		} else {
			this.comp('input6').val(sealno);
		}
	};

	// 返回进行中界面
	Model.prototype.button5Click = function(event) {
		justep.Shell.closePage();
		justep.Shell.showPage("working");
	};

	Model.prototype.modelActive = function(event) {
		onDeviceReady("QBZX_TABLE");
		$('#images5').empty();
		this.dom.length = 0;
		this.dom = new Array();
		this.seal_picture.length = 0;
		this.seal_picture = new Array();
		var Donebox = this.comp('Donebox');
		this.comp("input1").val("");
		this.comp("input4").val("");
		this.comp("textarea").val("");
		Donebox.setValue('sealno', '');
		Donebox.setValue('sealImg', '');
		this.modelLoad();
	};

	Model.prototype.btn_back_guanClick = function(event) {
		var me = this;
		me.comp("messageDialog2").show({
			"title" : "温馨提示",
			"message" : "是否返回关列表？返回后半关门、全关门数据需要重新录入"
		});
	};
	Model.prototype.messageDialog2Yes = function(event) {
		var me = this;
		var status = "3,4";
		// 删除办关门、全关门缓存信息
		deleteRow_backGuan(localStorage.getItem('id'), status, delete_success);
		function delete_success() {
			// 修改状态表
			insert_status(localStorage.getItem('id'), "2", true, isBackGuan);
			function isBackGuan() {
				justep.Shell.showPage("working_details");
				// justep.Shell.closePage();
			}
		}
	};

	Model.prototype.messageDialog1Yes = function(event) {
		var me = this;
		// 调用允许超重请求
		$.ajax({
			"type" : "post",
			"async" : false,
			"data" : {
				"ctn_id" : localStorage.getItem('id')
			},
			"dataType" : dataType,
			"url" : interface_url + "?c=QbzxOperation&a=overweight",
			"success" : function(data) {
				if (data['code'] == 0) {
					if (data['overweight'] == "Y") {
						justep.Util.hint("请求成功,允许超重!", {
							'delay' : 3000
						});
						if (localStorage.getItem("isStop" + localStorage.getItem('id'))) {
							me.messageDialog3Yes();
						} else {
							me.comp("messageDialog3").show({
								"title" : "温馨提示",
								"message" : "是否拍摄补充照片？"
							});
						}
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

	}

	Model.prototype.button12Click = function(event) {
		var me = this;
		me.UpDataQF(true);
	};

	return Model;
});