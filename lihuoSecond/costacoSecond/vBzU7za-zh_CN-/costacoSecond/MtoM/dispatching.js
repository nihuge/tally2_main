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
		var staffData = this.comp("staffData");
		var KeycustomerData = this.comp('KeycustomerData');
		var uid = localStorage.getItem('userinfoid');
		var shift_id = localStorage.getItem('dispatching_gand_id');
		var dispatching_instruction_id = localStorage.getItem('dispatching_instruction_id');
		if (debugMode) {

			alert("签到工班id:" + shift_id + "\n指令id：" + dispatching_instruction_id);
		}
		$.ajax({
			"type" : "post",
			"async" : false,
			"data" : {
				"shift_id" : shift_id,
				"instruction_id" : dispatching_instruction_id,

			},
			"dataType" : "json",
			// ?c=Common&a=succeed
			"url" : interface_url + "?c=DdDispatch&a=getDetail",
			"success" : function(data) {
				if (data['code'] == 0) {
					me.repair_id = data['dispatch_id'];
					me.is_must = data['is_must'];
					KeycustomerData.setValue('is_must', data['is_must']);
					staffData.loadData(data['list']);
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
		var staffData = this.comp('staffData');
		var KeycustomerData = this.comp('KeycustomerData');
		var orderrepairid = staffData.val('orderrepairid');
		var dispatching_instruction_id = localStorage.getItem('dispatching_instruction_id');
		var uid = localStorage.getItem('userinfoid');
		var is_must = KeycustomerData.val('is_must');
		if (debugMode) {

			alert("派工id:" + me.repair_id + "\n指令id：" + dispatching_instruction_id + "\n是否重点客户：" + is_must + "\n用户id:" + uid);
		}
		$.ajax({
			cache : true,
			dataType : "json",
			// http://192.168.1.91/xztally/app.php/task/tasking?orderrepairid=919&insid=74&uid=20&users[20]
			url : interface_url + "?c=DdDispatch&a=editTask&" + "instruction_id=" + dispatching_instruction_id + "&dispatch_id=" + me.repair_id + "&uid=" + uid + "&is_must=" + is_must,
			data : $('#dd_form2').serialize(),
			async : false,
			error : function(data) {
				alert("派工失败");
			},
			success : function(data) {
				if (data['code'] == 0) {
					justep.Util.hint("修改派工成功！");
					justep.Shell.showPage("DispatchList_dd");
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
		justep.Shell.showPage("DispatchList_dd");
	};

	return Model;
});