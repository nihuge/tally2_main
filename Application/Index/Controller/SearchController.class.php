<?php
/**
 * 查询统计
 */
namespace Index\Controller;
use Index\Common\BaseController;

class SearchController extends BaseController
{
	//引导页
	public function index()
	{
		$this->display();
	}

	// 统计也
	public function indexs()
	{
		layout(false);
		G('begin');
		$where = array(
			'c.status'		=>	array('IN','1,2'),
			'c.operator_id'	=>	array('NEQ',''),
			'o.operation_examine'	=> array('IN','1,3')
			);
		$qbzx_in_ctn = new \Common\Model\QbzxInstructionCtnModel();
		$list = $qbzx_in_ctn
					->alias('c')
					->field('c.id,o.id operationid')
					->join('left join tally_qbzx_operation o on o.ctn_id=c.id')
					->where($where)
					->select();
		$qbzx_count = count($list);
		$level = new \Common\Model\QbzxOperationLevelModel ();
		static $qbzx_num = 0;
		$operation = new \Common\Model\QbzxOperationModel ();
		for($i = 0; $i < $qbzx_count; $i ++) {
			$ctn_id = $list [$i] ['id'];
			$res_o = $operation
					->field('id,begin_time')
					->where ( "ctn_id=$ctn_id" )->find();
			if ($res_o ['id'] != '') {
				// 最新操作时间
				$res_new = $level
							->field( 'createtime' )
							->where( array('operation_id'=>$list[$i]['operationid']) )
							->order('id desc')
							->find();
				if ($res_new ['createtime'] != '') {
					$list [$i] ['newtime'] = $res_new ['createtime'];
				} else {
					$list [$i] ['newtime'] = $res_o ['begin_time'];
				}
				$time1 = strtotime ( $list [$i] ['newtime'] );
				$time2 = time ();
				if (($time2 - $time1) / 300 > 1) {
					$qbzx_num++;
				}
			}
		}

		// 统计CFS装箱作业中数量
		$cfs_in_ctn = new \Common\Model\CfsInstructionCtnModel();
		$list = $cfs_in_ctn
					->alias('c')
					->field('c.id,o.id operationid')
					->join('left join tally_cfs_operation o on o.ctn_id=c.id')
					->where($where)
					->select();
		$cfs_z_count = count($list);
		$level=new \Common\Model\CfsOperationLevelModel();
		static $cfs_z_num = 0;
		
		for($i = 0; $i < $cfs_z_count; $i ++) {
			if ($list[$i]['operationid'] != '' || $list[$i]['operationid'] != null) {
				// 最新操作时间
				$res_new = $level
							->field( 'createtime' )
							->where( array('operation_id'=>$list[$i]['operationid']) )
							->order('id desc')
							->find();
				if ($res_new ['createtime'] != '') {
					$list [$i] ['newtime'] = $res_new ['createtime'];
				} else {
					$list [$i] ['newtime'] = $res_o ['begin_time'];
				}
				$time1 = strtotime ( $list [$i] ['newtime'] );
				$time2 = time ();
				if (($time2 - $time1) / 300 > 1) {
					$cfs_z_num++;
				}
			}
		}
		
		// 统计CFS拆箱作业中数量
		$DdPlanContainer=new \Common\Model\DdPlanContainerModel();
		$where1 = array(
			'c.status'				=>	array('IN','1,2'),
			'o.operation_examine'	=> 	array('IN','1,3'),
			'p.business'			=>	'cfs'
			);
		$list=$DdPlanContainer
						->alias('c')
						->field('c.id,o.id operationid')
						->join("left join tally_dd_operation o on o.ctn_id=c.id")
						->join("left join tally_dd_plan p on p.id=c.plan_id")
						->where($where1)
						->select();

		$cfs_c_count = count($list);
		$DdOperationLevel=new \Common\Model\DdOperationLevelModel();
		static $cfs_c_num = 0;
		
		for($i = 0; $i < $cfs_c_count; $i ++) {
			if ($list[$i]['operationid'] != '' || $list[$i]['operationid'] != null) {
				// 最新操作时间
				$res_new = $DdOperationLevel
							->field( 'createtime' )
							->where( array('operation_id'=>$list[$i]['operationid']) )
							->order('id desc')
							->find();
				if ($res_new ['createtime'] != '') {
					$list [$i] ['newtime'] = $res_new ['createtime'];
				} else {
					$list [$i] ['newtime'] = $res_o ['begin_time'];
				}
				$time1 = strtotime ( $list [$i] ['newtime'] );
				$time2 = time ();
				if (($time2 - $time1) / 300 > 1) {
					$cfs_c_num++;
				}
			}
		}

		// 统计门到门拆箱作业中数量
		$where2 = array(
			'c.status'				=>	array('IN','1,2'),
			'o.operation_examine'	=> 	array('IN','1,3'),
			'p.business'			=>	'dd'
			);
		$list=$DdPlanContainer
						->alias('c')
						->field('c.id,o.id operationid')
						->join("left join tally_dd_operation o on o.ctn_id=c.id")
						->join("left join tally_dd_plan p on p.id=c.plan_id")
						->where($where2)
						->select();

		$dd_c_count = count($list);

		static $dd_c_num = 0;
		
		for($i = 0; $i < $dd_c_count; $i ++) {
			if ($list[$i]['operationid'] != '' || $list[$i]['operationid'] != null) {
				// 最新操作时间
				$res_new = $DdOperationLevel
							->field( 'createtime' )
							->where( array('operation_id'=>$list[$i]['operationid']) )
							->order('id desc')
							->find();
				if ($res_new ['createtime'] != '') {
					$list [$i] ['newtime'] = $res_new ['createtime'];
				} else {
					$list [$i] ['newtime'] = $res_o ['begin_time'];
				}
				$time1 = strtotime ( $list [$i] ['newtime'] );
				$time2 = time ();
				if (($time2 - $time1) / 300 > 1) {
					$dd_c_num++;
				}
			}
		}


		// 起驳完成作业的每年的各月作业箱数据统计
		$year = date('Y');					
		// $year = '2017';					
		$sql="select   
		sum(case month(tally_qbzx_prove.createtime) when '1' then 1 else 0 end) as one,  
		sum(case month(tally_qbzx_prove.createtime) when '2' then 1 else 0 end) as two,  
		sum(case month(tally_qbzx_prove.createtime) when '3' then 1 else 0 end) as three,  
		sum(case month(tally_qbzx_prove.createtime) when '4' then 1 else 0 end) as four,  
		sum(case month(tally_qbzx_prove.createtime) when '5' then 1 else 0 end) as five,  
		sum(case month(tally_qbzx_prove.createtime) when '6' then 1 else 0 end) as six,  
		sum(case month(tally_qbzx_prove.createtime) when '7' then 1 else 0 end) as seven,  
		sum(case month(tally_qbzx_prove.createtime) when '8' then 1 else 0 end) as eight,  
		sum(case month(tally_qbzx_prove.createtime) when '9' then 1 else 0 end) as nine,  
		sum(case month(tally_qbzx_prove.createtime) when '10' then 1 else 0 end) as ten,  
		sum(case month(tally_qbzx_prove.createtime) when '11' then 1 else 0 end) as eleven,  
		sum(case month(tally_qbzx_prove.createtime) when '12' then 1 else 0 end) as twelve  
		from tally_qbzx_prove  
		where year(tally_qbzx_prove.createtime)='".$year."'";
		$qbzx_z = M()->query($sql);

		// cfs装箱完成作业的每年的各月作业箱数据统计
		$sql="select   
		sum(case month(tally_cfs_prove.createtime) when '1' then 1 else 0 end) as one,  
		sum(case month(tally_cfs_prove.createtime) when '2' then 1 else 0 end) as two,  
		sum(case month(tally_cfs_prove.createtime) when '3' then 1 else 0 end) as three,  
		sum(case month(tally_cfs_prove.createtime) when '4' then 1 else 0 end) as four,  
		sum(case month(tally_cfs_prove.createtime) when '5' then 1 else 0 end) as five,  
		sum(case month(tally_cfs_prove.createtime) when '6' then 1 else 0 end) as six,  
		sum(case month(tally_cfs_prove.createtime) when '7' then 1 else 0 end) as seven,  
		sum(case month(tally_cfs_prove.createtime) when '8' then 1 else 0 end) as eight,  
		sum(case month(tally_cfs_prove.createtime) when '9' then 1 else 0 end) as nine,  
		sum(case month(tally_cfs_prove.createtime) when '10' then 1 else 0 end) as ten,  
		sum(case month(tally_cfs_prove.createtime) when '11' then 1 else 0 end) as eleven,  
		sum(case month(tally_cfs_prove.createtime) when '12' then 1 else 0 end) as twelve  
		from tally_cfs_prove  
		where year(tally_cfs_prove.createtime)='".$year."'";
		$cfs_z = M()->query($sql);		

		// cfs拆箱完成作业的每年的各月作业箱数据统计
		$sql="select   
		sum(case month(dp.createtime) when '1' then 1 else 0 end) as one,  
		sum(case month(dp.createtime) when '2' then 1 else 0 end) as two,  
		sum(case month(dp.createtime) when '3' then 1 else 0 end) as three,  
		sum(case month(dp.createtime) when '4' then 1 else 0 end) as four,  
		sum(case month(dp.createtime) when '5' then 1 else 0 end) as five,  
		sum(case month(dp.createtime) when '6' then 1 else 0 end) as six,  
		sum(case month(dp.createtime) when '7' then 1 else 0 end) as seven,  
		sum(case month(dp.createtime) when '8' then 1 else 0 end) as eight,  
		sum(case month(dp.createtime) when '9' then 1 else 0 end) as nine,  
		sum(case month(dp.createtime) when '10' then 1 else 0 end) as ten,  
		sum(case month(dp.createtime) when '11' then 1 else 0 end) as eleven,  
		sum(case month(dp.createtime) when '12' then 1 else 0 end) as twelve  
		from tally_dd_prove dp left join tally_dd_plan_container c on c.id = dp.ctn_id left join tally_dd_plan p on p.id = c.plan_id 
		where year(dp.createtime)='".$year."' and p.business ='cfs'";
		$cfs_c = M()->query($sql);

		// 门到门拆箱完成作业的每年的各月作业箱数据统计
		$sql="select   
		sum(case month(dp.createtime) when '1' then 1 else 0 end) as one,  
		sum(case month(dp.createtime) when '2' then 1 else 0 end) as two,  
		sum(case month(dp.createtime) when '3' then 1 else 0 end) as three,  
		sum(case month(dp.createtime) when '4' then 1 else 0 end) as four,  
		sum(case month(dp.createtime) when '5' then 1 else 0 end) as five,  
		sum(case month(dp.createtime) when '6' then 1 else 0 end) as six,  
		sum(case month(dp.createtime) when '7' then 1 else 0 end) as seven,  
		sum(case month(dp.createtime) when '8' then 1 else 0 end) as eight,  
		sum(case month(dp.createtime) when '9' then 1 else 0 end) as nine,  
		sum(case month(dp.createtime) when '10' then 1 else 0 end) as ten,  
		sum(case month(dp.createtime) when '11' then 1 else 0 end) as eleven,  
		sum(case month(dp.createtime) when '12' then 1 else 0 end) as twelve  
		from tally_dd_prove dp left join tally_dd_plan_container c on c.id = dp.ctn_id left join tally_dd_plan p on p.id = c.plan_id 
		where year(dp.createtime)='".$year."' and p.business ='dd'";
		$dd_c = M()->query($sql);

		$count['qbzx_z'][$year] = $qbzx_z[0];
		$count['cfs_z'][$year]  = $cfs_z[0];
		$count['cfs_c'][$year]  = $cfs_c[0];
		$count['dd_c'][$year]   = $dd_c[0];


		$list = M('count')->select();
		foreach ($list as $key => $value) {
			if ($value['business'] == 'qbzx_z') {
				$count['qbzx_z'][$value['year']] = $value;
			} elseif($value['business'] == 'cfs_z') {
				$count['cfs_z'][$value['year']] = $value;
			} elseif($value['business'] == 'dd_c') {
				$count['dd_c'][$value['year']] = $value;
			} elseif($value['business'] == 'cfs_c') {
				$count['cfs_c'][$value['year']] = $value;
			}
		}
		// $qbzxpro = new \Common\Model\QbzxProveModel();
		// $ddpro = new \Common\Model\DdProveModel();
		// $cfspro = new \Common\Model\CfsProveModel();
		// // 获取地点总箱量
		// $qn = $qbzxpro
		// 			// ->where(array('location_id'=>$value['id']))
		// 			->field('sum(1) as number,location_id')
		// 			->join('left join tally_location l')
		// 			->group('location_id')
		// 			->select();
		// 计算起驳装箱总箱数
		$qbpl = new \Common\Model\QbzxPlanModel();
		$qn = $qbpl
				->alias('p')
				->field('sum(p.total_ctn) AS countNumber,p.location_id,l.location_name')
				->join('left join tally_location l on l.id = p.location_id')
				->group('p.location_id')
				->select();
		// 计算cfs装箱总箱数
		$cfsinst = new \Common\Model\CfsInstructionModel();
		$cfsn = $cfsinst
				->field('sum(1) AS countNumber,i.location_id,l.location_name')
				->alias('i')
				->join('left join tally_location l on l.id = i.location_id')
				->join('left join tally_cfs_instruction_ctn c on i.id = c.instruction_id')
				->group('i.location_id')
				->select();
		// 计算拆箱总数
		$ddpro = new \Common\Model\DdProveModel();
		$ddc = $ddpro
				->field('sum(1) AS countNumber,pr.location_id,l.location_name')
				->alias('pr')
				->join('left join tally_location l on l.id = pr.location_id')
				->group('pr.location_id')
				->select();
		// 将三个数据合并
		$new_arr1 = $qn;
		foreach ($cfsn as $key => $value) {
			$new_arr1[] = $value;
		}
		foreach ($ddc as $key => $value) {
			$new_arr1[] = $value;
		}
		$ret1 = array();
		foreach($new_arr1 as $v){
		    if(!isset($ret1[$v['location_id']])){
		        $ret1[$v['location_id']] = $v;
		    }else{
		        $ret1[$v['location_id']]['countnumber'] += $v['countnumber'];
		    }
		}

		$legendData = array();
		$seriesData = array();$selected = array();
		foreach ($ret1 as $key => $value) {
			$legendData[] = $value['location_name'];
			$seriesData[] = array(
				'name'	=>	$value['location_name'],
				'value'	=>	$value['countnumber'],
				);
			if ($value['countnumber'] >= 1000 ) {
				$selected[$value['location_name']] = 'true';
			}else{
				$selected[$value['location_name']] = 'false';
			}
		}
		
		// 设置显示的元素
		// foreach ($legendData as $key => $value) {
		// 	if ($key<=6) {
		// 		$selected[$value] = 'true';
		// 	}else{
		// 		$selected[$value] = 'false';
		// 	}
		// }
		// G('end');  
		// // ...也许这里还有其他代码  
		// // 进行统计区间  
		// p(G('begin','end').'s') ;
		// die;
		// 获取所有的作业场地中文名
		// $location = new \Common\Model\LocationModel ();
		// $locationlist = $location
		// 					->field('id,location_name')
		// 					->limit(0,50)
		// 					->select();
		// $legendData = array();
		// $seriesData = array();
		// foreach ($locationlist as $key => $value) {
		// 	$id = array();
		// 	$legendData[] = $value['location_name'];
		// 	$id['id'] = $value['id'];
		// 	$id['name'] = $value['location_name'];
		// 	$seriesData[] = $id;
		// }
		// $selected = array();
		// // 设置显示的元素
		// foreach ($legendData as $key => $value) {
		// 	if ($key<=6) {
		// 		$selected[$value] = 'true';
		// 	}else{
		// 		$selected[$value] = 'false';
		// 	}

		// }

		// $qbzxpro = new \Common\Model\QbzxProveModel();
		// $ddpro = new \Common\Model\DdProveModel();
		// $cfspro = new \Common\Model\CfsProveModel();
		// $amsg = array();
		// // 计算每个作业地点在四个系统中的作业箱
		// foreach ($seriesData as $key => $value) {
		// 	// 计算起驳装箱的个数
		// 	$qn = $qbzxpro
		// 				->where(array('location_id'=>$value['id']))
		// 				->count();
		// 	// 计算门到门拆箱的个数
		// 	$map = array(
		// 		'pr.location_id'	=>	$value['id'],
		// 		'p.business'		=>	'cfs'
		// 		);
		// 	$ddc = $ddpro
		// 				->alias('pr')
		// 				->join('left join tally_dd_plan_container c on c.id = pr.ctn_id')
		// 				->join('left join tally_dd_plan p on p.id = c.plan_id')
		// 				->where($map)
		// 				->count();

		// 	// 计算CFS装箱的个数
		// 	$cfs = $cfspro
		// 				->where(array('location_id'=>$value['id']))
		// 				->count();

		// 	// 计算CFS拆箱的个数
		// 	$map1 = array(
		// 		'pr.location_id'	=>	$value['id'],
		// 		'p.business'		=>	'dd'
		// 		);
		// 	$cfsc = $ddpro
		// 				->alias('pr')
		// 				->join('left join tally_dd_plan_container c on c.id = pr.ctn_id')
		// 				->join('left join tally_dd_plan p on p.id = c.plan_id')
		// 				->where($map1)
		// 				->count();

		// 	$seriesData[$key]['value'] = $qn+$cfs+$ddc+$cfsc;
		// 	unset($seriesData[$key]['id']);
		// }


		// 二维数组排序   降序
		// array_multisort(array_column($locationid,'count'),SORT_DESC,$locationid);
		$bindata = array(
				'legendData'	=> json_encode($legendData,JSON_UNESCAPED_UNICODE),// 分作业地点--作业地点名称
				'seriesData'	=> json_encode($seriesData,JSON_UNESCAPED_UNICODE),// 分作业地点--饼图数据
				'selected'		=>$selected// 分作业地点--旁边地点列表数据
			);
		// p($bindata);
		// G('end');  
		// // ...也许这里还有其他代码  
		// // 进行统计区间  
		// p(G('begin','end').'s') ;
		// die;

		// 获取分客户条状数据
		$year = date('Y');
		// 获取今年起驳装箱数最多的数据
		$qbsql = "SELECT sum(total_ctn) AS countNumber,YEAR(entrust_time) as dateTime,entrust_company FROM tally_qbzx_plan where YEAR(entrust_time)=".$year." GROUP BY entrust_company,YEAR(entrust_time) order by countNumber desc limit 0,10";
		$qb= M()->query($qbsql);

		// 获取今年cfs装箱数最多的数据
		$cfszsql = "SELECT COUNT(1) AS countNumber,YEAR(i.date) as dateTime,i.entrust_company FROM tally_cfs_instruction i left join tally_cfs_instruction_ctn c ON i.id=c.instruction_id where i.entrust_company!='' and YEAR(i.date)=".$year." GROUP BY i.entrust_company order by countNumber desc limit 0,10";
		$cfsz = M()->query($cfszsql);

		$new_arr = $qb;
		foreach ($cfsz as $key => $value) {
			$new_arr[] = $value;
		}
		$ret = array();
		foreach($new_arr as $v){
		    if(!isset($ret[$v['datetime'].'_'.$v['entrust_company']])){
		        $ret[$v['datetime'].'_'.$v['entrust_company']] = $v;
		    }else{
		        $ret[$v['datetime'].'_'.$v['entrust_company']]['countnumber'] += $v['countnumber'];
		    }
		}
		//让数组显示前十条
		$ret = array_slice($ret, 0, 10);
		// 获取最新的数据
		// $arr_last_data = array_column($ret, 'countnumber');
		$arr_last_data = array();
		$ids = array();
		foreach ($ret as $key => $value) {
			$arr_last_data[] = $value['countnumber'];	
			$ids[] = $value['entrust_company'];		// 获取所有的客户ID	
		}

		// 获取所有的客户ID
		// $ids = array_column($ret, 'entrust_company');
		
		// 获取客户名称
		$customerData = M('customer')
					->where(array('id'=>array('in',$ids)))
					->getField('customer_name',true);
		// 根据客户ID获取所有的往年数据
		if (empty($ids)) {
			$id = '(-1)';
		} else {
			$id = '('.implode(',',$ids).')';
		}
		// 获取往年的起驳数据
		$qbsql = "SELECT sum(total_ctn) AS countNumber,YEAR(entrust_time) as dateTime,entrust_company FROM tally_qbzx_plan where  YEAR(entrust_time)<".$year." and entrust_company in $id GROUP BY entrust_company,YEAR(entrust_time) order by YEAR(entrust_time) ";
		$qb= M()->query($qbsql);

		// 获取往年cfs装箱数据
		$cfszsql = "SELECT COUNT(1) AS countNumber,YEAR(p.createtime) as dateTime,entrust_company FROM tally_cfs_prove p left join tally_cfs_instruction_ctn c ON c.id=p.ctn_id left join tally_cfs_instruction i ON i.id=c.instruction_id where YEAR(p.createtime)<".$year." and  i.entrust_company in $id GROUP BY YEAR(p.createtime)";
		$cfsz = M()->query($cfszsql);

		// 获取往年年份
		// $qbyear = array_column($qb, 'datetime');
		// $qbyear = array_unique($qbyear);
		// $cfszyear = array_column($cfsz, 'datetime');
		$qbyear = array();
		foreach ($qb as $key => $value) {
			$qbyear[] = $value['datetime'];
		}
		$qbyear = array_unique($qbyear);
		// $cfszyear = array_column($cfsz, 'datetime');
		$cfszyear = array();
		foreach ($cfsz as $key => $value) {
			$cfszyear[] = $value['datetime'];
		}
		$cfszyear = array_unique($cfszyear);
		$years_11 = array_keys(array_flip($qbyear)+array_flip($cfszyear));
		$yearss = array();
		foreach ($years_11 as $key => $value) {
			$yearss[] = "$value";
		}
		$new_arr1 = $qb;
		foreach ($cfsz as $key => $value) {
			$new_arr1[] = $value;
		}
		$ret1 = array();
		foreach($new_arr1 as $v){
		    if(!isset($ret1[$v['datetime'].'_'.$v['entrust_company']])){
		        $ret1[$v['datetime'].'_'.$v['entrust_company']] = $v;
		    }else{
		        $ret1[$v['datetime'].'_'.$v['entrust_company']]['countnumber'] += $v['countnumber'];
		    }
		}

		// 组合数据
		$datas = array();
		foreach ($yearss as $key => $value) {
			foreach ($ids as $k => $v) {
				if (isset($ret1[$value.'_'.$v])) {
					$datas[$value][] = $ret1[$value.'_'.$v]['countnumber'];
				} else {
					$datas[$value][] = '';
				}
				
			}
		}
		// p($yearss);
		// p($datas);
		array_push($yearss, $year);
		array_push($datas, $arr_last_data);
		// echo "<hr>";

		$tiao_data = array(
				'customerData'	=> json_encode($customerData,JSON_UNESCAPED_UNICODE),// 分客户--客户名称
				'years'	        => json_encode($yearss ,JSON_UNESCAPED_UNICODE),// 分客户--数据
				'yearsdata'		=> json_encode($datas  ,JSON_UNESCAPED_UNICODE)
			);
		
		

		$assign = array(
			'qbzx_count'	=>	$qbzx_count,	// 起驳实时
			'qbzx_num'		=>	$qbzx_num,		// 起驳超时报警
			'cfs_z_count'	=>	$cfs_z_count,	// cfs装箱实时
			'cfs_z_num'		=>	$cfs_z_num,		// cfs装箱超时报警
			'cfs_c_count'	=>	$cfs_c_count,	// cfs拆箱实时
			'cfs_c_num'		=>	$cfs_c_num,		// cfs拆箱超时报警
			'dd_c_count'	=>	$dd_c_count,	// 门到门拆箱实时
			'dd_c_num'		=>	$dd_c_num,		// 门到门拆箱超时报警
			'count'			=>	$count,			// 数据整合
			'bindata'		=>	$bindata,		// 饼状图数据整合  --  分作业
			'tiao_data'		=>	$tiao_data,		// 条状图数据整合	  --  分客户
			);

		$this->assign($assign);
		$this->display();
	}

