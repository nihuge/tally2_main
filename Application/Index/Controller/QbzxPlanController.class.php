<?php
/**
 * 起泊装箱-预报计划
 */
namespace Index\Controller;
use Index\Common\BaseController;

class QbzxPlanController extends BaseController
{
	//预报计划列表
	public function index()
	{
		$plan=new \Common\Model\QbzxPlanModel();
		$where="1";
		$count=$plan->where($where)->count();
		$per = 15;
		if($_GET['p'])
		{
			$p=$_GET['p'];
		}else {
			$p=1;
		}
		$Page= new \Think\Page($count,$per);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$Page->rollPage=10; // 分页栏每页显示的页数
		$Page -> setConfig('header','共%TOTAL_ROW%条');
		$Page -> setConfig('first','首页');
		$Page -> setConfig('last','共%TOTAL_PAGE%页');
		$Page -> setConfig('prev','上一页');
		$Page -> setConfig('next','下一页');
		$Page -> setConfig('link','indexpagenumb');//pagenumb 会替换成页码
		$Page -> setConfig('theme','%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% 第 '.I('p',1).' 页/共 %TOTAL_PAGE% 页 (<font color="red">'.$per.'</font> 条/页 共 %TOTAL_ROW% 条)');
		$show= $Page->show();// 分页显示输出
		$this->assign('page',$show);
		
		//列表
		$begin=($p-1)*$per;
		$sql="select p.*,s.ship_name,l.location_name,c.customer_name as customer from __PREFIX__qbzx_plan p,__PREFIX__ship s,__PREFIX__location l,__PREFIX__customer c where p.id!='' and p.ship_id=s.id and p.location_id=l.id and p.entrust_company=c.id order by p.id desc limit $begin,$per";
		$list=M()->query($sql);
		$this->assign('list',$list);
		$this->display();
	}
	
