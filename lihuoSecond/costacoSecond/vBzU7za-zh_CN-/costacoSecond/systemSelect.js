define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.image6Click = function(event) {
		//localStorage.setItem("ToSystem", 0);
		justep.Shell.showPage("SelectSys");
	};

	Model.prototype.image5Click = function(event) {
		localStorage.setItem("ToSystem", 1);
		justep.Shell.showPage("SelectSys");
		// ZZ();
	};

	Model.prototype.image4Click = function(event) {
		ZZ();
	};

	Model.prototype.image7Click = function(event) {
		localStorage.setItem("ToSystem", 3);
		justep.Shell.showPage("SelectSys");
	};

	function ZZ() {
		justep.Util.hint("尚未开发！", {
			"delay" : 1000
		});
	}

	Model.prototype.modelActive = function(event) {
		localStorage.setItem("pagestep", "2");
	};

	return Model;
});