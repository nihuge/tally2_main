define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.backBtnClick = function(event) {
		justep.Shell.closePage();
	};

	Model.prototype.ctnPicCustomRefresh = function(event) {
		// 获取箱所有相关照片
		var ctnPicData = this.comp("ctnPicData");
		var cargoImg = this.comp("cargoImg");
		var emptyImg = this.comp("emptyImg");
		var damagePic = this.comp("damagePic");
		var sealnoPic = this.comp("sealnoPic");
		var level_num = localStorage.getItem("level_num");
		var imgshow = localStorage.getItem("imgshow");
		var ctn_id = localStorage.getItem('id');
		// 作业表详情
		$.ajax({
			"type" : "POST",
			"async" : false,
			"data" : {
				"ctn_id" : ctn_id
			},
			"dataType" : "json",
			"url" : interface_url + "?c=QbzxOperation&a=getContainerMsg",
			"success" : function(data) {
				if (PrintReturnValue) {
					alert(data);
					return;
				}
//				 alert(data);
//				 return;
				if (data['code'] == 0) {
					if (imgshow == 1) {
						sealnoPic.loadData([ data['operationMsg'] ]);
					} else if (imgshow == 2) {
						emptyImg.loadData(data['operationMsg']['empty_picture']);
					} else if (imgshow == 3) {
						cargoImg.loadData(data['levellist'][level_num]['cargo_picture']);
					} else if (imgshow == 4) {
						damagePic.loadData(data['levellist'][level_num]['damage_picture']);
					} else if (imgshow == 5) {
						ctnPicData.loadData([ data['operationMsg'] ]);
					}
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