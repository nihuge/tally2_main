<head>
<title>拆箱系统_实时作业详情</title>
<link rel="stylesheet" type="text/css" href="__PUBLIC__/css/page.css" />
<link rel="stylesheet" type="text/css" href="__PUBLIC__/admin/css/rule.css" />
<script type="text/javascript" src="__PUBLIC__/js/jquery.firstebox.pack.js"></script>
<script src="__PUBLIC__/layer/layer.js"></script>
<script src="__PUBLIC__/admin/js/showphoto.js"></script>
<style type="text/css" media="all">
@import "__PUBLIC__/css/firstebox.css";
#wapper, .right, .right_t, .right_list2, .row table {
	width: 1000px
}
</style>
<script type="text/javascript">
$(function(){
	$('.row').find('table tbody tr:even').css('background','#fff')	
})
</script>
</head>

	<div id="wapper">
		<div class="right">
			<div class="right_top" style="background: none; border: 0;">
				<div class="right_l" style="font-size: 16px;">
					当前位置：<a href="__MODULE__/Search/index">查询统计</a>&nbsp;&gt;&nbsp;门到门拆箱&nbsp;&gt;&nbsp;<a href="__MODULE__/DdSearch/real_time">实时作业查询</a>&nbsp;&gt;&nbsp;实时作业详情
				</div>
			</div>

			<div class="right_t">
				<div class="amsg">
					<p>船名：{$planMsg['vslname']}&nbsp;&nbsp;&nbsp;&nbsp;
					       航次：{$planMsg['voyage']}&nbsp;&nbsp;&nbsp;&nbsp;
					       拆箱地点：{$planMsg['unpackagingplace']}&nbsp;&nbsp;&nbsp;&nbsp;
					       包装：{$planMsg['package']}&nbsp;&nbsp;&nbsp;&nbsp;
					       标志：{$planMsg['mark']}&nbsp;&nbsp;&nbsp;&nbsp;
					       开始时间：{$operationMsg['begin_time']}&nbsp;&nbsp;&nbsp;&nbsp;
					</p>
					<p>箱号：{$msg['ctnno']}&nbsp;&nbsp;&nbsp;
					       箱型尺寸：{$msg['ctnsize']}{$msg['ctntype']}&nbsp;&nbsp;&nbsp;
					   <?php
						if ($operationMsg ['door_picture']) 
                        {
							echo '<span>（<a layer-href=".'.IMAGE_DD_DOOR.$operationMsg ['door_picture'].'" class=""><span class="showphoto">查看箱门照片</span></a>）</span>';
						}
						?>  
						<?php
						if ($operationMsg ['seal_picture']) 
                        {
							echo '<span>（<a layer-href=".'.IMAGE_DD_SEAL.$operationMsg ['seal_picture'].'" class=""><span class="showphoto">查看铅封照片</span></a>）</span>';
						}
						?>
						<?php
						if ($operationMsg ['cargo_picture']) 
                        {
							echo '<span>（<a layer-href=".'.IMAGE_DD_CARGO.$operationMsg ['cargo_picture'].'" class=""><span class="showphoto">查看货物照片</span></a>）</span>';
						}
						?>
						<?php
						if ($operationMsg ['empty_picture']) 
                        {
							echo '<span>（<a layer-href=".'.IMAGE_DD_EMPTY.$operationMsg ['empty_picture'].'" class=""><span class="showphoto">查看空箱照片</span></a>）</span>';
						}
						?> 
					    <?php
							$n = count ( $operationMsg['ctn_damage_img'] );
							if ($n > 0)
                            {
                            	echo '（';
                            	for($i = 0; $i < $n; $i ++)
                                {
                                	echo '<span><a layer-href=".'.IMAGE_DD_DAMAGE. $operationMsg['ctn_damage_img'] [$i] ['img'].'" class="" rel="ctn_damage_img"><span class="showphoto">';
                                	if ($i == 0)
                                    {
                                    	echo '查看残损照片';
                                    }
                                    echo '</span></a></span>';
                                }
                                echo '）';
                             }
						?>
						</p>
				</div>

				<div class="row" style="text-align: center">
					<div class="col-xs-12">
						<table class="table"
							style="margin-left: 35px; margin-top: 10px; width: 950px">
							<thead>
								<tr>
									<th>关序号</th>
									<th>提单号</th>
									<th>货物件数</th>
									<th>残损件数</th>
									<th>理货员</th>
									<th>操作时间</th>
								</tr>
							</thead>
							<tbody>
								<volist name="levellist" id="l">
								<tr>
									<td>{$l['level_num']}</td>
									<td>{$l['blno']}</td>
									<td>{$l['num']}
										<?php
												$n = count ( $l ['cargo_level_img'] );
												if ($n > 0) {
													echo '（';
													for($i = 0; $i < $n; $i ++) {
														echo '<span><a layer-href=".'.IMAGE_DD_CARGO. $l ['cargo_level_img'] [$i] ['level_img'].'" class="" rel="gallery' . $l ['level_num'] . '"><span class="showphoto">';
														if ($i == 0) {
															echo '查看货照片';
														}
														echo '</span></a></span>';
													}
													echo '）';
												}else{
													echo '暂无';
												}
												?>
									</td>
									<td>{$l['damage_num']}
									<?php
									$n = count ( $l ['cargo_damage_img'] );
									if ($n > 0) {
										echo '（';
										for($i = 0; $i < $n; $i ++) {
											echo '<span><a layer-href=".'.IMAGE_DD_CDAMAGE.$l ['cargo_damage_img'] [$i] ['img'].'" class="" rel="gallery' . $l ['level_num'] . '"><span class="showphoto">';
											if ($i == 0) {
												echo '查看残损照片';
											}
											echo '</span></a></span>';
										}
										echo '）';
									}
									?></td>
									<td>{$l['user_name']}</td>
									<td>{$l['createtime']}</td>
								</tr>
								</volist>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>