window.__justep.__ResourceEngine.loadCss([{url: '/system/components/comp.min.css', include: '$model/system/components/justep/row/css/row,$model/system/components/justep/attachment/css/attachment,$model/system/components/justep/barcode/css/barcodeImage,$model/system/components/bootstrap/form/css/form,$model/system/components/justep/panel/css/panel,$model/system/components/bootstrap/accordion/css/accordion,$model/system/components/justep/common/css/scrollable,$model/system/components/bootstrap/pager/css/pager,$model/system/components/justep/scrollView/css/scrollView,$model/system/components/justep/input/css/datePickerPC,$model/system/components/bootstrap/navs/css/navs,$model/system/components/justep/contents/css/contents,$model/system/components/justep/popMenu/css/popMenu,$model/system/components/justep/lib/css/icons,$model/system/components/justep/titleBar/css/titleBar,$model/system/components/justep/dataTables/css/dataTables,$model/system/components/justep/dialog/css/dialog,$model/system/components/justep/messageDialog/css/messageDialog,$model/system/components/bootstrap/navbar/css/navbar,$model/system/components/justep/toolBar/css/toolBar,$model/system/components/justep/popOver/css/popOver,$model/system/components/justep/loadingBar/loadingBar,$model/system/components/justep/input/css/datePicker,$model/system/components/justep/dataTables/css/dataTables,$model/system/components/bootstrap/dialog/css/dialog,$model/system/components/justep/wing/css/wing,$model/system/components/bootstrap/scrollSpy/css/scrollSpy,$model/system/components/justep/menu/css/menu,$model/system/components/justep/numberSelect/css/numberList,$model/system/components/justep/list/css/list,$model/system/components/bootstrap/carousel/css/carousel,$model/system/components/bootstrap/dropdown/css/dropdown,$model/system/components/justep/common/css/forms,$model/system/components/justep/bar/css/bar,$model/system/components/bootstrap/tabs/css/tabs,$model/system/components/bootstrap/pagination/css/pagination'},{url: '/system/components/bootstrap.min.css', include: '$model/system/components/bootstrap/lib/css/bootstrap,$model/system/components/bootstrap/lib/css/bootstrap-theme'}]);window.__justep.__ResourceEngine.loadJs(['/system/components/comp.min.js','/system/common.min.js','/system/core.min.js']);define(function(require){
require('$model/UI2/system/components/justep/loadingBar/loadingBar');
require('$model/UI2/system/components/justep/labelEdit/labelEdit');
require('$model/UI2/system/components/justep/row/row');
require('$model/UI2/system/components/justep/panel/panel');
require('$model/UI2/system/components/justep/list/list');
require('$model/UI2/system/components/justep/select/radioGroup');
require('$model/UI2/system/components/justep/window/window');
require('$model/UI2/system/components/justep/data/data');
require('$model/UI2/system/components/justep/titleBar/titleBar');
require('$model/UI2/system/components/justep/contents/contents');
require('$model/UI2/system/components/justep/panel/child');
require('$model/UI2/system/components/justep/scrollView/scrollView');
require('$model/UI2/system/components/justep/contents/content');
require('$model/UI2/system/components/justep/model/model');
require('$model/UI2/system/components/justep/button/radio');
require('$model/UI2/system/components/justep/button/button');
require('$model/UI2/system/components/justep/output/output');
var __parent1=require('$model/UI2/system/lib/base/modelBase'); 
var __parent0=require('$model/UI2/costacoSecond/MtoM/dispatching'); 
var __result = __parent1._extend(__parent0).extend({
	constructor:function(contextUrl){
	this.__sysParam='true';
	this.__contextUrl=contextUrl;
	this.__id='__baseID__';
	this.__cid='c7zYVBz';
	this._flag_='e4e490f0ec0f05f3be63eb3a3d1b2a76';
	this.callParent(contextUrl);
 var __Data__ = require("$UI/system/components/justep/data/data");new __Data__(this,{"autoLoad":true,"confirmDelete":true,"confirmRefresh":true,"defCols":{"is_must":{"define":"is_must","label":"是否为重点客户","name":"is_must","relation":"is_must","type":"String"}},"directDelete":false,"events":{},"idColumn":"is_must","initData":"[{}]","limit":20,"xid":"KeycustomerData"});
 new __Data__(this,{"autoLoad":true,"confirmDelete":true,"confirmRefresh":true,"defCols":{"departmentcode":{"define":"departmentcode","label":"departmentcode","name":"departmentcode","relation":"departmentcode","type":"String"},"is_check":{"define":"is_check","label":"是否已派","name":"is_check","relation":"is_check","type":"String"},"is_must":{"define":"is_must","label":"是否必须作业","name":"is_must","relation":"is_must","type":"String"},"orderrepairid":{"define":"orderrepairid","label":"orderrepairid","name":"orderrepairid","relation":"orderrepairid","type":"String"},"shift":{"define":"shift","label":"白班/夜班","name":"shift","relation":"shift","type":"String"},"shift_id":{"define":"shift_id","label":"派工id","name":"shift_id","relation":"shift_id","type":"String"},"signid":{"define":"signid","label":"signid","name":"signid","relation":"signid","type":"String"},"signtime":{"define":"signtime","label":"签到时间","name":"signtime","relation":"signtime","type":"String"},"status":{"define":"status","label":"状态","name":"status","relation":"status","rules":{"integer":true},"type":"Integer"},"uid":{"define":"uid","label":"userinfoid","name":"uid","relation":"uid","type":"String"},"user_name":{"define":"user_name","label":"姓名","name":"user_name","relation":"user_name","type":"String"},"usergroupscode":{"define":"usergroupscode","label":"usergroupscode","name":"usergroupscode","relation":"usergroupscode","type":"String"}},"directDelete":false,"events":{"onCustomRefresh":"staffDataCustomRefresh"},"idColumn":"signid","limit":5,"xid":"staffData"});
 new __Data__(this,{"autoLoad":true,"confirmDelete":true,"confirmRefresh":true,"defCols":{"name":{"define":"name","label":"名","name":"name","relation":"name","type":"String"},"value":{"define":"value","label":"值","name":"value","relation":"value","type":"String"}},"directDelete":false,"events":{},"idColumn":"value","initData":"[{\"value\":\"Y\",\"name\":\"是\"},{\"value\":\"N\",\"name\":\"否\"}]","limit":20,"xid":"isKeycustomer"});
}}); 
return __result;});
