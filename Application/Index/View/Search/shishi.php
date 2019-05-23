<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title></title>
	<style>
		*{padding: 0px;margin:0px;}
		body{width: 100%;}
		.content{width: 1050px;margin: auto auto;}
		.real{width: 940px;margin: 38px auto;text-align: center;padding: 20px 20px;}
		.img{ width: 220px;height: 215px;z-index: 10;display: inline-block;vertical-align: middle;margin: 20px 50px;}
		.p1{font-size: 65px;margin-top: 45px;line-height:70px;font-family:"黑体";}
		.p2{font-size: 16px;border-bottom: 1px dotted #b2b2b1;width: 120px;margin: auto auto;font-family:"微软雅黑";padding: 0px 0px 5px;color:#666666;}
		.img img{width: 22px;height: 22px;margin:5px;vertical-align: middle;}
		span{display: inline-block;margin-top: 5px;color: red;vertical-align: middle;margin-bottom: 5px;font-size: 22px;margin-left: 10px;}
		a:link,a:visited,a:hover,a:active{text-decoration: none;color:black;}
	</style>
</head>
<body>
	<div class="content">
		<div id="timer" style="font-size:16px;padding: 5px 15px;text-align: center;font-family:'微软雅黑'; color: #999999;margin-top: 30px;">
		</div>
		<div class="real">
			<a href="{:U('QbzxSearch/RealTime')}" target='_blank'>
			<div class="img" style="background:url(__PUBLIC__/images/qibo_bg.png);background-size:220px 215px;" >
				<p class='p1' style='color:#00a1eb'>{$qbzx_count}</p>
				<p class="p2">起驳装箱</p>
				<img src="__PUBLIC__/images/alert.png" alt="报警数"><span>{$qbzx_num}</span>
			</div></a>
			<a href="{:U('CfsSearch/real_time')}" target='_blank'>
			<div class="img" style="background:url(__PUBLIC__/images/cfszhuangxiang_bg.png);background-size:220px 215px;">
				<p class='p1' style='color:#c3b80c'>{$cfs_z_count}</p>
				<p class="p2">CFS装箱</p>
				<img src="__PUBLIC__/images/alert.png" alt="报警数"><span>{$cfs_z_num}</span>
			</div></a><br>
			<a href="{:U('DdSearch/real_time',array('business'=>'cfs'))}"  target='_blank'>
			<div class="img" style="background:url(__PUBLIC__/images/CFSchaixiang_bg.png);background-size:220px 215px;">
				<p class='p1' style='color:#f39900'>{$cfs_c_count}</p>
				<p class="p2">CFS拆箱</p>
				<img src="__PUBLIC__/images/alert.png" alt="报警数"><span>{$cfs_c_num}</span>
			</div></a>
			<a href="{:U('DdSearch/real_time',array('business'=>'dd'))}" target='_blank'>
			<div class="img" style="background:url(__PUBLIC__/images/mendaomen_bg.png);background-size:220px 215px;">
				<p class='p1' style='color:#11b9c6'>{$dd_c_count}</p>
				<p class="p2">门到门拆箱</p>
				<img src="__PUBLIC__/images/alert.png" alt="报警数"><span>{$dd_c_num}</span>
			</div></a>
		</div>
	</div>
	<script>
		var maxtime = 1 * 60; //一个小时，按秒计算，自己调整!   
        function CountDown() {
            if (maxtime >= 0) {
                minutes = Math.floor(maxtime / 60);
                seconds = Math.floor(maxtime % 60);
                if (minutes<10) {
                	minutes = '0'+minutes;
                }
                if (seconds<10) {
                	seconds = '0'+seconds;
                }
                // msg = "距离下次刷新：" + minutes + "分" + seconds + "秒";
                msg ="距离下次刷新 <span style='display: inline-block;border-radius: 3px;margin-right: 10px;margin-left: 20px;color: #ffffff;font-size:20px;font-family: 黑体;background-color:#666666;padding: 3px 8px;'>" + minutes + "</span>分<span style='display: inline-block;border-radius: 3px;margin-right: 10px;margin-left: 20px;color: #ffffff;font-size:20px;font-family: 黑体;background-color:#666666;padding: 3px 8px;'>" + seconds + "</span>秒";
                document.all["timer"].innerHTML = msg;
                // if (maxtime == 5 * 60)alert("还剩5分钟");
                    --maxtime;
            } else{
                // clearInterval(timer);
                // alert("时间到，结束!");
                location.reload();
            }
        }
        timer = setInterval("CountDown()", 1000);
	</script>
</body>
</html>