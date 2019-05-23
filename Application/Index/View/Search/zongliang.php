<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title></title>
	<script type="text/javascript" src="__PUBLIC__/js/ECharts/echarts.min.js"></script>
</head>
<body>
	<div id="main" style="width: 100%;height:690px;margin-top: 50px;"></div>
	<script>
				// 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));
		var dataMap = {};
		// 门到门
		dataMap.dataGDP = dataFormatter({
		    //max : 60000,
		     <?php
			foreach ($count['dd_c'] as $k=>$s)
			{
				echo $k.':['.$s['one'].','.$s['two'].','.$s['three'].','.$s['four'].','.$s['five'].','.$s['six'].','.$s['seven'].','.$s['eight'].','.$s['nine'].','.$s['ten'].','.$s['eleven'].','.$s['twelve'].'],';
			}
			?>
		});
		// 起驳装箱
		dataMap.dataPI = dataFormatter({
		    //max : 4000,
		    <?php
			foreach ($count['qbzx_z'] as $k=>$s)
			{
				echo $k.':['.$s['one'].','.$s['two'].','.$s['three'].','.$s['four'].','.$s['five'].','.$s['six'].','.$s['seven'].','.$s['eight'].','.$s['nine'].','.$s['ten'].','.$s['eleven'].','.$s['twelve'].'],';
			}
			?>
		});
		// CFS装箱
		dataMap.dataSI = dataFormatter({
		    //max : 26600,
		     <?php
			foreach ($count['cfs_z'] as $k=>$s)
			{
				echo $k.':['.$s['one'].','.$s['two'].','.$s['three'].','.$s['four'].','.$s['five'].','.$s['six'].','.$s['seven'].','.$s['eight'].','.$s['nine'].','.$s['ten'].','.$s['eleven'].','.$s['twelve'].'],';
			}
			?>
		});
		// CFS拆箱
		dataMap.dataTI = dataFormatter({
		    //max : 25000,
		    <?php
			foreach ($count['cfs_c'] as $k=>$s)
			{
				echo $k.':['.$s['one'].','.$s['two'].','.$s['three'].','.$s['four'].','.$s['five'].','.$s['six'].','.$s['seven'].','.$s['eight'].','.$s['nine'].','.$s['ten'].','.$s['eleven'].','.$s['twelve'].'],';
			}
			?>
		});

		function dataFormatter(obj) {
		    var pList = ['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月'];
		    var temp;
		    for (var year = 2017; year <= 2018; year++) {
		        var max = 0;
		        var sum = 0;
		        temp = obj[year];
		        // console.log(temp);
		        for (var i = 0, l = temp.length; i < l; i++) {
		            max = Math.max(max, temp[i]);
		            sum += temp[i];
		            obj[year][i] = {
		                name : pList[i],
		                value : temp[i]
		            }
		        }
		        obj[year + 'max'] = Math.floor(max / 100) * 100;
		        obj[year + 'sum'] = sum;
		    }
		    return obj;
		}

		option1 = {
		    baseOption: {
		        timeline: {
		            // y: 0, 
		            axisType: 'category',
		            // realtime: false,
		            // loop: false,
		            // theme:light,
		            itemStyle:{color:'#AC97A6'},
		            autoPlay: false,
		            currentIndex: 1,
		            playInterval: 1000,
		            // controlStyle: {
		            //     position: 'left'
		            // },
		            data: [

		               '2017-01-01',
		                {
		                    value: '2018-01-01',
		                    tooltip: {
		                        formatter: function (params) {
		                            // return params.name + '门到门拆箱达到又一个高度';
		                        }
		                    },
		                    symbol: 'diamond',
		                    symbolSize: 18
		                },
		            ],
		            label: {
		                formatter : function(s) {
		                    return (new Date(s)).getFullYear();
		                }
		            },lineStyle:{ color: {
					    type: 'linear',
					    x: 0,
					    y: 0,
					    x2: 0,
					    y2: 1,
					    colorStops: [{
					        offset: 0, color: '#b2b2b2' // 0% 处的颜色
					    }, {
					        offset: 1, color: '#b2b2b2' // 100% 处的颜色
					    }],
					    globalCoord: false // 缺省为 false
					}}
		           
		        },
		        title: {
		            subtext: '数据来自理货云平台'
		        },
		        tooltip: {
		        },
		        legend: {
		            x: 'right',
		            data: ['起驳装箱', 'CFS装箱', 'CFS拆箱', '门到门拆箱'],
		            selected: {
		                '门到门拆箱': true
		            }
		        },
		        calculable : true,
		        grid: {
		            top: 80,
		            bottom: 100,
		            tooltip: {
		                trigger: 'axis',
		                axisPointer: {
		                    type: 'shadow',
		                    label: {
		                        show: true,
		                        formatter: function (params) {
		                            return params.value.replace('\n', '');
		                        }
		                    }
		                }
		            }
		        },
		        xAxis: [
		            {
		                'type':'category',
		                'axisLabel':{'interval':0},
		                'data':[
		                    '一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月'
		                ],
		                splitLine: {show: false}
		            }
		        ],
		        yAxis: [
		            {
		                type: 'value',
		                name: '箱数(个)'
		            }
		        ],
		        series: [
		            {name: '门到门拆箱', type: 'bar'},
		            {name: '起驳装箱', type: 'bar'},
		            {name: 'CFS装箱', type: 'bar'},
		            {name: 'CFS拆箱', type: 'bar'},
		            {
		                name: '箱数占比',
		                type: 'pie',
		                center: ['75%', '35%'],
		                radius: '28%',
		                z: 100
		            }
		        ]
		    },
		    options: [
		        {
		            title : {text: '2017年度总箱量统计'},
		            series : [
		                {data: dataMap.dataGDP['2017'],itemStyle:{normal:{color:'#AC97A6'}}},
		                {data: dataMap.dataPI['2017'],itemStyle:{normal:{color:'#F4859D'}}},
		                {data: dataMap.dataSI['2017'],itemStyle:{normal:{color:'#B1C4CB'}}},
		                {data: dataMap.dataTI['2017'],itemStyle:{normal:{color:'#E0B7BF'}}},
		                {data: [
		                    {name: '起驳装箱', value: dataMap.dataPI['2017sum'],itemStyle:{normal:{color:'#F4859D'}}},
		                    {name: 'CFS装箱', value: dataMap.dataSI['2017sum'],itemStyle:{normal:{color:'#B1C4CB'}}},
		                    {name: 'CFS拆箱', value: dataMap.dataTI['2017sum'],itemStyle:{normal:{color:'#E0B7BF'}}},
		                    {name: '门到门拆箱', value: dataMap.dataGDP['2017sum'],itemStyle:{normal:{color:'#AC97A6'}}}
		                ]}
		            ]
		        },
		        {
		            title : {text: '2018年度总箱量统计'},
		            series : [
		                {data: dataMap.dataGDP['2018'],itemStyle:{normal:{color:'#AC97A6'}}},
		                {data: dataMap.dataPI['2018'],itemStyle:{normal:{color:'#F4859D'}}},
		                {data: dataMap.dataSI['2018'],itemStyle:{normal:{color:'#B1C4CB'}}},
		                {data: dataMap.dataTI['2018'],itemStyle:{normal:{color:'#E0B7BF'}}},
		                {data: [
		                    {name: '起驳装箱', value: dataMap.dataPI['2018sum'],itemStyle:{normal:{color:'#F4859D'}}},
		                    {name: 'CFS装箱', value: dataMap.dataSI['2018sum'],itemStyle:{normal:{color:'#B1C4CB'}}},
		                    {name: 'CFS拆箱', value: dataMap.dataTI['2018sum'],itemStyle:{normal:{color:'#E0B7BF'}}},
		                    {name: '门到门拆箱', value: dataMap.dataGDP['2018sum'],itemStyle:{normal:{color:'#AC97A6'}}}
		                ]}
		            ]
		        }
		    ]
		};
		// 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option1);
	</script>
</body>
</html>