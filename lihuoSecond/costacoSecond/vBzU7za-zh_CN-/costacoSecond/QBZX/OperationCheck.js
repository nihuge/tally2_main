define(function(require) {
	require("$UI/costacoSecond/ajax/jquery-1");
	var justep = require("$UI/system/lib/justep");
	var Baas = require('$UI/demo/baas/baas');

	var Model = function() {
		this.i = 0;
		this.empty_weight = "";
		this.weight_max = "";
		// this.lst = "";
		this.empty_picture = new Array();
		this.dom = new Array();
		this.empty_picture_to_str = "";
		this.uid = "";
		this.ctn_id = "";
		this.ctnno = "";
		this.instruction_id = "";
		this.qbzx_operationid = "";
		this.emptyweight_cache = "";
		this.get_empty_picture = "";
		this.callParent();
	};

	// 获取参数
	Model.prototype.getParameter = function(event) {
		this.uid = localStorage.getItem("userinfoid");
		this.ctn_id = localStorage.getItem("id");
		this.ctnno = localStorage.getItem("ctnno");
		this.instruction_id = localStorage.getItem("instruction_id");
		this.qbzx_operationid = localStorage.getItem("operation_id");
	}

	/*
	 * Model.prototype.modelLoad = function(event){ var me = this;
	 * this.getParameter();
	 * //alert(localStorage.getItem(this.qbzx_operationid+"step"))
	 * $("#input9").val(this.qbzx_operationid);
	 * $("#input1").val(this.qbjobcontainerid);
	 * document.addEventListener("deviceready", onDeviceReady, false); // 设备就绪
	 * function onDeviceReady() { me.db = window.sqlitePlugin.openDatabase({
	 * name : "my.db" }); me.db.transaction(function(tx) { tx.executeSql('DROP
	 * TABLE IF EXISTS empty_ctn_table'); }); me.db.transaction(function(tx) {
	 * tx.executeSql('CREATE TABLE IF NOT EXISTS empty_ctn_table(operation_id
	 * integer,empty_pictures VARCHAR(255),empty_weight int(10))'); }); } };
	 */

	Model.prototype.input2Click = function(event) {

	};

	/*
	 * //缓存数据 Model.prototype.submitClick = function(event){
	 * 
	 * var me = this; var emptyweight = this.getElementByXid('input1').value;
	 * this.db.transaction(function(tx) { for(var i = 0;i<me.empty_picture.length;i++){
	 * alert(i) tx.executeSql("INSERT INTO empty_ctn_table
	 * (operation_id,empty_pictures,empty_weight) VALUES (?,?,?)",[
	 * me.qbzx_operationid,me.empty_picture[i],emptyweight], function(tx, res) {
	 * },function(e) { alert("ERROR: " + e.message); }); } }); };
	 */
	/*
	 * //取出数据库数据 Model.prototype.getMsg = function(event){ var me = this; var
	 * get_empty_picture = []; this.db.transaction(function(tx) {
	 * tx.executeSql("select * from empty_ctn_table where operation_id
	 * ="+me.qbzx_operationid, [], function(tx, res) { alert(res.rows.length)
	 * for (var i = 0; i < res.rows.length; i++) { var empty_picture_value =
	 * res.rows.item(i).empty_pictures; alert(empty_picture_value)
	 * get_empty_picture.push(empty_picture_value) } }); },function(e) {
	 * 
	 * alert("ERROR: " + e.message); }); } //删除数据 Model.prototype.DelMsg =
	 * function(event){
	 * 
	 * var me = this; this.db.transaction(function(tx) {
	 * 
	 * tx.executeSql("DELETE FROM empty_ctn_table WHERE operation_id = " +
	 * me.qbzx_operationid,[], function(tx, res) { },function(e) { alert("ERROR: " +
	 * e.message); }); }); }
	 */

	// 上传数据
	Model.prototype.uploadMsg = function(event) {
		var me = this;
		var uid = localStorage.getItem('userinfoid');
		me.ctn_id = localStorage.getItem("id");
		me.empty_weight = this.getElementByXid('input1').value;
		// me.weight_max = this.getElementByXid('input_weight_max').value;
		// me.lst = this.getElementByXid('select1').value;
		if (me.empty_weight == "" || me.empty_weight == null) {
			justep.Util.hint("请输入重量！", {
				"delay" : normerHintDelay,
				"style" : "color:red;"
			});
			return;
		}

		if (me.empty_picture.length == 0) {
			justep.Util.hint("请拍摄空箱照片！", {
				"delay" : normerHintDelay,
				"style" : "color:red;"
			});
			return;
		} else {
			// 将数组转化为字符串，通过特定的符号来连接
			me.empty_picture_to_str = me.empty_picture.join("----------");
		}

		// if (me.weight_max == "" || me.weight_max == null) {
		// alert("请输入最大载重量！");
		// return;
		// } else {
		// // if (me.lst == "" || me.lst == null) {
		// // alert("请选择劳务队！");
		// // return;
		// // }
		//
		// if (Number(me.weight_max) < Number(localStorage.getItem('average' +
		// me.ctn_id))) {
		// // 跳出选择对话框
		// me.comp("messageDialog1").show({
		// "title" : "可能会超重！",
		// "message" : "是否继续？"
		// });
		// return;
		// }
		// }

		me.messageDialog1Yes();
	}

	Model.prototype.messageDialog1Yes = function(event) {
		var me = this;
		// alert("空箱重量：" + me.empty_weight + "\n箱子载重：" + me.weight_max +
		// "\n劳务队ID：" + me.lst + "\n空箱照片张数：" + me.empty_picture.length)
		// alert("箱ID：" + localStorage.getItem("id"));
		QBZX_firstSet(localStorage.getItem("id"), me.empty_weight, 0, me.empty_picture_to_str, 0, "1");
		justep.Shell.showPage("working_details");
	};

	Model.prototype.empty_pictureClick = function(event) {
		var me = this;
		if (me.empty_picture.length < 10) {
			function onSuccess(imageURI) {
				// 参数一:this
				// 参数二：base64形式的jpg图片
				// 参数三：DIV的ID
				var imageALLURI = "data:image/jpg;base64," + imageURI;
				var divId = "images1";
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

			justep.Util.hint("不能超过十张！", {
				"delay" : normerHintDelay,
				"style" : "color:red;"
			});

		}
	};

	Model.prototype.button11Click = function(event) {
		showdiv("false");
	};

	Model.prototype.btn_deleteClick = function(event) {
		// alert("组件ID = " + localStorage.getItem("ElementsId"));
		showdiv(this, "delete", Number(localStorage.getItem("ElementsId1")));
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
		me_s.empty_picture.push(imageURI_s);
		// 动态生成组件
		var img = document.createElement(imageCreateDId);
		// 设置id
		var imgsetID = img.getElementsByTagName(imageCreateDId);
		// （照片数组变动）
		imgsetID.id = me_s.empty_picture.length - 1;
		// 拼接css样式Text
		var imageCss = "width: 50px; height: 50px; margin-left: 5px;";
		// 设置css样式
		img.style.cssText = imageCss;
		// 设置src属性（照片数组、数组长度变动）
		img.src = me_s.empty_picture[me_s.empty_picture.length - 1];
		// 将设置好的组件放进div中
		parentNode.appendChild(img);
		// 将该对象加入到数组中来,为删除后重新排版服务
		me_s.dom.push(img);
		// image设置监听事件
		img.onclick = function() {
			// 保存id值，根据id值对应到（存image对象的）数组下标值
			var id = img.getElementsByTagName("img").id;
			// (存储imageId键命变动)
			localStorage.setItem("isDamageClick1", "false");
			localStorage.setItem("ElementsId1", id);
			// 弹出层或者跳转并将图片放进层中浏览
			showdiv(me_s, img);
		}

	}

	// 层的显示个隐藏
	function showdiv(me_ss, pictrue, id) {
		var winWidth = window.innerWidth;
		// 取消事件
		if (me_ss == "false") {
			$("#show1").css("display", "none");// show的display属性设置为none（隐藏）
			return;
		}
		// 删除事件
		if (pictrue == "delete") {
			var parentNode;
			parentNode = document.getElementById("images1");
			// 移除组件(组件对象数组变动)
			parentNode.removeChild(me_ss.dom[id]);
			// 移除照片数组的元素(照片数组变动)
			me_ss.empty_picture.splice(id, 1);
			// 移除组件对象数组的元素(组件对象数组变动)
			me_ss.dom.splice(id, 1);
			// 重新排版
			for (var int = id; int < me_ss.empty_picture.length; int++) {
				// 将各组件的src往前推，针对ui组件(组件对象数组、照片数组变动)
				me_ss.dom[int].src = me_ss.empty_picture[int];
				// 将ui组件的id往前推(组件对象数组变动)
				me_ss.dom[int].getElementsByTagName("img").id = int;
			}
			justep.Util.hint("删除成功！！！", {
				"delay" : normerHintDelay
			});
			$("#show1").css("display", "none");// show的display属性设置为none（隐藏）
			return;
		}

		if ($("#show1").css("display") == 'none') {// 如果show是隐藏的
			// 设置高度和宽度
			$("#show1").css("height") == winWidth;
			document.getElementById("show1").style.visibility = "visible";
			$("#show1").css("display", "block");// show的display属性设置为block（显示）
			// 获取image id
			var iamgeson = me_ss.getElementByXid('imageshow');
			$(iamgeson).attr("src", pictrue.src);
		} else {// 如果show是显示的
			$("#show1").css("display", "none");// show的display属性设置为none（隐藏）
		}
	}

	// 返回键，跳转到作业中列表
	Model.prototype.backBtnClick = function(event) {
		justep.Shell.closePage();
		justep.Shell.showPage("working");
	};

	Model.prototype.modelActive = function(event) {
		onDeviceReady("QBZX_TABLE");
		$('#images1').empty();
		this.dom.length = 0;
		this.dom = new Array();
		this.empty_picture.length = 0;
		this.empty_picture = new Array();
		// this.comp('input_empty_picture').val("");
		// this.comp('input_weight_max').val("");
		// this.comp('select1').val("");
		this.comp('input1').val("");
		this.getParameter();
	};

	/*
	 * Model.prototype.uploadcacheInfo = function(event){ var me =this;
	 * me.ajaxTimeOut = $.ajax({ "type" : "POST", "timeout":9000, "async" :
	 * false, "data" : { "uid":me.uid, "ctn_id" : me.ctn_id, "empty_weight" :
	 * me.emptyweight_cache, "empty_picture" :me.get_empty_picture }, "dataType" :
	 * "json", "url" : interface_url+"?c=QbzxOperation&a=OperationCheck", //
	 * PHP数据库校验用户名和密码是否正常 "success" : function(data) { if(data['code']==0) {
	 * me.DelMsg(); alert("缓存的空箱内容成功！")
	 * justep.Shell.showPage("working_details"); }else{
	 * alert("缓存的空箱内容失败:"+data['msg']+"。"+"请联系管理员！") } }, "complete" :
	 * function(XMLHttpRequest,status){ if(status == 'timeout' || status ==
	 * 'error'){ justep.Util.hint("网络异常，缓存上传失败！"); me.ajaxTimeOut.abort(); } }
	 * }); }
	 * 
	 * Model.prototype.uploadcache = function(event){ var me = this; var
	 * emptyweight_cache = ""; var get_empty_picture = []; var emptyweight =
	 * this.getElementByXid('input1').value; var photos =
	 * this.getElementByXid('input_empty_picture').value;;
	 * this.db.transaction(function(tx) { tx.executeSql("select * from
	 * empty_ctn_table where operation_id ="+me.qbzx_operationid, [],
	 * function(tx, res) {
	 * 
	 * if(res.rows.length != 0){//判断是否有数据 emptyweight_cache =
	 * res.rows.item(0).empty_weight; alert("1"+emptyweight_cache) }else{
	 * alert('没有缓存数据'); return; } for (var i = 0; i < res.rows.length; i++) {
	 * var empty_picture_value = res.rows.item(i).empty_pictures;
	 * alert("2"+empty_picture_value)
	 * get_empty_picture.push(empty_picture_value) } me.emptyweight_cache =
	 * emptyweight_cache; me.get_empty_picture = get_empty_picture;
	 * me.uploadcacheInfo(); }); },function(e) {
	 * 
	 * alert("ERROR: " + e.message); }); };
	 */

	Model.prototype.modelLoad = function(event) {

	};

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

	return Model;
});