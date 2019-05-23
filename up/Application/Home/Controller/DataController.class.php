<?php
namespace Home\Controller;
use Think\COntroller;
header("Content-Type:text/html;charset=utf-8;");
class DataController extends Controller{
	private $tally;
	public function _initialize()
	{
		$this->tally = M();
	}
	public function index()
	{
		$begin = time();
        /*------------------------------------------------------*/
        // =================================
        $this->tally->db(0);
        $data['qbzx_operation_emptypicture'] = $this->tally->table('qbzx_operation_emptypicture')->select();
        $data['operationlocationinfo'] = $this->tally->table('operationlocationinfo')->select();
        $data['shipinfo'] = $this->tally->table('shipinfo')->select();
        $data['containerinfo'] = $this->tally->table('containerinfo')->select();
        $data['containermasterinfo'] = $this->tally->table('containermasterinfo')->select();
        $data['customerinfo'] = $this->tally->table('customerinfo')->select();
        $data['departmentinfo'] = $this->tally->table('departmentinfo')->select();
        $data['userinfo'] = $this->tally->table('userinfo')->select();
        $data['gand'] = $this->tally->table('gand')->select();
        $data['gand_details'] = $this->tally->table('gand_details')->select();
        $data['orderrepair'] = $this->tally->table('orderrepair')->select();
        $data['orderdetail'] = $this->tally->table('orderdetail')->select();
        $data['tally_replace_tallymaster_record'] = $this->tally->table('tally_replace_tallymaster_record')->select();
        $data['qbzx_forecastplan'] = $this->tally->table('qbzx_forecastplan')->select();
        $data['qbzx_cargo'] = $this->tally->table('qbzx_cargo')->select();
        $data['qbzx_container'] = $this->tally->table('qbzx_container')->select();
        $data['qbzx_jobinstruction'] = $this->tally->table('qbzx_jobinstruction')->select();
        $data['qbzx_operation'] = $this->tally->table('qbzx_operation')->select();
        foreach ($data['qbzx_operation'] as $k => $v) {
            $ctn_id = $this->tally->table("qbjobcontainer")->where("qbzx_operationid = {$v['qbzx_operationid']}")->find()['qbjobcontainerid'];
            $data['qbzx_operation'][$k]['ctn_id'] = $ctn_id;
        }
        
        $data['qbjobcontainer'] = $this->tally->table('qbjobcontainer')->select();
        $this->tally->db(1,"mysql://tally_user:njtally2016@localhost:3306/tally2_data");
        // 
        $this->qboe($data['qbzx_operation_emptypicture']);
        // 
        $this->location($data['operationlocationinfo']);
        // 
        $this->ship($data['shipinfo']);
        // 
        $this->ctn($data['containerinfo']);
        // 
        $this->ctnm($data['containermasterinfo']);
        // 
        $this->cus($data['customerinfo']);
        // 
        $this->dpm($data['departmentinfo']);
        // 
        $this->u($data['userinfo']);
        // 
        $this->shift($data['gand']);
        // 
        $this->sd($data['gand_details']);
        // 
        $this->orderrepair($data['orderrepair']);
        // 
        $this->od($data['orderdetail']);
        // 
        $this->rtr($data['tally_replace_tallymaster_record']);
        // 
        $this->qbplan($data['qbzx_forecastplan']);
        // 
        $this->qbcargo($data['qbzx_cargo']);
        // 
        $this->qbctn($data['qbzx_container']);
        // 
        $this->qbins($data['qbzx_jobinstruction']);
        
        // 
        $this->qbo($data['qbzx_operation']);
        
        // ==============================
        $data = null;
        $this->tally->db(0);
        $data['levelpicture'] = $this->tally->table('levelpicture')->select();
        $data['goodsdamage'] = $this->tally->table('goodsdamage')->select();
        $data['amend'] = $this->tally->table('amend')->select();
        $data['tally_dd_plan_container'] = $this->tally->table('tally_dd_plan_container')->select();
        $data['tally_dd_operation'] = $this->tally->table('tally_dd_operation')->select();
        $data['tally_cfs_operation'] = $this->tally->table('tally_cfs_operation')->select();
        $data['qbjobcontainer'] = $this->tally->table('qbjobcontainer')->select();
        foreach ($data['qbjobcontainer'] as $k => $v) {
            if($v['qbzx_operationid']){
                $man = $this->tally->table('qbzx_operation')->where("qbzx_operationid = {$v['qbzx_operationid']}")->find();
                
                if($man['man']){
                    $data['qbjobcontainer'][$k]['operator_id'] = $man['man'];
                } else {
                    $data['qbjobcontainer'][$k]['operator_id'] = null;
                }
            } else {
                $data['qbjobcontainer'][$k]['operator_id'] = null;
            }
            
        }
        // -----------------
        $this->tally->db(1);
        // 
        $this->qblevel($data['levelpicture']);
        $this->qblevel1($data['levelpicture']);
        // 
        $this->qbgd($data['goodsdamage']);
        // 
        $this->qbamend($data['amend']);
        // 
        $this->ddpc($data['tally_dd_plan_container']);
        // 
        $this->ddo($data['tally_dd_operation']);
        // 
        $this->cfso($data['tally_cfs_operation']);
        // 
        $this->qbinscnt($data['qbjobcontainer']);
        // 
        $this->updateddstep();
        $this->updatecfsstep();
        $this->updateqbzxstep();
        $this->updcfscargoimg();

        $end = time();
        echo "累计耗时 ".($end-$begin)." 秒";
	}

