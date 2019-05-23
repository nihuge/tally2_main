<?php
/**
 * CFS装箱-指令管理
 */

namespace Index\Controller;
use Index\Common\BaseController;

class CfsInstructionController extends BaseController
{
	//新增指令
	public function add()
	{
		$uid = $_SESSION['uid'];
		$signin = new \Common\Model\UserModel(); 
		$res_s = $signin->is_sign($uid);
		if($res_s !== false)
		{
			// 集装箱船列表
			$shipinfo = new \Common\Model\ShipModel ();
			$ship_type = json_decode ( ship_type, true );
			$shiplist = $shipinfo->getShipList ( $ship_type ['container'] );
			$this->assign ( 'shiplist', $shiplist );
			//作业场地列表
			$location=new \Common\Model\LocationModel();
			$locationlist=$location->getLocationList();
			$this->assign('locationlist',$locationlist);
			//客户列表-代理
			$customer = new \Common\Model\CustomerModel();
			$customer_category=json_decode(customer_category,true);
			$customerlist=$customer->getCustomerList($customer_category['agent']);
			$this->assign ( 'customerlist', $customerlist );
			if(I('post.'))
			{
				layout(false);// 临时关闭当前模板的布局功能
				if(I('post.location_name'))
				{
					$location_name=I('post.location_name');
				}else {
					$this->error('装箱场地不能为空！');
				}
				//检查作业地点是否含有特殊字符
				$data_l = filterString($location_name);
				if($data_l == false)
				{
					$this->error("不能含有特殊字符");
					exit();
				}
				$voyage = I('post.voyage');
				$data_v = filterString($voyage);
				if($data_v == false)
				{
					$this->error("不能含有特殊字符");
					exit();
				}

				//检查委托单位是否含有特殊字符
				$customer_name = I('post.entrust_company');
				$data_l = filterString($entrust_company);
				if($data_l == false)
				{
					$this->error("委托单位不能含有特殊字符");
					exit();
				}
				//检验委托单位名称是否正确
				$res_c = $customer->where("customer_name='$customer_name'")->field('id')->find();
				if($res_c['id']=='')
				{
					$this->error('委托单位不存在');
				}else{
					$entrust_company = $res_c['id'];
				}

				//检验理货地址名称是否正确
				$res_l=$location->where("location_name='$location_name'")->field('id')->find();
				if($res_l['id']=='')
				{
					$this->error('理货地点不存在！');
				}else {
					$location_id = $res_l['id'];
				}
				//检查船名是否正确
				$ship_name = I('post.shipname');
				$data_s = filterString($ship_name);
				if($data_s == false)
				{
					$this->error("不能含有特殊字符");
					exit();
				}
				$res_v =$shipinfo->where("ship_name='$ship_name'")->field('id')->find();
				if($res_v['id'] == '')
				{
					$this->error('不存在此船');
				}else{
					$ship_id = $res_v['id'];
				}
				
				$sql = "select s.department_id from __PREFIX__user u,__PREFIX__shift s where u.uid='$uid' and u.shift_id=s.shift_id";
				$msg = M()->query($sql);
				$department_id = $msg[0]['department_id'];
				if($department_id == '')
				{
					$this->error('您尚未签到，请先签到！');
				}
				
				$operation_type = I('post.operation_type');
				if($operation_type == '人工')
				{
					$operation_type = '0';
				}else{
					$opration_type = '1';
				}
				$data=array(
						'ship_id'=>$ship_id,
						'voyage'=>$voyage,
						'department_id'=>$department_id,
						'location_id'=>$location_id,
						'entrust_company' => $entrust_company,
						'operation_type'=>$operation_type,
						'date'=>date('Y-m-d'),
						'last_operator'=>$_SESSION['uid'],
						'last_operationtime'=>date('Y-m-d H:i:s')
				);
				$instruction=new \Common\Model\CfsInstructionModel();
				if(!$instruction->create($data))
				{
					//对data数据进行验证
					$this->error($instruction->getError());
				}else{
					//验证通过 可以对数据进行操作
					$res=$instruction->add($data);
					if ($res !== false)
					{
						$this->success('新增作业指令成功!',U('index'));
					} else {
						$this->error('操作失败！');
					}
				}
			}else {
				$this->display();
			}
		}else{
			$this->error("您未签到，不能开始工作");
		}
        
	}

