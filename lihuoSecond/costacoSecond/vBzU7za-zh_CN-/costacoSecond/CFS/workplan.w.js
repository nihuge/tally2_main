window.__justep.__ResourceEngine.loadCss([{url: '/system/components/comp.min.css', include: '$model/system/components/justep/row/css/row,$model/system/components/justep/attachment/css/attachment,$model/system/components/justep/barcode/css/barcodeImage,$model/system/components/bootstrap/form/css/form,$model/system/components/justep/panel/css/panel,$model/system/components/bootstrap/accordion/css/accordion,$model/system/components/justep/common/css/scrollable,$model/system/components/bootstrap/pager/css/pager,$model/system/components/justep/scrollView/css/scrollView,$model/system/components/justep/input/css/datePickerPC,$model/system/components/bootstrap/navs/css/navs,$model/system/components/justep/contents/css/contents,$model/system/components/justep/popMenu/css/popMenu,$model/system/components/justep/lib/css/icons,$model/system/components/justep/titleBar/css/titleBar,$model/system/components/justep/dataTables/css/dataTables,$model/system/components/justep/dialog/css/dialog,$model/system/components/justep/messageDialog/css/messageDialog,$model/system/components/bootstrap/navbar/css/navbar,$model/system/components/justep/toolBar/css/toolBar,$model/system/components/justep/popOver/css/popOver,$model/system/components/justep/loadingBar/loadingBar,$model/system/components/justep/input/css/datePicker,$model/system/components/justep/dataTables/css/dataTables,$model/system/components/bootstrap/dialog/css/dialog,$model/system/components/justep/wing/css/wing,$model/system/components/bootstrap/scrollSpy/css/scrollSpy,$model/system/components/justep/menu/css/menu,$model/system/components/justep/numberSelect/css/numberList,$model/system/components/justep/list/css/list,$model/system/components/bootstrap/carousel/css/carousel,$model/system/components/bootstrap/dropdown/css/dropdown,$model/system/components/justep/common/css/forms,$model/system/components/justep/bar/css/bar,$model/system/components/bootstrap/tabs/css/tabs,$model/system/components/bootstrap/pagination/css/pagination'},{url: '/system/components/bootstrap.min.css', include: '$model/system/components/bootstrap/lib/css/bootstrap,$model/system/components/bootstrap/lib/css/bootstrap-theme'}]);window.__justep.__ResourceEngine.loadJs(['/system/components/comp.min.js','/system/common.min.js','/system/core.min.js']);define(function(require){
require('$model/UI2/system/components/justep/loadingBar/loadingBar');
require('$model/UI2/system/components/justep/labelEdit/labelEdit');
require('$model/UI2/system/components/justep/row/row');
require('$model/UI2/system/components/justep/panel/panel');
require('$model/UI2/system/components/justep/list/list');
require('$model/UI2/system/components/justep/windowDialog/windowDialog');
require('$model/UI2/system/components/justep/window/window');
require('$model/UI2/system/components/justep/data/data');
require('$model/UI2/system/components/justep/titleBar/titleBar');
require('$model/UI2/system/components/justep/contents/contents');
require('$model/UI2/system/components/justep/scrollView/scrollView');
require('$model/UI2/system/components/justep/panel/child');
require('$model/UI2/system/components/justep/contents/content');
require('$model/UI2/system/components/justep/messageDialog/messageDialog');
require('$model/UI2/system/components/justep/model/model');
require('$model/UI2/system/components/justep/button/button');
require('$model/UI2/system/components/justep/output/output');
var __parent1=require('$model/UI2/system/lib/base/modelBase'); 
var __parent0=require('$model/UI2/costacoSecond/CFS/workplan'); 
var __result = __parent1._extend(__parent0).extend({
	constructor:function(contextUrl){
	this.__sysParam='true';
	this.__contextUrl=contextUrl;
	this.__id='__baseID__';
	this.__cid='cURZzUf';
	this._flag_='9ae97e87d3c698dd3c15682fee4e3934';
	this.callParent(contextUrl);
 var __Data__ = require("$UI/system/components/justep/data/data");new __Data__(this,{"autoLoad":false,"autoNew":true,"confirmDelete":true,"confirmRefresh":false,"defCols":{"date":{"define":"date","label":"指令日期：","name":"date","relation":"date","type":"String"},"dispatch_id":{"define":"dispatch_id","name":"dispatch_id","relation":"dispatch_id","type":"String"},"id":{"define":"id","label":"指令id","name":"id","relation":"id","type":"String"},"location_name":{"define":"location_name","label":"作业场地：","name":"location_name","relation":"location_name","type":"String"},"numbersofpackages":{"define":"numbersofpackages","label":"件　　数：","name":"numbersofpackages","relation":"numbersofpackages","type":"String"},"operating_type":{"define":"operating_type","label":"拆箱方式：","name":"operating_type","relation":"operating_type","type":"String"},"operating_type_zh":{"define":"operating_type_zh","name":"operating_type_zh","relation":"operating_type_zh","type":"String"},"ship_name":{"define":"ship_name","label":"船　　名：","name":"ship_name","relation":"ship_name","type":"String"},"voyage":{"define":"voyage","label":"航　　次：","name":"voyage","relation":"voyage","type":"String"}},"directDelete":false,"events":{"onCustomRefresh":"notaskDateCustomRefresh"},"idColumn":"id","limit":5,"xid":"notaskDate"});
 new __Data__(this,{"autoLoad":false,"autoNew":true,"confirmDelete":true,"confirmRefresh":false,"defCols":{"date":{"define":"date","label":"指令日期：","name":"date","relation":"date","type":"String"},"dispatch_id":{"define":"dispatch_id","name":"dispatch_id","relation":"dispatch_id","type":"String"},"id":{"define":"id","label":"指令id","name":"id","relation":"id","type":"String"},"location_name":{"define":"location_name","label":"作业场地：","name":"location_name","relation":"location_name","type":"String"},"numbersofpackages":{"define":"numbersofpackages","label":"件　　数：","name":"numbersofpackages","relation":"numbersofpackages","type":"String"},"operating_type":{"define":"operating_type","label":"拆箱方式：","name":"operating_type","relation":"operating_type","type":"String"},"repair_id":{"define":"repair_id","label":"派工ID","name":"repair_id","relation":"repair_id","type":"String"},"ship_name":{"define":"ship_name","label":"船　　名：","name":"ship_name","relation":"ship_name","type":"String"},"voyage":{"define":"voyage","label":"航　　次：","name":"voyage","relation":"voyage","type":"String"}},"directDelete":false,"events":{"onCustomRefresh":"orderDataCustomRefresh"},"idColumn":"id","limit":5,"xid":"orderData"});
}}); 
return __result;});
