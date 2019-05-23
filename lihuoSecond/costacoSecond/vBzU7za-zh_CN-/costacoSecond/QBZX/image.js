define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var ShellImpl = require('$UI/system/lib/portal/shellImpl');
	var Model = function(){
		this.callParent();
	};

	Model.prototype.modelLoad = function(event){
	var sealpicture = localStorage.getItem("sealpicture");
		var picList = [

		{
		  height: 475,
		  width: 400,
			content : sealpicture
		}

		];

		var islider3 = new iSlider({
			data : picList,
			dom : document.getElementById("non-looping"),
			animateType : 'rotate',
		});
	};


	Model.prototype.backBtnClick = function(event){
		window.location.href="boxsDetails.w";
	};


	Model.prototype.button2Click = function(event){
history.back();
	};


	return Model;
});