	//指令列表
	public function index()
	{
		$instruction = new \Common\Model\CfsInstructionModel();
		$count = $instruction->where("1")->count();
		$per = 10;
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
		$begin=($p-1)*$per;
		$sql = "select i.*,s.ship_name,l.location_name
				from 
					__PREFIX__ship s,
					__PREFIX__cfs_instruction i,
					__PREFIX__location l 
				where 
					i.id !='' and  
					i.location_id=l.id and 
					i.ship_id=s.id 
				order by i.id desc 
				limit $begin,$per";
		$list = M()->query($sql);
		// 对数据遍历查询所缺少的提单号信息和委托编号信息
		foreach ($list as $k => $v) {
			if($v['entrust_company']){
				$cus_sql = "select customer_name from tally_customer where id = {$v['entrust_company']}";
				$data = M()->query($cus_sql);
				$list[$k]['customer_name'] = $data[0]['customer_name']?$data[0]['customer_name']:"无";
			} else {
				$list[$k]['customer_name'] = "无";
			}

			$blno_sql = "select blno from tally_cfs_instruction_cargo where instruction_id = {$v['id']}";
			$data = M()->query($blno_sql);
			$list[$k]['blno'] = $data[0]['blno']?$data[0]['blno']:" 无 ";
		}
		$this->assign('list',$list);
		$this->assign('page',$show);// 赋值分页输出
		$this->display();
	}

	//编辑指令
	public function edit($id)
	{
		$this->assign('id',$id);
		//根据预报计划ID获取预报计划详情
		$instruction = new \Common\Model\CfsInstructionModel();
		$msg=$instruction->getInstructionMsg($id);
		$this->assign('msg',$msg);
		//作业场地列表
		$location=new \Common\Model\LocationModel();
		$locationlist=$location->getLocationList();
		$this->assign('locationlist',$locationlist);
		//客户列表-代理
		$customer = new \Common\Model\CustomerModel();
		$customer_category=json_decode(customer_category,true);
		$customerlist=$customer->getCustomerList($customer_category['agent']);
		$this->assign ( 'customerlist', $customerlist );
		// 集装箱船列表
		$shipinfo = new \Common\Model\ShipModel ();
		$ship_type = json_decode ( ship_type, true );
		$shiplist = $shipinfo->getShipList ( $ship_type ['container'] );
		$this->assign ( 'shiplist', $shiplist );
		$instruction=new \Common\Model\CfsInstructionModel();
		//获取指令详情
		$msg=$instruction->getInstructionMsg($id);
		$this->assign('msg',$msg);
		//已配箱数
		$instructionContainer=new \Common\Model\CfsInstructionCtnModel();
		//作业班组
		$department_id=$msg['department_id'];
		$department=new \Common\Model\DepartmentModel();
		$dMsg=$department->getDepartmentMsg($department_id);
		$this->assign('dMsg',$dMsg);
		//根据指令ID获取派工详情
		$dispatch=new \Common\Model\DispatchModel();
		$dispatch_detail=$dispatch->getDetail($id, 'cfs');
		$this->assign('dispatch_detail',$dispatch_detail);
		//获取指令下的配箱列表
		$containerlist=$instructionContainer->getContainerList($id);
		$this->assign('containerlist',$containerlist);
		//获取指令下的配货列表
		$instructionCargo=new \Common\Model\CfsInstructionCargoModel();
		$cargolist=$instructionCargo->getCargoList($id);
		$this->assign('cargolist',$cargolist);
		if(I('post.'))
		{
			layout(false);// 临时关闭当前模板的布局功能
			if(I('post.location_name'))
			{
				$location_name=I('post.location_name');
			}else {
				$this->error('装箱场地不能为空！');
			}
			$data_l = filterString($location_name);
			if($data_l == false)
			{
				$this->error("不能含有特殊字符");
				exit();
			}
			//检验理货地址名称是否正确
			$res_l=$location->where("location_name='$location_name'")->field('id')->find();
			if($res_l['id']=='')
			{
				$this->error('理货地点不存在！');
			}else {
				$locationno = $res_l['id'];
			}
			//检查航次是否含有特殊字符
			$voyage = I('post.voyage');
			$data_v = filterString($voyage);
			if($data_v == false)
			{
				$this->error("不能含有特殊字符");
				exit();
			}

			//检查委托单位是否含有特殊字符
			$customer_name = I('post.entrust_company');
			$data_l = filterString($entrust_company);
			if($data_l == false)
			{
				$this->error("委托单位不能含有特殊字符");
				exit();
			}
			//检验委托单位名称是否正确
			$res_c = $customer->where("customer_name='$customer_name'")->field('id')->find();
			if($res_c['id']=='')
			{
				$this->error('委托单位不存在');
			}else{
				$entrust_company = $res_c['id'];
			}

			//检查船名是否正确
			$vslname = I('post.shipname');
			$data_s = filterString($vslname);
			if($data_s == false)
			{
				$this->error("不能含有特殊字符");
				exit();
			}
			$ship = new \Common\Model\ShipModel();
			$res_v = $ship->where("ship_name='$vslname'")->field('id')->find();
			if($res_v['id'] == '')
			{
				$this->error('不存在此船');
			}else{
				$ship_id = $res_v['id'];
			}
			$operation_type = I('post.operation_type');
			$data=array(
					'ship_id'=>$ship_id,
					'voyage'=>$voyage,
					'location_id'=>$locationno,
					'entrust_company' => $entrust_company,
					'operation_type'=>$operation_type,
					'last_operator'=>$_SESSION['uid'],
					'last_operationtime'=>date('Y-m-d H:i:s')
			);

			$instruction=new \Common\Model\CfsInstructionModel();
			if(!$instruction->create($data))
			{
				//对data数据进行验证
				$this->error($instruction->getError());
			}else{
				//验证通过 可以对数据进行操作
				$res=$instruction->where("id=$id")->save($data);
				if ($res !== false)
				{
					$this->success('修改作业指令成功!',U('index'));
				} else {
					$this->error('操作失败！');
				}
			}
		}else {
			$this->display();
		}
	}
	
