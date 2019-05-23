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
<title>门到门拆箱_预报计划列表</title>
<link rel="stylesheet" type="text/css" href="/Public/css/page.css" />
<link rel="stylesheet" type="text/css" href="/Public/admin/css/rule.css" />
<script src="/Public/js/jquery.bigautocomplete.js"></script>
<link rel="stylesheet" href="/Public/css/jquery.bigautocomplete.css" type="text/css" />
<script type="text/javascript">
$(function(){
	$('.right_list2').find('table tbody tr:even').css('background','#fff');	
})
</script>
</head>

<body>
	<div id="wapper">
		<div class="right">
			<div class="right_top" style="background: none; border: 0">
				<div class="right_l" style="font-size: 16px;">
					当前位置：拆箱系统</a>&nbsp;&gt;&nbsp;拆箱预报计划</a>
				</div>
			</div>
			<div class="right_list2">
				<a id="add" href="/index.php?s=/DdPlan/add" style="float: right; margin: -4px 10px 6px;">新增预报计划 </a>
				<a id="reload" class="box" href="/index.php?s=/DdPlan/reloadPage" style="float: right; margin: -4px 10px 6px;">查询龙潭cfs拆箱</a>
				<div style="clear: both;margin-bottom:10px"></div>
				<div class="row">
					<div class="col-xs-12">
						<div>
							<table width="100%" class="table">
								<thead>
									<tr>
										<th>委托编号</th>
										<th>船名</th>
										<th>航次</th>
										<th>申报公司名称</th>
										<th>所属业务系统</th>
										<th>运输条款</th>
										<th>拆箱类别</th>
										<th>委托日期</th>
										<th>预报状态</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$l): $mod = ($i % 2 );++$i;?><tr>
										<td><?php echo ($l['orderid']); ?></td>
										<td><?php echo ($l['vslname']); ?></td>
										<td><?php echo ($l['voyage']); ?></td>
										<td><?php echo ($l['applyname']); ?></td>
										<td>
										<?php if($l['business'] == 'cfs'): ?>CFS拆箱
										<?php elseif($l['business'] == 'dd'): ?>
											门到门拆箱<?php endif; ?>
										</td>
										<td><?php echo ($l['transit']); ?></td>
										<td>
										<?php if($l['category'] == '1'): ?>港内拆箱
										<?php elseif($l['category'] == '2'): ?>
											港外拆箱<?php endif; ?>
										</td>
										<td><?php echo ($l['orderdate']); ?></td>
										<td>
											<?php if($l['examine'] == 'N'): ?>未审核	
											<?php else: ?>
												通过<?php endif; ?>
										</td>
										<td>
										  <a href="/index.php?s=/DdPlan/edit/id/<?php echo ($l['id']); ?>">查看</a>
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
</body>

<script>
$(function(){
	$("#shipname").bigAutocomplete({
		width:160,
		data:[
			<?php  foreach ($shiplist as $s) { echo '{title:"'.$s['ship_code'].'",show:"'.$s['ship_name'].'"},'; echo '{title:"'.$s['ship_name'].'",show:"'.$s['ship_name'].'"},'; } ?>
		],
		callback:function(data){
			//alert(data.title);	
		}
	});
})
</script>
	<div class="foot_w">
    <div class="foot2">
      <p>版权所有  南京中理外轮理货有限公司   苏ICP备10220284号-1 <a href="http://new.xzitc.com" target="view_window">技术支持：携众信息</a></p>
    </div>
</div>
</body>