	/**
	 * 完成查询
	 */
	public function optionsearch()
	{
		// 集装箱船列表
		$ship = new \Common\Model\ShipModel ();
		$ship_type = json_decode ( ship_type, true );
		$shiplist = $ship->getShipList ( $ship_type ['container'] );

		// 作业场地
		$location = new \Common\Model\LocationModel ();
		$locationlist = $location->getLocationList ();

		// 港口信息
		$port = new \Common\Model\PortModel ();
		$portlist = $port->getPortList ();

		// 货代信息
		$cargo = new \Common\Model\CargoAgentModel();
		$cargolist = $cargo->getCargoAgentList();

		$assign = array(
			'shiplist'	=>	$shiplist, 
			'locationlist'	=>	$locationlist, 
			'portlist'	=>	$portlist, 
			'cargolist'	=>	$cargolist, 
			);
		$this->assign($assign);
	    $this->display();
	}


	/**
	 * 放大总量统计
	 */
	public function zongliang(){
	    layout(false);
	    // 起驳完成作业的每年的各月作业箱数据统计
		$year = date('Y');					
		// $year = '2017';					
		$sql="select   
		sum(case month(tally_qbzx_prove.createtime) when '1' then 1 else 0 end) as one,  
		sum(case month(tally_qbzx_prove.createtime) when '2' then 1 else 0 end) as two,  
		sum(case month(tally_qbzx_prove.createtime) when '3' then 1 else 0 end) as three,  
		sum(case month(tally_qbzx_prove.createtime) when '4' then 1 else 0 end) as four,  
		sum(case month(tally_qbzx_prove.createtime) when '5' then 1 else 0 end) as five,  
		sum(case month(tally_qbzx_prove.createtime) when '6' then 1 else 0 end) as six,  
		sum(case month(tally_qbzx_prove.createtime) when '7' then 1 else 0 end) as seven,  
		sum(case month(tally_qbzx_prove.createtime) when '8' then 1 else 0 end) as eight,  
		sum(case month(tally_qbzx_prove.createtime) when '9' then 1 else 0 end) as nine,  
		sum(case month(tally_qbzx_prove.createtime) when '10' then 1 else 0 end) as ten,  
		sum(case month(tally_qbzx_prove.createtime) when '11' then 1 else 0 end) as eleven,  
		sum(case month(tally_qbzx_prove.createtime) when '12' then 1 else 0 end) as twelve  
		from tally_qbzx_prove  
		where year(tally_qbzx_prove.createtime)='".$year."'";
		$qbzx_z = M()->query($sql);

		// cfs装箱完成作业的每年的各月作业箱数据统计
		$sql="select   
		sum(case month(tally_cfs_prove.createtime) when '1' then 1 else 0 end) as one,  
		sum(case month(tally_cfs_prove.createtime) when '2' then 1 else 0 end) as two,  
		sum(case month(tally_cfs_prove.createtime) when '3' then 1 else 0 end) as three,  
		sum(case month(tally_cfs_prove.createtime) when '4' then 1 else 0 end) as four,  
		sum(case month(tally_cfs_prove.createtime) when '5' then 1 else 0 end) as five,  
		sum(case month(tally_cfs_prove.createtime) when '6' then 1 else 0 end) as six,  
		sum(case month(tally_cfs_prove.createtime) when '7' then 1 else 0 end) as seven,  
		sum(case month(tally_cfs_prove.createtime) when '8' then 1 else 0 end) as eight,  
		sum(case month(tally_cfs_prove.createtime) when '9' then 1 else 0 end) as nine,  
		sum(case month(tally_cfs_prove.createtime) when '10' then 1 else 0 end) as ten,  
		sum(case month(tally_cfs_prove.createtime) when '11' then 1 else 0 end) as eleven,  
		sum(case month(tally_cfs_prove.createtime) when '12' then 1 else 0 end) as twelve  
		from tally_cfs_prove  
		where year(tally_cfs_prove.createtime)='".$year."'";
		$cfs_z = M()->query($sql);		

		// cfs拆箱完成作业的每年的各月作业箱数据统计
		$sql="select   
		sum(case month(dp.createtime) when '1' then 1 else 0 end) as one,  
		sum(case month(dp.createtime) when '2' then 1 else 0 end) as two,  
		sum(case month(dp.createtime) when '3' then 1 else 0 end) as three,  
		sum(case month(dp.createtime) when '4' then 1 else 0 end) as four,  
		sum(case month(dp.createtime) when '5' then 1 else 0 end) as five,  
		sum(case month(dp.createtime) when '6' then 1 else 0 end) as six,  
		sum(case month(dp.createtime) when '7' then 1 else 0 end) as seven,  
		sum(case month(dp.createtime) when '8' then 1 else 0 end) as eight,  
		sum(case month(dp.createtime) when '9' then 1 else 0 end) as nine,  
		sum(case month(dp.createtime) when '10' then 1 else 0 end) as ten,  
		sum(case month(dp.createtime) when '11' then 1 else 0 end) as eleven,  
		sum(case month(dp.createtime) when '12' then 1 else 0 end) as twelve  
		from tally_dd_prove dp left join tally_dd_plan_container c on c.id = dp.ctn_id left join tally_dd_plan p on p.id = c.plan_id 
		where year(dp.createtime)='".$year."' and p.business ='cfs'";
		$cfs_c = M()->query($sql);

		// 门到门拆箱完成作业的每年的各月作业箱数据统计
		$sql="select   
		sum(case month(dp.createtime) when '1' then 1 else 0 end) as one,  
		sum(case month(dp.createtime) when '2' then 1 else 0 end) as two,  
		sum(case month(dp.createtime) when '3' then 1 else 0 end) as three,  
		sum(case month(dp.createtime) when '4' then 1 else 0 end) as four,  
		sum(case month(dp.createtime) when '5' then 1 else 0 end) as five,  
		sum(case month(dp.createtime) when '6' then 1 else 0 end) as six,  
		sum(case month(dp.createtime) when '7' then 1 else 0 end) as seven,  
		sum(case month(dp.createtime) when '8' then 1 else 0 end) as eight,  
		sum(case month(dp.createtime) when '9' then 1 else 0 end) as nine,  
		sum(case month(dp.createtime) when '10' then 1 else 0 end) as ten,  
		sum(case month(dp.createtime) when '11' then 1 else 0 end) as eleven,  
		sum(case month(dp.createtime) when '12' then 1 else 0 end) as twelve  
		from tally_dd_prove dp left join tally_dd_plan_container c on c.id = dp.ctn_id left join tally_dd_plan p on p.id = c.plan_id 
		where year(dp.createtime)='".$year."' and p.business ='dd'";
		$dd_c = M()->query($sql);

		$count['qbzx_z'][$year] = $qbzx_z[0];
		$count['cfs_z'][$year]  = $cfs_z[0];
		$count['cfs_c'][$year]  = $cfs_c[0];
		$count['dd_c'][$year]   = $dd_c[0];


		$list = M('count')->select();
		foreach ($list as $key => $value) {
			if ($value['business'] == 'qbzx_z') {
				$count['qbzx_z'][$value['year']] = $value;
			} elseif($value['business'] == 'cfs_z') {
				$count['cfs_z'][$value['year']] = $value;
			} elseif($value['business'] == 'dd_c') {
				$count['dd_c'][$value['year']] = $value;
			} elseif($value['business'] == 'cfs_c') {
				$count['cfs_c'][$value['year']] = $value;
			}
		}
		$assign = array(
			'count'			=>	$count,			// 数据整合
			);

		$this->assign($assign);
	    $this->display();
	}

