<?php
namespace Home\Controller;
use Think\COntroller;
header("Content-Type:text/html;charset=utf-8;");
class Data1Controller extends Controller{
	private $tally;
	public function _initialize()
	{
		$this->tally = M();
	}
	public function index()
	{
		$begin = time();

        // 处理cfs装箱状态码冲突数据
        $this->tally->db(0);
        $data['tally_ship_agent'] = $this->tally->table('tally_ship_agent')->select();
        $data['tally_cargo_agent'] = $this->tally->table('tally_cargo_agent')->select();
        $data['tally_ship_schedule'] = $this->tally->table('tally_ship_schedule')->select();
        $data['tally_port'] = $this->tally->table('tally_port')->select();
        $data['tally_rate'] = $this->tally->table('tally_rate')->select();
        $data['tally_rate_detail'] = $this->tally->table('tally_rate_detail')->select();
        $data['tally_replace_clerk_record'] = $this->tally->table('tally_replace_clerk_record')->select();
        $data['tally_dd_plan'] = $this->tally->table('tally_dd_plan')->select();
        $data['tally_dd_instruction'] = $this->tally->table('tally_dd_instruction')->select();
        $data['tally_dd_ctn_damage_img'] = $this->tally->table('tally_dd_ctn_damage_img')->select();
        $data['tally_dd_ctn_damage_after_img'] = $this->tally->table('tally_dd_ctn_damage_after_img')->select();
        $data['tally_dd_operation_level'] = $this->tally->table('tally_dd_operation_level')->select();
        $data['tally_dd_cargo_damage_img'] = $this->tally->table('tally_dd_cargo_damage_img')->select();
        $data['tally_cfs_instruction_cargo'] = $this->tally->table('tally_cfs_instruction_cargo')->select();
        $data['tally_cfs_instruction_ctn'] = $this->tally->table('tally_cfs_instruction_ctn')->select();
        $data['tally_cfs_ctn_empty_img'] = $this->tally->table('tally_cfs_ctn_empty_img')->select();
        $data['tally_cfs_operation_level'] = $this->tally->table('tally_cfs_operation_level')->select();
        $data['tally_cfs_cargo_damage_img'] = $this->tally->table('tally_cfs_cargo_damage_img')->select();
        $data['tally_admin'] = $this->tally->table('tally_admin')->select();
        $data['tally_admin_group'] = $this->tally->table('tally_admin_group')->select();
        $data['tally_auth_rule'] = $this->tally->table('tally_auth_rule')->select();
        $data['tally_cfs_instruction'] = $this->tally->table('tally_cfs_instruction')->select();
        $this->tally->db(1,"mysql://tally_user:njtally2016@localhost:3306/tally2_data");
        // $this->tally->db(1,"mysql://tally_user:njtally2016@localhost:3306/tally2_data");
        // 
        $this->upd($data['tally_ship_agent'], "tally_ship_agent");
        // 
        $this->upd($data['tally_cargo_agent'], "tally_cargo_agent");
        // 
        $this->upd($data['tally_ship_schedule'], "tally_ship_schedule");
        // 
        $this->upd($data['tally_port'], "tally_port");
        // 
        $this->upd($data['tally_rate'], "tally_rate");
        // 
        $this->upd($data['tally_rate_detail'], "tally_rate_detail");
        // 
        $this->upd($data['tally_replace_clerk_record'], "tally_replace_clerk_record");
        // 
        $this->upd($data['tally_dd_plan'], "tally_dd_plan");
        // 
        $this->upd($data['tally_dd_instruction'], "tally_dd_instruction");
        // 
        $this->upd($data['tally_dd_ctn_damage_img'], "tally_dd_ctn_damage_img");
        // 
        $this->upd($data['tally_dd_ctn_damage_after_img'], "tally_dd_ctn_damage_after_img");
        // 
        $this->upd($data['tally_dd_operation_level'], "tally_dd_operation_level");
        // 
        $this->upd($data['tally_dd_cargo_damage_img'], "tally_dd_cargo_damage_img");
        // 
        foreach ($data['tally_cfs_instruction'] as $k => $v) {
            if($v['status'] == '3'){
                $data['tally_cfs_instruction'][$k]['status'] = '2';
            }
        }
        $this->upd($data['tally_cfs_instruction'], "tally_cfs_instruction");
        // 
        $this->upd($data['tally_cfs_instruction_cargo'], "tally_cfs_instruction_cargo");
        // 
        $this->upd($data['tally_cfs_instruction_ctn'], "tally_cfs_instruction_ctn");
        // 
        $this->upd($data['tally_cfs_ctn_empty_img'], "tally_cfs_ctn_empty_img");
        // 
        $this->upd($data['tally_cfs_operation_level'], "tally_cfs_operation_level");
        // 
        $this->upd($data['tally_cfs_cargo_damage_img'], "tally_cfs_cargo_damage_img");
        // 
        $this->upd($data['tally_admin'], "tally_admin");
        // 
        $this->upd($data['tally_admin_group'], "tally_admin_group");
        // 
        $this->upd($data['tally_auth_rule'], "tally_auth_rule");
        // 
        $this->upddcargo($data['tally_dd_plan']);
        /*------------------------------------------------------*/
        

        $end = time();
        echo "累计耗时 ".($end-$begin)." 秒";
	}

    public function upddcargo($data,$table = "tally_dd_plan_cargo"){
        // 清空原有数据表信息
        $this->tally->table($table)->where("1")->delete();
        // 将一期门到门数据遍历 获取预报配货的信息
        foreach ($data as $k => $v) {
            $arr['plan_id'] = $v['id'];
            $arr['paycode'] = $v['paycode'];
            $arr['payman'] = $v['payman'];
            $arr['blno'] = $v['blno'];
            $arr['cargoname'] = $v['cargoname'];
            $arr['numbersofpackages'] = $v['numbersofpackages'];
            $arr['package'] = $v['package'];
            $arr['mark'] = $v['mark'];
            $arr['consignee'] = $v['consignee'];
            $arr['classes'] = $v['classes'];
            $arr['undgno'] = $v['undgno'];
            $arr['contactuser'] = $v['contactuser'];
            $arr['contact'] = $v['contact'];
            $arr['last_operationtime'] = date('Y-m-d H:i:s', time());
            $this->tally->table($table)->add($arr);
        }

    }
	public function upd($data, $table, $table2='')
    {
        if($table2 == ''){
            $table2 = $table;
        }
        if(!empty($data)){
            $this->tally->table($table2)->where("1")->delete();
            foreach ($data as $k => $v) {
                $arr = array();
                foreach ($v as $key => $val) {
                    if($val !== ''){
                        $arr[$key] = $val;
                    }
                }
                $res = $this->tally->table($table2)->create($arr);

                $this->tally->table($table2)->add();
            }
            
        }
    }
}
 // DEFAULT CURRENT_TIMESTAMP 