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
		var imgshow = localStorage.getItem("imgshow");
		var level_num = localStorage.getItem("level_num");
		var ctn_id = localStorage.getItem('Done_containerno');
		//alert(ctn_id);
		// 作业表详情
		$.ajax({
			"type" : "POST",
			"async" : false,
			"data" : {
				"ctn_id" : ctn_id
			},
			"dataType" : "json",
			"url" : interface_url + "?c=CfsOperation&a=getContainerMsg",
			"success" : function(data) {
				// alert(data);
				// return;
				if (PrintReturnValue) {
					alert(data);
					return;
				}
				if (data['code'] == 0) {
					if (imgshow == 1) {
						sealnoPic.loadData([ data['operationMsg'] ]);
					} else if (imgshow == 2) {
						emptyImg.loadData(data['operationMsg']['empty_img']);
					} else if (imgshow == 3) {
						// alert(data['levellist'][level_num]['level_cargo_img'][0]['level_img']);
						cargoImg.loadData(data['levellist'][level_num]['level_cargo_img']);
					} else if (imgshow == 4) {
						damagePic.loadData(data['levellist'][level_num]['cargo_damage_img']);
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