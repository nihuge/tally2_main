<?php if (!defined('THINK_PATH')) exit(); require './Public/inc/status.config.php'; ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link rel="stylesheet" type="text/css" href="/Public/admin/css/pages.css">
	<script src="/Public/admin/js/jquery-1.js"></script>
	<script src="/Public/js/jquery.SuperSlide.2.1.1.js"></script>
	<script src="/Public/admin/js/base.js"></script>
	<script>
$(document).ready(function(){
	var innerHeight=window.innerHeight;
	var min_height=innerHeight-366;
	$("#wapper").css("min-height", min_height+'px');
});
</script>

</head>
<body>
	<link rel="stylesheet" type="text/css" href="/Public/admin/css/nff.css" />
<script type="text/javascript" src="/Public/admin/js/box.js"></script>
<script type="text/javascript" src="/Public/admin/js/nff.js"></script>
<script type="text/javascript" src="/Public/js/jquery.firstebox.pack.js"></script>
<link rel="stylesheet" type="text/css" href="/Public/css/firstebox.css" />
<style>
#wapper{
	margin-bottom: 5%;
}
.foot_w{
	position: fixed;
	bottom: 0px;
}
.foot_w .foot2 p a{
	font-color:#fff;
	color:#fff;
	font-size: 14px;
	text-decoration: none;
}
</style>
<?php
switch (CONTROLLER_NAME) { case 'QbzxPlan' : $hf2 = 'on'; break; case 'QbzxPlanCtn' : $hf2 = 'on'; break; case 'QbzxPlanCargo' : $hf2 = 'on'; break; case 'QbzxInstruction' : $hf2 = 'on'; break; case 'QbzxInstructionCtn' : $hf2 = 'on'; break; case 'QbzxOperation' : $hf2 = 'on'; break; case 'DdPlan' : $hf3 = 'on'; break; case 'DdInstruction' : $hf3 = 'on'; break; case 'DdOperation' : $hf3 = 'on'; break; case 'CfsInstruction' : $hf4 = 'on'; break; case 'CfsInstructionCargo' : $hf4 = 'on'; break; case 'CfsInstructionContainer' : $hf4 = 'on'; break; case 'Search' : $hf5 = 'on'; break; case 'QbzxSearch' : $hf5 = 'on'; break; case 'DdSearch' : $hf5 = 'on'; break; case 'CfsSearch' : $hf5 = 'on'; break; case 'QbzxSearch' : $hf5 = 'on'; break; case 'ShipSchedule' : $hf6 = 'on'; break; default : $hf1 = 'on'; break; } switch (CONTROLLER_NAME.'/'.ACTION_NAME) { case 'Index/personal' : $hf7 = 'on'; break; } ?>

<div class="top_w">
	<div class="top_bj">
		<img src="/Public/img/zjmls_01.png" alt="" />
	</div>
</div>

