<?php
/**
 * 门到门拆箱-预报计划管理
 */
namespace Index\Controller;
use Index\Common\BaseController;

class DdPlanController extends BaseController
{
	//预报列表
	public function index()
	{
		//集装箱船列表
		$Ship=new \Common\Model\ShipModel();
		$ship_type=json_decode(ship_type,true);
		$shiplist =$Ship->getShipList($ship_type['container']);
		$this->assign ( 'shiplist', $shiplist );
		$Plan=new \Common\Model\DdPlanModel();

		$count=$Plan->count();
		$per = 15;
		if($_GET['p'])
		{
			$p=$_GET['p'];
		}else {
			$p=1;
		}
		// 分页显示输出
		$Page=new \Common\Model\PageModel();
		$show= $Page->show($count,$per);
		$this->assign('page',$show);

		$list = $Plan->page($p.','.$per)->order('id desc')->select();
		$this->assign('list',$list);

		$this->display();
	}

	public function edit()
	{
		$location = new \Common\Model\LocationModel ();
		$ship = new \Common\Model\ShipModel ();
		$Plan=new \Common\Model\DdPlanModel();
		$planCargo=new \Common\Model\DdPlanCargoModel();
		if(I('post.'))
		{
			$plan_id = I('post.plan_id');
			$dtd_departmentid=dtd_departmentid;
			$zg_departmentid = zg_departmentid;
			layout(false);
			// 检验理货地址名称是否正确
			$location_name = I ( 'post.location_name' );
			$data_l = filterString ( $location_name );
			if ($data_l == false) {
				$this->error ( '不能含有特殊字符' );
				exit ();
			}
			$res_l = $location->where ( "location_name='$location_name'" )->field ( 'id' )->find ();
			if ($res_l ['id'] == '') {
				$this->error ( '理货地点不存在！' );
			} else {
				$unpackagingplace = $location_name;
			}
			//判断船名是否存在
			$Ship=new \Common\Model\ShipModel();
			$ship_exist=$Ship->is_exist($_POST ['VSLNAME']);
			if($ship_exist!==true)
			{
				$this->error("该船舶名称不存在！");
			}
			
			$data = array(
					'business'   =>  I('post.BUSINESS'),
					'vslname'    =>  I('post.VSLNAME'),
					'voyage'     =>  I('post.VOYAGE'),
					'note'       =>  I('post.NOTE'),
					'unpackagingplace'  =>   $location_name
				);
			
			$res = $Plan->where("id = '$plan_id'")->save($data);
			if($res !== false)
				{
				$this->success ( '修改拆箱预报成功！' );
			}else{
				$this->error( '修改拆箱预报失败！' );
			}
		}else{
			$id = I('get.id');
			$msg=$Plan->getPlanMsg($id);
			$this->assign('msg',$msg);
			// 预报计划-配货
			$cargoList = $planCargo->getCargoList ( $id );
			$this->assign ( 'cargolist', $cargoList );
			//  预报计划-配箱
			$planContainer = new \Common\Model\DdPlanContainerModel();
			$plancontainerlist = $planContainer->getContainerList($id);
			$this->assign('plancontainerlist',$plancontainerlist);
			// 集装箱船列表
			$ship_type = json_decode ( ship_type, true );
			$shiplist = $ship->getShipList ( $ship_type ['container'] );
			$this->assign ( 'shiplist', $shiplist );
			// 理货地点列表
			$location_type = json_decode ( location_type, true );
			$locationlist = $location->getLocationList ( $location_type ['port'] );
			$this->assign ( 'locationlist', $locationlist );
			$this->display();
		}
	}

