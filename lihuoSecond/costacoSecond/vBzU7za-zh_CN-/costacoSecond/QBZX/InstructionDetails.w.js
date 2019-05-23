window.__justep.__ResourceEngine.loadCss([{url: '/system/components/comp.min.css', include: '$model/system/components/justep/row/css/row,$model/system/components/justep/attachment/css/attachment,$model/system/components/justep/barcode/css/barcodeImage,$model/system/components/bootstrap/form/css/form,$model/system/components/justep/panel/css/panel,$model/system/components/bootstrap/accordion/css/accordion,$model/system/components/justep/common/css/scrollable,$model/system/components/bootstrap/pager/css/pager,$model/system/components/justep/scrollView/css/scrollView,$model/system/components/justep/input/css/datePickerPC,$model/system/components/bootstrap/navs/css/navs,$model/system/components/justep/contents/css/contents,$model/system/components/justep/popMenu/css/popMenu,$model/system/components/justep/lib/css/icons,$model/system/components/justep/titleBar/css/titleBar,$model/system/components/justep/dataTables/css/dataTables,$model/system/components/justep/dialog/css/dialog,$model/system/components/justep/messageDialog/css/messageDialog,$model/system/components/bootstrap/navbar/css/navbar,$model/system/components/justep/toolBar/css/toolBar,$model/system/components/justep/popOver/css/popOver,$model/system/components/justep/loadingBar/loadingBar,$model/system/components/justep/input/css/datePicker,$model/system/components/justep/dataTables/css/dataTables,$model/system/components/bootstrap/dialog/css/dialog,$model/system/components/justep/wing/css/wing,$model/system/components/bootstrap/scrollSpy/css/scrollSpy,$model/system/components/justep/menu/css/menu,$model/system/components/justep/numberSelect/css/numberList,$model/system/components/justep/list/css/list,$model/system/components/bootstrap/carousel/css/carousel,$model/system/components/bootstrap/dropdown/css/dropdown,$model/system/components/justep/common/css/forms,$model/system/components/justep/bar/css/bar,$model/system/components/bootstrap/tabs/css/tabs,$model/system/components/bootstrap/pagination/css/pagination'},{url: '/system/components/bootstrap.min.css', include: '$model/system/components/bootstrap/lib/css/bootstrap,$model/system/components/bootstrap/lib/css/bootstrap-theme'}]);window.__justep.__ResourceEngine.loadJs(['/system/components/comp.min.js','/system/common.min.js','/system/core.min.js']);define(function(require){
require('$model/UI2/system/components/justep/loadingBar/loadingBar');
require('$model/UI2/system/components/justep/labelEdit/labelEdit');
require('$model/UI2/system/components/justep/row/row');
require('$model/UI2/system/components/justep/panel/panel');
require('$model/UI2/system/components/justep/button/buttonGroup');
require('$model/UI2/system/components/justep/list/list');
require('$model/UI2/system/components/justep/window/window');
require('$model/UI2/system/components/justep/data/data');
require('$model/UI2/system/components/justep/contents/contents');
require('$model/UI2/system/components/justep/titleBar/titleBar');
require('$model/UI2/system/components/justep/scrollView/scrollView');
require('$model/UI2/system/components/justep/panel/child');
require('$model/UI2/system/components/justep/contents/content');
require('$model/UI2/system/components/justep/messageDialog/messageDialog');
require('$model/UI2/system/components/justep/select/select');
require('$model/UI2/system/components/justep/model/model');
require('$model/UI2/system/components/justep/button/button');
require('$model/UI2/system/components/justep/output/output');
require('$model/UI2/system/components/justep/input/input');
var __parent1=require('$model/UI2/system/lib/base/modelBase'); 
var __parent0=require('$model/UI2/costacoSecond/QBZX/InstructionDetails'); 
var __result = __parent1._extend(__parent0).extend({
	constructor:function(contextUrl){
	this.__sysParam='true';
	this.__contextUrl=contextUrl;
	this.__id='__baseID__';
	this.__cid='czqqYJr';
	this._flag_='2263cfd8a3e608578ded2e1575845a08';
	this.callParent(contextUrl);
 var __Data__ = require("$UI/system/components/justep/data/data");new __Data__(this,{"autoLoad":false,"autoNew":false,"confirmDelete":true,"confirmRefresh":true,"defCols":{"customer_name":{"define":"customer_name","label":"委托单位：","name":"customer_name","relation":"customer_name","type":"String"},"entrust_time":{"define":"entrust_time","label":"委托日期：","name":"entrust_time","relation":"entrust_time","type":"String"},"entrustno":{"define":"entrustno","label":"委托编号：","name":"entrustno","relation":"entrustno","type":"String"},"has_container_num":{"define":"has_container_num","label":"已配箱数：","name":"has_container_num","relation":"has_container_num","type":"String"},"id":{"define":"id","label":"指令编号：","name":"id","relation":"id","type":"String"},"loadingtype":{"define":"loadingtype","label":"装箱方式：","name":"loadingtype","relation":"loadingtype","type":"String"},"loadingtype_zh":{"define":"loadingtype_zh","label":"装箱方式中文","name":"loadingtype_zh","relation":"loadingtype_zh","type":"String"},"location_id":{"define":"location_id","label":"作业场地id","name":"location_id","relation":"location_id","type":"String"},"location_name":{"define":"location_name","label":"作业场地：","name":"location_name","relation":"location_name","type":"String"},"ordertime":{"define":"ordertime","label":"指令日期：","name":"ordertime","relation":"ordertime","rules":{"readonly":"true"},"type":"String"},"packing_require":{"define":"packing_require","label":"装箱要求：","name":"packing_require","relation":"packing_require","type":"String"},"plan_id":{"define":"plan_id","label":"预报计划编号","name":"plan_id","relation":"plan_id","type":"String"},"ship_name":{"define":"ship_name","label":"船　　名：","name":"ship_name","relation":"ship_name","type":"String"},"status":{"define":"status","label":"作业状态：","name":"status","relation":"status","rules":{"readonly":"true"},"type":"String"},"status_zh":{"define":"status_zh","label":"作业状态：","name":"status_zh","relation":"status_zh","type":"String"},"total_ctn":{"define":"total_ctn","label":"总箱数：","name":"total_ctn","relation":"total_ctn","type":"String"},"total_package":{"define":"total_package","label":"总件数：","name":"total_package","relation":"total_package","type":"String"},"total_ticket":{"define":"total_ticket","label":"总票数：","name":"total_ticket","relation":"total_ticket","type":"String"},"voyage":{"define":"voyage","label":"航　　次：","name":"voyage","relation":"voyage","type":"String"}},"directDelete":false,"events":{"onCustomRefresh":"instructionDetailsCustomRefresh"},"idColumn":"id","initData":"[]","limit":20,"xid":"instructionDetails"});
 new __Data__(this,{"autoLoad":false,"autoNew":false,"confirmDelete":true,"confirmRefresh":true,"defCols":{"loadingcode":{"define":"loadingcode","label":"返回码","name":"loadingcode","relation":"loadingcode","type":"String"},"loadingtype":{"define":"loadingtype","label":"工作方式","name":"loadingtype","relation":"loadingtype","type":"String"}},"directDelete":false,"events":{},"idColumn":"loadingtype","initData":"[{\"loadingtype\":\"机械\",\"loadingcode\":\"1\"},{\"loadingtype\":\"人工\",\"loadingcode\":\"0\"}]","limit":20,"xid":"loadingtype"});
 new __Data__(this,{"autoLoad":false,"autoNew":false,"confirmDelete":true,"confirmRefresh":true,"defCols":{"cmaster":{"define":"cmaster","label":"箱　　主：","name":"cmaster","relation":"cmaster","type":"String"},"ctn_type_code":{"define":"ctn_type_code","label":"箱型尺寸：","name":"ctn_type_code","relation":"ctn_type_code","type":"String"},"ctnno":{"define":"ctnno","label":"箱　　号：","name":"ctnno","relation":"ctnno","type":"String"},"id":{"define":"id","label":"箱id","name":"id","relation":"id","type":"String"},"operation_id":{"define":"operation_id","label":"作业id","name":"operation_id","relation":"operation_id","type":"String"},"status":{"define":"status","label":"状　　态：","name":"status","relation":"status","type":"String"},"status_zh":{"define":"status_zh","label":"状　　态：","name":"status_zh","relation":"status_zh","type":"String"}},"directDelete":false,"events":{"onCustomRefresh":"boxListCustomRefresh"},"idColumn":"id","limit":20,"xid":"boxList"});
 new __Data__(this,{"autoLoad":false,"autoNew":false,"confirmDelete":true,"confirmRefresh":true,"defCols":{"containermaster":{"define":"containermaster","label":"箱主","name":"containermaster","relation":"containermaster","type":"String"},"containerno":{"define":"containerno","label":"箱号","name":"containerno","relation":"containerno","type":"String"},"containertypecode":{"define":"containertypecode","label":"箱型尺寸","name":"containertypecode","relation":"containertypecode","type":"String"},"insid":{"define":"insid","label":"指令id","name":"insid","relation":"insid","type":"String"}},"directDelete":false,"events":{},"idColumn":"insid","initData":"[{}]","limit":20,"xid":"boxdetails"});
 new __Data__(this,{"autoLoad":false,"autoNew":false,"confirmDelete":true,"confirmRefresh":true,"defCols":{"billno":{"define":"billno","label":"提 单 号：","name":"billno","relation":"billno","type":"String"},"cargo_name":{"define":"cargo_name","label":"货　　名：","name":"cargo_name","relation":"cargo_name","type":"String"},"dangerlevel":{"define":"dangerlevel","label":"危险等级：","name":"dangerlevel","relation":"dangerlevel","type":"String"},"entrustno":{"define":"entrustno","label":"委托编号：","name":"entrustno","relation":"entrustno","type":"String"},"mark":{"define":"mark","label":"标　　志：","name":"mark","relation":"mark","type":"String"},"number":{"define":"number","label":"件　　数：","name":"number","relation":"number","type":"String"},"package":{"define":"package","label":"包　　装：","name":"package","relation":"package","type":"String"},"qbzx_cargoid":{"define":"qbzx_cargoid","label":"货物编号：","name":"qbzx_cargoid","relation":"qbzx_cargoid","type":"String"},"qbzx_forecastplanid":{"define":"qbzx_forecastplanid","label":"预报计划编号：","name":"qbzx_forecastplanid","relation":"qbzx_forecastplanid","type":"String"},"total_weight":{"define":"total_weight","label":"重　　量：","name":"total_weight","relation":"total_weight","type":"String"}},"directDelete":false,"events":{"onCustomRefresh":"goodsDataCustomRefresh"},"idColumn":"qbzx_cargoid","limit":20,"xid":"goodsData"});
 new __Data__(this,{"autoLoad":false,"autoNew":false,"confirmDelete":true,"confirmRefresh":true,"defCols":{"ctn_type_code":{"define":"ctn_type_code","label":"箱型尺寸","name":"ctn_type_code","relation":"ctn_type_code","type":"String"}},"directDelete":false,"events":{"onCustomRefresh":"countCustomRefresh"},"idColumn":"ctn_type_code","limit":20,"xid":"count"});
 new __Data__(this,{"autoLoad":false,"autoNew":false,"confirmDelete":true,"confirmRefresh":true,"defCols":{"ctn_master":{"define":"ctn_master","name":"ctn_master","relation":"ctn_master","type":"String"},"ctn_master_code":{"define":"ctn_master_code","name":"ctn_master_code","relation":"ctn_master_code","type":"String"},"id":{"define":"id","label":"箱主","name":"id","relation":"id","type":"String"}},"directDelete":false,"events":{"onCustomRefresh":"contmasterCustomRefresh"},"idColumn":"id","initData":"[]","limit":20,"xid":"contmaster"});
 new __Data__(this,{"autoLoad":false,"autoNew":false,"confirmDelete":true,"confirmRefresh":true,"defCols":{"id":{"define":"id","label":"作业场地id","name":"id","relation":"id","type":"String"},"location_name":{"define":"location_name","label":"作业场地名称","name":"location_name","relation":"location_name","type":"String"}},"directDelete":false,"events":{"onCustomRefresh":"locationNoCustomRefresh"},"idColumn":"id","limit":20,"xid":"locationNo"});
 var justep = require('$UI/system/lib/justep');if(!this['__justep__']) this['__justep__'] = {};if(!this['__justep__'].selectOptionsAfterRender)	this['__justep__'].selectOptionsAfterRender = function($element) {		var comp = justep.Component.getComponent($element);		if(comp) comp._addDefaultOption();	};if(!this['__justep__'].selectOptionsBeforeRender)	this['__justep__'].selectOptionsBeforeRender = function($element) {		var comp = justep.Component.getComponent($element);		if(comp) comp._optionsBeforeRender();	};
 var justep = require('$UI/system/lib/justep');if(!this['__justep__']) this['__justep__'] = {};if(!this['__justep__'].selectOptionsAfterRender)	this['__justep__'].selectOptionsAfterRender = function($element) {		var comp = justep.Component.getComponent($element);		if(comp) comp._addDefaultOption();	};if(!this['__justep__'].selectOptionsBeforeRender)	this['__justep__'].selectOptionsBeforeRender = function($element) {		var comp = justep.Component.getComponent($element);		if(comp) comp._optionsBeforeRender();	};
 var justep = require('$UI/system/lib/justep');if(!this['__justep__']) this['__justep__'] = {};if(!this['__justep__'].selectOptionsAfterRender)	this['__justep__'].selectOptionsAfterRender = function($element) {		var comp = justep.Component.getComponent($element);		if(comp) comp._addDefaultOption();	};if(!this['__justep__'].selectOptionsBeforeRender)	this['__justep__'].selectOptionsBeforeRender = function($element) {		var comp = justep.Component.getComponent($element);		if(comp) comp._optionsBeforeRender();	};
 var justep = require('$UI/system/lib/justep');if(!this['__justep__']) this['__justep__'] = {};if(!this['__justep__'].selectOptionsAfterRender)	this['__justep__'].selectOptionsAfterRender = function($element) {		var comp = justep.Component.getComponent($element);		if(comp) comp._addDefaultOption();	};if(!this['__justep__'].selectOptionsBeforeRender)	this['__justep__'].selectOptionsBeforeRender = function($element) {		var comp = justep.Component.getComponent($element);		if(comp) comp._optionsBeforeRender();	};
}}); 
return __result;});
