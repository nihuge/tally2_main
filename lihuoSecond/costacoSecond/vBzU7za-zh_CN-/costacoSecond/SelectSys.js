define(function(require) {
	require("$UI/costacoSecond/ajax/jquery-1");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.modelActive = function(event) {
		// localStorage.setItem("pagestep", "3")
		$("#show").css("display", "none");
		var me = this;
		// 改掉底部系统
		changeBotton(this);
		this.infoCustomRefresh();
		getModerCount(this, "qbzx");
		var userinfo = this.comp('userinfo');
		var siginData = this.comp('siginData');
		userinfo.refreshData();
		siginData.refreshData();
		var contents = me.comp("contents1");
		var active = contents.get('active');
		ChangedIcon(active, me);
	};

	// // 物理返回键的禁用
	// document.addEventListener('backbutton', back, false);
	// function back(backPage) {
	// navigator.app.exitApp();
	// switch (localStorage.getItem("pagestep")) {
	// case "1":
	// // justep.Shell.showPage("login");
	// navigator.app.exitApp();
	// break;
	// case "2":
	// justep.Shell.showPage("login");
	//
	// break;
	//
	// case "3":
	// justep.Shell.showPage("systemSelect");
	// break;
	//
	// default:
	// alert("123")
	// break;
	// }
	// }

	// document.addEventListener('backbutton', back, true);
	// function back(backPage) {
	// switch (localStorage.getItem("pagestep")) {
	// case "0":
	// navigator.app.exitApp();
	// break;
	//
	// default:
	// justep.Shell.showPage("login");
	// break;
	//		}
	//	}

	function getWindowHeight() {
		var winWidth = window.innerWidth;
		return winWidth;
	}

	Model.prototype.cfsClick = function(event) {
		this.nextPage("CFS", "index_cfs", "index_employees_cfs");
	};

	Model.prototype.MtoMClick = function(event) {
		this.nextPage("MtoM", "index_dd", "index_employees_dd");
	};

	Model.prototype.qbzxClick = function(event) {
		this.nextPage("qbzx", "index", "index_employees");
	};

	// 页面跳转方法
	Model.prototype.nextPage = function(sys, index, index_employees) {
		localStorage.setItem('system', sys);
		var position = localStorage.getItem('position');
		if (position != 11) {
			justep.Shell.showPage(index);
		} else {
			justep.Shell.showPage(index_employees);
		}
	}

	Model.prototype.backClick = function(event) {
		justep.Shell.closePage();
	};

	// 查询
	Model.prototype.image10Click = function(event) {
		showdiv(this);
	};
	// 作业计划
	Model.prototype.col7Click = function(event) {
		var position = localStorage.getItem('position');
		// 11是理货员
		if (position != 11) {
			justep.Shell.showPage("DispatchList");
		} else {
			justep.Util.hint("没有权限！", {
				"delay" : normerHintDelay,
				"style" : "color:red;"
			});
		}
	};

	// 签到
	Model.prototype.signinClick = function(event) {
		justep.Shell.showPage("SignIn");
	};
	// 交班
	Model.prototype.col10Click = function(event) {
		var position = localStorage.getItem('position');
		// 11是理货员
		if (position != 11) {
			justep.Shell.showPage("downwork");
		} else {
			justep.Util.hint("没有权限！", {
				"delay" : normerHintDelay,
				"style" : "color:red;"
			});
		}

	};

	// QB装箱作业(未作业)
	Model.prototype.col4Click = function(event) {
		toContent(0);
		justep.Shell.showPage("working");
	};

	// QB装箱作业(作业中)
	Model.prototype.col6Click = function(event) {
		toContent(1);
		justep.Shell.showPage("working");
	};
	// QB装箱作业(已完成)
	Model.prototype.col50Click = function(event) {
		toContent(2);
		justep.Shell.showPage("working");
	};
	// QB装箱作业
	Model.prototype.col9Click = function(event) {

		toContent(0);
		justep.Shell.showPage("working");
	};

	// CFS装箱作业(未作业)
	Model.prototype.cfs_doClick = function(event) {
		toContent(0);
		justep.Shell.showPage("working_cfs");
	};

	// CFS装箱作业(作业中)
	Model.prototype.cfs_doingClick = function(event) {
		toContent(1);
		justep.Shell.showPage("working_cfs");
	};
	// CFS装箱作业(已完成)
	Model.prototype.cfs_doedClick = function(event) {
		toContent(2);
		justep.Shell.showPage("working_cfs");
	};
	// CFS作业计划
	Model.prototype.cfs_dispatchingClick = function(event) {
		var position = localStorage.getItem('position');
		// 11是理货员
		if (position != 11) {
			justep.Shell.showPage("DispatchList_cfs");
		} else {
			justep.Util.hint("没有权限！", {
				"delay" : normerHintDelay,
				"style" : "color:red;"
			});
		}
	};

	// 拆箱作业（已完成）
	Model.prototype.c_workedClick = function(event) {
		toContent(2);
		justep.Shell.showPage("working_dd");

	};
	// 拆箱作业（未作业）
	Model.prototype.c_workClick = function(event) {
		toContent(0);
		justep.Shell.showPage("working_dd");
	};

	// 拆箱作业（作业中）
	Model.prototype.c_workingClick = function(event) {
		toContent(1);
		justep.Shell.showPage("working_dd");
	};
	// 拆箱作业
	Model.prototype.c_mworkingClick = function(event) {
		toContent(0);
		justep.Shell.showPage("working_dd");
	};

	// 拆箱作业（作业计划）
	Model.prototype.c_dispatchListClick = function(event) {
		// 作业计划
		var position = localStorage.getItem('position');
		// 11是理货员
		if (position != 11) {
			justep.Shell.showPage("DispatchList_dd");
		} else {
			justep.Util.hint("没有权限！", {
				"delay" : normerHintDelay,
				"style" : "color:red;"
			});
		}

	};

	function toContent(num) {
		localStorage.setItem("contentIndex", num);
	}

	function showdiv(me) {
		var winWidth = window.innerWidth;
		if ($("#show").css("display") == 'none') {// 如果show是隐藏的
			// 设置高度和宽度
			$("#show").css("height") == winWidth;
			// me.getElementByXid("divcontent").style.Height = "500px";
			// $("#divcontent").css("height") == '50px';
			// $("#divbottom").css("height") == winWidth * 0.1;
			document.getElementById("show").style.visibility = "visible";
			$("#show").css("display", "block");// show的display属性设置为block（显示）
		} else {// 如果show是显示的
			$("#show").css("display", "none");// show的display属性设置为none（隐藏）
		}
	}

	// 查询页面
	Model.prototype.image3Click = function(event) {
		// this.nextPage("qbzx","index","index_employees");
		// 弹出层
		showdiv(this);
	};
	// 关闭层
	Model.prototype.button2Click = function(event) {
		showdiv(this);
	};

	/**
	 * 0是起驳，1是CFS，2是拆箱
	 */

	// 预报计划
	Model.prototype.col5Click = function(event) {
		var contents = this.comp("contents1");
		var active = contents.get('active');
		switch (active) {
		case 0:
			justep.Shell.showPage("planSearch");
			break;
		case 1:
			justep.Util.hint("暂无预报查询！", {
				"delay" : 2000
			});
			break;
		case 2:
			justep.Shell.showPage("plansearch_dd");
			break;
		default:
			justep.Shell.showPage("planSearch");
			break;
		}
	};

	// 跳转指令查询界面
	Model.prototype.td11Click = function(event) {
		var contents = this.comp("contents1");
		var active = contents.get('active');
		switch (active) {
		case 0:
			justep.Shell.showPage("instructionSeacher");
			break;
		case 1:
			justep.Shell.showPage("instructionSeacher_cfs");
			break;
		case 2:
			justep.Shell.showPage("instructionSearch_dd");
			break;
		default:
			justep.Shell.showPage("instructionSeacher");
			break;
		}
	};
	// 派工
	Model.prototype.td12Click = function(event) {
		justep.Shell.showPage("dispatchSearch");
	};

	// 作业明细
	Model.prototype.td1Click = function(event) {
		var contents = this.comp("contents1");
		var active = contents.get('active');
		switch (active) {
		case 0:
			justep.Shell.showPage("workDetailsSearch");
			break;
		case 1:
			justep.Shell.showPage("workDetailsSearch_cfs");
			break;
		case 2:
			justep.Shell.showPage("workDetailsSearch_dd");
			break;
		default:
			justep.Shell.showPage("workDetailsSearch");
			break;
		}

	};

	// 交接记录
	Model.prototype.td16Click = function(event) {
		justep.Shell.showPage("handoverSearch");
		// window.location.href="handoverSearch.w";
	};

	// 单证
	Model.prototype.td4Click = function(event) {

		var contents = this.comp("contents1");
		var active = contents.get('active');
		switch (active) {
		case 0:
			justep.Shell.showPage("danzhengSearch");
			break;
		case 1:
			justep.Shell.showPage("danzhengSearch_cfs");
			break;
		case 2:
			justep.Shell.showPage("danzhengSearch_dd");
			break;
		default:
			justep.Shell.showPage("danzhengSearch");
			break;
		}
	};

	// 个人信息加载
	Model.prototype.infoCustomRefresh = function(event) {
		var userinfo = this.comp('userinfo');
		var siginData = this.comp('siginData');
		var username = localStorage.getItem('staffno');
		var uid = localStorage.getItem('userinfoid');
		if (debugMode) {
			alert("--获取个人信息接口--" + "\nuid：" + uid);
		}
		if (username == null) {
			justep.Util.hint("用户未登录，请登录！", {
				"delay" : normerHintDelay
			});
			justep.Shell.showPage("main");
			return;
		} else {
			$.ajax({
				"type" : "post",
				"async" : false,
				"data" : {
					"uid" : uid
				},
				"dataType" : dataType,

				"url" : interface_url + "?c=User&a=getUserMsg", // PHP数据库校验用户名和密码是否正常
				"success" : function(data) {
					if (PrintReturnValue) {
						alert(data);
						return;
					}

					if (data['code'] == 0) {
						userinfo.loadData([ data['content'] ]);
						siginData.loadData([ data['content']['shift'] ]);
						return;
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

	// 退出登录
	Model.prototype.button1Click = function(event) {
		// 弹出对话框
		this.comp("messageDialog1").show({
			"title" : "温馨提示",
			"message" : "是否确认退出？"
		});

	};
	Model.prototype.messageDialog1Yes = function(event) {
		localStorage.removeItem('staffno');
		localStorage.removeItem('pwd');
		justep.Shell.showPage("login");
	};

	Model.prototype.messageDialog1No = function(event) {

	};

	// 跳转修改密码页面
	Model.prototype.gruopItem1Click = function(event) {
		justep.Shell.showPage("changePwd");
		// window.location.href="changePwd.w";
	};

	// contents滑动事件
	Model.prototype.contents1ActiveChanged = function(event) {
		var isClick = localStorage.getItem("isButtongroup");
		if (isClick == "true") {
			localStorage.setItem("isButtongroup", "false");
			return;
		}
		var me = this;
		var contents = me.comp("contents1");
		var active = contents.get('active');
		ChangedIcon(active, me);
	};

	// buttongroup
	Model.prototype.button3Click = function(event) {
		localStorage.setItem("isButtongroup", "true");
		ChangedIcon(0, this);

	};

	Model.prototype.button32Click = function(event) {
		localStorage.setItem("isButtongroup", "true");
		ChangedIcon(1, this);
	};

	Model.prototype.button6Click = function(event) {
		localStorage.setItem("isButtongroup", "true");
		ChangedIcon(2, this);
	};

	Model.prototype.button7Click = function(event) {
		localStorage.setItem("isButtongroup", "true");
		ChangedIcon(3, this);
	};

	function ChangedIcon(active, me) {
		var setIcon3 = me.comp("button3");
		var setIcon32 = me.comp("button32");
		var setIcon6 = me.comp("button6");
		var setIcon7 = me.comp("button7");
		switch (active) {
		case 0:
			setIcon3.set({
				"icon" : "img:$UI/costacoSecond/img/packing_click.png|"
			});
			setIcon32.set({
				"icon" : "img:$UI/costacoSecond/img/icon_cfs_unclick.png|"
			});
			setIcon6.set({
				"icon" : "img:$UI/costacoSecond/img/dismanting_unclick.png|"
			});
			setIcon7.set({
				"icon" : "img:$UI/costacoSecond/img/my_unclick.png|"
			});
			getModerCount(me, "qbzx");
			break;
		case 1:
			setIcon3.set({
				"icon" : "img:$UI/costacoSecond/img/packing_unclick.png|"
			});
			setIcon32.set({
				"icon" : "img:$UI/costacoSecond/img/icon_cfs_click.png|"
			});
			setIcon6.set({
				"icon" : "img:$UI/costacoSecond/img/dismanting_unclick.png|"
			});
			setIcon7.set({
				"icon" : "img:$UI/costacoSecond/img/my_unclick.png|"
			});
			getModerCount(me, "cfs");
			break;
		case 2:
			setIcon3.set({
				"icon" : "img:$UI/costacoSecond/img/packing_unclick.png|"
			});
			setIcon32.set({
				"icon" : "img:$UI/costacoSecond/img/icon_cfs_unclick.png|"
			});
			setIcon6.set({
				"icon" : "img:$UI/costacoSecond/img/dismanting_click.png|"
			});
			setIcon7.set({
				"icon" : "img:$UI/costacoSecond/img/my_unclick.png|"
			});
			getModerCount(me, "dd");
			break;
		case 3:
			setIcon3.set({
				"icon" : "img:$UI/costacoSecond/img/packing_unclick.png|"
			});
			setIcon32.set({
				"icon" : "img:$UI/costacoSecond/img/icon_cfs_unclick.png|"
			});
			setIcon6.set({
				"icon" : "img:$UI/costacoSecond/img/dismanting_unclick.png|"
			});
			setIcon7.set({
				"icon" : "img:$UI/costacoSecond/img/my_click.png|"
			});
			break;

		default:
			setIcon3.set({
				"icon" : "img:$UI/costacoSecond/img/packing_click.png|"
			});
			setIcon32.set({
				"icon" : "img:$UI/costacoSecond/img/icon_cfs_unclick.png|"
			});
			setIcon6.set({
				"icon" : "img:$UI/costacoSecond/img/dismanting_unclick.png|"
			});
			setIcon7.set({
				"icon" : "img:$UI/costacoSecond/img/my_unclick.png|"
			});
			getModerCount(me, "qbzx");
			break;
		}

	}

	// 获取各模块作业未作业、已作业、作业中的条目
	function getModerCount(me_s, business) {
		var countData = me_s.comp('countData');
		$.ajax({
			"type" : "post",
			"timeout" : timeout,
			"async" : true,
			"data" : {
				"uid" : localStorage.getItem("userinfoid"),
				"business" : business
			},
			"dataType" : "json",
			"url" : interface_url + "?c=User&a=count_ctn", // PHP数据库校验用户名和密码是否正常
			"success" : function(data) {
				if (data['code'] == 0) {
					countData.loadData([ data ]);
				} else {
					countData.loadData([ {
						"no_begin_num" : 0,
						"begin_num" : 0,
						"finish_num" : 0,
					} ]);
					// justep.Util.hint(data['msg'], {
					// "delay" : 2000
					// });
				}
				countData.refreshData();
			},
			"complete" : function(XMLHttpRequest, status) {
				if (status == "error" || status == "timeout") {
					justep.Util.hint("服务器异常！", {
						"delay" : 2000
					});
				}
			}
		});
	}

	function changeBotton(me_s) {
		var num = localStorage.getItem("ToSystem");
		switch (Number(num)) {
		case 0:
			me_s.getElementByXid("label12").innerText = "拆 箱";
			me_s.getElementByXid("span6").innerText = "拆箱系统";
			break;
		case 1:
			me_s.getElementByXid("label12").innerText = "转 关 验 封";
			me_s.getElementByXid("span6").innerText = "转关验封";
			break;
		case 2:

			break;
		case 3:
			me_s.getElementByXid("label12").innerText = "开 箱 检 查"
			me_s.getElementByXid("span6").innerText = "开箱检查"
			break;

		default:
			me_s.getElementByXid("label12").innerText = "拆 箱";
			me_s.getElementByXid("span6").innerText = "拆箱系统";
			break;
		}

	}

	// 版本信息
	Model.prototype.div60Click = function(event) {
		justep.Shell.showPage("versionInformation");
	};

	return Model;
});