	//新增预报
	public function add()
	{
		$ship = new \Common\Model\ShipModel ();
		$DdPlan = new \Common\Model\DdPlanModel();
		$location = new \Common\Model\LocationModel();
		$dtd_departmentid=dtd_departmentid;
		$zg_departmentid = zg_departmentid;
		$kxcy_departmentid = kxcy_departmentid;
		$instruction_status=json_decode(instruction_status,true);
		if(I('post.'))
		{
			layout(false);
			// var_dump(I('post.'));die;
			//判断委托编号是否存在，存在不准重复提交
			$orderid = I('post.ORDERID');
			$res_dp=$DdPlan->where("orderid='$orderid'")->count();
			if($res_dp>0)
			{
				$this->error("该委托计划已存在，不能重复提交");
			}
			//判断船名是否存在
			$Ship=new \Common\Model\ShipModel();
			$ship_exist=$Ship->is_exist($_POST ['VSLNAME']);
			if($ship_exist!==true)
			{
				$this->error("该船舶名称不存在！");
			}
			
			// 检验拆箱地点名称是否正确
			$location_name = I ( 'post.LOCATION_NAME' );
			$data_l = filterString ( $location_name );
			if ($data_l == false) {
				$this->error ( '拆箱地点不能含有特殊字符' );
				exit ();
			}
			$res_l = $location->where ( "location_name='$location_name'" )->field ( 'id' )->find ();
			if ($res_l ['id'] == '') {
				$this->error ( '拆箱地点不存在！' );
			} else {
				$locationname = $location_name;
			}
			//保存预报计划
			$data = array (
					'orderid'    =>  $orderid,
					'orderdate'  =>  date('YmdHis'),
					'business'   =>  I('post.BUSINESS'),
					'vslname'    =>  I('post.VSLNAME'),
					'voyage'     =>  I('post.VOYAGE'),
					'applycode'  =>  I('post.APPLYCODE'),
					'applyname'  =>  I('post.APPLYNAME'),
					'transit'    =>  I('post.TRANSIT'),
					'category'   =>  I('post.CATEGORY'),
					'note'       =>  I('post.NOTE'),
					'unpackagingplace'  =>   $locationname
			);
			
			if(!$DdPlan->create($data))
			{
				//对data数据进行验证
				$this->error($DdPlan->getError());
			}else{
				//验证通过 可以对数据进行操作
				$res=$DdPlan->add($data);
				if(I('post.TRANSIT') == '公路转关')
				{
					$departmentid = $zg_departmentid;
				}elseif(I('post.TRANSIT') == '开箱查验'){
					$departmentid = $kxcy_departmentid;
				}else{
					$departmentid = $dtd_departmentid;
				}
				if ($res!==false)
				{
					//新增指令
					$data_i=array(
							'plan_id'=>$res,
							'date'=>date('Y-m-d'),
							'status'=>$instruction_status['not_start'],
							'department_id'=>$departmentid
					);
					$Instruction=new \Common\Model\DdInstructionModel();
					$Instruction->add($data_i);
					$this->success('添加成功！');
				} else {
					$this->error('添加失败！');
				}
			}
		}else{
			// 集装箱船列表
			$ship_type = json_decode ( ship_type, true );
			$shiplist = $ship->getShipList ( $ship_type ['container'] );
			$this->assign ( 'shiplist', $shiplist );
	
			// 理货地点列表
			$location_type = json_decode ( location_type, true );
			$locationlist = $location->getLocationList ( $location_type ['port'] );
			$this->assign ( 'locationlist', $locationlist );
			$this->display();
		}
	}
	
	public function reloadPage(){
		layout(false);

		$this->display();
	}

