<?php
namespace Home\Controller;
use Think\COntroller;
header("Content-Type:text/html;charset=utf-8;");
class Data2Controller extends Controller{
	private $tally;
	public function _initialize()
	{
		$this->tally = M();
	}
	public function index()
	{
		$begin = time();
        /*------------------------------------------------------*/
        // 处理单证表数据
        $prove = $this->tally->db(0)->table('ctn_prove')->select();
        foreach ($prove as $k => $v) {
            if($v['ship'] != 'null' ){
                $prove[$k]['ship_name'] = $this->tally->db(0)->table('shipinfo')->field("shipName")->where("shipInfoId = {$v['ship']}")->find()['shipname'];
            }
            if($v['location'] != 'null'){
                $prove[$k]['location_name'] = ($this->tally->db(0)->table('operationlocationinfo')->field('locationname')->where("operationLocationInfoId = {$v['location']}")->find()['locationname']);
            }
            if($v['operator'] != 'null'){
                $prove[$k]['operator_name'] = ($this->tally->db(0)->table('userinfo')->field('username')->where("uid = {$v['operator']}")->find()['username']);
            }
        }
        // 数据处理 单证表分离
        foreach ($prove as $k => $v) {
            if($v['business'] == "qbzx") {
                $prove['qbzx'][] = $prove[$k];
            } else if( $v['business'] == "cfs") {
                $prove['cfs'][] = $prove[$k];
            } else {
                $prove['dd'][] = $prove[$k];
            }
        }
        $this->tally->db(1,"mysql://tally_user:njtally2016@localhost:3306/tally2_data");
        $this->qbprove($prove['qbzx']);
        $this->ddprove($prove['dd']);
        $this->cfsprove($prove['cfs']);
        
        $end = time();
        echo "累计耗时 ".($end-$begin)." 秒";
	}
	/**
    *起泊装箱-单证表
    */
    public function qbprove($res)
    {
        $this->tally->table('tally_qbzx_prove')->where("1")->delete();
        foreach ($res as $k => $v) {
            $data = array();
            $data['voyage'] = $v['vargo'];
            $data['id'] = $v['id'];
            if($v['ctn_id'] != ''){
                $data['ctn_id'] = $v['ctn_id'];
            }
            
            $data['ctnno'] = $v['ctn_no'];
            if($v['ship'] != ''){
                $data['ship_id'] = $v['ship'];
            }
            if($v['ship_name'] != ''){
            	$data['ship_name'] = $v['ship_name'];
            }
            
            if($v['votes'] != ''){
                $data['total_ticket'] = $v['votes'];
            }
            
            if($v['units'] != ''){
                $data['total_package'] = $v['units'];
            }
            
            $data['flflag'] = $v['fl'];
            $data['ctn_type_code'] = $v['cube'];
            $data['ctn_master'] = $v['ctn_master'];
            $data['loadingtype'] = $v['methods'];
            if($v['location'] != ''){
                $data['location_id'] = $v['location'];
            }
            if($v['location_name'] != ''){
            	$data['location_name'] = $v['location_name'];
            }
            
            if($v['weights'] != ''){
                $data['total_weight'] = $v['weights'];
            }
            
            if($v['empty_weight'] != ''){
                $data['empty_weight'] = $v['empty_weight'];
            }
            
            if($v['cargo_weight'] != ''){
                $data['cargo_weight'] = $v['cargo_weight'];
            }
            
            $data['dangerlevel'] = $v['danger_rank'];
            $data['sealno'] = $v['seal_no'];
            if($v['sling'] != ''){
                $data['level_num'] = $v['sling'];
            }
            
            if($v['damaged_quantity'] != ''){
                $data['damage_num'] = $v['damaged_quantity'];
            }
            
            if($v['operator'] != ''){
                $data['operator_id'] = $v['operator'];
            }
            if($v['operator_name'] != ''){
            	$data['operator_name'] = $v['operator_name'];
            }
            $data['content'] = str_replace("bl_no", "billno", $v['content']);

            $data['remark'] = $v['remark'];
            $data['consignee'] = $v['consignee'];
            if($v['createtime'] != ''){
                $data['createtime'] = $v['createtime'];
            }
            $data['barge_ship_content'] = $v['ship_id'];
            

            $res = $this->tally->table('tally_qbzx_prove')->data($data)->add();

            if(!$res){
            }
        }
    }
    /**
    *门到门拆箱-单证表
    */
    public function ddprove($res)
    {
        $this->tally->table('tally_dd_prove')->where("1")->delete();
        foreach ($res as $k => $v) {
            $data = array();
            $data['vargo'] = $v['vargo'];
            $data['id'] = $v['id'];
            if($v['ctn_id'] != ''){
                $data['ctn_id'] = $v['ctn_id'];
            }
            
            $data['ctn_no'] = $v['ctn_no'];
            if($v['ship'] != ''){
                $data['ship_id'] = $v['ship'];
            }
            if($v['ship_name'] != ''){
            	$data['ship_name'] = $v['ship_name'];
            }
            
            if($v['votes'] != ''){
                $data['total_ticket'] = $v['votes'];
            }
            
            if($v['units'] != ''){
                $data['total_package'] = $v['units'];
            }
            
            $data['flflag'] = $v['fl'];
            $data['ctn_type_code'] = $v['cube'];
            $data['ctn_master'] = $v['ctn_master'];
            $data['loadingtype'] = $v['methods'];
            if($v['location'] != ''){
                $data['location_id'] = $v['location'];
            }
            if($v['location_name'] != ''){
            	$data['location_name'] = $v['location_name'];
            }
            
            if($v['weights'] != ''){
                $data['total_weight'] = $v['weights'];
            }
            
            if($v['empty_weight'] != ''){
                $data['empty_weight'] = $v['empty_weight'];
            }
            
            if($v['cargo_weight'] != ''){
                $data['cargo_weight'] = $v['cargo_weight'];
            }
            
            $data['dangerlevel'] = $v['danger_rank'];
            $data['sealno'] = $v['seal_no'];
            if($v['sling'] != ''){
                $data['level_num'] = $v['sling'];
            }
            
            if($v['damaged_quantity'] != ''){
                $data['damaged_quantity'] = $v['damaged_quantity'];
            }
            
            if($v['operator'] != ''){
                $data['operator_id'] = $v['operator'];
            }
            if($v['operator_name'] != ''){
            	$data['operator_name'] = $v['operator_name'];
            }
            

            $data['content'] = str_replace("bl_no", "blno", $v['content']);
            $data['remark'] = $v['remark'];
            $data['consignee'] = $v['consignee'];
            if($v['createtime'] != ''){
                $data['createtime'] = $v['createtime'];
            }
            

            $res = $this->tally->table('tally_dd_prove')->data($data)->add();

            if(!$res){
            }
        }
    }

