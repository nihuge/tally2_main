window.__justep.__ResourceEngine.loadCss([{url: '/system/components/comp.min.css', include: '$model/system/components/justep/row/css/row,$model/system/components/justep/attachment/css/attachment,$model/system/components/justep/barcode/css/barcodeImage,$model/system/components/bootstrap/form/css/form,$model/system/components/justep/panel/css/panel,$model/system/components/bootstrap/accordion/css/accordion,$model/system/components/justep/common/css/scrollable,$model/system/components/bootstrap/pager/css/pager,$model/system/components/justep/scrollView/css/scrollView,$model/system/components/justep/input/css/datePickerPC,$model/system/components/bootstrap/navs/css/navs,$model/system/components/justep/contents/css/contents,$model/system/components/justep/popMenu/css/popMenu,$model/system/components/justep/lib/css/icons,$model/system/components/justep/titleBar/css/titleBar,$model/system/components/justep/dataTables/css/dataTables,$model/system/components/justep/dialog/css/dialog,$model/system/components/justep/messageDialog/css/messageDialog,$model/system/components/bootstrap/navbar/css/navbar,$model/system/components/justep/toolBar/css/toolBar,$model/system/components/justep/popOver/css/popOver,$model/system/components/justep/loadingBar/loadingBar,$model/system/components/justep/input/css/datePicker,$model/system/components/justep/dataTables/css/dataTables,$model/system/components/bootstrap/dialog/css/dialog,$model/system/components/justep/wing/css/wing,$model/system/components/bootstrap/scrollSpy/css/scrollSpy,$model/system/components/justep/menu/css/menu,$model/system/components/justep/numberSelect/css/numberList,$model/system/components/justep/list/css/list,$model/system/components/bootstrap/carousel/css/carousel,$model/system/components/bootstrap/dropdown/css/dropdown,$model/system/components/justep/common/css/forms,$model/system/components/justep/bar/css/bar,$model/system/components/bootstrap/tabs/css/tabs,$model/system/components/bootstrap/pagination/css/pagination'},{url: '/system/components/bootstrap.min.css', include: '$model/system/components/bootstrap/lib/css/bootstrap,$model/system/components/bootstrap/lib/css/bootstrap-theme'}]);window.__justep.__ResourceEngine.loadJs(['/system/components/comp.min.js','/system/common.min.js','/system/core.min.js']);define(function(require){
require('$model/UI2/system/components/justep/labelEdit/labelEdit');
require('$model/UI2/system/components/justep/loadingBar/loadingBar');
require('$model/UI2/system/components/justep/row/row');
require('$model/UI2/system/components/justep/panel/panel');
require('$model/UI2/system/components/justep/panel/child');
require('$model/UI2/system/components/justep/scrollView/scrollView');
require('$model/UI2/system/components/justep/contents/content');
require('$model/UI2/system/components/justep/list/list');
require('$model/UI2/system/components/justep/model/model');
require('$model/UI2/system/components/justep/window/window');
require('$model/UI2/system/components/justep/titleBar/titleBar');
require('$model/UI2/system/components/justep/contents/contents');
require('$model/UI2/system/components/justep/data/data');
require('$model/UI2/system/components/justep/button/button');
require('$model/UI2/system/components/justep/output/output');
var __parent1=require('$model/UI2/system/lib/base/modelBase'); 
var __parent0=require('$model/UI2/costacoSecond/searchPage/qbzxSearch/danzhengDetails'); 
var __result = __parent1._extend(__parent0).extend({
	constructor:function(contextUrl){
	this.__sysParam='true';
	this.__contextUrl=contextUrl;
	this.__id='__baseID__';
	this.__cid='ceiyqQ3';
	this._flag_='ce2c118259307be3d98791b51b1975ab';
	this.callParent(contextUrl);
 var __Data__ = require("$UI/system/components/justep/data/data");new __Data__(this,{"autoLoad":true,"confirmDelete":true,"confirmRefresh":true,"defCols":{"cargo_weight":{"define":"cargo_weight","label":"货物重量：","name":"cargo_weight","relation":"cargo_weight","type":"String"},"consignee":{"define":"consignee","label":"收货人：","name":"consignee","relation":"consignee","type":"String"},"ctn_type_code":{"define":"ctn_type_code","label":"箱型尺寸：","name":"ctn_type_code","relation":"ctn_type_code","type":"String"},"ctnno":{"define":"ctnno","label":"箱号：","name":"ctnno","relation":"ctnno","type":"String"},"damage_num":{"define":"damage_num","label":"总残损数：","name":"damage_num","relation":"damage_num","type":"String"},"danger_rank":{"define":"danger_rank","label":"危险等级：","name":"danger_rank","relation":"danger_rank","type":"String"},"empty_weight":{"define":"empty_weight","label":"空箱重量：","name":"empty_weight","relation":"empty_weight","type":"String"},"flflag_zh":{"define":"flflag_zh","label":"整拼标志：","name":"flflag_zh","relation":"flflag_zh","type":"String"},"level_num":{"define":"level_num","label":"关数：","name":"level_num","relation":"level_num","type":"String"},"loadingtype_zh":{"define":"loadingtype_zh","label":"装箱方式：","name":"loadingtype_zh","relation":"loadingtype_zh","type":"String"},"location_name":{"define":"location_name","label":"作业场地：","name":"location_name","relation":"location_name","type":"String"},"remark":{"define":"remark","label":"备注：","name":"remark","relation":"remark","type":"String"},"sealno":{"define":"sealno","label":"铅封号：","name":"sealno","relation":"sealno","type":"String"},"ship_name":{"define":"ship_name","label":"船名：","name":"ship_name","relation":"ship_name","type":"String"},"total_package":{"define":"total_package","label":"总件数：","name":"total_package","relation":"total_package","type":"String"},"total_ticket":{"define":"total_ticket","label":"总票数：","name":"total_ticket","relation":"total_ticket","type":"String"},"total_weight":{"define":"total_weight","label":"总重量：","name":"total_weight","relation":"total_weight","type":"String"},"voyage":{"define":"voyage","label":"航次：","name":"voyage","relation":"voyage","type":"String"},"zhoperator":{"define":"zhoperator","label":"理货员：","name":"zhoperator","relation":"zhoperator","type":"String"}},"directDelete":false,"events":{"onCustomRefresh":"danzhengCustomRefresh"},"idColumn":"ctnno","limit":20,"xid":"danzheng"});
 new __Data__(this,{"autoLoad":true,"confirmDelete":true,"confirmRefresh":true,"defCols":{"billno":{"define":"billno","label":"提单号：","name":"billno","relation":"billno","type":"String"},"cargo_unit":{"define":"cargo_unit","label":"货物件数：","name":"cargo_unit","relation":"cargo_unit","type":"String"},"damage_unit":{"define":"damage_unit","label":"残损数：","name":"damage_unit","relation":"damage_unit","type":"String"}},"directDelete":false,"events":{},"idColumn":"billno","limit":20,"xid":"tidanhao"});
}}); 
return __result;});