	public function doReload(){
		layout(false);
		// 先判断操作类型 是整箱还是拼箱作业
		// 操作类型 根据提单号blno获取 或者 根据箱号ctnno获取
		$type = I('post.type');
		if($type == 'blno'){
			/*
			  此处 处理一票多箱情况
			*/
			// 根据提单号从龙潭抓取数据
			$blno = I("post.blno");
			$data = \Common\Model\LongTanModel::getDismantleDataByBlno($blno);
			foreach ($data as $k => $v) {
				if(!($v['container_service_type']=="EXFCL" or $v['container_service_type'] =="IMFCL")){
					$this->error("该提单号查询到的箱不是整箱！");
					exit;
				} 
			}
		} else {
			/*
			  此处处理一箱多票情况
			*/
			$ctnno = I("post.ctnno");
			$data = \Common\Model\LongTanModel::getDismantleDataByCtnno($ctnno);
			foreach ($data as $k => $v) {
				if(!($v['container_service_type']=="EXLCL" or $v['container_service_type'] =="IMLCL")){
					$this->error("该提单号查询到的箱不是拼箱！");
					exit;
				} 
			}
		}
		if(empty($data)){
			$this->error("数据输入错误，请核对后再加载2");
			exit;
		}
		M()->db(0);
		// 根据龙潭数据生成预报所需数据
		$plan = $this->getCreatePlanData($data, $type);
		// 判断该预报是否已存在
		// 启动数据库事务！！！
		M()->startTrans(); // 开启事务

		$DdPlan = new \Common\Model\DdPlanModel();
		$planCargo=new \Common\Model\DdPlanCargoModel();
		$PlanContainer = new \Common\Model\DdPlanContainerModel();
		$Instruction=new \Common\Model\DdInstructionModel();

		if(is_array($plan)){
			// 该预报未存在 新添加一条预报数据
			if($plan_id = $DdPlan->add($plan)){
				$plan['id'] = $plan_id;
				// 根据预报生成配货信息
				$plan_cargo = $this->getCreatePlanCargoData($data, $plan, $type);
				if($planCargo->addAll($plan_cargo)){
				} else {
					// 若新增预报配货失败 则直接回滚 并报错
					M()->rollback(); // 事务回滚
					$this->error("数据输入错误，请核对后再加载4");
					exit;
				}

				// 根据预报生成配箱信息
				$plan_ctn = $this->getCreatePlanCtnData($data, $plan['id'], $type);
				if($PlanContainer->addAll($plan_ctn)){
				} else {
					// 若新增预报配货失败 则直接回滚 并报错
					M()->rollback(); // 事务回滚
					$this->error("数据输入错误，请核对后再加载4");
					exit;
				}
				// 根据龙潭数据获取预报指令数据
				$qbzx_ins = $this->getCreatePlanInsData($plan['id'],$plan['location_id']);
				// 判断新增指令是否成功
				if ($Instruction->add($qbzx_ins)) {
				} else {
					M()->rollback(); // 事务回滚
					$this->error("数据输入错误，请核对后再加载2");
					exit;
				}
			} else {
				// 生成新预报失败
				$this->error("数据输入错误，请核对后再加载1");
				exit;
			}
		} else {
			$this->error("该预报已存在，请核对后再输入！");
			exit;
		}
		// 提交事务
		M()->commit();
		echo '<script>alert("新增指令配箱成功!");top.location.reload(true);window.close();</script>';
	}
	/**
	* 生成预报配货信息数据
	* @param int $plan_id     预报计划ID
	* @param int $location_id 作业场地ID
	*/
	public function getCreatePlanInsData($plan_id,$location_id){
		// 工班信息
		$department = M('department')->where("department_code='MDMBZ'")->find();
		$res=array(
					'plan_id'=>$plan_id,
					'date'=>date('Y-m-d'),
					'status'=>"0",
					'department_id'=>$department['id']
			);
		return $res;
	}
	/**
	* 生成预报配箱信息
	* @param array $data 龙潭数据
	* @param int $plan_id 预报ID
	* @param string $type 类型
	*/
	public function getCreatePlanCtnData($data,$plan_id,$type){
		if($type == 'blno'){
			// 一票多箱
			$ctn_master = M('container_master')->where("ctn_master='{$v['owner_code']}'")->find();
			if(empty($ctn_master)){
				M()->rollback();
				$this->error("箱主信息不全，请维护！");
				exit;
			}
			foreach ($data as $k => $v) {
				$ctn_type = explode('-', $v['con_size']);
				$res[$k] = array (
						'ctnno' => $v['container_number'],
						'ctnsize' => $ctn_type[0],
						'ctntype' => $ctn_type[1],
						'numbersofpackages' => $v['pieces'],
						'weight' => $v['weight'],
						'volume' => $v['volumn'],
						'sealno' => $v['seal_1'],
						'flflag' => "F", // 默认 整箱
						'plan_id' =>  $plan_id
				);
			}
		} else {
			$ctn_master = M('container_master')->where("ctn_master='{$data[0]['owner_code']}'")->find();
			if(empty($ctn_master)){
				M()->rollback();
				$this->error("箱主信息不全，请维护！");
				exit;
			}
			$ctn_type = explode('-', $data[0]['con_size']);
			$res[0] = array (
						'ctnno' => $data[0]['container_number'],
						'ctnsize' => $ctn_type[0],
						'ctntype' => $ctn_type[1],
						'numbersofpackages' => $data[0]['pieces'],
						'weight' => $data[0]['weight'],
						'volume' => $data[0]['volumn'],
						'flflag' => "L", // 默认 整箱
						'plan_id' =>  $plan_id
				);
		}
		return $res;
	}
	/** 
	 * 生成预报配货信息数据
	 * @param array $data 龙潭数据
	 * @param array $plan 预报数据
	 * @param string $type 获取操作方式的类型 整箱或者拼箱
	 * @param array $plan_cargo 预报存在下的配货信息
	*/
	public function getCreatePlanCargoData($data,$plan,$type){
		if ($type == 'blno') {
			$res[0]=array(
						'plan_id'=>$plan['id'],
						'blno'=>$data[0]['bl_so_no'],
						'numbersofpackages'=>$data[0]['pieces'],
						'package'=>$data[0]['package_des'],
						'last_operator'=>$_SESSION['uid'],
						'last_operationtime'=>date('Y-m-d H:i:s'),
						'contactuser'  => "外理系统管理员",
						'contact'  => "025-58583921",
						'cargoname' => $data[0]['cargo_name'],
				);

		} else {
			foreach ($data as $k => $v) {
				$res[$k]=array(
						'plan_id'=>$plan['id'],
						'blno'=>$v['bl_so_no'],
						'cargoname' => $v['cargo_name'],
						'numbersofpackages'=>$v['pieces'],
						'package'=>$v['package_des'],
						'last_operator'=>$_SESSION['uid'],
						'last_operationtime'=>date('Y-m-d H:i:s'),
						'contactuser'  => "外理系统管理员",
						'contact'  => "025-58583921"
				);
			}
		}
		return $res;
	}
	/**
	 *根据从龙潭获取的数据生成对应的预报数据
	 * @param array $data 从龙潭抓取的数据
	 * @param string $type 获取操作方式的类型 整箱或者拼箱
	*/
	
