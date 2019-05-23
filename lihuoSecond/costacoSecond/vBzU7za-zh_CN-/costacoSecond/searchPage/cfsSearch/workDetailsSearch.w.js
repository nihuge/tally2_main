window.__justep.__ResourceEngine.loadCss([{url: '/system/components/comp.min.css', include: '$model/system/components/justep/row/css/row,$model/system/components/justep/attachment/css/attachment,$model/system/components/justep/barcode/css/barcodeImage,$model/system/components/bootstrap/form/css/form,$model/system/components/justep/panel/css/panel,$model/system/components/bootstrap/accordion/css/accordion,$model/system/components/justep/common/css/scrollable,$model/system/components/bootstrap/pager/css/pager,$model/system/components/justep/scrollView/css/scrollView,$model/system/components/justep/input/css/datePickerPC,$model/system/components/bootstrap/navs/css/navs,$model/system/components/justep/contents/css/contents,$model/system/components/justep/popMenu/css/popMenu,$model/system/components/justep/lib/css/icons,$model/system/components/justep/titleBar/css/titleBar,$model/system/components/justep/dataTables/css/dataTables,$model/system/components/justep/dialog/css/dialog,$model/system/components/justep/messageDialog/css/messageDialog,$model/system/components/bootstrap/navbar/css/navbar,$model/system/components/justep/toolBar/css/toolBar,$model/system/components/justep/popOver/css/popOver,$model/system/components/justep/loadingBar/loadingBar,$model/system/components/justep/input/css/datePicker,$model/system/components/justep/dataTables/css/dataTables,$model/system/components/bootstrap/dialog/css/dialog,$model/system/components/justep/wing/css/wing,$model/system/components/bootstrap/scrollSpy/css/scrollSpy,$model/system/components/justep/menu/css/menu,$model/system/components/justep/numberSelect/css/numberList,$model/system/components/justep/list/css/list,$model/system/components/bootstrap/carousel/css/carousel,$model/system/components/bootstrap/dropdown/css/dropdown,$model/system/components/justep/common/css/forms,$model/system/components/justep/bar/css/bar,$model/system/components/bootstrap/tabs/css/tabs,$model/system/components/bootstrap/pagination/css/pagination'},{url: '/system/components/bootstrap.min.css', include: '$model/system/components/bootstrap/lib/css/bootstrap,$model/system/components/bootstrap/lib/css/bootstrap-theme'}]);window.__justep.__ResourceEngine.loadJs(['/system/components/comp.min.js','/system/common.min.js','/system/core.min.js']);define(function(require){
require('$model/UI2/system/components/justep/loadingBar/loadingBar');
require('$model/UI2/system/components/justep/labelEdit/labelEdit');
require('$model/UI2/system/components/justep/row/row');
require('$model/UI2/system/components/justep/panel/panel');
require('$model/UI2/system/components/justep/list/list');
require('$model/UI2/system/components/justep/window/window');
require('$model/UI2/system/components/justep/controlGroup/controlGroup');
require('$model/UI2/system/components/justep/data/data');
require('$model/UI2/system/components/justep/contents/contents');
require('$model/UI2/system/components/justep/titleBar/titleBar');
require('$model/UI2/system/components/justep/panel/child');
require('$model/UI2/system/components/justep/contents/content');
require('$model/UI2/system/components/justep/model/model');
require('$model/UI2/system/components/justep/button/button');
require('$model/UI2/system/components/justep/input/input');
require('$model/UI2/system/components/justep/output/output');
var __parent1=require('$model/UI2/system/lib/base/modelBase'); 
var __parent0=require('$model/UI2/costacoSecond/searchPage/cfsSearch/workDetailsSearch'); 
var __result = __parent1._extend(__parent0).extend({
	constructor:function(contextUrl){
	this.__sysParam='true';
	this.__contextUrl=contextUrl;
	this.__id='__baseID__';
	this.__cid='cABRRnq';
	this._flag_='9127c8dd23606f3fc6aefe0fb7ae16f0';
	this.callParent(contextUrl);
 require('css!$UI/costacoSecond/ajax/jquery-ui.min').load();
 var __Data__ = require("$UI/system/components/justep/data/data");new __Data__(this,{"autoLoad":true,"confirmDelete":true,"confirmRefresh":true,"defCols":{"shipcode":{"define":"shipcode","label":"值","name":"shipcode","relation":"shipcode","type":"String"},"shipinfoid":{"define":"shipinfoid","name":"shipinfoid","relation":"shipinfoid","type":"String"},"shipname":{"define":"shipname","label":"船名","name":"shipname","relation":"shipname","type":"String"}},"directDelete":false,"events":{"onCustomRefresh":"shipnameCustomRefresh"},"idColumn":"shipname","limit":20,"xid":"shipname"});
 new __Data__(this,{"autoLoad":true,"confirmDelete":true,"confirmRefresh":true,"defCols":{"ctn_size":{"define":"ctn_size","label":"箱尺寸：","name":"ctn_size","relation":"ctn_size","type":"String"},"ctnno":{"define":"ctnno","label":"箱　　号：","name":"ctnno","relation":"ctnno","type":"String"},"ctntype":{"define":"ctntype","label":"箱　　型：","name":"ctntype","relation":"ctntype","type":"String"},"id":{"define":"id","label":"id","name":"id","relation":"id","type":"String"}},"directDelete":false,"events":{},"idColumn":"id","initData":"[{}]","limit":20,"xid":"boxlist"});
 new __Data__(this,{"autoLoad":true,"confirmDelete":true,"confirmRefresh":true,"defCols":{"damage_num":{"define":"damage_num","label":"残损件数","name":"damage_num","relation":"damage_num","type":"String"},"id":{"define":"id","label":"id","name":"id","relation":"id","type":"String"},"level_num":{"define":"level_num","label":"关号","name":"level_num","relation":"level_num","type":"String"},"num":{"define":"num","label":"提单号","name":"num","relation":"num","type":"String"},"operation_id":{"define":"operation_id","label":"作业id","name":"operation_id","relation":"operation_id","type":"String"}},"directDelete":false,"events":{},"idColumn":"id","initData":"[]","limit":20,"xid":"slingdetail"});
 new __Data__(this,{"autoLoad":true,"confirmDelete":true,"confirmRefresh":true,"defCols":{"cargo_weight":{"define":"cargo_weight","label":"货物重量：","name":"cargo_weight","relation":"cargo_weight","type":"String"},"empty_weight":{"define":"empty_weight","label":"空箱重量：","name":"empty_weight","relation":"empty_weight","type":"String"},"sealno":{"define":"sealno","label":"铅封号：","name":"sealno","relation":"sealno","type":"String"},"user_name":{"define":"user_name","label":"理货员：","name":"user_name","relation":"user_name","type":"String"}},"directDelete":false,"events":{},"idColumn":"sealno","limit":20,"xid":"operationDetails"});
}}); 
return __result;});
