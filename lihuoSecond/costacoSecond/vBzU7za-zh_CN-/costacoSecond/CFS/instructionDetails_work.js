define(function(require) {
	require("$UI/costacoSecond/ajax/jquery-1");
	var justep = require("$UI/system/lib/justep");
	var touch = require("./touch");
	var Model = function() {
		this.ctnid = "";
		this.callParent();
	};

	Model.prototype.modelLoad = function(event) {
		this.swipeDelete();
	};

	Model.prototype.InsDetailsCustomRefresh = function(event) {
		var InsDetails = this.comp('InsDetails');
		var instructionId = localStorage.getItem('instructionId_work');
		if (debugMode) {
			alert("--获取指令详情接口--" + "\n指令id：" + instructionId);
		}
		$.ajax({
			"type" : "post",
			"async" : false,
			"data" : {
				"id" : instructionId
			},
			"dataType" : dataType,
			"url" : interface_url + "?c=CfsInstruction&a=getInstructionMsg",
			"success" : function(data) {
				if (PrintReturnValue) {
					aler(data);
					return;
				}
				if (data['code'] == 0) {
					InsDetails.loadData([ data['content'] ]);

				} else {
					alert(data['msg']);
				}
			},
			"error" : function() {
				alert("数据传输失败！");
			}

		});
	};

	Model.prototype.backBtnClick = function(event) {
		justep.Shell.showPage("DispatchList_cfs");
	};

	Model.prototype.goodsCustomRefresh = function(event) {

		var goods = this.comp('goods');
		var instructionId = localStorage.getItem('instructionId_work');
		$.ajax({
			"type" : "post",
			"async" : false,
			"data" : {
				"instruction_id" : instructionId
			},
			"dataType" : "json",
			// ?c=CfsOperation&a=getCargoList
			"url" : interface_url + "?c=CfsOperation&a=getCargoList",
			"success" : function(data) {
				if (data['code'] == 0) {
					goods.loadData(data['list']);
				} else {
					alert(data['msg']);
				}
			},
			"error" : function() {
				alert("数据传输失败！");
			}

		});

	};

	// 获取箱列表
	Model.prototype.boxDetailsCustomRefresh = function(event) {
		var boxDetails = this.comp('boxDetails');
		var instructionId = localStorage.getItem('instructionId_work');
		$.ajax({
			"type" : "post",
			"async" : false,
			"data" : {
				"instruction_id" : instructionId
			},
			"dataType" : "json",
			// ?c=CfsOperation&a=getCargoList
			"url" : interface_url + "?c=CfsOperation&a=getContainer",
			"success" : function(data) {
				if (data['code'] == 0) {
					boxDetails.loadData(data['list']);
				} else {
					alert(data['msg']);
				}
			},
			"error" : function() {
				alert("数据传输失败！");
			}

		});
	};

	Model.prototype.button1Click = function(event) {

		var ID = event.bindingContext.$object.val('id');
		this.ctnid = ID;

		this.comp("messageDialog1").show({
			"title" : "温馨提示",
			"message" : "是否删除？"
		});

	};

	Model.prototype.messageDialog1OK = function(event) {
		var boxDetails = this.comp("boxDetails");
		var id = this.ctnid;
		// http://192.168.1.91/xztally/index.php/qbzx/contid?id=1
		// 获取当前行信息
		var uid = localStorage.getItem('userinfoid');
		var instructionId = localStorage.getItem('instructionId_work');
		$.ajax({
			"type" : "post",
			"async" : false,
			"data" : {
				"uid" : uid,
				"ctn_id" : id,
				"instruction_id" : instructionId
			},
			"dataType" : "json",
			// http://192.168.1.91/xztally/index.php/qbzx/addcont?insid=&containerno=&containertypecode=&containermaster=
			"url" : interface_url + "?c=CfsOperation&a=delContainer", // PHP数据库校验用户名和密码是否正常
			"success" : function(data) {
				if (data['code'] == 0) {
					alert("删除成功！");
					boxDetails.refreshData();
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
		var boxDetails = this.getIDByXID('boxlist');
		var swipeAreaSize = 100;
		var dx;
		touch.on('#' + boxDetails, 'touchstart', function(ev) {
			ev.preventDefault();
			var $swipNode = $('#' + boxDetails + " li").has(ev.target);
			dx = parseInt($swipNode.attr('swipeX') || "0");
		});

		touch.on('#' + boxDetails, 'drag', function(ev) {
			var $swipNode = $('#' + boxDetails + " li").has(ev.target);
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
		touch.on('#' + boxDetails, 'dragend', function(ev) {
			var $swipNode = $('#' + boxDetails + " li").has(ev.target);
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

	Model.prototype.modelActive = function(event) {
		this.goodsCustomRefresh();
		this.boxDetailsCustomRefresh();
		this.InsDetailsCustomRefresh();
	};

	return Model;
});