	public function getCreatePlanData($data,$type){
		// 委托编号 设置为 "未知"
		$entrustno = "未知";
		// 根据船舶代码 获取对应的船ID
		// 此处 做假设 ：假设查询到的数据属于同一艘船 即船舶代码都相同
		$ship_code = $data[0]['vessel_code'];
		$ship = M("ship")->where("ship_code = '$ship_code'")->find();
		$ship_id = $ship['id'];
		if(!$ship_id){
			$this->error("没有对应的船，请去维护船舶系统！");
		}
		// 根据船名航次查询数据 判断该预报是否已存在
		$ctn = '';
		foreach ($data as $k => $v) {
			$ctn .= "'".$v['container_number']."',"; 
		}
		$ctn = rtrim($ctn,',');

		$where = array(
				'vslname' => $ship['ship_name'],
				'voyage'     =>  $data[0]['oper_in_voyage'],
			);
		$dd_plan = M('dd_plan')->where($where)->order("id desc")->find();
		if($dd_plan['id']){
			$sql = "SELECT c.* FROM tally_dd_plan_container c WHERE c.plan_id = '{$dd_plan['id']}' and c.ctnno IN ($ctn)";
			$res_c = M()->query($sql);
			if($res_c[0]['id']){
				return $dd_plan['id'];
			}
		}
		$res = array (
					'orderid'    =>  $entrustno,
					'orderdate'  =>  date('YmdHis'),
					'business'   =>  'cfs',
					'vslname'    =>  $ship['ship_name'],
					'voyage'     =>  $data[0]['oper_in_voyage'],
					'applycode'  =>  '0000',
					'applyname'  =>  '南京中理',
					'category'   =>  '2', // 默认值设为2
					'unpackagingplace'  =>   "未知"
			);
		return $res;
		
	}
	
	

