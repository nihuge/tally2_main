<?php
namespace Home\Controller;
use Think\COntroller;
header("Content-Type:text/html;charset=utf-8;");
class UpdateController extends Controller{
	private $tally;
	public function _initialize()
	{
		$this->tally = M();
        $this->tally->db(1,"mysql://root:root@localhost:3306/tally2_data");
        // $this->tally->db(1,"mysql://tally_user:njtally2016@localhost:3306/tally2_data");


	}

	// 2017-09-13 将门到门预报计划中的提单号放到
	public function updateBlno(){
		// 获取门到门作业关表数据
		// $data = $this->tally->select();
		$sql = "SELECT tally_dd_plan.blno,tally_dd_operation.id operation_id FROM `tally_dd_plan`,tally_dd_plan_container,tally_dd_operation, tally_dd_operation_level WHERE tally_dd_operation_level.operation_id = tally_dd_operation.id AND tally_dd_operation.ctn_id = tally_dd_plan_container.id and tally_dd_plan_container.plan_id = tally_dd_plan.id GROUP BY tally_dd_plan_container.id";
		$data = $this->tally->query($sql);
		// 遍历数据并更新提单号
		foreach ($data as $k => $v) {
			$where = array(
					'operation_id' => $v['operation_id']
				);
			$arr = array(
					'blno' => $v['blno']
				);
			$this->tally->table('tally_dd_operation_level')->where($where)->save($arr);
		}
		// WHERE tally_dd_operation_level.operation_id = tally_dd_operation.id AND tally_dd_operation.ctn_id = tally_dd_plan_container.id and tally_dd_plan_container.plan_id = tally_dd_plan.id
	}

	// 理货数据库字段名颠倒
	// 理货龙潭链接oracle数据库
	// 理货二期数据字典更新
}
?>