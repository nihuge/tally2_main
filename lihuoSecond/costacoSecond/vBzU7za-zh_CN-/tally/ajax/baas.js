
//内网http://192.168.1.92/tally/app.php
//外网http://121.41.22.2/tally/app.php
//http://192.168.1.92/tally2test/index.php?s=/CfsInstruction/edit/id/314
//var interface_url = 'http://192.168.1.92/tally2test/app.php';//起驳测试
var interface_url = 'http://192.168.1.92/tally2perfect/app.php';//门到门测试
//var imgUrl = "http://192.168.1.92/tally2"; //门到门测试图片路径
//起驳图片相关路径
var imgUrl = "http://192.168.1.92/tally2perfect"; 
var completeImgUrl = "http://192.168.1.92/tally2perfect/Public/upload/qbzx/cdamage/";
var completeImgEmptyPicUrl = "http://192.168.1.92/tally2perfect/Public/upload/qbzx/empty/";
//cfs图片相关路劲
var cdamageCFS = imgUrl+ "/Public/upload/cfs/cdamage/";
var sealPicCFS = imgUrl+ "/Public/upload/cfs/seal/";
var sealcargoCFS = imgUrl+ "/Public/upload/cfs/cargo/";
var emptyCFS = imgUrl+ "/Public/upload/cfs/empty/";
var doorPicCFS = imgUrl+ "/Public/upload/cfs/closedoor/";
var halfdoorPicCFS = imgUrl+ "/Public/upload/cfs/halfclosedoor/";
//门到门图片路劲
var cargodd = imgUrl+ "/Public/upload/dd/cargo/";
var cdamagedd = imgUrl+ "/Public/upload/dd/cdamage/";
var damageAfterdd = imgUrl+ "/Public/upload/dd/damageAfter/";
var damagedd = imgUrl+ "/Public/upload/dd/damage/";
var doordd = imgUrl+ "/Public/upload/dd/door/";
var sealdd = imgUrl+ "/Public/upload/dd/seal/";
var emptydd = imgUrl+ "/Public/upload/dd/empty/";
//调试模式开关
var debugMode = false;

//是否打印返回值
var dataType = "json"; //"json"&"html"
var PrintReturnValue = false;


//指令状态配置（指令状态 0.未派工 1.已派工 3.已完成）
var nodispatch = 0;
var dispatched = 1;
var donedispach = 3;

//箱状态配置（0.未开始 1.工作中 3.已铅封-1.箱残损）
var nostart = 0;
var workin = 1;
var finished = 2;
var damage = -1;