	//新增预报计划
	public function add() 
	{
		$ship=new \Common\Model\ShipModel();
		$location=new \Common\Model\LocationModel();
		$customer=new \Common\Model\CustomerModel();
		$cargoagent=new \Common\Model\CargoAgentModel();
		if (! IS_POST) 
		{
			//理货地点列表
			$location_type=json_decode(location_type,true);
			$locationlist = $location->getLocationList($location_type['port']);
			$this->assign ( 'locationlist', $locationlist );
			//集装箱船列表
			$ship_type=json_decode(ship_type,true);
			$shiplist =$ship->getShipList($ship_type['container']);
			$this->assign ( 'shiplist', $shiplist );
			//客户列表-代理
			$customer_category=json_decode(customer_category,true);
			$customerlist=$customer->getCustomerList($customer_category['agent']);
			$this->assign ( 'customerlist', $customerlist );
			//货代
			$cargoAgentList=$cargoagent->getCargoAgentList();
			$this->assign ( 'cargoAgentList', $cargoAgentList );
			$this->display ();
		} else {
			layout ( false );
			if(I('post.entrustno')=='' or I('post.entrust_company')=='' or I('post.location_name')=='' or I('post.shipname')=='' or I('post.voyage')=='' or I('post.total_ticket')=='' or I('post.cargo_agent')=='')
			{
				$this->error('委托编号、委托单位、理货地点、船舶名称、航次、总票数、货代不能为空！');
			}
			//检验理货地址名称是否正确
			$location_name = I ( 'post.location_name' );
			$data_l = filterString($location_name);
			if($data_l == false){
				$this->error('不能含有特殊字符');
				exit();
			}
			$res_l=$location->where("location_name='$location_name'")->field('id')->find();
			if($res_l['id']=='')
			{
				$this->error('理货地点不存在！');
			}else {
				$location_id = $res_l['id'];
			}
			
			//检查委托单位是否正确
			$customer_name = I('post.entrust_company');
			$data_c = filterString($customer_name);
			if($data_c == false){
				$this->error('不能含有特殊字符');
				exit();
			}
			$res_c = $customer->where("customer_name='$customer_name'")->field('id')->find();
			if($res_c['id']=='')
			{
				$this->error('委托单位不存在');
			}else{
				$entrust_company = $res_c['id'];
			}
			
			//检验船舶名称是否正确
			$shipname = I ( 'post.shipname' );
			$data_s = filterString($shipname);
			if($data_s == false)
			{
				$this->error('不能含有特殊字符');
				exit();
			}
			$res_s=$ship->where("ship_name='$shipname'")->field('id')->find();
			if($res_s['id']=='')
			{
				$this->error('船舶名称不存在！');
			}else {
				$ship_id = $res_s['id'];
			}
			
			//检验货代名称是否正确
			$cargo_agent = I ( 'post.cargo_agent' );
			$data_ca = filterString($cargo_agent);
			if($data_ca == false)
			{
				$this->error('不能含有特殊字符');
				exit();
			}
			$res_ca=$cargoagent->where("name='$cargo_agent'")->field('id')->find();
			if($res_ca['id']=='')
			{
				$this->error('货代名称不存在！');
			}else {
				$cargo_agent_id = $res_ca['id'];
			}
			// 将提交过来的数据强制类型转换
			$total_ctn = intval(I('post.total_ctn'));
			if($total_ctn>2147483647){
				$this->error("总箱数错误！");
				// echo $total_ctn;
				exit;
			}
			$data=array(
					'entrustno'=>trim(I ( 'post.entrustno' ),"'"),
					'entrust_company'=>$entrust_company,
					'location_id'=>$location_id,
					'ship_id'=>$ship_id,
					'voyage'=>trim(I('post.voyage'),"'"),
					// 'total_ctn'=>trim(I ('post.total_ctn')),
					'total_ctn'=>$total_ctn,
					'total_ticket'=>trim(I ( 'post.total_ticket' ),"'"),
					'total_package'=>trim(I ( 'post.total_package' ),"'"),
					'total_weight'=>trim(I ( 'post.total_weight' ),"'"),
					'cargo_agent_id'=>$cargo_agent_id,
					'packing_require'=>trim(I ('post.packing_require')),
					'entrust_time'=>date ('Y-m-d'),
					'last_operator'=>$_SESSION ['uid'],
					'last_operationtime'=>date ('Y-m-d H:i:s'),
					
			);
			$plan=new \Common\Model\QbzxPlanModel();
			if(!$plan->create($data))
			{
				//对data数据进行验证
				$this->error($plan->getError());
			}else{
				//验证通过 可以对数据进行操作
				$plan_id=$plan->add($data);
				if ($plan_id)
				{
					$this->success ( '新增起泊装箱预报计划成功', U ('index') );
				} else {
					$this->error ('操作失败！');
				}
			}
		}
	}
	