	/**
	 * 生成指令配箱数据
	 * @param array $data 从龙潭抓取的数据
	 * @param int $instruction_id 指令ID
	 * @param string $type
	*/
	public function getCreatePlanInsCtnData($data,$instruction_id,$type){
		$ctn_master = M('container_master')->where("ctn_master='未知'")->find();
		if($type == 'blno'){
			// 一票多箱
			foreach ($data as $k => $v) {
				$ctn_type = explode('-', $v['sta']);
				$ctn_type_code = $ctn_type[0].$ctn_type[1];
				$res[$k] = array(
						'instruction_id' 	=>$instruction_id,
						'ctnno' 			=>$v['container_number'],
						'ctn_type_code' 			=>$ctn_type_code,
						'ctn_master' 		=>$ctn_master['id'],
						'status' 			=>'0',
					);
			}
		} else {
			// 一箱多票
			$ctn_type = explode('-', $data[0]['sta']);
			$ctn_type_code = $ctn_type[0].$ctn_type[1];
			$res[0] = array(
						'instruction_id' 	=>$instruction_id,
						'ctnno' 			=>$data[0]['container_number'],
						'ctn_type_code' 	=>$ctn_type_code,
						'ctn_master' 		=>$ctn_master['id'],
						'status' 			=>'0',
					);
		}
		return $res;
	}

	//预报审核
	public function examine($plan_id)
	{
		$instruction = new \Common\Model\DdInstructionModel();
		$plan = new \Common\Model\DdPlanModel();
		$res = $instruction->field("id,status")->where("plan_id = '$plan_id'")->select();
		if($res !== false)
		{
			foreach ($res as $v)
			{
				//判断预报指令是否已完成
				if($v['status'] != '2')
				{
					echo '<script>alert("该预报指令尚未完成!");window.history.go(-1);</script>';
					exit;
				}
				//判断指令的配箱是否全部已完成
				$planctn = new \Common\Model\DdPlanContainerModel();
				$ctn_list = $planctn->field("id,status")->where("plan_id='$plan_id'")->select();
				if($ctn_list !== false)
				{
					foreach ($ctn_list as $value)
					{
						//判断预报指令配箱是否已完成
						if($value['status'] != '2' and $value['status'] != '3')
						{
							echo '<script>alert("预报有尚未完成的配箱!");window.history.go(-1);</script>';
							exit;
						}
						//判断箱是否审核
						$ddoperation = new \Common\Model\DdOperationModel();
						$res_o = $ddoperation->field("operation_examine")->where("ctn_id='".$value['id']."'")->find();
						if($res_o['operation_examine'] != '2')
						{
							echo '<script>alert("有尚未审核的配箱!");window.history.go(-1);</script>';
							exit;
						}
					}
				}else{
					echo '<script>alert("查询预报配箱有误!");window.history.go(-1);</script>';
					exit;
				}
			}
			//修改审核状态，记录修改的操作人
			$data = array(
					'examine'  =>   'Y',
					'examine_operator'    =>$_SESSION ['uid']
			);
			$res_e = $plan->where("id='$plan_id'")->save($data);
			if($res_e !== false)
			{
				echo '<script>alert("审核成功!");window.history.go(-1);</script>';
				exit;
			}else{
				echo '<script>alert("审核失败!");window.history.go(-1);</script>';
				exit;
			}
		}else{
			echo '<script>alert("查询预报指令有误!");window.history.go(-1);</script>';
			exit;
		}
	}
}