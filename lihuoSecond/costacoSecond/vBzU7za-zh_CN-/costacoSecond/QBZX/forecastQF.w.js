window.__justep.__ResourceEngine.loadCss([{url: '/system/components/comp.min.css', include: '$model/system/components/justep/row/css/row,$model/system/components/justep/attachment/css/attachment,$model/system/components/justep/barcode/css/barcodeImage,$model/system/components/bootstrap/form/css/form,$model/system/components/justep/panel/css/panel,$model/system/components/bootstrap/accordion/css/accordion,$model/system/components/justep/common/css/scrollable,$model/system/components/bootstrap/pager/css/pager,$model/system/components/justep/scrollView/css/scrollView,$model/system/components/justep/input/css/datePickerPC,$model/system/components/bootstrap/navs/css/navs,$model/system/components/justep/contents/css/contents,$model/system/components/justep/popMenu/css/popMenu,$model/system/components/justep/lib/css/icons,$model/system/components/justep/titleBar/css/titleBar,$model/system/components/justep/dataTables/css/dataTables,$model/system/components/justep/dialog/css/dialog,$model/system/components/justep/messageDialog/css/messageDialog,$model/system/components/bootstrap/navbar/css/navbar,$model/system/components/justep/toolBar/css/toolBar,$model/system/components/justep/popOver/css/popOver,$model/system/components/justep/loadingBar/loadingBar,$model/system/components/justep/input/css/datePicker,$model/system/components/justep/dataTables/css/dataTables,$model/system/components/bootstrap/dialog/css/dialog,$model/system/components/justep/wing/css/wing,$model/system/components/bootstrap/scrollSpy/css/scrollSpy,$model/system/components/justep/menu/css/menu,$model/system/components/justep/numberSelect/css/numberList,$model/system/components/justep/list/css/list,$model/system/components/bootstrap/carousel/css/carousel,$model/system/components/bootstrap/dropdown/css/dropdown,$model/system/components/justep/common/css/forms,$model/system/components/justep/bar/css/bar,$model/system/components/bootstrap/tabs/css/tabs,$model/system/components/bootstrap/pagination/css/pagination'},{url: '/system/components/bootstrap.min.css', include: '$model/system/components/bootstrap/lib/css/bootstrap,$model/system/components/bootstrap/lib/css/bootstrap-theme'}]);window.__justep.__ResourceEngine.loadJs(['/system/components/comp.min.js','/system/common.min.js','/system/core.min.js']);define(function(require){
require('$model/UI2/system/components/justep/loadingBar/loadingBar');
require('$model/UI2/system/components/justep/labelEdit/labelEdit');
require('$model/UI2/system/components/justep/row/row');
require('$model/UI2/system/components/justep/panel/panel');
require('$model/UI2/system/components/justep/button/buttonGroup');
require('$model/UI2/system/components/justep/textarea/textarea');
require('$model/UI2/system/components/justep/select/radioGroup');
require('$model/UI2/system/components/justep/window/window');
require('$model/UI2/system/components/justep/data/data');
require('$model/UI2/system/components/justep/titleBar/titleBar');
require('$model/UI2/system/components/justep/panel/child');
require('$model/UI2/system/components/justep/messageDialog/messageDialog');
require('$model/UI2/system/components/justep/model/model');
require('$model/UI2/system/components/justep/button/radio');
require('$model/UI2/system/components/justep/button/button');
require('$model/UI2/system/components/justep/input/input');
var __parent1=require('$model/UI2/system/lib/base/modelBase'); 
var __parent0=require('$model/UI2/costacoSecond/QBZX/forecastQF'); 
var __result = __parent1._extend(__parent0).extend({
	constructor:function(contextUrl){
	this.__sysParam='true';
	this.__contextUrl=contextUrl;
	this.__id='__baseID__';
	this.__cid='cRFbmEf';
	this._flag_='d83a75db6e30cc87841ff0ae6028101a';
	this.callParent(contextUrl);
 var __Data__ = require("$UI/system/components/justep/data/data");new __Data__(this,{"autoLoad":true,"confirmDelete":true,"confirmRefresh":false,"defCols":{"isdone":{"define":"isdone","label":"是否铅封：","name":"isdone","relation":"isdone","type":"String"}},"directDelete":false,"events":{},"idColumn":"isdone","initData":"[{\"isdone\":\"1\"},{\"isdone\":\"0\"},{\"isdone\":\"2\"}]","limit":20,"xid":"isgoodsbad"});
 new __Data__(this,{"autoLoad":true,"confirmDelete":true,"confirmRefresh":true,"defCols":{"qianfen":{"define":"qianfen","label":"是否铅封","name":"qianfen","relation":"qianfen","type":"String"},"qianfencode":{"define":"qianfencode","label":"铅封状态","name":"qianfencode","relation":"qianfencode","type":"String"}},"directDelete":false,"events":{},"idColumn":"qianfen","initData":"[{\"qianfen\":\"预定铅封\",\"qianfencode\":\"1\"},{\"qianfen\":\"铅封\",\"qianfencode\":\"0\"}]","limit":20,"xid":"data3"});
 new __Data__(this,{"autoLoad":true,"confirmDelete":true,"confirmRefresh":true,"defCols":{"oid":{"define":"oid","label":"指令ID","name":"oid","relation":"oid","type":"String"},"onedoor":{"define":"onedoor","label":"半关门照片","name":"onedoor","relation":"onedoor","type":"String"},"sealImg":{"define":"sealImg","label":"铅封照片：","name":"sealImg","relation":"sealImg","type":"String"},"sealno":{"define":"sealno","label":"铅封号：","name":"sealno","relation":"sealno","type":"String"},"twodoor":{"define":"twodoor","label":"全关门照片","name":"twodoor","relation":"twodoor","type":"String"}},"directDelete":false,"events":{},"idColumn":"oid","initData":"[{}]","limit":20,"xid":"Donebox"});
}}); 
return __result;});