	//编辑预报计划
	public function edit($plan_id)
	{
		$this->assign('plan_id',$plan_id);
		//根据预报计划ID获取预报计划详情
		$customer=new \Common\Model\CustomerModel();
		$plan=new \Common\Model\QbzxPlanModel();
		$msg=$plan->getPlanMsg($plan_id);
		$this->assign('msg',$msg);
		$shipModel=new \Common\Model\ShipModel();
		$location=new \Common\Model\LocationModel();
		//理货地点列表
		$location_type=json_decode(location_type,true);
		$locationlist = $location->getLocationList($location_type['type']);
		$this->assign ( 'locationlist', $locationlist );
		//集装箱船列表
		$shiplist =$shipModel->getShipList(1);
		$this->assign ( 'shiplist', $shiplist );
		//客户列表-代理
		$customer_category=json_decode(customer_category,true);
		$customerlist=$customer->getCustomerList($customer_category['agent']);
		$this->assign ( 'customerlist', $customerlist );
		//货代
		$cargoAgent=new \Common\Model\CargoAgentModel();
		$cargoAgentList=$cargoAgent->getCargoAgentList();
		$this->assign ( 'cargoAgentList', $cargoAgentList );
		
		//预报计划-配箱
		$planContainer=new \Common\Model\QbzxPlanCtnModel();
		$containerList=$planContainer->getContainerList($plan_id);
		$this->assign('containerlist',$containerList);
		
		//预报计划-配货
		$planCargo=new \Common\Model\QbzxPlanCargoModel();
		$cargoList=$planCargo->getCargoList($plan_id);
		$this->assign('cargolist',$cargoList);
		
		if(I('post.'))
		{
			layout ( false );
			if(I('post.entrustno')=='' or I('post.entrust_company')=='' or I('post.location_name')=='' or I('post.shipname')=='' or I('post.voyage')=='' or I('post.total_ticket')=='' or I('post.cargo_agent')=='')
			{
				$this->error('委托编号、委托单位、理货地点、船舶名称、航次、总票数、货代不能为空！');
			}
			//检验理货地址代码是否正确
			$location_name = I ( 'post.location_name' );
			$data_l = filterString($location_name);
			if($data_l == false){
				$this->error('不能含有特殊字符');
				exit();
			}
			$res_l=$location->where("location_name='$location_name'")->field('id')->find();
			if($res_l['id']=='')
			{
				$this->error('理货地点不存在！');
			}else {
				$location_id = $res_l['id'];
			}
			
			//检查委托单位是否正确
			$customer_name = I('post.entrust_company');
			$data_c = filterString($customer_name);
			if($data_c == false){
				$this->error('不能含有特殊字符');
				exit();
			}
			$res_c = $customer->where("customer_name='$customer_name'")->field('id')->find();
			if($res_c['id']=='')
			{
				$this->error('委托单位不存在');
			}else{
				$entrust_company = $res_c['id'];
			}

			//检验船舶名称是否正确
			$shipname = I ( 'post.shipname' );
			$data_s = filterString($shipname);
			if($data_s == false){
				$this->error('不能含有特殊字符');
				exit();
			}
			$res_s=$shipModel->where("ship_name='$shipname'")->field('id')->find();
			if($res_s['id']=='')
			{
				$this->error('船舶名称不存在！');
			}else {
				$ship_id = $res_s['id'];
			}

			//检验货代名称是否正确
			$cargo_agent = I ( 'post.cargo_agent' );
			$data_ca = filterString($cargo_agent);
			if($data_ca == false){
				$this->error('不能含有特殊字符');
				exit();
			}
			$res_ca=$cargoAgent->where("name='$cargo_agent'")->field('id')->find();
			if($res_ca['id']=='')
			{
				$this->error('货代名称不存在！');
			}else {
				$cargo_agent_id = $res_ca['id'];
			}

			// 将提交过来的数据强制类型转换
			$total_ctn = intval(I('post.total_ctn'));
			if($total_ctn>2147483647){
				$this->error("总箱数错误！");
				exit;
			}
			$data=array(
					'entrustno'=>trim(I ( 'post.entrustno' ),"'"),
					'entrust_company'=>$entrust_company,
					'location_id'=>$location_id,
					'ship_id'=>$ship_id,
					'voyage'=>trim(I('post.voyage'),"'"),
					'total_ctn'=>trim(I ('post.total_ctn'),"'"),
					'total_ticket'=>trim(I ( 'post.total_ticket' ),"'"),
					'total_package'=>trim(I ( 'post.total_package' ),"'"),
					'total_weight'=>trim(I ( 'post.total_weight' ),"'"),
					'cargo_agent_id'=>$cargo_agent_id,
					'packing_require'=>trim(I ('post.packing_require'),"'"),
					'entrust_time'=>date ('Y-m-d'),
					'last_operator'=>$_SESSION ['uid'],
					'last_operationtime'=>date ('Y-m-d H:i:s'),
					
			);
			if(!$plan->create($data))
			{
				//对data数据进行验证
				$this->error($plan->getError());
			}else{
				//验证通过 可以对数据进行验证
				$res = $plan->where ( "id=$plan_id" )->save ($data);
				if ($res !== false)
				{
					$this->success ('修改起泊装箱预报计划成功');
				} else {
					$this->error ( '修改失败');
				}
			}
		}else {
			$this->display();
		}
	}
	