<div class="nav_w">
	<div class="navBar">
		<ul class="nav clearfix">
			<li class="m">
				<h3>
					<a href="/index.php?s=/Index/index">首页</a>
				</h3>
			</li>
			<li class="m <?php echo $hf2;?>">
				<h3>
					<a href="/index.php?s=/QbzxPlan/index">起驳装箱</a>
				</h3>
				<ul class="sub">
					<li><a href="/index.php?s=/QbzxPlan/index">查看预报</a></li>
					<li><a href="/index.php?s=/QbzxPlan/add">新增预报</a></li>
					<li><a href="/index.php?s=/QbzxInstruction/index">作业指令</a></li>
				</ul>
			</li>
			<li class="m <?php echo $hf3;?>">
				<h3>
					<a href="/index.php?s=/DdInstruction/index">拆箱系统</a>
				</h3>
				<ul class="sub">
					<li><a href="/index.php?s=/DdPlan/index">查看预报</a></li>
					<li><a href="/index.php?s=/DdPlan/add">新增预报</a></li>
					<li><a href="/index.php?s=/DdInstruction/index">作业指令</a></li>
				</ul>
			</li>
			<li class="m <?php echo $hf4;?>">
				<h3>
					<a href="/index.php?s=/CfsInstruction/index">CFS装箱</a>
				</h3>
				<ul class="sub">
					<li><a href="/index.php?s=/CfsInstruction/index">查看指令</a></li>
					<li><a href="/index.php?s=/CfsInstruction/add">新增指令</a></li>
				</ul>
			</li>
			<li class="m <?php echo $hf5;?>">
				<h3>
					<a href="/index.php?s=/Search/index">查询统计</a>
				</h3>
				<ul class="sub">
					<li><a href="/index.php?s=/Search/indexs" target="_blank">数据驾驶舱</a></li>
				</ul>
			</li>
			<li class="m <?php echo $hf6;?>">
				<h3>
					<a href="#" onclick="window.location.reload();">工班作业</a>
				</h3>
				<ul class="sub">
					<li><a href="/index.php?s=/Work/signin" class="box">工班签到</a></li>
			<?php
 if ($_SESSION ['u_group_id'] == 12 or $_SESSION ['u_group_id'] == 13) { echo '<li><a href="/index.php?s=/Work/succeed" class="box">接班开工</a></li>
					<li><a href="/index.php?s=/Work/transfer" class="box">收工交班</a></li>'; } if ($_SESSION ['u_group_id'] == 13) { echo '<li><a href="/index.php?s=/Work/resume">工班恢复</a></li>
		              <li><a href="/index.php?s=/Work/replaceMaster">替换当班理货长</a></li>'; } ?>
<!-- 			        <li><a href="/index.php?s=/ShipSchedule/index">船期维护</a></li> -->
				</ul>
			</li>
			<li class="m <?php echo $hf7;?>">
				<h3>
					<a href="#" onclick="window.location.reload();">用户中心</a>
				</h3>
				<ul class="sub">
				    <!-- <li><a href="/index.php?s=/User/login">用户登录</a></li> -->
					<li><a href="/index.php?s=/User/personal">个人信息</a></li>
					<li><a href="/index.php?s=/User/changepwd" class="box">修改密码</a></li>
					<li><a href="/Public/img/xiaza.png" class="firstebox">下载客户端</a></li>
					<li><a href="/index.php?s=/User/loginout">退出登录</a></li>
					<li><a href="/index.php?s=/Test/invoice">模拟发送门到门预报</a></li>
					<li><a href="/index.php?s=/Test/payment">模拟发送支付回执</a></li>
				</ul>
			</li>
		</ul>
	</div>
	<script type="text/javascript">
		jQuery(".nav").slide({ 
				type:"menu", //效果类型
				titCell:".m", // 鼠标触发对象
				targetCell:".sub", // 效果对象，必须被titCell包含
				delayTime:300, // 效果时间
				triggerTime:0, //鼠标延迟触发时间
				returnDefault:true  //返回默认状态
			});
	</script>
</div>
	<head>
<title>起驳装箱_分箱单证查询</title>
<script src="/Public/js/jquery.bigautocomplete.js"></script>
<link rel="stylesheet" href="/Public/css/jquery.bigautocomplete.css"
	type="text/css" />
<link rel="stylesheet" type="text/css" href="/Public/css/page.css" />
<link rel="stylesheet" type="text/css"
	href="/Public/admin/css/rule.css" />
<script type="text/javascript" src="/Public/js/my97/WdatePicker.js"></script>
<script type="text/javascript">
$(function(){
	$('.right_list2').find('table tbody tr:even').css('background','#fff');	
})
</script>
<style>
	.searchabc ul li{list-style:none;float:left;margin-left:30px;}
	.searchabc ul li a{text-decoration:none;color:#505050;line-height:60px;font-family:"新宋体";font-size:17px;background:#f0f0f0;border:1px solid #f0f0f0;border-radius:5px;padding:10px 5px;}
	.searchabc ul li a:hover{color:#fff;background:#3398db;}
</style>
</head>
	<div id="wapper">
		<div class="right">
			<div class="right_top" style="background: none; border: 0">
				<div class="right_l" style="font-size: 16px;">
					当前位置：<a href="/index.php?s=/Search/index">查询统计</a>&nbsp;&gt;&nbsp;分箱单证查询
				</div>
			</div>
			<div class="wrapper_o">
				<div style="min-height: 30px;width: 1176px; margin: 0 auto;">
					<div class="searchabc">
						<ul style="margin-left:-32px;">
							<li ><a href="/index.php?s=/QbzxSearch/ProveByCtn" style="background:#3398db;color:#fff;">分箱单证查询</a></li>
							<li ><a href="/index.php?s=/QbzxSearch/ProveByTicket">分票单证查询</a></li>
							<li ><a href="/index.php?s=/QbzxSearch/ProveByShip">分驳船单证查询</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="right_list2">
				<div class="addrule">
					<form class="select" action="" method="get">
					<input type="hidden" name="p" value="1">
					<input type="hidden" name="c" value="QbzxSearch">
					<input type="hidden" name="a" value="ProveByCtn">
						船名：<!-- <select class="input1" name="ship_name" style="width: 135px">
							<option value="">--默认全部--</option>
							<?php if(is_array($shiplist)): $i = 0; $__LIST__ = $shiplist;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$sl): $mod = ($i % 2 );++$i;?><option value="<?php echo ($sl['id']); ?>"><?php echo ($sl['ship_name']); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
						</select>-->
						<input type="text" name="ship_name" id='ship_name' class="input1"> 
						 &nbsp;&nbsp;&nbsp;&nbsp;
						航次：<input type="text" name="voyage" class="input1"> &nbsp;&nbsp;&nbsp;&nbsp;
						作业地点：
						<input type="text" name="location_name" id='location_name' class="input1">
						<!-- <select class="input1" name="location_name" style="width: 135px">
							<option value="">--默认全部--</option>
							<?php if(is_array($locationlist)): $i = 0; $__LIST__ = $locationlist;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$l): $mod = ($i % 2 );++$i;?><option value="<?php echo ($l['id']); ?>"><?php echo ($l['location_name']); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
						</select>-->&nbsp;&nbsp;&nbsp;&nbsp;
						集装箱号：<input type="text" name="ctnno" class="input1"><br> <br>
						整拼： <select class="input1" name="flflag"
							style="width: 135px">
							<option value="">--默认全部--</option>
							<option value="F">整箱</option>
							<option value="L">拼箱</option>
						</select> &nbsp;&nbsp;&nbsp;&nbsp;
						制单时间： 从 <input type="text" name="begin_time" class="input1 Wdate" onClick="WdatePicker()"
							style="width: 90px"> 到 <input type="text" name="end_time"
							class="input1 Wdate" onClick="WdatePicker()" style="width: 90px">
						&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="查询"
							style="background-color: #3398db !important; border-color: #3398db; color: #fff; font-size: 16px; text-align: center; padding: 3px 15px;">
					</form>
				</div>
				<div style="clear: both;"></div>
				<div class="row" style="margin-top: 10px">
					<div class="col-xs-12">
						<div>
							<table width="100%" class="table">
								<thead>
									<tr>
										<th>船名</th>
										<th>航次</th>
										<th>作业场地</th>
										<th>箱号</th>
										<th>箱型尺寸</th>
										<th>铅封号</th>
										<th>总票数</th>
										<th>总件数</th>
										<th>总重量</th>
										<th>总残损</th>
										<th>制单时间</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$l): $mod = ($i % 2 );++$i;?><tr>
										<td><?php echo ($l['ship_name']); ?></td>
										<td><?php echo ($l['voyage']); ?></td>
										<td><?php echo ($l['location_name']); ?></td>
										<td><?php echo ($l['ctnno']); ?></td>
										<td><?php echo ($l['ctn_type_code']); ?></td>
										<td><?php echo ($l['sealno']); ?></td>
										<td><?php echo ($l['total_ticket']); ?></td>
										<td><?php echo ($l['total_package']); ?></td>
										<td><?php echo ($l['total_weight']); ?></td>
										<td><?php echo ($l['damage_num']); ?></td>
										<td><?php echo ($l['createtime']); ?></td>
										<td>
										  <a href="/index.php?s=/QbzxSearch/ProveByCtnMsg/id/<?php echo ($l['id']); ?>">查看</a>
										</td>
									</tr><?php endforeach; endif; else: echo "" ;endif; ?>
								</tbody>
							</table>
							<div class="pages"><?php echo ($page); ?></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<script>
$("#ship_name").bigAutocomplete({
		width:135,
		data:[
			<?php
 foreach ($shiplist as $s) { echo '{title:"'.$s['ship_code'].'",show:"'.$s['ship_name'].'"},'; echo '{title:"'.$s['ship_name'].'",show:"'.$s['ship_name'].'"},'; } ?>
		],
		callback:function(data){

		}
	});
	$("#location_name").bigAutocomplete({
		width:160,
		data:[
			<?php  foreach ($locationlist as $l) { echo '{title:"'.$l['location_code'].'",show:"'.$l['location_name'].'"},'; echo '{title:"'.$l['location_name'].'",show:"'.$l['location_name'].'"},'; } ?>
		],
		callback:function(data){
			//alert(data.title);	
		}
	});
</script>
	<div class="foot_w">
    <div class="foot2">
      <p>版权所有  南京中理外轮理货有限公司   苏ICP备10220284号-1 <a href="http://new.xzitc.com" target="view_window">技术支持：携众信息</a></p>
    </div>
</div>
</body>