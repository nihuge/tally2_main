<head>
<title>拆箱系统_预报计划详情</title>
<link rel="stylesheet" type="text/css" href="__PUBLIC__/css/page.css" />
<link rel="stylesheet" type="text/css" href="__PUBLIC__/admin/css/rule.css" />
<link rel="stylesheet" type="text/css" href="__PUBLIC__/admin/css/nff.css" />
<script src="__PUBLIC__/js/jquery.bigautocomplete.js"></script>
<link rel="stylesheet" href="__PUBLIC__/css/jquery.bigautocomplete.css" type="text/css" />
<script type="text/javascript">
$(function(){
	$('.row').find('table tbody tr:even').css('background','#fff')	
});
</script>
<style>
#wapper,.right,.right_t {
	width: 1000px
}

.right_t table td .article {
	width: 150px
}
</style>
</head>
<body>
	<div id="wapper">
		<div class="right">
			<div class="right_top" style="background: none; border: 0">
				<div class="right_l" style="font-size: 16px;">
					当前位置：查询统计</a>&nbsp;&gt;&nbsp;拆箱系统预报计划</a>
				</div>
			</div>

			<div class="right_t" style="text-align: center;">
				<form action="__ACTION__" method="post">
					<input type="hidden" name="plan_id" value="{$msg['id']}"/>
					<table style="margin: 0 auto; width: 890px">
						<tr>
							<td height="36" width="110" align="right" valign="middle">委托编号：</td>
							<td>
								<input type="text" class="article" value="{$msg['orderid']}" readonly >
							</td>

							<td height="36" width="110" align="right" valign="middle">委托日期：</td>
							<td>
								<input type="text" class="article" value="{$msg['orderdate']}" readonly>
							</td>

							<td height="36" width="110" align="right" valign="middle"><span style="color:red">*</span>船名：</td>
							<td>
								<input type="text" class="article" name="VSLNAME" id="shipname" required="required" value="{$msg['vslname']}" >
							</td>
						</tr>

						<tr>
							<td height="36" width="110" align="right" valign="middle"><span style="color:red">*</span>航次：</td>
							<td>
								<input type="text" class="article" name='VOYAGE' value="{$msg['voyage']}"  required="required" >
							</td>

							<td height="36" width="110" align="right" valign="middle">申报公司代码：</td>
							<td>
								<input type="text" class="article" value="{$msg['applycode']}" readonly>
							</td>
							<td height="36" width="110" align="right" valign="middle">申报公司名称：</td>
							<td>
								<input type="text" class="article" value="{$msg['applyname']}" readonly>
							</td>
						</tr>

						<tr>
							<td height="36" align="right" valign="middle"><span style="color:red">*</span>业务系统：</td>
							<td>
								<span class="help-inline col-xs-12 col-sm-7">
									<label class="middle">
									<input id="id-disable-check" name="BUSINESS" value="dd" type="radio" <?php echo $msg['business']=='dd' ? checked :'';?>>
									<span class="lbl" style="color:black">门到门拆箱</span>
									</label>
								</span>&nbsp;&nbsp;
								<span class="help-inline col-xs-12 col-sm-7">
									<label class="middle">
									<input id="id-disable-check" name="BUSINESS" value="cfs" type="radio" <?php echo $msg['business']=='cfs' ? checked :'';?>>
									<span class="lbl" style="color:black">CFS拆箱</span>
									</label>
								</span>
							</td>	
							<td height="36" width="110" align="right" valign="middle">拆箱方式：</td>
							<td>
								<input type="text" class="article" value="{$msg['operating_type_zh']}" readonly>
							</td>
							<td height="36" width="110" align="right" valign="middle"><span style="color:red">*</span>拆箱地点：</td>
							<td>
								<input type="text" class="article" name="location_name"
								id="location_name" required="required" autocomplete="off"
								style="text-transform: uppercase;" value="{$msg['unpackagingplace']}"/>
							</td>
						</tr>
						<tr>
							<td height="36" width="110" align="right" valign="middle">运输条款：</td>
							<td>
								<input type="text" class="article" value="{$msg['transit']}" readonly>
							</td>
						</tr>
						<tr>
							<td height="36" width="110" align="right" valign="top"><span style="color:red">*</span>备注：</td>
							<td colspan="5">
								<textarea class="article" name="NOTE" style="width: 690px; height: 100px" >{$msg['note']}</textarea>
							</td>
						</tr>
						<tr style="text-align: right;">
							<td colspan="6">
								<if condition="$msg['examine'] != 'Y'">
									<input type="submit" class="qr" value="确&nbsp;认" />&nbsp;&nbsp;&nbsp;
									<input type="reset" class="qr" value="重&nbsp;置" />
									<a onclick="return confirm('你确认要审核通过该预报信息吗？');" href="__CONTROLLER__/examine/plan_id/{$msg['id']}" style="background-color: #f1691e; border-color: rgb(213, 213, 213); color: rgb(255, 255, 255); font-size: 16px; text-align: center; padding: 3px 15px;">通过</a>
								</if>
								</td>
						</tr>
					</table>
				</form>

				<div style="clear: both; margin-top: 10px"></div>

				<div class="row">
					<div class="col-xs-12">
						<div>
							<table class="table" style="margin: 0 auto; text-align: center;width:850px">
								<thead>
									<tr>
										<th>提单号</th>
										<th>付费方名称</th>
										<th>货名</th>
										<th>包装</th>
										<th>件数</th>
										<th>标志</th>
										<th>收货人</th>
										<th>危险等级</th>
										<th>联合国编号</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<volist name="cargolist" id="c">
									<tr>
										<td>{$c['blno']}</td>
										<td>{$c['payman']}</td>
										<td>{$c['cargoname']}</td>
										<td>{$c['package']}</td>
										<td>{$c['numbersofpackages']}</td>
										<td>{$c['mark']}</td>
										<td>{$c['consignee']}</td>
										<td>{$c['classes']}</td>
										<td>{$c['undgno']}</td>
										<td>
										<if condition="$msg['examine'] != 'Y'">
										<a class="box"
											href="__MODULE__/DdPlanCargo/edit/id/{$c['id']}">查看/修改</a> | <a
											onclick="return confirm('删除是不可恢复的，你确认要删除该配货吗？');"
											href="__MODULE__/DdPlanCargo/del/id/{$c['id']}/plan_id/{$c['plan_id']}/id/{$c['id']}">删除</a>
										</if>
										</td>
									</tr>
									</volist>
									<tr>
										<td colspan="10"><a class="box"
											href="__MODULE__/DdPlanCargo/add/plan_id/{$msg['id']}"
											id="add">新增配货</a></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div style="clear: both; margin-bottom: 10px"></div>
				<div style="clear: both; margin-top: 10px"></div>
				<div class="row">
					<div class="col-xs-12">
						<div>
							<table class="table" style="margin: 0 auto; text-align: center;width:850px">
							<thead>
									<tr>
										<th>序号</th>
										<th>箱号</th>
										<th>箱尺寸</th>
										<th>箱型</th>
										<th>铅封号</th>
										<th>件数</th>
										<th>重量</th>
										<th>体积</th>
										<th>集装箱状态</th>
										<th>危险品等级</th>
										<th>联合国编号</th>
										<th>箱状态</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<?php $n=0;?>
									<volist name="plancontainerlist" id="c">
									<tr>
									<?php $n++;?>
									    <td>{$n}</td>
										<td>{$c['ctnno']}</td>
										<td>{$c['ctnsize']}</td>
										<td>{$c['ctntype']}</td>
										<td>{$c['sealno']}</td>
										<td>{$c['numbersofpackages']}</td>
										<td>{$c['weight']}</td>
										<td>{$c['volume']}</td>
										<td>
										<?php 
										if($c['flflag']=='F')
										{
											echo '整箱';
										}else {
											echo '拼箱';
										}
										?>
										</td>
										<td>{$c['classes']}</td>
										<td>{$c['undgno']}</td>
										<td>
										<?php 
										switch ($c['status'])
										{
											case '0':
												echo '未作业';
												break;
											case '1':
												echo '工作中';
												break;
											case '2':
												echo '工作完成';
												break;
											case '-1':
												echo '箱残损';
												break;
										}
										?>
										</td>
										<td>
										<if condition="$msg['examine'] != 'Y'">
										<a class="box"
											href="__MODULE__/DdPlanContainer/edit/id/{$c['id']}">查看 | 修改</a>
											| <a onclick="return confirm('删除是不可恢复的，你确认要删除该配箱吗？');"
											href="__MODULE__/DdPlanContainer/del/id/{$c['id']}">删除</a>
											</if>
											</td>
									</tr>
									</volist>
									<tr>
										<td colspan="13"><a class="box"
											href="__MODULE__/DdPlanContainer/add/plan_id/{$msg['id']}"
											id="add">新增配箱</a></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div style="clear: both; margin-bottom: 10px"></div>
			</div>
			</div>
		</div>
	</div>
</body>
<script>
$(function(){
	$("#location_name").bigAutocomplete({
		width:160,
		data:[
			<?php 
			foreach ($locationlist as $l)
			{
				echo '{title:"'.$l['location_code'].'",show:"'.$l['location_name'].'"},';
				echo '{title:"'.$l['location_name'].'",show:"'.$l['location_name'].'"},';
			}
			?>
		],
		callback:function(data){
			//alert(data.title);	
		}
	});
	$("#shipname").bigAutocomplete({
		width:160,
		data:[
			<?php 
			foreach ($shiplist as $s)
			{
				echo '{title:"'.$s['ship_code'].'",show:"'.$s['ship_name'].'"},';
				echo '{title:"'.$s['ship_name'].'",show:"'.$s['ship_name'].'"},';
			}
			?>
		],
		callback:function(data){
			//alert(data.title);	
		}
	});
})
</script>