    /*
    一期关照片 即 二期 货物照片（关照片）
    将一期关照片放到二期中
    涉及表 二期tally_cfs_level_cargo_img 二期tally_cfs_operation_level
    */
    public function updcfscargoimg(){
        // 获取该表数据
        $data = $this->tally->db(0)->query("SELECT * FROM `tally_cfs_operation_level` WHERE level_img <> ''");
        // var_dump($data);
        $this->tally->db(1)->table('tally_cfs_level_cargo_img')->where("1")->delete();
        for ($i=0; $i < count($data); $i++) { 
            $array[$i]['id'] = $i+1;
            $array[$i]['level_id'] = $data[$i]['id'];
            $array[$i]['level_img'] = basename($data[$i]['level_img']);
            $array[$i]['level_num'] = $data[$i]['level_num'];
        }
        $this->tally->db(1)->table('tally_cfs_level_cargo_img')->addAll($array);
    }

    /**
    *修改门到门作业中的步骤
    */
    public function updateddstep()
    {
        // 获取所有数据
        $data = $this->tally->table("tally_dd_operation")->select();
        // 遍历数据 对每条数据都进行处理
        foreach ($data as $k => $v) {
            // 判断是否有铅封号
            if(empty($v['sealno'])){
                // 判断是否有全关门照片
                if(empty($v['close_door_picture'])){
                    // 判断是否有半关门照片
                    if(empty($v['halfclose_door_picture'])){
                        // 判断是否有作业关表数据
                        $res2 = $this->tally->table("tally_dd_operation_level")->where("operation_id = {$v['id']}")->find();
                        if(empty($res2)) {
                            // 判断是否有空箱照片
                            if(empty($data['empty_picture'])){
                                $res = array(
                                    'step' => 0
                                );
                            } else {
                                $res = array(
                                    'step' => 1
                                );
                            }
                        } else {
                            $res = array(
                                'step' => 2
                            );
                        }
                    } else {
                        $res = array(
                            'step' => 3
                        );
                    }
                } else {
                    $res = array(
                        'step' => 4
                        );
                }
            } else {
                $res = array(
                    'step' => 5
                    );
            }
            // 修改表中的步骤
            $where = array(
                    'id' => $v['id']
                );
            $this->tally->table('tally_dd_operation')->where($where)->save($res);
        }
    }
    /**
    *修改cfs作业中的步骤
    */
    public function updatecfsstep()
    {
        // 获取作业表中的所有数据
        $data = $this->tally->table("tally_cfs_operation")->select();
        // 遍历数据 对每条数据都进行处理
        foreach ($data as $k => $v) {
            // 判断是否有铅封号
            if(empty($v['sealno'])){
                // 判断是否有全关门照片
                if(empty($v['close_door_picture'])){
                    // 判断是否有半关门照片
                    if(empty($v['halfclose_door_picture'])){
                        // 判断是否有作业关表数据
                        $res2 = $this->tally->table("tally_cfs_operation_level")->where("operation_id = {$v['id']}")->find();
                        if(empty($res2)) {
                            // 判断是否有空箱照片
                            $res1 = $this->tally->table("tally_cfs_ctn_empty_img")->where("operation_id = {$v['id']}")->find();
                            if(empty($res1)){
                                $res = array(
                                    'step' => 0
                                );
                            } else {
                                $res = array(
                                    'step' => 1
                                );
                            }
                        } else {
                            $res = array(
                                'step' => 2
                            );
                        }
                    } else {
                        $res = array(
                            'step' => 3
                        );
                    }
                } else {
                    $res = array(
                        'step' => 4
                        );
                }
            } else {
                $res = array(
                    'step' => 5
                    );
            }
            // 修改表中的步骤
            $where = array(
                    'id' => $v['id']
                );
            $this->tally->table('tally_cfs_operation')->where($where)->save($res);
        }
    }
    /**
    *修改起泊装箱作业中的步骤
    */
    public function updateqbzxstep()
    {
        // 获取作业表中的所有数据
        $data = $this->tally->table("tally_qbzx_operation")->select();
        // 遍历数据 对每条数据都进行处理
        foreach ($data as $k => $v) {
            // 判断是否有铅封号
            if(empty($v['sealno'])){
                // 判断是否有全关门照片
                if(empty($v['close_door_picture'])){
                    // 判断是否有半关门照片
                    if(empty($v['halfclose_door_picture'])){
                        // 判断是否有作业关表数据
                        $res2 = $this->tally->table("tally_qbzx_operation_level")->where("operation_id = {$v['id']}")->find();
                        if(empty($res2)) {
                            // 判断是否有空箱照片
                            $res1 = $this->tally->table("tally_qbzx_empty_ctn_img")->where("operation_id = {$v['id']}")->find();
                            if(empty($res1)){
                                $res = array(
                                    'step' => 0
                                );
                            } else {
                                $res = array(
                                    'step' => 1
                                );
                            }
                        } else {
                            $res = array(
                                'step' => 2
                            );
                        }
                    } else {
                        $res = array(
                            'step' => 3
                        );
                    }
                } else {
                    $res = array(
                        'step' => 4
                        );
                }
            } else {
                $res = array(
                    'step' => 5
                    );
            }
            // 修改表中的步骤
            $where = array(
                    'id' => $v['id']
                );
            $this->tally->table('tally_qbzx_operation')->where($where)->save($res);
        }
    }
    /**
    *指令-配箱表
    */
    public function qbinscnt($res)
    {
        $this->tally->table('tally_qbzx_instruction_ctn')->where("1")->delete();
        foreach ($res as $k => $v) {
            $data = array();
            $data['id'] = $v['qbjobcontainerid'];
            if($v['qbjobinstructionid'] != ''){
                $data['instruction_id'] = $v['qbjobinstructionid'];
            }
            
            
            $data['operator_id'] = $v['operator_id'];
            
            
            $data['ctnno'] = $v['containerno'];
            $data['ctn_type_code'] = $v['containertypecode'];
            if($v['containermaster'] != ''){
                $data['ctn_master'] = $v['containermaster'];
            }
            
            $data['status'] = $v['status'];
            

            $re = $this->tally->db(1)->table('tally_qbzx_instruction_ctn')->data($data)->add();
            if(!$re){
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
	/**
    *作业表
    */
    public function cfso($res)
    {
        $this->tally->table('tally_cfs_operation')->where("1")->delete();
        foreach ($res as $k => $v) {
            $data = array();
            $data['id'] = $v['id'];
            if($v['ctn_id'] != ''){
                $data['ctn_id'] = $v['ctn_id'];
            }
            
            $data['halfclose_door_picture'] = $v['one_door_picture'];
            $data['close_door_picture'] = $v['two_door_picture'];
            $data['empty_weight'] = $v['empty_weight'];
            $data['sealno'] = $v['sealno'];
            $data['tmp_sealno'] = $v['tmp_sealno'];
            $data['seal_picture'] = $v['seal_picture'];
            $data['cargo_weight'] = $v['cargo_weight'];
            if($v['operator_id'] != ''){
                $data['operator_id'] = $v['operator_id'];
            }
            
            if($v['begin_time'] != ''){
                $data['begin_time'] = $v['begin_time'];
            }
            
            $res = $this->tally->table('tally_cfs_operation')->data($data)->add();

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
    *作业表
    */
    public function ddo($res)
    {
        $this->tally->table('tally_dd_operation')->where("1")->delete();
        foreach ($res as $k => $v) {
            $data = array();
            $data['id'] = $v['id'];
            if($v['ctn_id'] != ''){
                $data['ctn_id'] = $v['ctn_id'];
            }
            
            $data['door_picture'] = $v['door_picture'];
            $data['seal_picture'] = $v['seal_picture'];
            $data['damage_remark'] = $v['damage_remark'];
            $data['true_sealno'] = $v['true_sealno'];
            $data['cargo_picture'] = $v['cargo_picture'];
            $data['empty_picture'] = $v['empty_picture'];
            $data['damage_after_remark'] = $v['damage_after_remark'];
            if($v['operator_id'] != ''){
                $data['operator_id'] = $v['operator_id'];
            }
            
            if($v['begin_time'] != ''){
                $data['begin_time'] = $v['begin_time'];
            }
            
            $data['step'] = $v['step'];

            $res = $this->tally->table('tally_dd_operation')->data($data)->add();

            if(!$res){
            }
        }
    }
	/**
    *预报计划-配箱表
    */
    public function ddpc($res)
    {
        $this->tally->table('tally_dd_plan_container')->where("1")->delete();
        foreach ($res as $k => $v) {
            $data = array();
            $data['id'] = $v['id'];
            $data['ctnno'] = $v['ctnno'];
            $data['ctnsize'] = $v['ctnsize'];
            $data['ctntype'] = $v['ctntype'];
            $data['sealno'] = $v['sealno'];
            if($v['numbersofpackages'] != ''){
                $data['numbersofpackages'] = $v['numbersofpackages'];
            }
            
            if($v['weight'] != ''){
                $data['weight'] = $v['weight'];
            }
            
            if($v['volume'] != ''){
                $data['volume'] = $v['volume'];
            }
            
            $data['flflag'] = $v['flflag'];
            $data['classes'] = $v['classes'];
            $data['undgno'] = $v['undgno'];
            if($v['plan_id'] != ''){
                $data['plan_id'] = $v['plan_id'];
            }
            $data['status'] = $v['status'];
            if($data['status'] == '4'){
                $data['status'] = '2';
            }
            if($v['operator'] != ''){
                $data['operator_id'] = $v['operator'];
            }
            

            $res = $this->tally->table('tally_dd_plan_container')->data($data)->add();

            if(!$res){
            }
        }
    }
	/**
    *修改记录表
    */
    public function qbamend($res )
    {
        $this->tally->table('tally_amend')->where("1")->delete();
        foreach ($res as $k => $v) {
            $data = array();
            $data['id'] = $v['id'];
            $data['business'] = $v['business'];
            $data['category'] = $v['category'];
            if($v['op_id'] != ''){
                $data['operation_id'] = $v['op_id'];
            }
            
            if($v['info_id'] != ''){
                $data['instruction_id'] = $v['info_id'];
            }
            
            $data['field_name'] = $v['field_name'];
            $data['field_old_value'] = $v['field_old_value'];
            $data['field_new_value'] = $v['field_new_value'];
            if($v['uid'] != ''){
                $data['uid'] = $v['uid'];
            }
            
            if($v['date'] != ''){
                $data['date'] = $v['date'];
            }
            
            $data['remark'] = $v['remark'];

            $res = $this->tally->table('tally_amend')->data($data)->add();

            if(!$res){
            }
        }
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
    *装箱作业-关残损照片表
    */
    public function qbgd($res)
    {
        $this->tally->table('tally_qbzx_level_damage_img')->where("1")->delete();
        foreach ($res as $k => $v) {
            $data = array();
            $data['id'] = $v['goodsdamageid'];
            if($v['operationid'] != ''){
                $data['level_id'] = $v['operationid'];
            }
            
            if($v['sling'] != ''){
                $data['level_num'] = $v['sling'];
            }
            
            $data['damage_picture'] = $v['damagepicture'];

            $res = $this->tally->table('tally_qbzx_level_damage_img')->data($data)->add();

            if(!$res){
            }
        }
    }
	/**
    *装箱作业-关表
    */
    public function qblevel($res)
    {
        $this->tally->table('tally_qbzx_operation_level')->where("1")->delete();
        foreach ($res as $k => $v) {
            $data = array();
            $data['id'] = $v['levelpictureid'];
            if($v['operationid'] != ''){
                $data['operation_id'] = $v['operationid'];
            }
            
            if($v['sling'] != ''){
                $data['level_num'] = $v['sling'];
            }
            
            if($v['cargonumber'] != ''){
                $data['cargo_number'] = $v['cargonumber'];
            }
            
            $data['cargo_picture'] = $v['picture'];
            if($v['damageno'] != ''){
                $data['damage_num'] = $v['damageno'];
            }
            

            $data['billno'] = $v['orderno'];
            if($v['man'] != ''){
                $data['operator_id'] = $v['man'];
            }
            
            if($v['createtime'] != ''){
                $data['createtime'] = $v['createtime'];
            }
            

            $data['damage_explain'] = $v['remark'];
            $data['comment'] = $v['beizhu'];
            if($v['ship_id'] != ''){
                $data['ship_id'] = $v['ship_id'];
            }
            
            if($v['location_id'] != ''){
                $data['location_id'] = $v['location_id'];
            }
            
            $data['car'] = $v['car'];

            $res = $this->tally->table('tally_qbzx_operation_level')->add($data);

            if(!$res){
            }
        }
    }
    /**
    *装箱作业-关表
    */
    public function qblevel1($res)
    {
        $this->tally->table('tally_qbzx_level_cargo_img')->where("1")->delete();
        foreach ($res as $k => $v) {
            $data['level_id'] = $v['levelpictureid'];
            $data['level_num'] = $v['sling'];
            $data['cargo_picture'] = $v['picture'];

            $res = $this->tally->table('tally_qbzx_level_cargo_img')->add($data);
        }
    }
	/**
    *装箱作业表
    */

    public function qbo($res)
    {
        $this->tally->table('tally_qbzx_operation')->where("1")->delete();
        foreach ($res as $k => $v) {
            $data = array();
            $data['id'] = $v['qbzx_operationid'];

            $data['halfclose_door_picture'] = $v['one_door_picture'];
            $data['close_door_picture'] = $v['two_door_picture'];
            $data['sealno'] = $v['sealno'];
            $data['seal_picture'] = $v['sealpicture'];
            $data['empty_weight'] = $v['emptyweight'];
            $data['cargo_weight'] = $v['cargoweight'];
            $data['operator_id'] = $v['man'];
            $data['per_no'] = $v['per_no'];
            $data['tmp_sealno'] = $v['tmp_sealno'];
            if(!empty($v['ctn_id'])){
                $data['ctn_id'] = $v['ctn_id'];
            }
            
            $res = $this->tally->table('tally_qbzx_operation')->data($data)->add();

            if(!$res){
            }
        }
    }
	/**
    *指令表
    */
    public function qbins($res)
    {
        $this->tally->table('tally_qbzx_instruction')->where("1")->delete();
        foreach ($res as $k => $v) {
            $data = array();
            $data['id'] = $v['qbzx_jobinstructionid'];
            if($v['locationno'] != ''){
                $data['location_id'] = $v['locationno'];
            }
            
            if($v['ordertime'] != ''){
                $data['ordertime'] = $v['ordertime'];
            }
            
            $data['status'] = $v['status'];
            $data['loadingtype'] = $v['loadingtype'];
            $data['plan_id'] = $v['qbzx_forecastplanid'];
            if($v['group_id'] != ''){
                $data['department_id'] = $v['group_id'];
            }
            
            if($v['last_operator'] != ''){
                $data['last_operator'] = $v['last_operator'];
            }
            
            if($v['last_operationtime'] != ''){
                $data['last_operationtime'] = $v['last_operationtime'];
            }
            $res = $this->tally->table('tally_qbzx_instruction')->data($data)->add();
        }
    }
	/**
    *预报计划-配箱表
    */
    public function qbctn($res)
    {
        $this->tally->table('tally_qbzx_plan_ctn')->where("1")->delete();
        foreach ($res as $k => $v) {
            $data = array();
            $data['id'] = $v['qbzx_containerid'];
            if($v['qbzx_forecastplanid'] != ''){
                $data['plan_id'] = $v['qbzx_forecastplanid'];
            }
            
            $data['ctn_type_code'] = $v['containertypecode'];
            if($v['containermaster'] != ''){
                $data['ctn_master'] = $v['containermaster'];
            }
            
            $data['flflag'] = $v['loadingtype'];
            if($v['quantity'] != ''){
                $data['quantity'] = $v['quantity'];
            }
            
            if($v['last_operator'] != ''){
                $data['last_operator'] = $v['last_operator'];
            }
            
            if($v['last_operationtime'] != ''){
                $data['last_operationtime'] = $v['last_operationtime'];
            }
            

            $res = $this->tally->table('tally_qbzx_plan_ctn')->data($data)->add();

        }
    }
	/**
    *预报计划-配货表
    */
    public function qbcargo($res)
    {
        $this->tally->table('tally_qbzx_plan_cargo')->where("1")->delete();
        foreach ($res as $k => $v) {
            $data = array();
            $data['id'] = $v['qbzx_cargoid'];
            if($v['qbzx_forecastplanid'] != ''){
                $data['plan_id'] = $v['qbzx_forecastplanid'];
            }
            
            $data['billno '] = $v['billno'];
            $data['cargo_name'] = $v['cargoname'];
            if($v['number'] != ''){
                $data['number'] = $v['number'];
            }
            
            $data['pack'] = $v['package'];
            $data['mark'] = $v['mark'];
            $data['total_weight'] = $v['totalweight'];
            $data['dangerlevel'] = $v['dangerlevel'];
            $data['ship_id'] = $v['ship_id'];
            $data['location_id'] = $v['location_id'];


            $res = $this->tally->table('tally_qbzx_plan_cargo')->data($data)->add();
        }
    }
	/**
    *起泊装箱预报计划表
    */
    public function qbplan($res)
    {
        $this->tally->table('tally_qbzx_plan')->where("1")->delete();
        foreach ($res as $k => $v) {
            $data = array();
            $data['id'] = $v['qbzx_forecastplanid'];
            $data['entrustno'] = $v['entrustno'];
            if($v['totalnumber'] != ''){
                $data['total_ctn'] = $v['totalnumber'];
            }
            $data['total_ticket'] = $v['ticket'];
            $data['total_weight'] = $v['totalweight'];
            if($v['shipname'] != ''){
                $data['ship_id'] = $v['shipname'];
            }
            
            $data['voyage'] = $v['voyage'];
            if($v['locationno'] != ''){
                $data['location_id'] = $v['locationno'];
            }
            
            if($v['entrustdept'] != ''){
                $data['entrust_company'] = $v['entrustdept'];
            }
            
            $data['entrust_time'] = $v['entrusttime'];
            if($v['totalcontainer'] != ''){
                $data['total_package'] = $v['totalcontainer'];
            }
            
            $data['packing_require'] = $v['loadingrequire'];
            if($v['operator'] != ''){
                $data['last_operator'] = $v['operator'];
            }
            
            if($v['operationtime'] != ''){
                $data['last_operationtime'] = $v['operationtime'];
            }
            
            if($v['cargo_agent_id'] != ''){
                $data['cargo_agent_id'] = $v['cargo_agent_id'];
            }
            
            
            
            $res = $this->tally->table('tally_qbzx_plan')->data($data)->add();
        }
    }
	/**
    *替换当班理货长记录表
    */
    public function rtr($res)
    {
        $this->tally->table('tally_replace_tallymaster_record')->where("1")->delete();
        foreach ($res as $k => $v) {
            $data = array();
            $data['id'] = $v['id'];
            $data['shift_id'] = $v['work_id'];
            if($v['operator_id'] != ''){
                $data['operator_id'] = $v['operator_id'];
            }
            
            $data['reason'] = $v['reason'];
            if($v['replace_time'] != ''){
                $data['replace_time'] = $v['replace_time'];
            }
            
            
            
            $res = $this->tally->db(1)->table('tally_replace_tallymaster_record')->data($data)->add();
        }
    }
	/**
    *派工明细表
    */
    public function od($res)
    {
        $this->tally->table('tally_dispatch_detail')->where("1")->delete();
        foreach ($res as $k => $v) {
            $data = array();
            $data['id'] = $v['orderdetailid'];
            if($v['orderrepairid'] != ''){
                $data['dispatch_id'] = $v['orderrepairid'];
            }
            
            if($v['tallyclerk'] != ''){
                $data['clerk_id'] = $v['tallyclerk'];
            }
            
            if($v['orderdate'] != ''){
                $data['dispatch_time'] = $v['orderdate'];
            } else {
                $data['dispatch_time'] = "2017-1-1 00:00:00";
            }
            
            
            $res = $this->tally->table('tally_dispatch_detail')->data($data)->add();
        }
    }
	/**
    *派工表
    */
    public function orderrepair($res)
    {
        $this->tally->table('tally_dispatch')->where("1")->delete();
        foreach ($res as $k => $v) {
            $data = array();
            $data['id'] = $v['orderrepairid'];
            if($v['chieftally'] != ''){
                $data['chieftally'] = $v['chieftally'];
            }
            
            if($v['orderdate'] != ''){
                $data['dispatch_time'] = $v['orderdate'].' '.$v['repairtime'];
            }
            
            
            $data['shift_id'] = $v['gand_id'];
            if($v['instruction'] != ''){
                $data['instruction_id'] = $v['instruction'];
            }
            
            $data['business'] = $v['business'];
            $data['mark'] = $v['mark'];

            $res = $this->tally->table('tally_dispatch')->data($data)->add();
        }
    }
	/**
   	*交接班明细表
   	*/
   	public function sd($res)
   	{
        $this->tally->table('tally_shift_detail')->where("1")->delete();
    	foreach ($res as $k => $v) {
            $data = array();
    		$data['id'] = $v['id'];
    		$data['exchanged_id'] = $v['gand_id'];
    		if($v['user_to'] != ''){
    			$data['user_exchanged_id'] = $v['user_to'];
    		}
    		
    		if($v['time_to'] != ''){
    			$data['exchanged_time'] = $v['time_to'];
    		}
    		
    		$data['carryon_id'] = $v['gand_id_get'];
    		if($v['user_get'] != ''){
    			$data['user_carryon_id'] = $v['user_get'];
    		}
    		
    		if($v['time_get'] != ''){
    			$data['carryon_time'] = $v['time_get'];
    		}
    		
    		$data['note'] = $v['note'];
    		$res = $this->tally->table('tally_shift_detail')->data($data)->add();
    	}
   	}
	/**
   	*签到表
   	*/
   	public function shift($res)
   	{
        $this->tally->table('tally_shift')->where("1")->delete();
    	foreach ($res as $k => $v) {
            $data = array();
    		$data['shift_id'] = $v['gand_id'];
    		if($v['gand_master'] != ''){
    			$data['shift_master'] = $v['gand_master'];
    		}
    		
    		if($v['group_id'] != ''){
    			$data['department_id'] = $v['group_id'];
    		}
    		
    		$data['classes'] = $v['classes'];
    		if($v['date'] != ''){
    			$data['date'] = $v['date'];
    		}
    		
    		if($v['begin_time'] != ''){
    			$data['begin_time'] = $v['date'].' '.$v['begin_time'];
    		}
    		
    		if($v['end_time'] != ''){
    			$data['end_time'] = $v['date'].' '.$v['end_time'];
    		}
    		$data['mark'] = $v['mark'];
    		$res = $this->tally->table('tally_shift')->data($data)->add();
    	}
   	}
	/**
   	*用户表
   	*/
   	public function u($res)
   	{
        $this->tally->table('tally_user')->where("1")->delete();
    	foreach ($res as $k => $v) {
            $data = array();
    		$data['uid'] = $v['uid'];
    		$data['staffno'] = $v['staffno'];
    		$data['user_name'] = $v['username'];
    		$data['user_pwd'] = md5($v['userpassword'].'user'.substr($v['userpassword'],0,3));
    		$data['department_id'] = $v['departmentinfoid'];
    		$data['position'] = $v['position'];
    		$data['group_id'] = $v['group_id'];
    		if($v['lastlogintime'] != ''){
    			$data['last_logintime'] = $v['lastlogintime'];
    		}
            if($v['userstatus'] == '1'){
                $data['user_status'] = "Y";
            }else{
                $data['user_status'] = "N";
            }
    		$data['operator'] = $v['operator'];
    		if($v['operationtime'] != ''){
    			$data['operationtime'] = $v['operationtime'];
    		}
    		$data['shift_id'] = $v['gand_id'];
    		$res = $this->tally->table('tally_user')->data($data)->add();
    		if(!$res){
    			 
    		}
    	}
   	}
	
	/**
   	*部门表
   	*/
   	public function dpm($res)
   	{
        $this->tally->table('tally_department')->where("1")->delete();
    	foreach ($res as $k => $v) {
            $data = array();
    		$data['id'] = $v['departmentinfoid'];
    		$data['department_code'] = $v['departmentcode'];
    		$data['department_name'] = $v['departmentname'];
    		if($v['superdepartmentid'] != ''){
    			$data['pid'] = $v['superdepartmentid'];
    		}
    		$res = $this->tally->table('tally_department')->data($data)->add();
    	}
   	}
	/**
   	*客户表
   	*/
   	public function cus($res)
   	{
        $this->tally->table('tally_customer')->where("1")->delete();
    	foreach ($res as $k => $v) {
            $data = array();
    		$data['id'] = $v['customerinfoid'];
    		$data['customer_code'] = $v['customercode'];
    		$data['customer_pwd'] = md5($v['customerpassword'].'customer'.substr($v['customerpassword'],0,2));

    		$data['customer_name'] = $v['customername'];
    		if($v['category'] != ''){
    			$data['customer_category'] = $v['category'];
    		}
    		if($v['paytype'] != ''){
    			$data['paytype'] = $v['paytype'];
    		}
    		
    		$data['linkman'] = $v['contacter'];
    		$data['telephone'] = $v['telephone'];
            if($v['customerstatus'] == '1'){
                $data['customer_status'] = "Y";
            } else {
                $data['customer_status'] = "N";
            }
    		if($v['operator'] != ''){
    			$data['operator'] = $v['operator'];
    		}
    		if($v['operationtime'] != ''){
    			$data['operationtime'] = $v['operationtime'];
    		}
    		
    		$data['contract_number'] = $v['shortcall'];
    		$data['customer_shortname'] = $v['contract_num'];
    		if($v['contract_expiry_date'] != ''){
    			$data['contract_life'] = $v['contract_expiry_date'];
    		}
    		
    		if($v['rate_id'] != ''){
    			$data['rate_id'] = $v['rate_id'];
    		}
    		
    		
    		$res = $this->tally->table('tally_customer')->data($data)->add();
    	}
   	}
	/**
   	*集装箱-箱主表
   	*/
   	public function ctnm($res)
   	{
        $this->tally->table('tally_container_master')->where("1")->delete();
    	foreach ($res as $k => $v) {
            $data = array();
    		$data['id'] = $v['containermasterinfoid'];
    		$data['ctn_master_code'] = $v['containermastercode'];
    		$data['ctn_master'] = $v['containermaster'];
    		if($v['operator'] != ''){
				$data['operator'] = $v['operator'];
    		}
    		if($v['operationtime'] != ''){
    			$data['operationtime'] = $v['operationtime'];
    		}
    		$res = $this->tally->table('tally_container_master')->data($data)->add(); 
    	}
   	}
   	/**
   	*集装箱-箱型表
   	*/
	public function ctn($res)
   	{
        $this->tally->table('tally_container')->where("1")->delete();
    	foreach ($res as $k => $v) {
            $data = array();
    		$data['id'] = $v['containerinfoid'];
    		$data['ctn_type_code'] = $v['containertypecode'];
    		$data['ctn_type'] = $v['containertype'];
    		if($v['containersize'] != ''){
    			$data['ctn_size'] = $v['containersize'];
    		}
    		
    		if($v['operator'] != ''){
    			$data['operator'] = $v['operator'];
    		}
    		if($v['operationtime'] != ''){
    			$data['operationtime'] = $v['operationtime'];
    		}
    		$res = $this->tally->table('tally_container')->data($data)->add();
    		 
    	}
   	}

	/**
   	*船舶表
   	*/
   	public function ship($res)
   	{
        $this->tally->table('tally_ship')->where("1")->delete();
    	foreach ($res as $k => $v) {
            $data = array();
    		$data['id'] = $v['shipinfoid'];
    		$data['ship_code'] = $v['shipcode'];
    		$data['ship_name'] = $v['shipname'];
    		$data['ship_english_name'] = $v['shipname_en'];
    		if($v['type'] != ''){
    			$data['ship_type'] = $v['type'];
    		}
    		$data['nationality'] = $v['nationality'];
    		$data['linkman'] = $v['contacter'];
    		$data['telephone'] = $v['telephone'];
    		if($v['operator'] != ''){
    			$data['operator'] = $v['operator'];
    		}
    		if($v['operationtime'] != ''){
    			$data['operationtime'] = $v['operationtime'];
    		}
    		if($v['line'] != ''){
    			$data['ship_route'] = $v['line'];
    		}
    		if($v['regular_ship'] != ''){
    			$data['regular_ship'] = $v['regular_ship'];
    		}
    		if($v['space_num'] != ''){
    			$data['warehouse_number'] = $v['space_num'];
    		}
    		$data['imo'] = $v['imo'];
    		if($v['agent'] != ''){
    			$data['agent_id'] = $v['agent'];
    		}
    		$res = $this->tally->table('tally_ship')->data($data)->add();
    		 
    	}
   	}

	/**
	* 将作业地点表导入二期
	*/
    public function location($res)
    {
        $this->tally->table('tally_location')->where("1")->delete();
    	foreach ($res as $k => $v) {
            $data = array();
    		$data['id'] = $v['operationlocationinfoid'];
    		$data['location_code'] = $v['locationcode'];
    		$data['location_name'] = $v['locationname'];
    		$data['address'] = $v['address'];
    		$data['linkman'] = $v['contacter'];
    		$data['telephone'] = $v['telephone'];
    		$data['location_type'] = $v['type'];
    		if($v['operator'] != ''){
    			$data['operator'] = $v['operator'];
    		}
    		if($v['operationtime'] != ''){
	    		$data['operationtime'] = $v['operationtime'];
    		}
    		if($v['pid'] != ''){
    			$data['pid'] = $v['pid'];
    		}
    		$res = $this->tally->table('tally_location')->data($data)->add();
    	}
   	}

	/**
    *装箱作业-空箱照片表
    */
	public function qboe($data)
    {
        

        $this->tally->table('tally_qbzx_empty_ctn_img')->where("1")->delete();
        foreach ($data as $k => $v) {
            $arr = array();
            foreach ($v as $key => $val) {
                if($key == "qbzx_operation_id"){
                    $arr['operation_id'] = $val;
                } else {
                    $arr[$key] = $val;
                }
            }
            $res = $this->tally->table('tally_qbzx_empty_ctn_img')->data($arr)->add();
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
	// 获取tally中的表名
	public function getData()
	{
		$sql = "SHOW TABLES";
		$tables = M('amend')->db(0)->query($sql);
        
        foreach ($tables as $k => $v) {
            $tablelist[] = $v['tables_in_tally_data'];
        }
        foreach ($tablelist as $k => $v) {
            $data[$v] = $this->tally->table($v)->select();
        }
		return $data;
	}

}