	//删除预报
	public function del($plan_id)
	{
		layout(false);
		//判断预报下是否存在指令，存在不允许删除
		$instruction=new \Common\Model\QbzxInstructionModel();
		$instruction_num=$instruction->where("plan_id=$plan_id")->count();
		if($instruction_num>0)
		{
			//存在指令，不允许删除
			$this->error('该预报已有指令，不允许删除！');
		}else {
			//不存在指令，允许删除
			//删除预报
			$plan=new \Common\Model\QbzxPlanModel();
			$res_p=$plan->where("id=$plan_id")->delete();
			$container=new \Common\Model\QbzxPlanCtnModel();
			$res_ctn=$container->where("plan_id=$plan_id")->delete();
			$cargo=new \Common\Model\QbzxPlanCargoModel();
			$res_c=$cargo->where("plan_id=$plan_id")->delete();
			if($res_p!==false and $res_ctn!==false and $res_c!==false)
			{
				$this->success('删除预报计划成功！');
			}else {
				$this->error('删除预报计划失败！');
			}
		}
	}
	// 加载页面，显示加载页面
	public function reloadPage(){
		layout(false);

		$this->display();
	}

	
	
	/**
	 *根据从龙潭获取的数据生成对应的预报数据
	 * @param array $data 从龙潭抓取的数据
	 * @param string $type 获取操作方式的类型 整箱或者拼箱
	*/
	
