define(function(require) {
	require("$UI/costacoSecond/ajax/jquery-1");
	var justep = require("$UI/system/lib/justep");
	var touch = require("./touch");
	var Model = function() {
		this.id = "";
		this.callParent();
	};
	Model.prototype.modelLoad = function(event) {
		this.swipeDelete();
	};
	Model.prototype.instructionDetailsCustomRefresh = function(event) {
		var value = localStorage.getItem('workPlanID_details');
		localStorage.setItem('insid', value);
		var instructionDetails = this.comp("instructionDetails");
		$.ajax({
			"type" : "POST",
			"async" : false,
			"data" : {
				"id" : value
			},
			"dataType" : "json",
			"url" : interface_url + "?c=QbzxInstruction&a=getInstructionMsg",
			"success" : function(data) {
				if (data["code"] == 0) {
					instructionDetails.loadData([ data["content"] ]);
				}
			},
			"error" : function() {
				alert("数据传输失败！");
			}
		});
	};

	Model.prototype.backClick = function(event) {
		window.location.href = "workplan.w";
	};
	// 箱子列表
	Model.prototype.boxListCustomRefresh = function(event) {

		var value = localStorage.getItem('workPlanID_details');
		var boxList = this.comp("boxList");
		$.ajax({
			"type" : "POST",
			"async" : false,
			"data" : {

				"instruction_id" : value
			},
			"dataType" : "json",
			// http://192.168.1.91/xztally/app.php/qbzx/allcont?insid=98
			"url" : interface_url + "?c=QbzxOperation&a=getContainer",
			"success" : function(data) {
				if (PrintReturnValue) {
					alert(data);
					return;
				}
				if (data["code"] == 0) {
					boxList.loadData(data['list']);
				} else {
					alert(data['msg']);
				}

			},
			"error" : function() {
				alert("数据传输失败！");
			}

		});

	};
	// 作业指令详情跳转派工界面

	Model.prototype.button2Click = function(event) {
		window.location.href = "dispatching.w";
	};

	// 保存修改
	Model.prototype.button3Click = function(event) {

		var instructionDetails = this.comp("instructionDetails");
		// alert(detailnotaskData.val("locationno")+detailnotaskData.val("qbzx_forecastplanid")+detailnotaskData.val("loadingtype"));
		var instruction_id = instructionDetails.val("id");
		var location_id = instructionDetails.val("location_id");
		var plan_id = instructionDetails.val("plan_id");
		var loadingtype = instructionDetails.val("loadingtype");
		var uid = localStorage.getItem('userinfoid');
		// alert(bargeno+locationno);
		if (debugMode) {
			alert("--修改指令接口--" + "\n用户id：" + uid + "\n指令id：" + instruction_id + "\n预报id：" + plan_id + "\n装箱方式：" + loadingtype + "\n作业场地：" + location_id);
		}
		if ($.trim(location_id) === "" || $.trim(loadingtype) === "") {
			this.comp("messageDialog").show({
				"title" : "温馨提示",
				"message" : "值不能为空"
			});
		} else {

			$.ajax({
				"type" : "POST",
				"async" : false,
				"data" : {
					"uid" : uid,
					"instruction_id" : instruction_id,
					"location_id" : location_id,
					"plan_id" : plan_id,
					"loadingtype" : loadingtype

				},
				"dataType" : "json",
				"url" : interface_url + "?c=QbzxOperation&a=editInstruction",
				"success" : function(data) {
					if (data['code'] == 0) {
						alert(data['msg']);
					} else {
						alert(data['msg']);
					}

				},
				"error" : function() {
					alert("失败");
				}

			});
		}

	};

	// 删除箱列表
	Model.prototype.button1Click = function(event) {
		var id1 = event.bindingContext.$object.val('id');
		this.id = id1;
		this.comp("messageDialog1").show({
			"title" : "温馨提示",
			"message" : "是否删除"
		});

	};
	// 确认删除
	Model.prototype.messageDialog1Yes = function(event) {
		var boxList = this.comp("boxList");
		var id = this.id;
		var value = localStorage.getItem('workPlanID_details');
		// http://192.168.1.91/xztally/index.php/qbzx/contid?id=1
		// 获取当前行信息
		var uid = localStorage.getItem('userinfoid');
		if (debugMode) {
			alert("--删除配箱接口--" + "\n用户id：" + uid + "\n箱id：" + id + "\n指令id：" + value);
		}
		$.ajax({
			"type" : "POST",
			"async" : false,
			"data" : {

				"uid" : uid,
				"ctn_id" : id,
				"instruction_id" : value

			},
			"dataType" : "json",
			"url" : interface_url + "?c=QbzxOperation&a=delContainer",
			"success" : function(data) {
				if (data['code'] == 0) {
					justep.Util.hint("删除成功！");
					boxList.refreshData();
				} else {
					alert(data['msg']);
				}
			},
			"error" : function() {
				alert("删除失败");
			}

		});
	};
	// 箱号的检验
	Model.prototype.chkcntrno = function(as_cntrno, ai_choice) {
		var fi_ki;
		var fi_numsum;
		var fi_nummod;
		var fai_num = new Array(11);
		var fb_errcntrno = false;

		if (as_cntrno == null)
			return true; // null��������֤
		if (as_cntrno == "")
			return true; // �ղ�������֤

		if (as_cntrno.length == 11) // ��ʱ�׼Ϊ11λ�����һλ��У��λ��������11λ�϶����Ǳ�׼��
		{
			for (fi_ki = 1; fi_ki <= 11; fi_ki++)
				fai_num[fi_ki] = 0;
			for (fi_ki = 1; fi_ki <= 4; fi_ki++) // ��ݹ�ʱ�׼��֤���������ǰ���4��Ӣ����ĸ
			{
				fch_char = as_cntrno.charAt(fi_ki - 1).toUpperCase();
				switch (true) {
				case (fch_char == "A"): {
					fai_num[fi_ki] = 10;
					break;
				}
				case (fch_char >= "V" && fch_char <= "Z"): {
					fai_num[fi_ki] = fch_char.charCodeAt() - 52;
					break;
				}
				case (fch_char >= "L" && fch_char <= "U"): {
					fai_num[fi_ki] = fch_char.charCodeAt() - 53;
					break;
				}
				default: {
					fai_num[fi_ki] = fch_char.charCodeAt() - 54;
					break;
				}
				}
			}
			for (fi_ki = 5; fi_ki <= 11; fi_ki++) {
				fch_char = as_cntrno.charAt(fi_ki - 1);
				fai_num[fi_ki] = parseInt(fch_char); // ctype((mid(as_cntrno,
				// fi_ki, 1)), integer)
			}
			fi_numsum = 0

			for (fi_ki = 1; fi_ki <= 10; fi_ki++) {
				fi_sqr = 1;
				for (i = 1; i < fi_ki; i++) {
					fi_sqr *= 2;
				}
				fi_numsum += fai_num[fi_ki] * fi_sqr;
			}

			if (as_cntrno.substr(0, 4) == "HLCU")
				fi_numsum = fi_numsum - 2; // hapaq lloyd�Ĺ�����ʱ�׼���2
			fi_nummod = fi_numsum % 11;
			if (fi_nummod == 10)
				fi_nummod = 0;
			if (fi_nummod == fai_num[11])
				fb_errcntrno = true;
			return fb_errcntrno;
		} else {
			return fb_errcntrno;
		}
	}

	// 确认新建箱

	Model.prototype.button23Click = function(event) {
		var me = this;
		var uid = localStorage.getItem('userinfoid');
		var instruction_id = localStorage.getItem('workPlanID_details');
		var containertypecode = this.getElementByXid("select3").value;
		var containermaster = this.getElementByXid("select2").value;
		var boxdetails = this.comp("boxdetails");

		var containerno = $.trim(boxdetails.val("containerno"));
		// alert(insid+"containerno"+containerno+"containertypecode"+containertypecode+"containermaster"+containermaster);
		if (true/* this.chkcntrno(containerno, 0) */) {
			if ($.trim(containermaster) === "" || containerno === "" || $.trim(containertypecode) === "") {
				this.comp("messageDialog").show({
					"title" : "温馨提示",
					"message" : "值不能为空"
				});
			} else {

				$.ajax({
					"type" : "POST",
					"async" : false,
					"data" : {
						"uid" : uid,
						"instruction_id" : instruction_id,
						"ctnno" : containerno,
						"ctn_type_code" : containertypecode,
						"ctn_master" : containermaster

					},
					"dataType" : "json",
					"url" : interface_url + "?c=QbzxOperation&a=addContainer",
					"success" : function(data) {

						if (data['code'] == 0) {
							alert("成功")
						} else {
							alert(data['msg']);
						}

						me.tocontentboxlist();
					},
					"error" : function() {
						alert("新建失败");
					}

				});
			}
		} else {
			this.comp("messageDialog").show({
				"title" : "温馨提示",
				"message" : "箱号不正确"
			});

		}

	};
	// 跳转到箱
	Model.prototype.tocontentboxlist = function() {
		var boxList = this.comp("boxList");
		var contents = this.comp('contents');
		contents.to('boxlist');
		boxList.refreshData();

	}

	// 配像列表返回
	Model.prototype.button13Click = function(event) {
		justep.Shell.closePage();
	};

	// 货列表返回

	Model.prototype.button14Click = function(event) {
		justep.Shell.closePage();
	};

	// 指令列表返回

	Model.prototype.button11Click = function(event) {

		justep.Shell.showPage("DispatchList");
	};

	Model.prototype.goodsDataCustomRefresh = function(event) {

		var qbzx_forecastplanid = localStorage.getItem('qbzx_forecastplanid');
		var goodsData = this.comp("goodsData");
		$.ajax({
			"type" : "POST",
			"async" : false,
			"data" : {
				"plan_id" : qbzx_forecastplanid
			},
			"dataType" : dataType,
			// http://192.168.1.91/xztally/index.php/qbzx/ordernolist?planid=1
			"url" : interface_url + "?c=QbzxOperation&a=getCargoList", // PHP数据库校验用户名和密码是否正常
			"success" : function(data) {
				if (PrintReturnValue) {
					alert(data);
					return;
				}
				if (data["code"] == 0) {

					goodsData.loadData(data["list"]);
				} else {
					alert(data["msg"]);
				}
			},
			"error" : function() {
				alert("数据传输失败！");
			}

		});

	};
	// 获取箱型尺寸
	Model.prototype.countCustomRefresh = function(event) {
		var count = this.comp("count");
		$.ajax({
			"type" : "POST",
			"async" : false,
			"data" : {

			// get提交密码字段
			},
			"dataType" : "json",
			// ？c=CtnTypeCode&a=getCtnTypeCodeList
			"url" : interface_url + "?c=CtnTypeCode&a=getCtnTypeCodeList", // PHP数据库校验用户名和密码是否正常
			"success" : function(data) {
				if (data['code'] == 0) {
					count.loadData(data['list']);
				} else {
					alert(data['msg']);
				}
			},
			"error" : function() {
				alert("数据传输失败！");
			}

		});
	};
	// 获取箱主
	Model.prototype.contmasterCustomRefresh = function(event) {

		var contmaster = this.comp("contmaster");
		$.ajax({
			"type" : "POST",
			"async" : false,
			"data" : {

			// get提交密码字段
			},
			"dataType" : "json",
			// http://192.168.1.91/xztally/index.php/qbzx/ordernolist?planid=1
			"url" : interface_url + "?c=CtnMaster&a=getCtnMasterList",
			"success" : function(data) {
				if (data['code'] == 0) {
					contmaster.loadData(data['list']);
				} else {
					alert(data['msg']);
				}
			},
			"error" : function() {
				alert("数据传输失败！");
			}

		});

	};
	// 滑动删除
	Model.prototype.swipeDelete = function() {
		var content4 = this.getIDByXID('content4');
		var swipeAreaSize = 100;
		var dx;
		touch.on('#' + content4, 'touchstart', function(ev) {
			ev.preventDefault();
			var $swipNode = $('#' + content4 + " li").has(ev.target);
			dx = parseInt($swipNode.attr('swipeX') || "0");
		});

		touch.on('#' + content4, 'drag', function(ev) {
			var $swipNode = $('#' + content4 + " li").has(ev.target);
			if (ev.direction === "left" || ev.direction === "right") {
				dx = dx || 0;
				var offx = dx + ev.x;

				if (offx < swipeAreaSize * -1) {
					offx = swipeAreaSize * -1;
				}
				if (offx > 0) {
					offx = 0;
				}
				if (ev.direction === "right" && $swipNode.hasClass('x-swipe-out')) {
					$swipNode.css({
						'transform' : 'translate3d(' + offx + 'px,0,0)'
					});
				} else if (ev.direction === "left" && (!$swipNode.hasClass('x-swipe-out'))) {
					$swipNode.css({
						'transform' : 'translate3d(' + offx + 'px,0,0)'
					});
				}
			}
		});
		touch.on('#' + content4, 'dragend', function(ev) {
			var $swipNode = $('#' + content4 + " li").has(ev.target);
			if (ev.direction === "left") {
				$swipNode.css({
					'transform' : 'translate3d(-' + swipeAreaSize + 'px,0,0)'
				});
				$swipNode.addClass('x-swipe-out');
				dx = swipeAreaSize * -1;
			} else if (ev.direction === "right") {
				$swipNode.removeClass('x-swipe-out');
				$swipNode.css({
					'transform' : 'translate3d(0,0,0)'
				});
				dx = 0;
			}
			$swipNode.attr('swipeX', dx);
		});
	};

	// 查看箱详情
	Model.prototype.col8Click = function(event) {
		var id = event.bindingContext.$object.val('id');
		var ship = event.bindingContext.$object.val('ship');
		var voyage = event.bindingContext.$object.val('voyage');
		var containerno = event.bindingContext.$object.val('containerno');
		var qbzx_operationid = event.bindingContext.$object.val('operation_id');

		// alert(ship+voyage+containerno+qbzx_operationid);
		localStorage.setItem('boxdetails_id', id);
		localStorage.setItem('boxdetails_ship', ship);
		localStorage.setItem('boxdetails_voyage', voyage);
		localStorage.setItem('boxdetails_containerno', containerno);
		localStorage.setItem('boxdetails_qbzx_operationid', qbzx_operationid);

		justep.Shell.showPage("boxsDetails");
	};

	// 页面激活时候加载数据
	Model.prototype.modelActive = function(event) {
		this.instructionDetailsCustomRefresh();
		this.goodsDataCustomRefresh();
		this.contmasterCustomRefresh();
		this.locationNoCustomRefresh();
		this.boxListCustomRefresh();
		this.countCustomRefresh();
	};

	Model.prototype.locationNoCustomRefresh = function(event) {

		var locationNo = this.comp("locationNo");
		$.ajax({
			"type" : "POST",
			"async" : false,
			"data" : {

			},
			"dataType" : "json",
			//
			"url" : interface_url + "?c=Location&a=getLocationList",
			"success" : function(data) {
				if (data['code'] == 0) {
					locationNo.loadData(data['list']);
				} else {
					alert(data['msg']);
				}
			},
			"error" : function() {
				alert("数据传输失败！");
			}

		});

	};

	return Model;
});