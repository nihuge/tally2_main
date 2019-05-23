window.__justep.__ResourceEngine.loadCss([{url: '/system/components/comp.min.css', include: '$model/system/components/justep/row/css/row,$model/system/components/justep/attachment/css/attachment,$model/system/components/justep/barcode/css/barcodeImage,$model/system/components/bootstrap/form/css/form,$model/system/components/justep/panel/css/panel,$model/system/components/bootstrap/accordion/css/accordion,$model/system/components/justep/common/css/scrollable,$model/system/components/bootstrap/pager/css/pager,$model/system/components/justep/scrollView/css/scrollView,$model/system/components/justep/input/css/datePickerPC,$model/system/components/bootstrap/navs/css/navs,$model/system/components/justep/contents/css/contents,$model/system/components/justep/popMenu/css/popMenu,$model/system/components/justep/lib/css/icons,$model/system/components/justep/titleBar/css/titleBar,$model/system/components/justep/dataTables/css/dataTables,$model/system/components/justep/dialog/css/dialog,$model/system/components/justep/messageDialog/css/messageDialog,$model/system/components/bootstrap/navbar/css/navbar,$model/system/components/justep/toolBar/css/toolBar,$model/system/components/justep/popOver/css/popOver,$model/system/components/justep/loadingBar/loadingBar,$model/system/components/justep/input/css/datePicker,$model/system/components/justep/dataTables/css/dataTables,$model/system/components/bootstrap/dialog/css/dialog,$model/system/components/justep/wing/css/wing,$model/system/components/bootstrap/scrollSpy/css/scrollSpy,$model/system/components/justep/menu/css/menu,$model/system/components/justep/numberSelect/css/numberList,$model/system/components/justep/list/css/list,$model/system/components/bootstrap/carousel/css/carousel,$model/system/components/bootstrap/dropdown/css/dropdown,$model/system/components/justep/common/css/forms,$model/system/components/justep/bar/css/bar,$model/system/components/bootstrap/tabs/css/tabs,$model/system/components/bootstrap/pagination/css/pagination'},{url: '/system/components/bootstrap.min.css', include: '$model/system/components/bootstrap/lib/css/bootstrap,$model/system/components/bootstrap/lib/css/bootstrap-theme'}]);window.__justep.__ResourceEngine.loadJs(['/system/components/comp.min.js','/system/common.min.js','/system/core.min.js']);define(function(require){
require('$model/UI2/system/components/justep/loadingBar/loadingBar');
require('$model/UI2/system/components/justep/panel/panel');
require('$model/UI2/system/components/justep/panel/child');
require('$model/UI2/system/components/justep/scrollView/scrollView');
require('$model/UI2/system/components/justep/list/list');
require('$model/UI2/system/components/justep/model/model');
require('$model/UI2/system/components/justep/window/window');
require('$model/UI2/system/components/justep/data/data');
require('$model/UI2/system/components/justep/titleBar/titleBar');
require('$model/UI2/system/components/justep/button/button');
var __parent1=require('$model/UI2/system/lib/base/modelBase'); 
var __parent0=require('$model/UI2/costacoSecond/searchPage/workingPic'); 
var __result = __parent1._extend(__parent0).extend({
	constructor:function(contextUrl){
	this.__sysParam='true';
	this.__contextUrl=contextUrl;
	this.__id='__baseID__';
	this.__cid='ciInuEz';
	this._flag_='7d31472546c0dbff6a2df1259f07abdf';
	this.callParent(contextUrl);
 var __Data__ = require("$UI/system/components/justep/data/data");new __Data__(this,{"autoLoad":true,"confirmDelete":true,"confirmRefresh":true,"defCols":{"cargo_picture_a":{"define":"cargo_picture_a","name":"cargo_picture_a","relation":"cargo_picture_a","type":"String"},"damage_picture":{"define":"damage_picture","label":"残损照片","name":"damage_picture","relation":"damage_picture","type":"String"}},"directDelete":false,"events":{},"idColumn":"damage_picture","limit":20,"xid":"damagePic"});
 new __Data__(this,{"autoLoad":true,"confirmDelete":true,"confirmRefresh":true,"defCols":{"close_door_picture_a":{"define":"close_door_picture_a","name":"close_door_picture_a","relation":"close_door_picture_a","type":"String"},"empty_picture_a":{"define":"empty_picture_a","label":"货物照片","name":"empty_picture_a","relation":"empty_picture_a","type":"String"},"halfclose_door_picture_a":{"define":"halfclose_door_picture_a","name":"halfclose_door_picture_a","relation":"halfclose_door_picture_a","type":"String"}},"directDelete":false,"events":{"onCustomRefresh":"ctnPicCustomRefresh"},"idColumn":"empty_picture_a","limit":20,"xid":"ctnPicData"});
 new __Data__(this,{"autoLoad":true,"confirmDelete":true,"confirmRefresh":true,"defCols":{"empty_picture":{"define":"empty_picture","label":"空箱照片","name":"empty_picture","relation":"empty_picture","type":"String"}},"directDelete":false,"events":{},"idColumn":"empty_picture","limit":20,"xid":"emptyImg"});
 new __Data__(this,{"autoLoad":true,"confirmDelete":true,"confirmRefresh":true,"defCols":{"cargo_picture_a":{"define":"cargo_picture_a","label":"货物照片","name":"cargo_picture_a","relation":"cargo_picture_a","type":"String"}},"directDelete":false,"events":{},"idColumn":"cargo_picture_a","limit":20,"xid":"cargoImg"});
 new __Data__(this,{"autoLoad":true,"confirmDelete":true,"confirmRefresh":true,"defCols":{"seal_picture_a":{"define":"seal_picture_a","name":"seal_picture_a","relation":"seal_picture_a","type":"String"}},"directDelete":false,"events":{},"idColumn":"seal_picture_a","limit":20,"xid":"sealnoPic"});
}}); 
return __result;});