	/**
	 * 地点
	 */
	public function didian(){
		layout(false);
	    // 获取所有的作业场地中文名
	    $qbpl = new \Common\Model\QbzxPlanModel();
		$qn = $qbpl
				->alias('p')
				->field('sum(p.total_ctn) AS countNumber,p.location_id,l.location_name')
				->join('left join tally_location l on l.id = p.location_id')
				->group('p.location_id')
				->select();
		// 计算cfs装箱总箱数
		$cfsinst = new \Common\Model\CfsInstructionModel();
		$cfsn = $cfsinst
				->field('sum(1) AS countNumber,i.location_id,l.location_name')
				->alias('i')
				->join('left join tally_location l on l.id = i.location_id')
				->join('left join tally_cfs_instruction_ctn c on i.id = c.instruction_id')
				->group('i.location_id')
				->select();
		// 计算拆箱总数
		$ddpro = new \Common\Model\DdProveModel();
		$ddc = $ddpro
				->field('sum(1) AS countNumber,pr.location_id,l.location_name')
				->alias('pr')
				->join('left join tally_location l on l.id = pr.location_id')
				->group('pr.location_id')
				->select();
		// 将三个数据合并
		$new_arr1 = $qn;
		foreach ($cfsn as $key => $value) {
			$new_arr1[] = $value;
		}
		foreach ($ddc as $key => $value) {
			$new_arr1[] = $value;
		}
		$ret1 = array();
		foreach($new_arr1 as $v){
		    if(!isset($ret1[$v['location_id']])){
		        $ret1[$v['location_id']] = $v;
		    }else{
		        $ret1[$v['location_id']]['countnumber'] += $v['countnumber'];
		    }
		}

		$legendData = array();
		$seriesData = array();$selected = array();
		foreach ($ret1 as $key => $value) {
			$legendData[] = $value['location_name'];
			$seriesData[] = array(
				'name'	=>	$value['location_name'],
				'value'	=>	$value['countnumber'],
				);
			if ($value['countnumber'] >= 1000 ) {
				$selected[$value['location_name']] = 'true';
			}else{
				$selected[$value['location_name']] = 'false';
			}
		}
		// $location = new \Common\Model\LocationModel ();
		// $locationlist = $location
		// 					->field('id,location_name')
		// 					->limit(0,100)
		// 					->select();
		// $legendData = array();
		// $seriesData = array();
		// foreach ($locationlist as $key => $value) {
		// 	$id = array();
		// 	$legendData[] = $value['location_name'];
		// 	$id['id'] = $value['id'];
		// 	$id['name'] = $value['location_name'];
		// 	$seriesData[] = $id;
		// }
		// $selected = array();
		// // 设置显示的元素
		// foreach ($legendData as $key => $value) {
		// 	if ($key<=6) {
		// 		$selected[$value] = 'true';
		// 	}else{
		// 		$selected[$value] = 'false';
		// 	}

		// }

		// $qbzxpro = new \Common\Model\QbzxProveModel();
		// $ddpro = new \Common\Model\DdProveModel();
		// $cfspro = new \Common\Model\CfsProveModel();
		// $amsg = array();
		// // 计算每个作业地点在四个系统中的作业箱
		// foreach ($seriesData as $key => $value) {
		// 	// 计算起驳装箱的个数
		// 	$qn = $qbzxpro
		// 				->where(array('location_id'=>$value['id']))
		// 				->count();
		// 	// 计算门到门拆箱的个数
		// 	$map = array(
		// 		'pr.location_id'	=>	$value['id'],
		// 		'p.business'		=>	'cfs'
		// 		);
		// 	$ddc = $ddpro
		// 				->alias('pr')
		// 				->join('left join tally_dd_plan_container c on c.id = pr.ctn_id')
		// 				->join('left join tally_dd_plan p on p.id = c.plan_id')
		// 				->where($map)
		// 				->count();
		// 	// 计算CFS装箱的个数
		// 	$cfs = $cfspro
		// 				->where(array('location_id'=>$value['id']))
		// 				->count();
		// 	// 计算CFS拆箱的个数
		// 	$map1 = array(
		// 		'pr.location_id'	=>	$value['id'],
		// 		'p.business'		=>	'dd'
		// 		);
		// 	$cfsc = $ddpro
		// 				->alias('pr')
		// 				->join('left join tally_dd_plan_container c on c.id = pr.ctn_id')
		// 				->join('left join tally_dd_plan p on p.id = c.plan_id')
		// 				->where($map1)
		// 				->count();

		// 	$seriesData[$key]['value'] = $qn+$cfs+$ddc+$cfsc;
		// 	unset($seriesData[$key]['id']);
		// }
		// 二维数组排序   降序
		// array_multisort(array_column($locationid,'count'),SORT_DESC,$locationid);
		$bindata = array(
				'legendData'	=> json_encode($legendData,JSON_UNESCAPED_UNICODE),// 分作业地点--作业地点名称
				'seriesData'	=> json_encode($seriesData,JSON_UNESCAPED_UNICODE),// 分作业地点--饼图数据
				'selected'		=> $selected// 分作业地点--旁边地点列表数据
			);
		$assign=array(
		    'bindata'=>$bindata
		    );
		$this->assign($assign);
	    $this->display();
	}

