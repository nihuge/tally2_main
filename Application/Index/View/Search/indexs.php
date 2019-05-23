<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>数据驾驶舱</title>
	
	<script type="text/javascript" src="__PUBLIC__/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="__PUBLIC__/layer/layer.js"></script>
	<style>
		*{padding: 0px;margin:0px;}
		body{width: 100%;background-color: #EDEDED}
		.content{width: 1250px;margin: auto auto;}
		.wrapper_o{width: 615px;background-color: #fff;height: 450px;display: inline-block;margin: 5px 0px 0px 1px;vertical-align: middle;}
		.nav{width: 118px;height:40px;line-height:40px;margin-top: 10px;display: inline-block;}
		.contents{margin: 5px 5px;height: 385px;vertical-align: middle;}
		.real{margin-left: 30px;width: 540px;margin-right: 30px;margin-top: 50px;margin-bottom: 50px;text-align: center;height: 290px;}
		.real1{margin-left: 30px;width: 540px;margin-right: 30px;margin-bottom: 50px;text-align: center;height: 290px;}
		.img{ width: 150px;height: 145px;z-index: 10;display: inline-block;vertical-align: middle;margin: 10px 20px;}
		.p1{font-size: 45px;margin-top: 27px;line-height:50px;font-family:"黑体"}
		.p2{font-size: 12px;border-bottom: 1px dotted #b2b2b1;width: 60px;margin: auto auto;font-family:"微软雅黑"}
		.img img{width: 18px;height: 16px;margin:5px;vertical-align: middle;}
		span{display: inline-block;margin-top: 5px;color: red;vertical-align: middle;margin-bottom: 5px;}
		a:link,a:visited,a:hover,a:active{text-decoration: none;color:black;}
	</style>
</head>
<body>
	<div class="content">
		<div class="wrapper_o">
			<div class="nav">
				<img src="__PUBLIC__/images/shishi.png" alt="">
			</div>
			<img src="__PUBLIC__/images/fangda.png" alt="" style="float: right;display: inline-block;margin-top: 15px;margin-right: 15px;cursor: pointer;" onclick="shishi()">
			<div class="contents">
				<div id="timer" style="font-size:16px;text-align: center;font-family:'微软雅黑'; color: #999999;">
					
				</div>
				<div class="real1">
					<a href="{:U('QbzxSearch/RealTime')}" target="_blank">
					<div class="img" style="background:url(__PUBLIC__/images/qibo_bg.png);background-size:150px 145px;" >
						<p class='p1' id='qbzx_count' style='color:#00a1eb'>{$qbzx_count}</p>
						<p class="p2">起驳装箱</p>
						<img src="__PUBLIC__/images/alert.png" alt="报警数"><span id='qbzx_num'>{$qbzx_num}</span>
					</div></a>
					<a href="{:U('CfsSearch/real_time')}" target="_blank">
					<div class="img" style="background:url(__PUBLIC__/images/cfszhuangxiang_bg.png);background-size:150px 145px;">
						<p class='p1' id='cfs_z_count' style='color:#c3b80c'>{$cfs_z_count}</p>
						<p class="p2">CFS装箱</p>
						<img src="__PUBLIC__/images/alert.png" alt="报警数"><span id='cfs_z_num'>{$cfs_z_num}</span>
					</div></a><br>
					<a href="{:U('DdSearch/real_time',array('business'=>'cfs'))}" target="_blank">
					<div class="img" style="background:url(__PUBLIC__/images/CFSchaixiang_bg.png);background-size:150px 145px;">
						<p class='p1' id='cfs_c_count' style='color:#f39900'>{$cfs_c_count}</p>
						<p class="p2">CFS拆箱</p>
						<img src="__PUBLIC__/images/alert.png" alt="报警数"><span id='cfs_c_num'>{$cfs_c_num}</span>
					</div></a>
					<a href="{:U('DdSearch/real_time',array('business'=>'dd'))}" target="_blank">
					<div class="img" style="background:url(__PUBLIC__/images/mendaomen_bg.png);background-size:150px 145px;">
						<p class='p1' id='dd_c_count' style='color:#11b9c6'>{$dd_c_count}</p>
						<p class="p2">门到门拆箱</p>
						<img src="__PUBLIC__/images/alert.png" alt="报警数"><span id='dd_c_num'>{$dd_c_num}</span>
					</div></a>
				</div>
			</div>
		</div>
		<div class="wrapper_o">
			<div class="nav">
				<img src="__PUBLIC__/images/zongliang.png" alt="">
			</div>
			<img src="__PUBLIC__/images/fangda.png" alt="" style="float: right;display: inline-block;margin-top: 15px;margin-right: 15px;cursor: pointer;"  onclick="zongliang()">
			<div class="contents">
				<div class="real">
					<div id="main" style="width: 100%;height:290px;"></div>
				</div>
			</div>
		</div>
		<div class="wrapper_o">
			<div class="nav">
				<img src="__PUBLIC__/images/kehu.png" alt="">
			</div>
			<img src="__PUBLIC__/images/fangda.png" alt="" style="float: right;display: inline-block;margin-top: 15px;margin-right: 15px;cursor: pointer;" onclick="kehu()">
			<div class="contents">
				<div class="real">
					<div id="container2" style="width: 100%;height:290px;"></div>
				</div>
			</div>
		</div>
		<div class="wrapper_o">
			<div class="nav">
				<img src="__PUBLIC__/images/didian.png" alt="">
			</div>
			<img src="__PUBLIC__/images/fangda.png" alt="" style="float: right;display: inline-block;margin-top: 15px;margin-right: 15px;cursor: pointer;"  onclick="didian()">
			<div class="contents">
				<div class="real">
					<div id="container" style="width: 100%;height:290px;"></div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="__PUBLIC__/js/ECharts/echarts.min.js"></script>
	<script type="text/javascript">
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
		    for (var year = 2018; year <= 2019; year++) {
		        var max = 0;
		        var sum = 0;
		        temp = obj[year];
		        //console.log(temp.length);
		        var l = temp.length;
		        for (var i = 0;  i < l; i++) {
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
		            autoPlay: true,
		            currentIndex: 1,
		            playInterval: 1000,
		            // controlStyle: {
		            //     position: 'left'
		            // },
		            data: [

		               '2018-01-01',
		                {
		                    value: '2019-01-01',
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

		var dom2 = document.getElementById("container2");
		var myChart2 = echarts.init(dom2);
		var app2 = {};
		option3 = null;
		var data3 = genData3();
		// app2.title = '世界人口总量 - 条形图';

		// console.log(data3.years);
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

		function zongliang(){
	        var url = "{:U('Search/zongliang')}";
	        layer.open({
	            title:'总量',
	            type: 2,
	            area: ["100%", "100%"],
	            skin: 'layui-layer-rim', //加上边框
	            content: [url, 'yes'],
	            resize:false,
	            end: function () {
	                location.reload();
	            }
	        });
	    }

	    function didian(){
	        var url = "{:U('Search/didian')}";
	        layer.open({
	            title:'地点',
	            type: 2,
	            area: ["100%", "100%"],
	            skin: 'layui-layer-rim', //加上边框
	            content: [url, 'yes'],
	            resize:false,
	            end: function () {
	                location.reload();
	            }
	        });
	    }

	    function kehu(){
	        var url = "{:U('Search/kehu')}";
	        layer.open({
	            title:'客户',
	            type: 2,
	            area: ["100%", "100%"],
	            skin: 'layui-layer-rim', //加上边框
	            content: [url, 'yes'],
	            resize:false,
	            end: function () {
	                location.reload();
	            }
	        });
	    }

	    function shishi(){
	        var url = "{:U('Search/shishi')}";
	        layer.open({
	            title:'实时',
	            type: 2,
	            area: ["100%", "100%"],
	            skin: 'layui-layer-rim', //加上边框
	            content: [url, 'yes'],
	            resize:false,
	            end: function () {
	                location.reload();
	            }
	        });
	    }

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
                --maxtime;
            } else{
                // clearInterval(timer);
                maxtime = 1 * 60;
                jubushua();
                CountDown();
            }
        }
        timer = setInterval("CountDown()", 1000);

        function jubushua(){
        	$.ajax({
                type: "POST",
                url: "{:U('Search/ajaxshua')}",
                dataType: "json",
                success: function(data) {
                    document.getElementById("qbzx_count").innerHTML= data.qbzx_count;
                    document.getElementById("qbzx_num").innerHTML= data.qbzx_num;
                    document.getElementById("cfs_z_count").innerHTML= data.cfs_z_count;
                    document.getElementById("cfs_z_num").innerHTML= data.cfs_z_num;
                    document.getElementById("cfs_c_count").innerHTML= data.cfs_c_count;
                    document.getElementById("cfs_c_num").innerHTML= data.cfs_c_num;
                    document.getElementById("dd_c_count").innerHTML= data.dd_c_count;
                    document.getElementById("dd_c_num").innerHTML= data.dd_c_num;
                }
            });
        }
	</script>
</body>
</html>