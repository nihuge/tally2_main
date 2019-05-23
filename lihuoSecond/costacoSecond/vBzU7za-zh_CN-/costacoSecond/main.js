define(function(require) {
	require("$UI/costacoSecond/ajax/jquery-1");
	var justep = require("$UI/system/lib/justep");
	var ShellImpl = require('$UI/system/lib/portal/shellImpl');

	var Model = function() {
		this.callParent();
		var shellImpl = new ShellImpl(this, {
			"contentsXid" : "pages",
			"pageMappings" : {
				"main" : {
					url : require.toUrl('./main.w')
				},
				"login" : {
					// 登录页面
					url : require.toUrl('./login.w')
				},
				"downwork" : {
					url : require.toUrl('./downwork.w')
				},
				"index" : {
					// 起驳装箱主页（理货员）
					url : require.toUrl('./index.w')
				},
				"index_employees" : {
					// 起驳装箱主页（理货长）
					url : require.toUrl('./index_employees.w')
				},
				"SelectSys" : {
					// 系统选择页面
					url : require.toUrl('./SelectSys.w')
				},
				"changePwd" : {
					// 修改密码页面
					url : require.toUrl('./changePwd.w')
				},
				"SignIn" : {
					// 签到页面
					url : require.toUrl('./SignIn.w')
				},
				// 起驳作业列表（未作业、作业中、已完成）
				"working" : {
					url : require.toUrl('./QBZX/working.w')
				},
				"halfclosedoor" : {
					// 拍摄半关门照片
					url : require.toUrl('./QBZX/halfclosedoor.w')
				},
				"closedoor" : {
					// 拍摄全关门照片
					url : require.toUrl('./QBZX/closedoor.w')
				},
				"forecastQF" : {
					// 铅封页面
					url : require.toUrl('./QBZX/forecastQF.w')
				},
				// 起驳装箱核对（录入空箱重量、空箱照片）
				"OperationCheck" : {
					url : require.toUrl('./QBZX/OperationCheck.w')
				},
				// 起驳录关界面
				"working_details" : {
					url : require.toUrl('./QBZX/working_details.w')
				},
				// 起驳完成箱详情
				"doneboxdetails" : {
					url : require.toUrl('./QBZX/doneboxdetails.w')
				},// 起驳补充照片界面
				"supplementary" : {
					url : require.toUrl('./QBZX/supplementary_pictrue.w')
				},
				// 起驳指令派工列表
				"DispatchList" : {
					url : require.toUrl('./QBZX/DispatchList.w')
				},
				// 起驳指令详情
				"InstructionDetails" : {
					url : require.toUrl('./QBZX/InstructionDetails.w')
				},
				// 起驳派工(选择人员进行派工)
				"dispatching" : {
					url : require.toUrl('./QBZX/dispatching.w')
				},
				//
				"begindispatching" : {
					url : require.toUrl('./QBZX/begindispatching.w')
				},
				"boxsDetails" : {
					url : require.toUrl('./QBZX/boxsDetails.w')
				},
				"levelPics" : {
					url : require.toUrl('./QBZX/levelPics.w')
				},
				"index_employees_dd" : {
					// 门到门主页（理货员）
					url : require.toUrl('./index_employees_dd.w')
				},
				"index_dd" : {
					// 门到门主页（理货长）
					url : require.toUrl('./index_dd.w')
				},
				"DispatchList_dd" : {
					url : require.toUrl('./MtoM/DispatchList.w')
				},
				"begindispatching_dd" : {
					url : require.toUrl('./MtoM/begindispatching.w')
				},
				"dispatching_dd" : {
					url : require.toUrl('./MtoM/dispatching.w')
				},
				"working_dd" : {
					url : require.toUrl('./MtoM/working.w')
				},
				"doneboxdetails_dd" : {
					url : require.toUrl('./MtoM/doneboxdetails.w')
				},
				"beginworking_firststep_dd" : {
					url : require.toUrl('./MtoM/beginworking_firststep.w')
				},
				"openDoor_dd" : {
					url : require.toUrl('./MtoM/openDoor.w')
				},
				"instructionDetails_work_dd" : {
					url : require.toUrl('./MtoM/instructionDetails_work.w')
				},
				"working_details_dd" : {
					url : require.toUrl('./MtoM/working_details.w')
				},
				"workingfinish_dd" : {
					url : require.toUrl('./MtoM/workingfinish.w')
				},
				"supplementary_mtom" : {
					url : require.toUrl('./MtoM/supplementary_pictrue_mtom.w')
				},
				"levelPics_dd" : {
					url : require.toUrl('./MtoM/levelPics.w')
				},
				"index_cfs" : {
					url : require.toUrl('./CFS/index.w')
				},

				"index_employees_cfs" : {
					url : require.toUrl('./CFS/index_employees.w')
				},
				"working_cfs" : {
					url : require.toUrl('./CFS/working.w')
				},
				"DispatchList_cfs" : {
					url : require.toUrl('./CFS/workplan.w')
				},
				"begindispatching_cfs" : {
					url : require.toUrl('./CFS/begindispatching.w')
				},
				"dispatching_cfs" : {
					url : require.toUrl('./CFS/dispatching.w')
				},
				"instructionDetails_work_cfs" : {
					url : require.toUrl('./CFS/instructionDetails_work.w')
				},
				"beginworking_firststep_cfs" : {
					url : require.toUrl('./CFS/beginworking_firststep.w')
				},
				"working_details_cfs" : {
					url : require.toUrl('./CFS/working_details.w')
				},
				"SealDone_cfs" : {
					url : require.toUrl('./CFS/SealDone.w')
				},
				"forecastQF_cfs" : {
					url : require.toUrl('./CFS/forecastQF.w')
				},
				"supplementary_cfs" : {
					url : require.toUrl('./CFS/supplementary_pictrue_cfs.w')
				},
				"halfcloseDoor_cfs" : {
					url : require.toUrl('./CFS/halfcloseDoor.w')
				},
				"doneboxdetails_cfs" : {
					url : require.toUrl('./CFS/doneboxdetails.w')
				},
				"levelPics_cfs" : {
					url : require.toUrl('./CFS/levelPics.w')
				},
				// 起驳查询页面
				"instructionSeacher" : {
					url : require.toUrl('./searchPage/qbzxSearch/instructionsearch.w')
				},

				"planSearch" : {
					url : require.toUrl('./searchPage/qbzxSearch/plansearch.w')
				},
				"danzhengSearch" : {
					url : require.toUrl('./searchPage/qbzxSearch/danzhengSearch.w')
				},
				"workDetailsSearch" : {
					url : require.toUrl('./searchPage/qbzxSearch/workDetailsSearch.w')
				},
				"searchInstructionDetails" : {
					url : require.toUrl('./searchPage/qbzxSearch/searchInstructionDetails.w')
				},
				"forecastDetails" : {
					url : require.toUrl('./searchPage/qbzxSearch/forecastDetails.w')
				},
				"danzhengDetails" : {
					url : require.toUrl('./searchPage/qbzxSearch/danzhengDetails.w')
				},
				// cfs查询页面
				"instructionSeacher_cfs" : {
					url : require.toUrl('./searchPage/cfsSearch/instructionsearch.w')
				},
				"danzhengSearch_cfs" : {
					url : require.toUrl('./searchPage/cfsSearch/danzhengSearch.w')
				},

				"workDetailsSearch_cfs" : {
					url : require.toUrl('./searchPage/cfsSearch/workDetailsSearch.w')
				},
				"searchInstructionDetails_cfs" : {
					url : require.toUrl('./searchPage/cfsSearch/searchInstructionDetails.w')
				},
				"danzhengDetails_cfs" : {
					url : require.toUrl('./searchPage/cfsSearch/danzhengDetails.w')
				},

				// 门到门查询页面
				"instructionSearch_dd" : {
					url : require.toUrl('./searchPage/MtoMSearch/instructionSearch.w')
				},

				"plansearch_dd" : {
					url : require.toUrl('./searchPage/MtoMSearch/plansearch.w')
				},
				"danzhengSearch_dd" : {
					url : require.toUrl('./searchPage/MtoMSearch/danzhengSearch.w')
				},

				"workDetailsSearch_dd" : {
					url : require.toUrl('./searchPage/MtoMSearch/workDetailsSearch.w')
				},
				"InstructionDetails_dd" : {
					url : require.toUrl('./searchPage/MtoMSearch/instructionDetails.w')
				},
				"forecastDetails_dd" : {
					url : require.toUrl('./searchPage/MtoMSearch/forecastDetails.w')
				},
				"danzhengDetails_dd" : {
					url : require.toUrl('./searchPage/MtoMSearch/danzhengDetails.w')
				},
				// 公共的查询页面
				"dispatchSearch" : {
					url : require.toUrl('./searchPage/dispatchSearch.w')
				},
				"handoverSearch" : {
					url : require.toUrl('./searchPage/handoverSearch.w')
				},
				"systemSelect" : {
					url : require.toUrl('./systemSelect.w')
				},
				"versionInformation" : {
					url : require.toUrl('./versionInformation.w')
				}

			}
		});

	};

	return Model;
});