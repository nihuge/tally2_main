window.__justep.__ResourceEngine.loadCss([{url: '/system/components/comp.min.css', include: '$model/system/components/justep/row/css/row,$model/system/components/justep/attachment/css/attachment,$model/system/components/justep/barcode/css/barcodeImage,$model/system/components/bootstrap/form/css/form,$model/system/components/justep/panel/css/panel,$model/system/components/bootstrap/accordion/css/accordion,$model/system/components/justep/common/css/scrollable,$model/system/components/bootstrap/pager/css/pager,$model/system/components/justep/scrollView/css/scrollView,$model/system/components/justep/input/css/datePickerPC,$model/system/components/bootstrap/navs/css/navs,$model/system/components/justep/contents/css/contents,$model/system/components/justep/popMenu/css/popMenu,$model/system/components/justep/lib/css/icons,$model/system/components/justep/titleBar/css/titleBar,$model/system/components/justep/dataTables/css/dataTables,$model/system/components/justep/dialog/css/dialog,$model/system/components/justep/messageDialog/css/messageDialog,$model/system/components/bootstrap/navbar/css/navbar,$model/system/components/justep/toolBar/css/toolBar,$model/system/components/justep/popOver/css/popOver,$model/system/components/justep/loadingBar/loadingBar,$model/system/components/justep/input/css/datePicker,$model/system/components/justep/dataTables/css/dataTables,$model/system/components/bootstrap/dialog/css/dialog,$model/system/components/justep/wing/css/wing,$model/system/components/bootstrap/scrollSpy/css/scrollSpy,$model/system/components/justep/menu/css/menu,$model/system/components/justep/numberSelect/css/numberList,$model/system/components/justep/list/css/list,$model/system/components/bootstrap/carousel/css/carousel,$model/system/components/bootstrap/dropdown/css/dropdown,$model/system/components/justep/common/css/forms,$model/system/components/justep/bar/css/bar,$model/system/components/bootstrap/tabs/css/tabs,$model/system/components/bootstrap/pagination/css/pagination'},{url: '/system/components/bootstrap.min.css', include: '$model/system/components/bootstrap/lib/css/bootstrap,$model/system/components/bootstrap/lib/css/bootstrap-theme'}]);window.__justep.__ResourceEngine.loadJs(['/system/components/comp.min.js','/system/common.min.js','/system/core.min.js']);define(function(require){
require('$model/UI2/system/components/justep/loadingBar/loadingBar');
require('$model/UI2/system/components/justep/labelEdit/labelEdit');
require('$model/UI2/system/components/justep/row/row');
require('$model/UI2/system/components/justep/panel/panel');
require('$model/UI2/system/components/justep/list/list');
require('$model/UI2/system/components/justep/window/window');
require('$model/UI2/system/components/justep/data/data');
require('$model/UI2/system/components/justep/titleBar/titleBar');
require('$model/UI2/system/components/justep/contents/contents');
require('$model/UI2/system/components/justep/panel/child');
require('$model/UI2/system/components/justep/scrollView/scrollView');
require('$model/UI2/system/components/justep/contents/content');
require('$model/UI2/system/components/justep/messageDialog/messageDialog');
require('$model/UI2/system/components/justep/model/model');
require('$model/UI2/system/components/justep/button/button');
require('$model/UI2/system/components/justep/output/output');
var __parent1=require('$model/UI2/system/lib/base/modelBase'); 
var __parent0=require('$model/UI2/costacoSecond/CFS/working'); 
var __result = __parent1._extend(__parent0).extend({
	constructor:function(contextUrl){
	this.__sysParam='true';
	this.__contextUrl=contextUrl;
	this.__id='__baseID__';
	this.__cid='cBfQVbi';
	this._flag_='e7ab08886cbf40f7e1af9bd9dd3db6ed';
	this.callParent(contextUrl);
 var __Data__ = require("$UI/system/components/justep/data/data");new __Data__(this,{"autoLoad":true,"confirmDelete":true,"confirmRefresh":true,"defCols":{"business":{"define":"business","label":"业务系统","name":"business","relation":"business","type":"String"},"cargonumber":{"define":"cargonumber","label":"货物数量","name":"cargonumber","relation":"cargonumber","type":"String"},"damageno":{"define":"damageno","label":"残损数字","name":"damageno","relation":"damageno","type":"String"},"levelpictureid":{"define":"levelpictureid","label":"作业明细编号","name":"levelpictureid","relation":"levelpictureid","type":"String"},"operationid":{"define":"operationid","label":"作业表编号","name":"operationid","relation":"operationid","type":"String"},"orderno":{"define":"orderno","label":"单号","name":"orderno","relation":"orderno","type":"String"},"picture":{"define":"picture","label":"每关照片","name":"picture","relation":"picture","type":"String"},"sling":{"define":"sling","label":"关数","name":"sling","relation":"sling","type":"String"}},"directDelete":false,"events":{},"idColumn":"levelpictureid","limit":20,"xid":"sling"});
 new __Data__(this,{"autoLoad":false,"autoNew":false,"confirmDelete":false,"confirmRefresh":false,"defCols":{"cargo_weight":{"define":"cargo_weight","label":"货物重量：","name":"cargo_weight","relation":"cargo_weight","type":"String"},"containermaster":{"define":"containermaster","label":"箱主代码：","name":"containermaster","relation":"containermaster","type":"String"},"containerno":{"define":"containerno","label":"集装箱号：","name":"containerno","relation":"containerno","type":"String"},"ctn_size":{"define":"ctn_size","label":"箱型尺寸：","name":"ctn_size","relation":"ctn_size","type":"String"},"ctnno":{"define":"ctnno","label":"箱　　号：","name":"ctnno","relation":"ctnno","type":"String"},"examine_remark":{"define":"examine_remark","label":"审核不通过原因","name":"examine_remark","relation":"examine_remark","type":"String"},"guan":{"define":"guan","label":"关数：","name":"guan","relation":"guan","rules":{"integer":true},"type":"Integer"},"id":{"define":"id","label":"箱ID","name":"id","relation":"id","type":"String"},"instruction_id":{"define":"instruction_id","label":"指令编号：","name":"instruction_id","relation":"instruction_id","type":"String"},"is_begin":{"define":"is_begin","label":"是否开始作业","name":"is_begin","relation":"is_begin","type":"String"},"is_level":{"define":"is_level","label":"是否开始录关","name":"is_level","relation":"is_level","type":"String"},"is_must":{"define":"is_must","label":"是否必须做","name":"is_must","relation":"is_must","rules":{"integer":true},"type":"Integer"},"is_stop":{"define":"is_stop","label":"是否暂停","name":"is_stop","relation":"is_stop","type":"String"},"kximg":{"define":"kximg","label":"是否拍摄空箱：","name":"kximg","relation":"kximg","rules":{"integer":true},"type":"Integer"},"lcl_zh":{"define":"lcl_zh","label":"装箱方式：","name":"lcl_zh","relation":"lcl_zh","type":"String"},"numbersofpackages":{"define":"numbersofpackages","label":"件　　数：","name":"numbersofpackages","relation":"numbersofpackages","type":"String"},"operation_examine":{"define":"operation_examine","label":"审核状态标志","name":"operation_examine","relation":"operation_examine","type":"String"},"operation_id":{"define":"operation_id","label":"作业表id：","name":"operation_id","relation":"operation_id","type":"String"},"operation_type_zh":{"define":"operation_type_zh","label":"装箱方式","name":"operation_type_zh","relation":"operation_type_zh","type":"String"},"qbjobcontainerid":{"define":"qbjobcontainerid","label":"qbjobcontainerid","name":"qbjobcontainerid","relation":"qbjobcontainerid","type":"String"},"sealno":{"define":"sealno","label":"铅封号：","name":"sealno","relation":"sealno","type":"String"},"status":{"define":"status","label":"状　　态：","name":"status","relation":"status","rules":{"integer":true},"type":"Integer"},"status_zh":{"define":"status_zh","label":"中文状态","name":"status_zh","relation":"status_zh","type":"String"},"step":{"define":"step","label":"操作步骤","name":"step","relation":"step","rules":{"integer":true},"type":"Integer"},"tmp_sealno":{"define":"tmp_sealno","label":"临时铅封","name":"tmp_sealno","relation":"tmp_sealno","type":"String"},"zhstatus":{"define":"zhstatus","label":"作业状态：","name":"zhstatus","relation":"zhstatus","type":"String"}},"directDelete":false,"events":{"onCustomRefresh":"doDataCustomRefresh"},"idColumn":"qbjobcontainerid","limit":10,"xid":"doData"});
 new __Data__(this,{"autoLoad":false,"autoNew":true,"confirmDelete":false,"confirmRefresh":false,"defCols":{"cargo_weight":{"define":"cargo_weight","label":"货物重量：","name":"cargo_weight","relation":"cargo_weight","type":"String"},"containermaster":{"define":"containermaster","label":"箱主代码：","name":"containermaster","relation":"containermaster","type":"String"},"containerno":{"define":"containerno","label":"集装箱号：","name":"containerno","relation":"containerno","type":"String"},"ctn_size":{"define":"ctn_size","label":"箱型尺寸：","name":"ctn_size","relation":"ctn_size","type":"String"},"ctnno":{"define":"ctnno","label":"箱　　号：","name":"ctnno","relation":"ctnno","type":"String"},"examine_remark":{"define":"examine_remark","label":"审核不通过原因","name":"examine_remark","relation":"examine_remark","type":"String"},"guan":{"define":"guan","label":"关数：","name":"guan","relation":"guan","rules":{"integer":true},"type":"Integer"},"id":{"define":"id","label":"箱ID","name":"id","relation":"id","type":"String"},"instruction_id":{"define":"instruction_id","label":"指令编号：","name":"instruction_id","relation":"instruction_id","type":"String"},"is_begin":{"define":"is_begin","label":"是否开始作业","name":"is_begin","relation":"is_begin","type":"String"},"is_level":{"define":"is_level","label":"是否开始录关","name":"is_level","relation":"is_level","type":"String"},"is_must":{"define":"is_must","label":"是否必须做","name":"is_must","relation":"is_must","rules":{"integer":true},"type":"Integer"},"is_reservation":{"define":"is_reservation","label":"是否预约铅封","name":"is_reservation","relation":"is_reservation","type":"String"},"is_stop":{"define":"is_stop","label":"是否暂停","name":"is_stop","relation":"is_stop","type":"String"},"kximg":{"define":"kximg","label":"是否拍摄空箱：","name":"kximg","relation":"kximg","rules":{"integer":true},"type":"Integer"},"lcl_zh":{"define":"lcl_zh","label":"装箱方式：","name":"lcl_zh","relation":"lcl_zh","type":"String"},"numbersofpackages":{"define":"numbersofpackages","label":"件　　数：","name":"numbersofpackages","relation":"numbersofpackages","type":"String"},"operation_examine":{"define":"operation_examine","label":"审核状态标志","name":"operation_examine","relation":"operation_examine","type":"String"},"operation_id":{"define":"operation_id","label":"作业表id：","name":"operation_id","relation":"operation_id","type":"String"},"operation_type_zh":{"define":"operation_type_zh","label":"装箱方式","name":"operation_type_zh","relation":"operation_type_zh","type":"String"},"qbjobcontainerid":{"define":"qbjobcontainerid","label":"qbjobcontainerid","name":"qbjobcontainerid","relation":"qbjobcontainerid","type":"String"},"sealno":{"define":"sealno","label":"铅封号：","name":"sealno","relation":"sealno","type":"String"},"showHide":{"define":"showHide","label":"显示隐藏控件","name":"showHide","relation":"showHide","type":"Boolean"},"status":{"define":"status","label":"状　　态：","name":"status","relation":"status","rules":{"integer":true},"type":"Integer"},"status_zh":{"define":"status_zh","label":"中文状态","name":"status_zh","relation":"status_zh","type":"String"},"step":{"define":"step","label":"操作步骤","name":"step","relation":"step","rules":{"integer":true},"type":"Integer"},"tmp_sealno":{"define":"tmp_sealno","label":"临时铅封","name":"tmp_sealno","relation":"tmp_sealno","type":"String"},"zhstatus":{"define":"zhstatus","label":"作业状态：","name":"zhstatus","relation":"zhstatus","type":"String"}},"directDelete":false,"events":{"onCustomRefresh":"doingDataCustomRefresh"},"idColumn":"qbjobcontainerid","initData":"[]","limit":20,"xid":"doingData"});
 new __Data__(this,{"autoLoad":false,"autoNew":false,"confirmDelete":false,"confirmRefresh":false,"defCols":{"cargo_weight":{"define":"cargo_weight","label":"货物重量：","name":"cargo_weight","relation":"cargo_weight","type":"String"},"containermaster":{"define":"containermaster","label":"箱主代码：","name":"containermaster","relation":"containermaster","type":"String"},"containerno":{"define":"containerno","label":"集装箱号：","name":"containerno","relation":"containerno","type":"String"},"ctn_size":{"define":"ctn_size","label":"箱型尺寸：","name":"ctn_size","relation":"ctn_size","type":"String"},"ctnno":{"define":"ctnno","label":"箱　　号：","name":"ctnno","relation":"ctnno","type":"String"},"examine_remark":{"define":"examine_remark","label":"审核不通过原因","name":"examine_remark","relation":"examine_remark","type":"String"},"guan":{"define":"guan","label":"关数：","name":"guan","relation":"guan","rules":{"integer":true},"type":"Integer"},"id":{"define":"id","label":"箱ID","name":"id","relation":"id","type":"String"},"instruction_id":{"define":"instruction_id","label":"指令编号：","name":"instruction_id","relation":"instruction_id","type":"String"},"is_begin":{"define":"is_begin","label":"是否开始作业","name":"is_begin","relation":"is_begin","type":"String"},"is_level":{"define":"is_level","label":"是否开始录关","name":"is_level","relation":"is_level","type":"String"},"is_must":{"define":"is_must","label":"是否必须做","name":"is_must","relation":"is_must","rules":{"integer":true},"type":"Integer"},"is_stop":{"define":"is_stop","label":"是否暂停","name":"is_stop","relation":"is_stop","type":"String"},"kximg":{"define":"kximg","label":"是否拍摄空箱：","name":"kximg","relation":"kximg","rules":{"integer":true},"type":"Integer"},"lcl_zh":{"define":"lcl_zh","label":"装箱方式：","name":"lcl_zh","relation":"lcl_zh","type":"String"},"numbersofpackages":{"define":"numbersofpackages","label":"件　　数：","name":"numbersofpackages","relation":"numbersofpackages","type":"String"},"operation_examine":{"define":"operation_examine","label":"审核状态标志","name":"operation_examine","relation":"operation_examine","type":"String"},"operation_id":{"define":"operation_id","label":"作业表id：","name":"operation_id","relation":"operation_id","type":"String"},"operation_type_zh":{"define":"operation_type_zh","label":"装箱方式","name":"operation_type_zh","relation":"operation_type_zh","type":"String"},"qbjobcontainerid":{"define":"qbjobcontainerid","label":"qbjobcontainerid","name":"qbjobcontainerid","relation":"qbjobcontainerid","type":"String"},"sealno":{"define":"sealno","label":"铅封号：","name":"sealno","relation":"sealno","type":"String"},"status":{"define":"status","label":"状　　态：","name":"status","relation":"status","rules":{"integer":true},"type":"Integer"},"status_zh":{"define":"status_zh","label":"中文状态","name":"status_zh","relation":"status_zh","type":"String"},"step":{"define":"step","label":"操作步骤","name":"step","relation":"step","rules":{"integer":true},"type":"Integer"},"tmp_sealno":{"define":"tmp_sealno","label":"临时铅封","name":"tmp_sealno","relation":"tmp_sealno","type":"String"},"zhstatus":{"define":"zhstatus","label":"作业状态：","name":"zhstatus","relation":"zhstatus","type":"String"}},"directDelete":false,"events":{"onCustomRefresh":"doneDataCustomRefresh"},"idColumn":"qbjobcontainerid","limit":20,"xid":"doneData"});
}}); 
return __result;});
