<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title></title>
	<script type="text/javascript" src="__PUBLIC__/js/ECharts/echarts.min.js"></script>
</head>
<body>
	<div id="container" style="width:100%;height:690px;margin-top: 50px;"></div>
	<script>
        var dom = document.getElementById("container");
		var myChart1 = echarts.init(dom);
		var app = {};
		var data = genData();
		option2 = null;
		
		// console.log(data.legendData);
		option2 = {
		    title : {
		        text: '分作业场地数量统计',
		        subtext: '',
		        x:'right'
		    },
		    tooltip : {
		        trigger: 'item',
		        formatter: "{a} <br/>{b} : {c} ({d}%)"
		    },
		    legend: {
		        type: 'scroll',
		        orient: 'vertical',
		        right: 10,
		        top: 20,
		        bottom: 20,
		        data: data.legendData,

		        selected: data.selected
		    },
		    series : [
		        {
		            name: '地点',
		            type: 'pie',
		            radius : '55%',
		            center: ['40%', '50%'],
		            data: data.seriesData,
		            itemStyle: {
		                emphasis: {
		                    shadowBlur: 10,
		                    shadowOffsetX: 0,
		                    shadowColor: 'rgba(0, 0, 0, 0.5)'
		                }
		            }
		        }
		    ]
		};
		function genData() {
		    var legendData = <?php echo $bindata['legendData'];?>;
		    var seriesData =  <?php echo $bindata['seriesData'];?>;
		    var selected = {
		    <?php
		    $aaa = '';
			foreach ($bindata['selected'] as $k=>$s)
			{
				$aaa .= "'".$k."':".$s.',';
			}
			echo substr($aaa,0,-1);
			?>
		    };

		    return {
		        legendData: legendData,
		        seriesData: seriesData,
		        selected: selected
		    };
		};
		if (option2 && typeof option2 === "object") {
		    myChart1.setOption(option2, true);
		}
	</script>
</body>
</html>