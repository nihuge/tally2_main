<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title></title>
	<script type="text/javascript" src="__PUBLIC__/js/ECharts/echarts.min.js"></script>
</head>
<body>
	<div id="container2" style="width:100%;height:790px;margin-top: 50px;"></div>
	<script>
       	var dom2 = document.getElementById("container2");
		var myChart2 = echarts.init(dom2);
		var app2 = {};
		option3 = null;
		var data3 = genData3();
		// app2.title = '世界人口总量 - 条形图';

		console.log(data3.customerData);
		option3 = {
		    title: {
		        text: '分客户总箱量统计',
		        subtext: '数据来自理货云平台'
		    },
		    tooltip: {
		        trigger: 'axis',
		        axisPointer: {
		            type: 'shadow'
		        }
		    },
		    legend: {
		        // data: ['2011年', '2012年']
		        data: data3.years
		    },
		    grid: {
		        left: '3%',
		        right: '4%',
		        bottom: '3%',
		        containLabel: true
		    },
		    xAxis: {
		        type: 'value',
		        boundaryGap: [0, 0.01]
		    },
		    yAxis: {
		        type: 'category',
		        data: data3.customerData
		    },
		    series: data3.yearsdata
		};
		function genData3() {
		    var years = <?php echo $tiao_data['years'];?>;
		    var customerData = <?php echo $tiao_data['customerData'];?>;
		    var yearsdata = <?php echo $tiao_data['yearsdata'];?>;
		    var arrContact = new Array();
			Object.keys(yearsdata).forEach(function(key){
				// console.log(key,yearsdata[key]);
				var reVal = new Object();
				reVal['name'] = key;
				reVal['type'] = 'bar';
				reVal['data'] = yearsdata[key];
				arrContact.push(reVal);
			});

		    return {
		        years: years,
		        customerData: customerData,
		        yearsdata: arrContact,
		    };
		};
		if (option3 && typeof option3 === "object") {
		    myChart2.setOption(option3, true);
		}
	</script>
</body>
</html>