	public function getCreatePlanData($data,$type){
		// 委托编号 设置为 "未知"
		$entrustno = "未知";
		// 委托单位默认值为 "未知"
		$customer_name = "未知";
		$customer=new \Common\Model\CustomerModel();
		$res_c = $customer->where("customer_name='$customer_name'")->field('id')->find();
		$entrust_company = $res_c['id'];
		// 理货地点默认值为 "未知"
		$location_name = "未知";
		$location=new \Common\Model\LocationModel();
		$res_l=$location->where("location_name='$location_name'")->field('id')->find();
		$location_id = $res_l['id'];
		// 根据船舶代码 获取对应的船ID
		// 此处 做假设 ：假设查询到的数据属于同一艘船 即船舶代码都相同
		$ship_code = $data[0]['vessel_code'];
		$ship = M("ship")->where("ship_code = '$ship_code'")->find();
		$ship_id = $ship['id'];
		if(!$ship_id){
			M()->rollback(); // 事务回滚
			$this->error("没有对应的船，请去维护船舶系统！");
			exit;
		}
		// 航次
		$voyage = $data[0]['oper_out_voyage'];
		// 获取总箱数总件数总票数总重量
		$total_ctn = 0;
		$totle_ticket = 0;
		$total_package = 0;
		$total_weight = 0;
		if($type == "blno"){
			$totle_ticket = 1;
			$total_ctn = count($data);
		} else {
			$totle_ticket = count($data);
			$total_ctn = 1;
		}
		$ctn = '';
		foreach ($data as $k => $v) {
			$total_weight += $v['weight'];
			$total_package += $v['pieces'];
			$ctn .= "'".$v['container_number']."',"; 
		}
		$ctn = rtrim($ctn,',');
		// 定义一个值 将货代名设置为 '未知' 获取对应的货代ID
		$cargo_agent = 'WZ000000';
		$cargoagent=new \Common\Model\CargoAgentModel();
		$res_ca=$cargoagent->where("code='$cargo_agent'")->field('id')->find();
		$cargo_agent_id = $res_ca['id']; // 默认设置 货代名为 未知，让理货长取修改
		if(!$cargo_agent_id){
			M()->rollback(); // 事务回滚
			$this->error("货代不存在，请维护货代系统！");
			exit;
		}
		// 判断该预报是否存在 若存在返回该预报的ID 若不存在返回拼凑完成的预报数据

		$plan = array(
				'ship_id'=>$ship_id,
				'voyage'=>$voyage,
			);
		$planmodel=new \Common\Model\QbzxPlanModel();
		$res = M('qbzx_plan')->where($plan)->order("id desc")->find();
		if($res['id']){
			// 查询该预报下的指令配箱是否存在该配箱
			$sql = "SELECT c.* FROM tally_qbzx_instruction_ctn c,tally_qbzx_instruction i WHERE c.instruction_id=i.id and i.plan_id={$res['id']} and c.ctnno IN ($ctn)";
			$res_c = M()->query($sql);
			if($res_c[0]['id']){
				return $res['id'];
			}
		} 
		$plan=array(
			'entrustno'			=>$entrustno,
			'entrust_company'	=>$entrust_company,
			'location_id'		=>$location_id,
			'ship_id'			=>$ship_id, 
			'voyage'			=>$voyage,
			'total_ctn'			=>$total_ctn,
			'total_ticket'		=>$totle_ticket,
			'total_package'		=>$total_package,
			'total_weight'		=>$total_weight,
			'cargo_agent_id'	=>$cargo_agent_id,
			'packing_require' 	=>"暂无",
			'entrust_time'		=>date ('Y-m-d'),
			'last_operator'		=>$_SESSION ['uid'],
			'last_operationtime'=>date ('Y-m-d H:i:s'),
		);
		return $plan;
		
		
		/*$plan=array(
					'entrustno'			=>$entrustno,
					'entrust_company'	=>$entrust_company,
					'location_id'		=>$location_id,
					'ship_id'			=>$ship_id, 
					'voyage'			=>$voyage,
					'total_ctn'			=>$total_ctn,
					'total_ticket'		=>$totle_ticket,
					'total_package'		=>$total_package,
					'total_weight'		=>$total_weight,
					'cargo_agent_id'	=>$cargo_agent_id,
					'packing_require' 	=>"暂无",
					'entrust_time'		=>date ('Y-m-d'),
					'last_operator'		=>$_SESSION ['uid'],
					'last_operationtime'=>date ('Y-m-d H:i:s'),
			);
		return $plan;*/
	}
	/** 
	 * 生成预报配货信息数据
	 * @param array $data 龙潭数据
	 * @param array $plan 预报数据
	 * @param string $type 获取操作方式的类型 整箱或者拼箱
	 * @param array $plan_cargo 预报存在下的配货信息
	*/
	public function getCreatePlanCargoData($data,$plan,$type,$plan_cargo=null){
		if ($type == 'blno') {
			if($data[0]['imo_code']){
				$dangerlevel = $data[0]['imo_code'];
			} else {
				$dangerlevel = '0';
			}
			$plan_cargo[0] = array(
					'plan_id'			=>$plan['id'],
					'billno'			=>$data[0]['bl_so_no'],
					'cargo_name'		=>"未知",
					'total_weight'		=>$plan['total_weight'],
					'number'			=>$plan['total_package'],
					'pack'				=>$data[0]['package_des'],
					'mark'				=>"未知",
					'dangerlevel'		=>$dangerlevel,
					'ship_id'			=>$plan['ship_id'],
					'location_id'		=>$plan['location_id'],
					'port_id'			=>"",
				);
		} else {
			foreach ($data as $k => $v) {
				if($v['imo_code']){
					$dangerlevel = $v['imo_code'];
				} else {
					$dangerlevel = '0';
				}
				$plan_cargo[$k] = array(
						'plan_id'			=>$plan['id'],
						'billno'			=>$v['bl_so_no'],
						'cargo_name'		=>$v['cargo_name'],
						'total_weight'		=>$v['weight'],
						'number'			=>$v['pieces'],
						'pack'				=>$v['package_des'],
						'mark'				=>"未知",
						'dangerlevel'		=>$dangerlevel,
						'ship_id'			=>$plan['ship_id'],
						'location_id'		=>$plan['location_id'],
						'port_id'			=>"",
					);
			}
		}
		return $plan_cargo;
	}
	/**
	* 生成预报配货信息数据
	* @param int $plan_id     预报计划ID
	* @param int $location_id 作业场地ID
	*/
	public function getCreatePlanInsData($plan_id,$location_id){
		// 工班信息
		$department = M('department')->where("department_code='QBZXZ'")->find();
		$qbzx_ins=array(
			'plan_id' => $plan_id,
			'location_id'=>$location_id,
			'loadingtype'=>"0",
			'department_id'=>$department['id'],
			'ordertime'=>date('Y-m-d'),
			'last_operator'=>$_SESSION['uid'],
			'last_operationtime'=>date ('Y-m-d H:i:s'),
		);
		return $qbzx_ins;
	}

