window.__justep.__ResourceEngine.loadCss([{url: '/system/components/comp.min.css', include: '$model/system/components/justep/row/css/row,$model/system/components/justep/attachment/css/attachment,$model/system/components/justep/barcode/css/barcodeImage,$model/system/components/bootstrap/form/css/form,$model/system/components/justep/panel/css/panel,$model/system/components/bootstrap/accordion/css/accordion,$model/system/components/justep/common/css/scrollable,$model/system/components/bootstrap/pager/css/pager,$model/system/components/justep/scrollView/css/scrollView,$model/system/components/justep/input/css/datePickerPC,$model/system/components/bootstrap/navs/css/navs,$model/system/components/justep/contents/css/contents,$model/system/components/justep/popMenu/css/popMenu,$model/system/components/justep/lib/css/icons,$model/system/components/justep/titleBar/css/titleBar,$model/system/components/justep/dataTables/css/dataTables,$model/system/components/justep/dialog/css/dialog,$model/system/components/justep/messageDialog/css/messageDialog,$model/system/components/bootstrap/navbar/css/navbar,$model/system/components/justep/toolBar/css/toolBar,$model/system/components/justep/popOver/css/popOver,$model/system/components/justep/loadingBar/loadingBar,$model/system/components/justep/input/css/datePicker,$model/system/components/justep/dataTables/css/dataTables,$model/system/components/bootstrap/dialog/css/dialog,$model/system/components/justep/wing/css/wing,$model/system/components/bootstrap/scrollSpy/css/scrollSpy,$model/system/components/justep/menu/css/menu,$model/system/components/justep/numberSelect/css/numberList,$model/system/components/justep/list/css/list,$model/system/components/bootstrap/carousel/css/carousel,$model/system/components/bootstrap/dropdown/css/dropdown,$model/system/components/justep/common/css/forms,$model/system/components/justep/bar/css/bar,$model/system/components/bootstrap/tabs/css/tabs,$model/system/components/bootstrap/pagination/css/pagination'},{url: '/system/components/bootstrap.min.css', include: '$model/system/components/bootstrap/lib/css/bootstrap,$model/system/components/bootstrap/lib/css/bootstrap-theme'}]);window.__justep.__ResourceEngine.loadJs(['/system/components/comp.min.js','/system/common.min.js','/system/core.min.js']);define(function(require){
require('$model/UI2/system/components/justep/loadingBar/loadingBar');
require('$model/UI2/system/components/justep/labelEdit/labelEdit');
require('$model/UI2/system/components/justep/row/row');
require('$model/UI2/system/components/justep/panel/panel');
require('$model/UI2/system/components/justep/list/list');
require('$model/UI2/system/components/justep/windowDialog/windowDialog');
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
var __parent0=require('$model/UI2/costacoSecond/searchPage/qbzxSearch/workDetailsSearch'); 
var __result = __parent1._extend(__parent0).extend({
	constructor:function(contextUrl){
	this.__sysParam='true';
	this.__contextUrl=contextUrl;
	this.__id='__baseID__';
	this.__cid='czAjUF3';
	this._flag_='53bf17b4a991cef8dc05a961f4e8c195';
	this.callParent(contextUrl);
 require('css!$UI/costaco/ajax/jquery-ui.min').load();
 var __Data__ = require("$UI/system/components/justep/data/data");new __Data__(this,{"autoLoad":true,"confirmDelete":true,"confirmRefresh":true,"defCols":{"id":{"define":"id","name":"id","relation":"id","type":"String"},"ship_name":{"define":"ship_name","label":"船名","name":"ship_name","relation":"ship_name","type":"String"},"shipcode":{"define":"shipcode","label":"值","name":"shipcode","relation":"shipcode","type":"String"}},"directDelete":false,"events":{"onCustomRefresh":"shipnameCustomRefresh"},"idColumn":"ship_name","limit":20,"xid":"shipname"});
 new __Data__(this,{"autoLoad":true,"confirmDelete":true,"confirmRefresh":true,"defCols":{"ctn_master":{"define":"ctn_master","label":"箱　　主：","name":"ctn_master","relation":"ctn_master","type":"String"},"ctn_type_code":{"define":"ctn_type_code","label":"箱型尺寸：","name":"ctn_type_code","relation":"ctn_type_code","type":"String"},"ctnno":{"define":"ctnno","label":"箱　　号：","name":"ctnno","relation":"ctnno","type":"String"},"id":{"define":"id","name":"id","relation":"id","type":"String"},"instruction_id":{"define":"instruction_id","label":"指令id","name":"instruction_id","relation":"instruction_id","type":"String"},"man":{"define":"man","label":"施 封 人 ：","name":"man","relation":"man","type":"String"},"status_zh":{"define":"status_zh","label":"状　　态：","name":"status_zh","relation":"status_zh","type":"String"}},"directDelete":false,"events":{},"idColumn":"instruction_id","initData":"[{}]","limit":20,"xid":"boxlist"});
 new __Data__(this,{"autoLoad":true,"confirmDelete":true,"confirmRefresh":true,"defCols":{"billno":{"define":"billno","label":"提单号","name":"billno","relation":"billno","type":"String"},"cargo_number":{"define":"cargo_number","label":"货物件数","name":"cargo_number","relation":"cargo_number","type":"String"},"cargo_picture":{"define":"cargo_picture","label":"货物照片","name":"cargo_picture","relation":"cargo_picture","type":"String"},"comment":{"define":"comment","label":"备注","name":"comment","relation":"comment","type":"String"},"createtime":{"define":"createtime","label":"开始时间","name":"createtime","relation":"createtime","type":"String"},"damage_explain":{"define":"damage_explain","label":"残损数量","name":"damage_explain","relation":"damage_explain","type":"String"},"damage_num":{"define":"damage_num","label":"残损数量","name":"damage_num","relation":"damage_num","type":"String"},"level_num":{"define":"level_num","label":"关数","name":"level_num","relation":"level_num","type":"String"}},"directDelete":false,"events":{},"idColumn":"level_num","initData":"[]","limit":20,"xid":"slingdetail"});
 new __Data__(this,{"autoLoad":true,"confirmDelete":true,"confirmRefresh":true,"defCols":{"id":{"define":"id","name":"id","relation":"id","type":"String"},"sys":{"define":"sys","label":"系统名称","name":"sys","relation":"sys","type":"String"}},"directDelete":false,"events":{},"idColumn":"id","initData":"[{\"id\":\"cfs\",\"sys\":\"cfs\"},{\"id\":\"qbzx\",\"sys\":\"起驳装箱\"},{\"id\":\"chaixiang\",\"sys\":\"chaixiang\"}]","limit":20,"xid":"system"});
 new __Data__(this,{"autoLoad":true,"confirmDelete":true,"confirmRefresh":true,"defCols":{"begin_time":{"define":"begin_time","label":"开始时间","name":"begin_time","relation":"begin_time","type":"String"},"cargo_weight":{"define":"cargo_weight","label":"货物重量","name":"cargo_weight","relation":"cargo_weight","type":"String"},"close_door_picture":{"define":"close_door_picture","label":"全关门照片（需要完整地址）","name":"close_door_picture","relation":"close_door_picture","type":"String"},"ctn_id":{"define":"ctn_id","label":"箱ID","name":"ctn_id","relation":"ctn_id","type":"String"},"empty_weight":{"define":"empty_weight","label":"空箱重量","name":"empty_weight","relation":"empty_weight","type":"String"},"halfclose_door_picture":{"define":"halfclose_door_picture","label":"半关门照片（需要完整地址）","name":"halfclose_door_picture","relation":"halfclose_door_picture","type":"String"},"id":{"define":"id","label":"作业ID","name":"id","relation":"id","type":"String"},"is_reservation":{"define":"is_reservation","label":"是否预约 Y是 N否","name":"is_reservation","relation":"is_reservation","type":"String"},"is_stop":{"define":"is_stop","label":"是否暂停 Y是N否","name":"is_stop","relation":"is_stop","type":"String"},"seal_picture":{"define":"seal_picture","label":"铅封照片（需要完整地址）","name":"seal_picture","relation":"seal_picture","type":"String"},"sealno":{"define":"sealno","label":"铅封号","name":"sealno","relation":"sealno","type":"String"},"step":{"define":"step","label":"步骤","name":"step","relation":"step","type":"String"},"tmp_sealno":{"define":"tmp_sealno","label":"临时铅封号","name":"tmp_sealno","relation":"tmp_sealno","type":"String"}},"directDelete":false,"events":{},"idColumn":"id","limit":20,"xid":"operationMsg"});
}}); 
return __result;});