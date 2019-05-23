window.__justep.__ResourceEngine.loadCss([{url: '/system/components/comp.min.css', include: '$model/system/components/justep/row/css/row,$model/system/components/justep/attachment/css/attachment,$model/system/components/justep/barcode/css/barcodeImage,$model/system/components/bootstrap/form/css/form,$model/system/components/justep/panel/css/panel,$model/system/components/bootstrap/accordion/css/accordion,$model/system/components/justep/common/css/scrollable,$model/system/components/bootstrap/pager/css/pager,$model/system/components/justep/scrollView/css/scrollView,$model/system/components/justep/input/css/datePickerPC,$model/system/components/bootstrap/navs/css/navs,$model/system/components/justep/contents/css/contents,$model/system/components/justep/popMenu/css/popMenu,$model/system/components/justep/lib/css/icons,$model/system/components/justep/titleBar/css/titleBar,$model/system/components/justep/dataTables/css/dataTables,$model/system/components/justep/dialog/css/dialog,$model/system/components/justep/messageDialog/css/messageDialog,$model/system/components/bootstrap/navbar/css/navbar,$model/system/components/justep/toolBar/css/toolBar,$model/system/components/justep/popOver/css/popOver,$model/system/components/justep/loadingBar/loadingBar,$model/system/components/justep/input/css/datePicker,$model/system/components/justep/dataTables/css/dataTables,$model/system/components/bootstrap/dialog/css/dialog,$model/system/components/justep/wing/css/wing,$model/system/components/bootstrap/scrollSpy/css/scrollSpy,$model/system/components/justep/menu/css/menu,$model/system/components/justep/numberSelect/css/numberList,$model/system/components/justep/list/css/list,$model/system/components/bootstrap/carousel/css/carousel,$model/system/components/bootstrap/dropdown/css/dropdown,$model/system/components/justep/common/css/forms,$model/system/components/justep/bar/css/bar,$model/system/components/bootstrap/tabs/css/tabs,$model/system/components/bootstrap/pagination/css/pagination'},{url: '/system/components/bootstrap.min.css', include: '$model/system/components/bootstrap/lib/css/bootstrap,$model/system/components/bootstrap/lib/css/bootstrap-theme'}]);window.__justep.__ResourceEngine.loadJs(['/system/components/comp2.min.js','/system/components/comp.min.js','/system/common.min.js','/system/core.min.js']);define(function(require){
require('$model/UI2/system/components/justep/loadingBar/loadingBar');
require('$model/UI2/system/components/justep/row/row');
require('$model/UI2/system/components/justep/panel/panel');
require('$model/UI2/system/components/justep/panel/child');
require('$model/UI2/system/components/justep/contents/content');
require('$model/UI2/system/components/justep/list/list');
require('$model/UI2/system/components/justep/button/buttonGroup');
require('$model/UI2/system/components/justep/model/model');
require('$model/UI2/system/components/justep/window/window');
require('$model/UI2/system/components/bootstrap/table/table');
require('$model/UI2/system/components/bootstrap/panel/panel');
require('$model/UI2/system/components/justep/contents/contents');
require('$model/UI2/system/components/justep/titleBar/titleBar');
require('$model/UI2/system/components/justep/data/data');
require('$model/UI2/system/components/justep/button/button');
require('$model/UI2/system/components/justep/output/output');
var __parent1=require('$model/UI2/system/lib/base/modelBase'); 
var __parent0=require('$model/UI2/costacoSecond/index_employees_dd'); 
var __result = __parent1._extend(__parent0).extend({
	constructor:function(contextUrl){
	this.__sysParam='true';
	this.__contextUrl=contextUrl;
	this.__id='__baseID__';
	this.__cid='cnIrINb';
	this._flag_='c218e594b56cc578cea242698cf386d5';
	this.callParent(contextUrl);
 var __Data__ = require("$UI/system/components/justep/data/data");new __Data__(this,{"autoLoad":false,"autoNew":true,"confirmDelete":true,"confirmRefresh":true,"defCols":{"classes":{"define":"classes","label":"班次","name":"classes","relation":"classes","type":"String"},"department_name":{"define":"department_name","label":"班组","name":"department_name","relation":"department_name","type":"String"},"parent_department_name":{"define":"parent_department_name","label":"部门","name":"parent_department_name","relation":"parent_department_name","type":"String"},"position":{"define":"position","label":"身份","name":"position","relation":"position","rules":{"integer":true},"type":"Integer"},"sign_in_date":{"define":"sign_in_date","label":"日期","name":"sign_in_date","relation":"sign_in_date","type":"String"},"staffno":{"define":"staffno","label":"工号","name":"staffno","relation":"staffno","type":"String"},"user_name":{"define":"user_name","label":"名字","name":"user_name","relation":"user_name","type":"String"}},"directDelete":false,"events":{"onCustomRefresh":"infoCustomRefresh"},"idColumn":"user_name","initData":"[{}]","limit":20,"xid":"userinfo"});
 new __Data__(this,{"autoLoad":true,"confirmDelete":true,"confirmRefresh":true,"defCols":{"classes":{"define":"classes","label":"班次","name":"classes","relation":"classes","type":"String"},"department_name":{"define":"department_name","label":"班组","name":"department_name","relation":"department_name","type":"String"},"parent_department_name":{"define":"parent_department_name","label":"部门","name":"parent_department_name","relation":"parent_department_name","type":"String"},"sign_in_date":{"define":"sign_in_date","label":"签到时间","name":"sign_in_date","relation":"sign_in_date","type":"String"}},"directDelete":false,"events":{},"idColumn":"parent_department_name","limit":20,"xid":"siginData"});
}}); 
return __result;});