	/**
	 * 生成指令配箱数据
	 * @param array $data 从龙潭抓取的数据
	 * @param int $instruction_id 指令ID
	 * @param string $type
	*/
	public function getCreatePlanInsCtnData($data,$instruction_id,$type){
		if($type == 'blno'){
			// 一票多箱
			foreach ($data as $k => $v) {
				$ctn_master = M('container_master')->where("ctn_master='{$v['owner_code']}'")->find();
				if(empty($ctn_master)){
					M()->rollback();
					$this->error("箱主信息不全，请维护！");
					exit;
				}
				$ctn_type = explode('-', $v['con_size']);
				$ctn_type_code = $ctn_type[0].$ctn_type[1];
				$res[$k] = array(
						'instruction_id' 	=>$instruction_id,
						'ctnno' 			=>$v['container_number'],
						'ctn_type_code' 	=>$ctn_type_code,
						'ctn_master' 		=>$ctn_master['id'],
						'flflag'  			=> 'F',
						'status' 			=>'0',
					);
			}
		} else {
			$ctn_master = M('container_master')->where("ctn_master='{$data[0]['owner_code']}'")->find();
			if(empty($ctn_master)){
				M()->rollback();
				$this->error("箱主信息不全，请维护！");
				exit;
			}
			// 一箱多票
			$ctn_type = explode('-', $data[0]['con_size']);
			$ctn_type_code = $ctn_type[0].$ctn_type[1];
			$res[0] = array(
						'instruction_id' 	=>$instruction_id,
						'ctnno' 			=>$data[0]['container_number'],
						'ctn_type_code' 	=>$ctn_type_code,
						'ctn_master' 		=>$ctn_master['id'],
						'flflag'  			=> 'L',
						'status' 			=>'0',
					);
		}
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
			foreach ($data as $k => $v) {
				$ctn_master = M('container_master')->where("ctn_master='{$v['owner_code']}'")->find();
				if(empty($ctn_master)){
					M()->rollback();
					$this->error("箱主信息不全，请维护！");
					exit;
				}
				$ctn_type = explode('-', $v['con_size']);
				$ctn_type_code = $ctn_type[0].$ctn_type[1];
				$res[$k] = array(
						'plan_id'=>$plan_id,
						'ctn_type_code'=>$ctn_type_code,
						'quantity'=>1,
						'ctn_master'=>$ctn_master['id'],
						'flflag'=>1,
						'last_operator'=>$_SESSION['uid'],
						'last_operationtime' =>date("Y-m-d H:i:s"),
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
			$ctn_type_code = $ctn_type[0].$ctn_type[1];
			$res[0] = array(
					'plan_id'=>$plan_id,
					'ctn_type_code'=>$ctn_type_code,
					'quantity'=>1,
					'ctn_master'=>$ctn_master['id'],
					'flflag'=>2,
					'last_operator'=>$_SESSION['uid'],
					'last_operationtime' =>date("Y-m-d H:i:s"),
				);
		}
		return $res;
	}
	/**
	* 处理加载页面提交过来的数据
	*
	*/
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
			$data = \Common\Model\LongTanModel::getLoadingDataByBlno($blno);
		} else {
			/*
			  此处处理一箱多票情况
			*/
			$ctnno = I("post.ctnno");
			$data = \Common\Model\LongTanModel::getLoadingDataByCtnno($ctnno);
		}
		if(empty($data)){
			$this->error("数据输入错误，请核对后再加载");
			exit;
		}
		M()->db(0);
		// 根据龙潭数据生成预报所需数据
		$plan = $this->getCreatePlanData($data, $type);
		// 判断该预报是否已存在
		// 启动数据库事务！！！
		M()->startTrans(); // 开启事务

