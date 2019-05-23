define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function(){
		this.callParent();

		this.firstName = justep.Bind.observable('justep');
		this.lastName = justep.Bind.observable('wex5');
		this.fullName = justep.Bind.computed(function() {
			return this.firstName.get() + " " + this.lastName.get();
		}, this);		

	};

	Model.prototype.data1CustomRefresh = function(event){
		var jsonStr1 = '{"@type" : "table","rows" :['
							+'{"fName" : {"value" :"列表1"},"fImage" : {"value" :"26.00"},"fDecription" : {"value" :"描述"}},'
							+'{"fName" : {"value" :"列表2"},"fImage" : {"value" :"26.00"},"fDecription" : {"value" :"描述,"}}'
							+'],"userdata":{"sys.count":"3"}}';
		var jsonStr2 = '{"@type" : "table","rows" :['
							+'{"fName" : {"value" :"列表3"},"fImage" : {"value" :"26.00"},"fDecription" : {"value" :"描述"}}'
							+']}';
			if(event.offset == 0){
			var jsonObj = JSON.parse(jsonStr1);
		this.comp('data1').loadData(jsonObj,false);
			}else{
		var jsonObj = JSON.parse(jsonStr2);
		this.comp('data1').loadData(jsonObj,true);
		}
	};

	Model.prototype.data1Create = function(event){
		event.source.limit = 2;
	};

	Model.prototype.data1CustomSave = function(event){
		console.log(event.source.toJson(true));
	};

	Model.prototype.button6Click = function(event){
this.comp('data1').newData({defaultValues : [{fName :'意大利面',fImage :'30.00',fDecription : "面食"}]});
	};

	Model.prototype.button7Click = function(event){
	this.comp('data1').deleteData(this.comp('data1').getFirstRow());
	};

	

	Model.prototype.list3Click = function(event){
		alert(this.comp('data1').getValue('fName'));
		this.comp('data1').setValue('fImage',(parseFloat(this.comp('data1').getValue('fImage')) + 1).toFixed(2));
		
	};

	

	Model.prototype.button3Click = function(event){
		this.comp('windowReceiver1').windowCancel();
	};

	

	Model.prototype.row2Click = function(event){
		/*this.comp('windowDialog1').open();*/
	};

	

	Model.prototype.button4Click = function(event){
	
	localStorage.setItem("key", "zhangsan"); 
		var value = localStorage.getItem("key"); 
		alert(value);
/*Model.prototype.openLeft = function(event) {
		this.comp('wing').showLeft();
	};*/
	};

	

	return Model;
});