	//删除指令
	public function del_instruct($id)
	{
		layout(false);
		$instruction = new \Common\Model\CfsInstructionModel ();
		$res_i=$instruction->where("id='$id'")->field('status')->find();
		$status = $res_i['status'];
		if ($status == '0')
		{
			$res = $instruction->where ( "id='$id'" )->delete ();
			$container = new \Common\Model\CfsInstructionCtnModel();
			$res_c = $container->where("instruction_id='$id'")->delete();
			if ($res !== false)
			{
				$this->success ( '删除指令成功！' );
			} else {
				$this->error ( '操作失败！' );
			}
		}else{
			$this->error("不能删除此指令，指令已作业");
		}
	}
	public function reloadPage(){
		layout(false);

		$this->display();
	}

	/**
	* 操作加载提交过来的数据
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
			$this->error("数据输入错误，请核对后再加载2");
			exit;
		}
		M()->db(0);
		M()->startTrans(); // 开启事务
		// 根据龙潭数据 生成指令所需数据
		$ins = $this->getCreateInsData($data);
		$instruction=new \Common\Model\CfsInstructionModel();
		$instructionCargo=new \Common\Model\CfsInstructionCargoModel();
		$instructionContainer=new \Common\Model\CfsInstructionCtnModel();
		// 判断该指令是否存在
		if(is_array($ins)){
			// 该指令不存在
			if($ins_id = $instruction->add($ins)){
				// 生成指令成功
				// 生成指令配货数据
				$ins_cargo = $this->getCreateInsCargoData($data,$ins_id,$type);
				if($instructionCargo->addAll($ins_cargo)){
					// 生成指令配货成功
				} else {
					// 生成指令配货失败
					M()->rollback(); // 事务回滚
					$this->error("输入数据有误，请核对后在输入。");
					exit;
				}
				// 生成指令配箱数据
				$ins_ctn = $this->getCreateInsCtnData($data,$ins_id,$type);
				if($instructionContainer->addAll($ins_ctn)){
					// 生成指令配箱成功
				} else {
					// 生成指令配箱失败
					M()->rollback(); // 事务回滚
					$this->error("输入数据有误，请核对后在输入。");
					exit;
				}
			} else {
				// 生成指令失败
				$this->error("输入数据有误，请核对后在输入。");
				exit;
			}
		} else {
			/*// 该指令已存在
			// 根据指令查询配箱和配货信息
			$where = array('instruction_id'=>$ins);
			$ins_cargo = $instructionCargo->where($where)->select();
			$ins_ctn = $instructionContainer->where($where)->select();
			if($ins_cargo_data = $this->getCreateInsCargoData($data,$ins,$type,$ins_cargo)){
				if($instructionCargo->addAll($ins_cargo_data)){
					// 生成指令配货成功
				} else {
					// 生成指令配货失败
					M()->rollback(); // 事务回滚
					$this->error("输入数据有误，请核对后在输入。");
					exit;
				}
			}
			if($ins_ctn_data = $this->getCreateInsCtnData($data,$ins,$type,$ins_ctn)){
				// 生成指令配箱数据
				$ins_ctn = $this->getCreateInsCtnData($data,$ins_id,$type);
				if($instructionContainer->addAll($ins_ctn)){
					// 生成指令配箱成功
				} else {
					// 生成指令配箱失败
					M()->rollback(); // 事务回滚
					$this->error("输入数据有误，请核对后在输入。");
					exit;
				}
			}*/
			$this->error("该指令已存在，请核对后再输入");
			exit;
		}
		// 提交事务
		M()->commit();
		echo '<script>alert("新增指令配箱成功!");top.location.reload(true);window.close();</script>';

	}

	public function getCreateInsCtnData($data,$instruction_id,$type,$ins_ctn){
		if(is_array($ins_ctn)){
			// 此处处理指令已存在情况配货信息
			// 先比较配货信息是否多了
			if(count($ins_ctn) == count($data)){
				// 配货信息无变化
				return false;
			} else {
				$data = array_diff($ins_ctn,$data);
			}
		}
		$ctn_master = M('container_master')->where("ctn_master='未知'")->find();
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
						'ctn_size' 			=>$ctn_type_code,
						'ctn_master' 		=>$ctn_master['id'],
						'status' 			=>'0',
						'lcl'				=>"F",
						'pre_number'		=>$v['pieces'],
					);
			}
		} else {
			// 一箱多票
			$ctn_master = M('container_master')->where("ctn_master='{$data[0]['owner_code']}'")->find();
			if(empty($ctn_master)){
				M()->rollback();
				$this->error("箱主信息不全，请维护！");
				exit;
			}
			$ctn_type = explode('-', $data[0]['con_size']);
			$ctn_type_code = $ctn_type[0].$ctn_type[1];
			$res[0] = array(
						'instruction_id' 	=>$instruction_id,
						'ctnno' 			=>$data[0]['container_number'],
						'ctn_size' 			=>$ctn_type_code,
						'ctn_master' 		=>$ctn_master['id'],
						'status' 			=>'0',
						'lcl'				=>"L",
						'pre_number'		=>$data[0]['pieces'],
					);
		}
		return $res;
	}
	/**
	* 根据龙潭数据 生成指令配货数据
	* @param array $data 龙潭抓取到的数据
	* @param int $instruction_id 指令ID
	* @param string $type 获取类型
	*/
	public function getCreateInsCargoData($data,$instruction_id,$type,$ins_cargo=null){
		if(is_array($ins_cargo)){
			// 此处处理指令已存在情况配货信息
			// 先比较配货信息是否多了
			if(count($ins_cargo) == count($data)){
				// 配货信息无变化
				return false;
			} else {
				$data = array_diff($ins_cargo,$data);
			}
		}
		if ($type=="blno") {
			// 一票多箱
			$totalweight = 0;
			$number = 0;
			$totalvolume = 0;
			foreach ($data as $k => $v) {
				$totalweight += $v['weight'];
				$number += $v['preces'];
				$totalvolume += $v['volumn'];
			}
			$res[0] = array(
				'instruction_id'=>$instruction_id,
				'blno'=>$data[0]['bl_so_no'],
				'name'=>$data[0]['cargo_name'],
				'number'=>$number,
				'package'=>$data[0]['package_des'],
				'mark'=>"未知",
				'totalweight'=>$totalweight,
				'dangerlevel'=>$data[0]['imo_code'],
				'totalvolume'=>$totalvolume,
				'po'=>"未知",
				'crgno'=>"未知",
				'last_operator'=>$_SESSION['uid'],
				'last_operationtime'=>date('Y-m-d H:i:s'),
			);
		} else {
			// 一箱多票
			foreach ($data as $k => $v) {
				$res[$k] = array(
					'instruction_id'=>$instruction_id,
					'blno'=>$v['bl_so_no'],
					'name'=>$v['cargo_name'],
					'number'=>$v['pieces'],
					'package'=>$v['package_des'],
					'mark'=>"未知",
					'totalweight'=>$v['weight'],
					'dangerlevel'=>$v['imo_code'],
					'totalvolume'=>$v['volumn'],
					'po'=>"未知",
					'crgno'=>"未知",
					'last_operator'=>$_SESSION['uid'],
					'last_operationtime'=>date('Y-m-d H:i:s'),
				);
			}
		}
		return $res;
	}
	/**
	* 根据龙潭数据 生成指令数据
	* @param array $data 从龙潭抓取的数据
	*/
	public function getCreateInsData($data){
		// 根据船舶代码 获取对应的船ID
		// 此处 做假设 ：假设查询到的数据属于同一艘船 即船舶代码都相同
		$ship_code = $data[0]['vessel_code'];
		$ship = M("ship")->where("ship_code = '$ship_code'")->find();
		$ship_id = $ship['id'];
		if(!$ship_id){
			$this->error("没有对应的船，请去维护船舶系统！");
		}
		// 根据船ID 和航次 判断该指令是否存在
		$where = array(
				'ship_id' =>$ship_id,
				'voyage'  =>$data[0]['oper_out_voyage'],
			);
		$ins = M('cfs_instruction')->where($where)->order("id desc")->find();

		if(!empty($ins)){
			$ctn = '';
			foreach ($data as $k => $v) {
				$ctn .= "'".$v['container_number']."',"; 
			}
			$ctn = rtrim($ctn,',');
			$sql = "SELECT c.* FROM tally_cfs_instruction_ctn c WHERE c.instruction_id = '{$ins['id']}' and c.ctnno IN ($ctn)";
			$res_c = M()->query($sql);
			if($res_c[0]['id']){
				return $ins['id'];
			}
		}
		// 部门ID
		$uid = $_SESSION['uid'];
		$sql = "select s.department_id from __PREFIX__user u,__PREFIX__shift s where u.uid='$uid' and u.shift_id=s.shift_id";
		$msg = M()->query($sql);
		$department_id = $msg[0]['department_id'];
		// if($department_id == '')
		// {
		// 	$this->error('您尚未签到，请先签到！');
		// 	exit;
		// }
		// 理货地点默认值为 "未知"
		$location_name = "未知";
		$location=new \Common\Model\LocationModel();
		$res_l=$location->where("location_name='$location_name'")->field('id')->find();
		$location_id = $res_l['id'];
		// 委托单位默认值为 "未知"
		$customer_name = "未知";
		$customer=new \Common\Model\CustomerModel();
		$res_c = $customer->where("customer_name='$customer_name'")->field('id')->find();
		$entrust_company = $res_c['id'];
		$res=array(
				'ship_id'=>$ship_id,
				'voyage'=>$data[0]['oper_out_voyage'],
				'department_id'=>$department_id,
				'location_id'=>$location_id,
				'entrust_company' => $entrust_company,
				'operation_type'=>"0",
				'date'=>date('Y-m-d'),
				'last_operator'=>$_SESSION['uid'],
				'last_operationtime'=>date('Y-m-d H:i:s')
			);
		return $res;
	}
	
	//指令审核
	public function examine($instruction_id)
	{
		$instruction = new \Common\Model\CfsInstructionModel();
		$res = $instruction->field("id,status")->where("id = '$instruction_id'")->find();
		if($res !== false)
		{
			//判断预报指令是否已完成
			if($res['status'] != '2')
			{
				echo '<script>alert("该指令尚未完成!");window.history.go(-1);</script>';
				exit;
			}
			//判断指令的配箱是否全部已完成
			$instructionctn = new \Common\Model\CfsInstructionCtnModel();
			$ctn_list = $instructionctn->field("id,status")->where("instruction_id='$instruction_id'")->select();
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
					$cfsoperation = new \Common\Model\CfsOperationModel();
					$res_o = $cfsoperation->field("operation_examine")->where("ctn_id='".$value['id']."'")->find();
					if($res_o['operation_examine'] != '2')
					{
						echo '<script>alert("有尚未审核的配箱!");window.history.go(-1);</script>';
						exit;
					}
				}
				//修改审核状态，记录修改的操作人
				$data = array(
						'examine'  =>   'Y',
						'examine_operator'    =>$_SESSION ['uid']
				);
				$res_e = $instruction->where("id='$instruction_id'")->save($data);
				if($res_e !== false)
				{
					echo '<script>alert("审核成功!");window.history.go(-1);</script>';
					exit;
				}else{
					echo '<script>alert("审核失败!");window.history.go(-1);</script>';
					exit;
				}
			}else{
				echo '<script>alert("查询指令配箱有误!");window.history.go(-1);</script>';
				exit;
			}
		}else{
			echo '<script>alert("查询指令有误!");window.history.go(-1);</script>';
			exit;
		}
	}
}