		$planmodel=new \Common\Model\QbzxPlanModel();
		$planCargoModel=new \Common\Model\QbzxPlanCargoModel();
		$planContainer=new \Common\Model\QbzxPlanCtnModel();
		$instruction = new \Common\Model\QbzxInstructionModel();
		$instructionContainer=new \Common\Model\QbzxInstructionCtnModel();

		if(is_array($plan)){
			// 该预报未存在 新添加一条预报数据
			if($plan_id = $planmodel->add($plan)){
				// 数据无问题
				
				$plan['id'] = $plan_id;
				// 根据预报生成配货信息
				$plan_cargo = $this->getCreatePlanCargoData($data, $plan, $type);
				
				if($planCargoModel->addAll($plan_cargo)){
				} else {
					// 若新增预报配货失败 则直接回滚 并报错
					M()->rollback(); // 事务回滚
					$this->error("数据输入错误，请核对后再加载4");
					exit;
				}
				// 根据预报生成配箱信息
				$plan_ctn = $this->getCreatePlanCtnData($data, $plan['id'], $type);
				if($planContainer->addAll($plan_ctn)){
				} else {
					// 若新增预报配货失败 则直接回滚 并报错
					M()->rollback(); // 事务回滚
					$this->error("数据输入错误，请核对后再加载4");
					exit;
				}
				// 根据龙潭数据获取预报指令数据
				$qbzx_ins = $this->getCreatePlanInsData($plan['id'],$plan['location_id']);
				if($qbzx_ins){
					
					// 判断新增指令是否成功
					if ($instruction->create($qbzx_ins)) {
						// 新增指令成功
						$ins_id = $instruction->add($qbzx_ins);
						// 获取指令配箱数据
						$ins_ctn = $this->getCreatePlanInsCtnData($data,$ins_id,$type);
						
						foreach ($ins_ctn as $k => $v) {
							if($instructionContainer->create($v)){
								$instructionContainer->add($v);
							} else {
								M()->rollback(); // 事务回滚
								$this->error("数据输入错误，请核对后再加载3");
								exit;
							}
						}
					} else {
						M()->rollback(); // 事务回滚
						$this->error("数据输入错误，请核对后再加载2");
						exit;
					}
				} else {
					$this->error("该用户不是当班理货长");
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

	//预报审核
	public function examine($plan_id)
	{
		$instruction = new \Common\Model\QbzxInstructionModel();
		$plan = new \Common\Model\QbzxPlanModel();
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
				$instructionctn = new \Common\Model\QbzxInstructionCtnModel();
				$ctn_list = $instructionctn->field("id,status")->where("instruction_id='".$v['id']."'")->select();
				if($ctn_list !== false)
				{
					foreach ($ctn_list as $value)
					{
						//判断预报指令配箱是否已完成
						if($value['status'] != '2' and $value['status'] != '3')
						{
							echo '<script>alert("指令有尚未完成的配箱!");window.history.go(-1);</script>';
							exit;
						}
						//判断箱是否审核
						$qbzxoperation = new \Common\Model\QbzxOperationModel();
						$res_o = $qbzxoperation->field("operation_examine")->where("ctn_id='".$value['id']."'")->find();
						if($res_o['operation_examine'] != '2')
						{
							echo '<script>alert("有尚未审核的配箱!");window.history.go(-1);</script>';
							exit;
						}
					}
				}else{
					echo '<script>alert("查询指令配箱有误!");window.history.go(-1);</script>';
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
?>