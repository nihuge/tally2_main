define(function(require) {
	require("$UI/costacoSecond/ajax/jquery-1");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		// 整箱照
		this.cargo_picture = new Array();
		this.dom = new Array();
		this.ctndetails_ID = "";
		this.get_ctn_id = "";
		this.callParent();
		this.step = "";

	};

	Model.prototype.submitClick = function(event) {
		var me = this;
		var ctndetails_ID = localStorage.getItem('ctndetails_ID');
		var uid = localStorage.getItem('userinfoid');
		var cargoPicture = "";
		if (me.cargo_picture.length != 0) {
			cargoPicture = me.cargo_picture[0];
		}

		if (localStorage.getItem('isMust_' + ctndetails_ID) == "Y") {
			// 重点箱判断各项值是否为空
			if (me.cargo_picture.length == 0) {
				justep.Util.hint("请拍摄开箱照片", {
					"delay" : normerHintDelay,
					"style" : "color:red;"
				});
				return;
			}
		}

		MtoM_open_door(ctndetails_ID, cargoPicture, "2");

		justep.Shell.showPage("working_details_dd");

	};

	// 拿到第一条缓存数据
	Model.prototype.getFirstData = function(getData) {
		this.db.transaction(function(tx) {
			tx.executeSql("select * from operation_table", [], function(tx, res) {
				if (res.rows.length > 0) {
					var get_ctn_id = res.rows.item(0).ctn_id;
					var step = res.rows.item(0).step;
					var id = res.rows.item(0).id;
					getData(id, get_ctn_id, step, res.rows.item(0).operation_data);
				}
			});
		}, function(e) {
			alert("ERROR: " + e.message);
		});
	};

	// 上传缓存的照片
	Model.prototype.upCacheData = function(me_s) {
		var uid = localStorage.getItem('userinfoid');
		me_s.getFirstData(getData);
		function getData(id, ctn_id, step, data) {
			if (step == 1) {
				var oid = localStorage.getItem("working_details_oid");
				var obj = JSON.parse(data);
				var get_damage_remark = obj['damage_remark'];
				var get_true_sealno = obj['true_sealno'];
				var get_door_picture = obj['door_picture'];
				var get_seal_picture = obj['seal_picture'];
				var get_damage_img = obj['damage_img'];
				var arry = new Array();
				if (get_damage_img != "") {
					var arry = get_damage_img.split("----------");
				}
				$.ajax({
					"type" : "post",
					"timeout" : 5000,
					"async" : true,
					"data" : {
						"uid" : uid,
						"ctn_id" : ctn_id,
						"operation_id" : oid,
						"damage_remark" : get_damage_remark,
						"true_sealno" : get_true_sealno,
						"door_picture" : get_door_picture,
						"seal_picture" : get_seal_picture,
						"damage_img" : get_damage_img,
					},
					"dataType" : dataType,
					"url" : interface_url + "?c=DdOperation&a=OperationCheck", // PHP数据库校验用户名和密码是否正常
					"success" : function(data) {
						if (PrintReturnValue) {
							alert(data);
							return;
						}
						if (data['code'] == 0) {
							me_s.db.transaction(function(tx) {
								tx.executeSql("delete from operation_table where step =" + 1 + " AND id=" + id);
							});
							me_s.db.transaction(function(tx) {
								tx.executeSql("select * from operation_table", [], function(tx, res) {
									if (res.rows.length > 0) {
										me_s.getFirstData(getData, me_s);
									}
								});
							}, function(e) {
								alert("ERROR: " + e.message);
							});
						} else {
							alert(data['msg'] + "  没有上传");
						}
					},
					"complete" : function(XMLHttpRequest, status) {
						if (status == 'timeout' || status == 'error') {
							justep.Shell.showPage("working_details_dd");
						}
					}
				});
			} else if (step == 2) {
				var obj = JSON.parse(data);
				var get_cargo_picture = obj['cargo_picture'];
				$.ajax({
					"type" : "post",
					"timeout" : 5000,
					"async" : true,
					"data" : {
						"uid" : uid,
						"ctn_id" : ctn_id,
						"cargo_picture" : get_cargo_picture,
					},
					"dataType" : "json",
					"url" : interface_url + "?c=DdOperation&a=OpenDoor", // PHP数据库校验用户名和密码是否正常
					"success" : function(data) {
						if (PrintReturnValue) {
							alert(data);
							return;
						}
						if (data['code'] == 0) {
							me_s.db.transaction(function(tx) {
								tx.executeSql("delete from operation_table where step =" + 2 + " AND id=" + id);
							});
							me_s.db.transaction(function(tx) {
								tx.executeSql("select * from operation_table", [], function(tx, res) {
									if (res.rows.length > 0) {
										me_s.getFirstData(getData, me_s);
									}
								});
							}, function(e) {
								alert("ERROR: " + e.message);
							});
							justep.Shell.showPage("working_details_dd");
						} else {
							justep.Util.hint(data['msg'], {
								"delay" : normerHintDelay
							});
						}
					},
					"complete" : function(XMLHttpRequest, status) {
						if (status == 'timeout' || status == 'error') {
							justep.Shell.showPage("working_details_dd");
						}
					}
				});
			} else if (step == 3) {
				var obj = JSON.parse(data);
				var get_oid = obj['operation_id'];
				var get_level_num = obj['level_num'];
				var get_num = obj['num'];
				var get_damage_num = obj['damage_num'];
				var get_damage_img = obj['damage_img'];
				var arry3 = new Array();
				if (get_damage_img != "") {
					arry3 = get_damage_img.split("----------");
				}
				$.ajax({
					"type" : "post",
					"timeout" : 5000,
					"async" : true,
					"data" : {
						"operation_id" : get_oid,
						"level_num" : get_level_num,
						"num" : get_num,
						"damage_num" : get_damage_num,
						"damage_img" : arry3
					},
					"dataType" : dataType,
					"url" : interface_url + "?c=DdOperation&a=OperationLevel",
					"success" : function(data) {
						if (PrintReturnValue) {
							alert(data);
							return;
						}
						if (data['code'] == 0) {
							me_s.db.transaction(function(tx) {
								tx.executeSql("delete from operation_table where step =" + 3 + " AND id=" + id);
							});
							me_s.db.transaction(function(tx) {
								tx.executeSql("select * from operation_table", [], function(tx, res) {
									if (res.rows.length > 0) {
										me_s.getFirstData(getData, me_s);
									}
								});
							}, function(e) {
								alert("ERROR: " + e.message);
							});
						} else if (data['code'] == 1003) {
							me.db.transaction(function(tx) {
								tx.executeSql("delete from operation_table where step =" + 3 + " AND id=" + id);
							});
						} else {
							justep.Util.hint(data['msg'], {
								"delay" : normerHintDelay
							});
						}
					},
					"complete" : function(XMLHttpRequest, status) {
						if (status == 'timeout' || status == 'error') {
							justep.Shell.showPage("working_details_dd");
						}
					}
				});
			} else if (step == 4) {
				var obj = JSON.parse(data);
				var get_empty_picture = obj['empty_picture'];
				var get_damage_after_remark = obj['damage_after_remark'];
				var get_damage_after_img = obj['damage_after_img'];
				var get_remark = obj['remark'];
				var arry4 = new Array();
				if (get_damage_after_img != "") {
					var arry4 = get_damage_after_img.split("----------");
				}
				$.ajax({
					"type" : "post",
					"timeout" : 5000,
					"async" : true,
					"data" : {
						"uid" : uid,
						"ctn_id" : ctn_id,
						"empty_picture" : get_empty_picture,
						"damage_after_remark" : get_damage_after_remark,
						"damage_after_img" : arry4,
						"remark" : get_remark
					},
					"dataType" : dataType,
					"url" : interface_url + "?c=DdOperation&a=operationFinish",
					"success" : function(data) {
						if (PrintReturnValue) {
							alert(data);
							return;
						}
						if (data['code'] == 0) {
							me_s.db.transaction(function(tx) {
								tx.executeSql("delete from operation_table where step =" + 4 + " AND id=" + id);
							});
							me_s.db.transaction(function(tx) {
								tx.executeSql("select * from operation_table", [], function(tx, res) {
									if (res.rows.length > 0) {
										me_s.getFirstData(getData, me_s);
									}
								});
							}, function(e) {
								alert("ERROR: " + e.message);
							});
						} else {
							justep.Util.hint(data['msg'], {
								"delay" : normerHintDelay
							});
						}
					},
					"complete" : function(XMLHttpRequest, status) {
						if (status == 'timeout' || status == 'error') {
							justep.Shell.showPage("working_details_dd");
						}
					}
				});
			}
		}
	}

	// 缓存数据
	Model.prototype.cache = function(cache_upCacheData, me_s) {
		var operation_data = "{\"cargo_picture\":\"" + me_s.cargo_picture + "\"}";
		me_s.db.transaction(function(tx) {
			tx.executeSql("INSERT INTO operation_table (ctn_id,step,operation_data) VALUES (?,?,?)", [ me_s.ctndetails_ID, 2, operation_data ], function(tx, res) {
				cache_upCacheData(me_s);
			}, function(e) {
				alert("ERROR: " + e.message);
			});
		});
	};

	// 修改步骤
	Model.prototype.operation_step = function(event) {
		var me = this;
		this.db.transaction(function(tx) {
			tx.executeSql("select ctn_id,operation_step from step_table where ctn_id =" + me.ctndetails_ID, [], function(tx, res) {
				tx.executeSql("update step_table set operation_step = 2 where ctn_id =" + me.ctndetails_ID, [], function(tx, res) {
				}, function(e) {
					alert("ERROR: " + e.message);
				});
			});
		}, function(e) {
			alert("ERROR: " + e.message);
		});
	}

	Model.prototype.button_cargo_pictureClick = function(event) {
		var me = this;
		if (me.cargo_picture.length < 1) {
			function onSuccess(imageURI) {
				// me.comp('input_cargo_picture').val("拍照成功！");
				// me.cargo_picture = "data:image/jpg;base64," + imageURI;
				// 参数一:this
				// 参数二：base64形式的jpg图片
				// 参数三：DIV的ID
				var imageALLURI = "data:image/jpg;base64," + imageURI;
				var divId = "images12";
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
		showdiv(this, "delete", Number(localStorage.getItem("ElementsId12")));
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
		me_s.cargo_picture.push(imageURI_s);
		// 动态生成组件
		var img = document.createElement(imageCreateDId);
		// 设置id
		var imgsetID = img.getElementsByTagName(imageCreateDId);
		// （照片数组变动）
		imgsetID.id = me_s.cargo_picture.length - 1;
		// 拼接css样式Text
		var imageCss = "width: 50px; height: 50px; margin-left: 5px;";
		// 设置css样式
		img.style.cssText = imageCss;
		// 设置src属性（照片数组、数组长度变动）
		img.src = me_s.cargo_picture[me_s.cargo_picture.length - 1];
		// 将设置好的组件放进div中
		parentNode.appendChild(img);
		// 将该对象加入到数组中来,为删除后重新排版服务
		me_s.dom.push(img);
		// image设置监听事件
		img.onclick = function() {
			// 保存id值，根据id值对应到（存image对象的）数组下标值
			var id = img.getElementsByTagName("img").id;
			// (存储imageId键命变动)
			localStorage.setItem("ElementsId12", id);
			// 弹出层或者跳转并将图片放进层中浏览
			showdiv(me_s, img);
		}

	}

	// 层的显示个隐藏
	function showdiv(me_ss, pictrue, id) {
		var winWidth = window.innerWidth;
		// 取消事件
		if (me_ss == "false") {
			$("#show12").css("display", "none");// show的display属性设置为none（隐藏）
			return;
		}
		// 删除事件
		if (pictrue == "delete") {
			var parentNode;
			parentNode = document.getElementById("images12");
			// 移除组件(组件对象数组变动)
			parentNode.removeChild(me_ss.dom[id]);
			// 移除照片数组的元素(照片数组变动)
			me_ss.cargo_picture.splice(id, 1);
			// 移除组件对象数组的元素(组件对象数组变动)
			me_ss.dom.splice(id, 1);
			// 重新排版
			for (var int = id; int < me_ss.cargo_picture.length; int++) {
				// 将各组件的src往前推，针对ui组件(组件对象数组、照片数组变动)
				me_ss.dom[int].src = me_ss.cargo_picture[int];
				// 将ui组件的id往前推(组件对象数组变动)
				me_ss.dom[int].getElementsByTagName("img").id = int;
			}
			justep.Util.hint("删除成功！！！", {
				"delay" : normerHintDelay
			});
			$("#show12").css("display", "none");// show的display属性设置为none（隐藏）
			return;
		}

		if ($("#show12").css("display") == 'none') {// 如果show是隐藏的
			// 设置高度和宽度
			$("#show12").css("height") == winWidth;
			document.getElementById("show12").style.visibility = "visible";
			$("#show12").css("display", "block");// show的display属性设置为block（显示）
			// 获取image id
			var iamgeson = me_ss.getElementByXid('imageshow');
			$(iamgeson).attr("src", pictrue.src);
		} else {// 如果show是显示的
			$("#show12").css("display", "none");// show的display属性设置为none（隐藏）
		}
	}

	Model.prototype.backBtnClick = function(event) {
		justep.Shell.showPage("working_dd");
	};

	Model.prototype.modelActive = function(event) {
		var me = this;
		onDeviceReady("MtoM_TABLE");
		me.ctndetails_ID = localStorage.getItem('ctndetails_ID');
		// this.cargo_picture = "";
		// this.comp('input_cargo_picture').val("");
		$('#images12').empty();
		me.dom.length = 0;
		me.dom = new Array();
		me.cargo_picture.length = 0;
		me.cargo_picture = new Array();
	};

	Model.prototype.modelLoad = function(event) {
		var me = this;
		this.ctndetails_ID = localStorage.getItem('ctndetails_ID');

	};

	return Model;
});