	/**
	 * 客户
	 */
	public function kehu(){
	    layout(false);
	    // 获取分客户条状数据
		$year = date('Y');
		// 获取今年起驳装箱数最多的数据
		$qbsql = "SELECT sum(total_ctn) AS countNumber,YEAR(entrust_time) as dateTime,entrust_company FROM tally_qbzx_plan where YEAR(entrust_time)=".$year." GROUP BY entrust_company,YEAR(entrust_time) order by countNumber desc ";
		$qb= M()->query($qbsql);

		// 获取今年cfs装箱数最多的数据
		$cfszsql = "SELECT COUNT(1) AS countNumber,YEAR(i.date) as dateTime,i.entrust_company FROM tally_cfs_instruction i left join tally_cfs_instruction_ctn c ON i.id=c.instruction_id where i.entrust_company!='' and YEAR(i.date)=".$year." GROUP BY i.entrust_company order by countNumber desc ";
		$cfsz = M()->query($cfszsql);

		$new_arr = $qb;
		foreach ($cfsz as $key => $value) {
			$new_arr[] = $value;
		}
		$ret = array();
		foreach($new_arr as $v){
		    if(!isset($ret[$v['datetime'].'_'.$v['entrust_company']])){
		        $ret[$v['datetime'].'_'.$v['entrust_company']] = $v;
		    }else{
		        $ret[$v['datetime'].'_'.$v['entrust_company']]['countnumber'] += $v['countnumber'];
		    }
		}
		//让数组显示前十条
		// $ret = array_slice($ret, 0, 10);
		// 获取最新的数据
		// $arr_last_data = array_column($ret, 'countnumber');
		$arr_last_data = array();
		$ids = array();
		foreach ($ret as $key => $value) {
			$arr_last_data[] = $value['countnumber'];	
			$ids[] = $value['entrust_company'];		// 获取所有的客户ID	
		}

		// 获取所有的客户ID
		// $ids = array_column($ret, 'entrust_company');

		// 获取客户名称
		$customerData = M('customer')
					->where(array('id'=>array('in',$ids)))
					->getField('customer_name',true);
		// 根据客户ID获取所有的往年数据
		if (empty($ids)) {
			$id = '(-1)';
		} else {
			$id = '('.implode(',',$ids).')';
		}
		// 获取往年的起驳数据
		$qbsql = "SELECT sum(total_ctn) AS countNumber,YEAR(entrust_time) as dateTime,entrust_company FROM tally_qbzx_plan where  YEAR(entrust_time)<".$year." and entrust_company in $id GROUP BY entrust_company,YEAR(entrust_time) order by YEAR(entrust_time) ";
		$qb= M()->query($qbsql);

		// 获取往年cfs装箱数据
		$cfszsql = "SELECT COUNT(1) AS countNumber,YEAR(p.createtime) as dateTime,entrust_company FROM tally_cfs_prove p left join tally_cfs_instruction_ctn c ON c.id=p.ctn_id left join tally_cfs_instruction i ON i.id=c.instruction_id where YEAR(p.createtime)<".$year." and  i.entrust_company in $id GROUP BY YEAR(p.createtime)";
		$cfsz = M()->query($cfszsql);

		// 获取往年年份
		// $qbyear = array_column($qb, 'datetime');
		$qbyear = array();
		foreach ($qb as $key => $value) {
			$qbyear[] = $value['datetime'];
		}
		$qbyear = array_unique($qbyear);
		// $cfszyear = array_column($cfsz, 'datetime');
		$cfszyear = array();
		foreach ($cfsz as $key => $value) {
			$cfszyear[] = $value['datetime'];
		}
		$cfszyear = array_unique($cfszyear);
		$years_11 = array_keys(array_flip($qbyear)+array_flip($cfszyear));
		$yearss = array();
		foreach ($years_11 as $key => $value) {
			$yearss[] = "$value";
		}
		$new_arr1 = $qb;
		foreach ($cfsz as $key => $value) {
			$new_arr1[] = $value;
		}
		$ret1 = array();
		foreach($new_arr1 as $v){
		    if(!isset($ret1[$v['datetime'].'_'.$v['entrust_company']])){
		        $ret1[$v['datetime'].'_'.$v['entrust_company']] = $v;
		    }else{
		        $ret1[$v['datetime'].'_'.$v['entrust_company']]['countnumber'] += $v['countnumber'];
		    }
		}

		// 组合数据
		$datas = array();
		foreach ($yearss as $key => $value) {
			foreach ($ids as $k => $v) {
				if (isset($ret1[$value.'_'.$v])) {
					$datas[$value][] = $ret1[$value.'_'.$v]['countnumber'];
				} else {
					$datas[$value][] = '';
				}
				
			}
		}
		// p($yearss);
		// p($datas);
		array_push($yearss, $year);
		array_push($datas, $arr_last_data);
		// echo "<hr>";

		$tiao_data = array(
				'customerData'	=> json_encode($customerData,JSON_UNESCAPED_UNICODE),// 分客户--客户名称
				'years'	        => json_encode($yearss ,JSON_UNESCAPED_UNICODE),// 分客户--数据
				'yearsdata'		=> json_encode($datas  ,JSON_UNESCAPED_UNICODE)
			);

		$assign = array(
			'tiao_data'		=>	$tiao_data,		// 条状图数据整合	  --  分客户
			);

		$this->assign($assign);
		$this->display();
	}