    /**
    *cfs装箱-单证表
    */
    public function cfsprove($res)
    {
        $this->tally->table('tally_cfs_prove')->where("1")->delete();
        foreach ($res as $k => $v) {
            $data = array();
            $data['voyage'] = $v['vargo'];
            $data['id'] = $v['id'];
            if($v['ctn_id'] != ''){
                $data['ctn_id'] = $v['ctn_id'];
            }
            
            $data['ctnno'] = $v['ctn_no'];
            if($v['ship'] != ''){
                $data['ship_id'] = $v['ship'];
            }
            if($v['ship_name'] != ''){
            	$data['ship_name'] = $v['ship_name'];
            }
            
            if($v['votes'] != ''){
                $data['total_ticket'] = $v['votes'];
            }
            
            if($v['units'] != ''){
                $data['total_package'] = $v['units'];
            }
            
            $data['flflag'] = $v['fl'];
            $data['ctn_type_code'] = $v['cube'];
            $data['ctn_master'] = $v['ctn_master'];
            $data['loadingtype'] = $v['methods'];
            if($v['location'] != ''){
                $data['location_id'] = $v['location'];
            }
            if($v['location_name'] != ''){
            	$data['location_name'] = $v['location_name'];
            }
            
            if($v['weights'] != ''){
                $data['total_weight'] = $v['weights'];
            }
            
            if($v['empty_weight'] != ''){
                $data['empty_weight'] = $v['empty_weight'];
            }
            
            if($v['cargo_weight'] != ''){
                $data['cargo_weight'] = $v['cargo_weight'];
            }
            
            $data['dangerlevel'] = $v['danger_rank'];
            $data['sealno'] = $v['seal_no'];
            if($v['sling'] != ''){
                $data['level_num'] = $v['sling'];
            } else {
            	$data['level_num'] = '0';
            }
            
            if($v['damaged_quantity'] != ''){
                $data['damage_num'] = $v['damaged_quantity'];
            }
            
            if($v['operator'] != ''){
                $data['operator_id'] = $v['operator'];
            }
            if($v['operator_name'] != ''){
            	$data['operator_name'] = $v['operator_name'];
            }
            

            $data['content'] = str_replace("bl_no", "blno", $v['content']);
            $data['remark'] = $v['remark'];
            $data['consignee'] = $v['consignee'];
            if($v['createtime'] != ''){
                $data['createtime'] = $v['createtime'];
            }
            

            $res = $this->tally->table('tally_cfs_prove')->data($data)->add();

            if(!$res){
            }
        }
    }
}