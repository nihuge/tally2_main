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
		var uid = localStorage.getItem('userinfoid');

		var dispatching_gand_id = localStorage.getItem('dispatching_gand_id');
		var dispatching_instruction_id = localStorage.getItem('dispatching_instruction_id');
		var staffData = this.comp("staffData");
		$.ajax({
			"type" : "post",
			"async" : false,
			"data" : {
				"shift_id" : dispatching_gand_id,

			},
			"dataType" : "json",
			// ?c=Common&a=succeed
			"url" : interface_url + "?c=DdDispatch&a=getWorkList",
			"success" : function(data) {
				if (data['code'] == 0) {
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
	Model.prototype.dispatchingBtn = function(event) {
		var me = this;
		var staffData = this.comp('staffData');
		var keycostomer = this.comp('keycostomer');
		var orderrepairid = staffData.val('orderrepairid');
		var dispatching_instruction_id = localStorage.getItem('dispatching_instruction_id');
		var dispatching_gand_id = localStorage.getItem('dispatching_gand_id');
		var uid = localStorage.getItem('userinfoid');
		var is_must = keycostomer.val('is_must');
		// alert(orderrepairid+"---"+workPlanID_details+"---"+uid)
		$.ajax({
			cache : true,
			dataType : "json",
			// http://192.168.1.91/xztally/app.php/task/tasking?orderrepairid=919&insid=74&uid=20&users[20]
			url : interface_url + "?c=DdDispatch&a=addTask" + "&instruction_id=" + dispatching_instruction_id + "&shift_id=" + dispatching_gand_id + "&chiefTally=" + uid + "&is_must=" + is_must,
			data : $('#dd_begin_form1').serialize(),
			async : false,
			error : function(data) {
				alert("数据传输失败！");
			},
			success : function(data) {
				if (data['code'] == 0) {
					justep.Util.hint("派工成功！");
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