	/**
	 * 实时
	 */
	public function shishi(){
	    layout(false);
	    
	    // json转数组
	    $data = $this->ajaxshua();
	    $data = json_decode($data,true);
		$assign = array(
			'qbzx_count'	=>	$data['qbzx_count'],	// 起驳实时
			'qbzx_num'		=>	$data['qbzx_num'],		// 起驳超时报警
			'cfs_z_count'	=>	$data['cfs_z_count'],	// cfs装箱实时
			'cfs_z_num'		=>	$data['cfs_z_num'],		// cfs装箱超时报警
			'cfs_c_count'	=>	$data['cfs_c_count'],	// cfs拆箱实时
			'cfs_c_num'		=>	$data['cfs_c_num'],		// cfs拆箱超时报警
			'dd_c_count'	=>	$data['dd_c_count'],	// 门到门拆箱实时
			'dd_c_num'		=>	$data['dd_c_num'],		// 门到门拆箱超时报警
			);

		$this->assign($assign);
	    $this->display();
	}

	/**
	 * 局部刷新
	 */
	public function ajaxshua(){
	    $where = array(
			'c.status'		=>	array('IN','1,2'),
			'c.operator_id'	=>	array('NEQ',''),
			'o.operation_examine'	=> array('IN','1,3')
			);
		$qbzx_in_ctn = new \Common\Model\QbzxInstructionCtnModel();
		$list = $qbzx_in_ctn
					->alias('c')
					->field('c.id,o.id operationid')
					->join('left join tally_qbzx_operation o on o.ctn_id=c.id')
					->where($where)
					->select();
		$qbzx_count = count($list);
		$level = new \Common\Model\QbzxOperationLevelModel ();
		static $qbzx_num = 0;
		
		// for($i = 0; $i < $qbzx_count; $i ++) {
		// 	if ($list[$i]['operationid'] != '' || $list[$i]['operationid'] != null) {
		// 		// 最新操作时间
		// 		$res_new = $level
		// 					->field( 'createtime' )
		// 					->where( array('operation_id'=>$list[$i]['operationid']) )
		// 					->order('id desc')
		// 					->find();
		// 		if ($res_new ['createtime'] != '') {
		// 			$list [$i] ['newtime'] = $res_new ['createtime'];
		// 		} else {
		// 			$list [$i] ['newtime'] = $res_o ['begin_time'];
		// 		}
		// 		$time1 = strtotime ( $list [$i] ['newtime'] );
		// 		$time2 = time ();
		// 		if (($time2 - $time1) / 300 > 1) {
		// 			$qbzx_num++;
		// 		}
		// 	}
		// }
		$level = new \Common\Model\QbzxOperationLevelModel ();
		static $qbzx_num = 0;
		$operation = new \Common\Model\QbzxOperationModel ();
		for($i = 0; $i < $qbzx_count; $i ++) {
			$ctn_id = $list [$i] ['id'];
			$res_o = $operation
					->field('id,begin_time')
					->where ( "ctn_id=$ctn_id" )->find();
			if ($res_o ['id'] != '') {
				// 最新操作时间
				$res_new = $level
							->field( 'createtime' )
							->where( array('operation_id'=>$list[$i]['operationid']) )
							->order('id desc')
							->find();
				if ($res_new ['createtime'] != '') {
					$list [$i] ['newtime'] = $res_new ['createtime'];
				} else {
					$list [$i] ['newtime'] = $res_o ['begin_time'];
				}
				$time1 = strtotime ( $list [$i] ['newtime'] );
				$time2 = time ();
				if (($time2 - $time1) / 300 > 1) {
					$qbzx_num++;
				}
			}
		}
		
		// 统计CFS装箱作业中数量
		$cfs_in_ctn = new \Common\Model\CfsInstructionCtnModel();
		$list = $cfs_in_ctn
					->alias('c')
					->field('c.id,o.id operationid')
					->join('left join tally_cfs_operation o on o.ctn_id=c.id')
					->where($where)
					->select();
		$cfs_z_count = count($list);
		$level=new \Common\Model\CfsOperationLevelModel();
		static $cfs_z_num = 0;
		
		for($i = 0; $i < $cfs_z_count; $i ++) {
			$ctn_id=$list[$i]['id'];
			$operation = new \Common\Model\CfsOperationModel();
			$res_o=$operation->field('id,begin_time')->where("ctn_id=$ctn_id")->find();
			if($res_o['id']!='')
			{
			// if ($list[$i]['operationid'] != '' || $list[$i]['operationid'] != null) {
				// 最新操作时间
				$res_new = $level
							->field( 'createtime' )
							->where( array('operation_id'=>$list[$i]['operationid']) )
							->order('id desc')
							->find();
				if ($res_new ['createtime'] != '') {
					$list [$i] ['newtime'] = $res_new ['createtime'];
				} else {
					$list [$i] ['newtime'] = $res_o ['begin_time'];
				}
				$time1 = strtotime ( $list [$i] ['newtime'] );
				$time2 = time ();
				if (($time2 - $time1) / 300 > 1) {
					$cfs_z_num++;
				}
			}
		}
		
		// 统计CFS拆箱作业中数量
		$DdPlanContainer=new \Common\Model\DdPlanContainerModel();
		$where1 = array(
			'c.status'				=>	array('IN','1,2'),
			'o.operation_examine'	=> 	array('IN','1,3'),
			'p.business'			=>	'cfs'
			);
		$list=$DdPlanContainer
						->alias('c')
						->field('c.id,o.id operationid')
						->join("left join tally_dd_operation o on o.ctn_id=c.id")
						->join("left join tally_dd_plan p on p.id=c.plan_id")
						->where($where1)
						->select();

		$cfs_c_count = count($list);
		$DdOperationLevel=new \Common\Model\DdOperationLevelModel();
		static $cfs_c_num = 0;
		
		for($i = 0; $i < $cfs_c_count; $i ++) {
			$ctn_id=$list[$i]['id'];
			$DdOperation=new \Common\Model\DdOperationModel();
			$res_o=$DdOperation->field('id,begin_time')->where("ctn_id=$ctn_id")->find();
			if($res_o['id']!='')
			{
			// if ($list[$i]['operationid'] != '' || $list[$i]['operationid'] != null) {
				// 最新操作时间
				$res_new = $DdOperationLevel
							->field( 'createtime' )
							->where( array('operation_id'=>$list[$i]['operationid']) )
							->order('id desc')
							->find();
				if ($res_new ['createtime'] != '') {
					$list [$i] ['newtime'] = $res_new ['createtime'];
				} else {
					$list [$i] ['newtime'] = $res_o ['begin_time'];
				}
				$time1 = strtotime ( $list [$i] ['newtime'] );
				$time2 = time ();
				if (($time2 - $time1) / 300 > 1) {
					$cfs_c_num++;
				}
			}
		}

		// 统计门到门拆箱作业中数量
		$where2 = array(
			'c.status'				=>	array('IN','1,2'),
			'o.operation_examine'	=> 	array('IN','1,3'),
			'p.business'			=>	'dd'
			);
		$list=$DdPlanContainer
						->alias('c')
						->field('c.id,o.id operationid')
						->join("left join tally_dd_operation o on o.ctn_id=c.id")
						->join("left join tally_dd_plan p on p.id=c.plan_id")
						->where($where2)
						->select();

		$dd_c_count = count($list);

		static $dd_c_num = 0;
		
		for($i = 0; $i < $dd_c_count; $i ++) {
			if ($list[$i]['operationid'] != '' || $list[$i]['operationid'] != null) {
				// 最新操作时间
				$res_new = $DdOperationLevel
							->field( 'createtime' )
							->where( array('operation_id'=>$list[$i]['operationid']) )
							->order('id desc')
							->find();
				if ($res_new ['createtime'] != '') {
					$list [$i] ['newtime'] = $res_new ['createtime'];
				} else {
					$list [$i] ['newtime'] = $res_o ['begin_time'];
				}
				$time1 = strtotime ( $list [$i] ['newtime'] );
				$time2 = time ();
				if (($time2 - $time1) / 300 > 1) {
					$dd_c_num++;
				}
			}
		}
		$data = array(
			'qbzx_count'	=>	$qbzx_count,	// 起驳实时
			'qbzx_num'		=>	$qbzx_num,		// 起驳超时报警
			'cfs_z_count'	=>	$cfs_z_count,	// cfs装箱实时
			'cfs_z_num'		=>	$cfs_z_num,		// cfs装箱超时报警
			'cfs_c_count'	=>	$cfs_c_count,	// cfs拆箱实时
			'cfs_c_num'		=>	$cfs_c_num,		// cfs拆箱超时报警
			'dd_c_count'	=>	$dd_c_count,	// 门到门拆箱实时
			'dd_c_num'		=>	$dd_c_num,		// 门到门拆箱超时报警
			);
		if (IS_AJAX) {
			$this->ajaxReturn($data);
		} else {
			return json_encode($data,JSON_UNESCAPED_UNICODE);
		}
		
	}
}
?>