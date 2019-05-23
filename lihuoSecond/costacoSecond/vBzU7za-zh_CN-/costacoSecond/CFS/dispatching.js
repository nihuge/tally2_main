define(function(require) {
	require("$UI/costacoSecond/ajax/jquery-1");
	var justep = require("$UI/system/lib/justep");
	var Baas = require("$UI/demo/baas/baas");

	var Model = function() {
		this.callParent();
		this.repair_id;
		this.is_must;
	};

	// orderData的自定义刷新事件onCustomRefresh

	Model.prototype.staffDataCustomRefresh = function(event) {
		var me = this
		var exitstaffData = this.comp("exitstaffData");
		var uid = localStorage.getItem('userinfoid');
		var dispatching_gand_id = localStorage.getItem('dispatching_gand_id');
		var dispatching_instruction_id = localStorage.getItem('dispatching_instruction_id');
		if (debugMode) {
			alert("--获取派工详情--" + "\n工班id：" + dispatching_gand_id + "\n指令id：" + dispatching_instruction_id)
		}
		$.ajax({
			"type" : "post",
			"async" : false,
			"data" : {
				"shift_id" : dispatching_gand_id,
				"instruction_id" : dispatching_instruction_id,

			},
			"dataType" : "json",
			// ?c=Common&a=succeed
			"url" : interface_url + "?c=CfsDispatch&a=getDetail",
			"success" : function(data) {
				if (data['code'] == 0) {
					me.repair_id = data['dispatch_id'];
					var list1 = me.comp("list1");
					list1.refresh();
					exitstaffData.loadData(data['list']);
				} else {
					alert(data['msg']);
				}

			},
			"error" : function() {
				alert("数据传输失败！");
			}

		});

	};

	// 确认派工
	Model.prototype.searchBtnClick = function(event) {
		var me = this;
		var exitstaffData = this.comp('exitstaffData');
		var orderrepairid = exitstaffData.val('orderrepairid');

		var dispatching_instruction_id = localStorage.getItem('dispatching_instruction_id');
		var uid = localStorage.getItem('userinfoid');
		if (debugMode) {
			alert("--修改派工接口--" + "\n指令id：" + dispatching_instruction_id + "\n派工id：" + me.repair_id + "\n用户id" + uid)
		}
		$.ajax({
			cache : false,
			dataType : "json",
			// http://192.168.1.91/xztally/app.php?c=CfsDispatch&a=editTask&instruction_id=140&uid=7&repair_id=17&workerlist[]=[]
			url : interface_url + "?c=CfsDispatch&a=editTask" + "&instruction_id=" + dispatching_instruction_id + "&dispatch_id=" + me.repair_id + "&uid=" + uid,
			data : $('#form').serialize(),
			async : false,
			error : function(data) {
				alert("数据传输失败！");
			},
			success : function(data) {
				if (data['code'] == 0) {
					justep.Util.hint("修改派工成功！");
					justep.Shell.showPage("DispatchList_cfs");
				} else {
					alert(data['msg']);
				}

				//  
			}
		});
		// $('#form1').submit();
	};

	// 返回键
	Model.prototype.backBtnClick = function(event) {
		justep.Shell.showPage("DispatchList_cfs");
	};

	Model.prototype.modelActive = function(event) {
		this.staffDataCustomRefresh();
	};

	return Model;
});