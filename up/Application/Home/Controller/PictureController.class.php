<?php
namespace Home\Controller;
use Think\Controller;
/**
* 修改文件中图片的遗留问题
*/
header("Content-Type:text/html;charset=utf-8;");
class PictureController extends Controller{
	/*
	路径均用相对路径
	*/
	// 原图片路径
	private $source = "../tally/AppUpload/";
	// 目标cargo图片路径
	private $cargo = "../tally2test/Public/upload/qbzx/cargo/";
	// 目标cdamage图片路径
	private $cdamage = "../tally2test/Public/upload/qbzx/cdamage/";
	// 目标closedoor图片路径
	private $close = "../tally2test/Public/upload/qbzx/closedoor/";
	// 目标halfclosedoor图片路径
	private $half = "../tally2test/Public/upload/qbzx/halfclosedoor/";
	// 目标empty图片路径
	private $empty = "../tally2test/Public/upload/qbzx/empty/";
	// 目标seal图片路径
	private $seal = "../tally2test/Public/upload/qbzx/seal/";
	private $tally;
	public function _initialize()
	{
		$this->tally = M();
        $this->tally->db(1,"mysql://tally_user:njtally2016@localhost:3306/tally2_data");
	}
	public function index()
	{
		$begin = time();
		$this->_run();
		$this->_run();
		$end = time();
		echo "累计耗时 ".($end-$begin)." 秒";
	}
	public function _run()
	{
		$this->renewal("tally_qbzx_operation", "halfclose_door_picture", $this->half);
		$this->renewal("tally_qbzx_operation", "close_door_picture", $this->close);
		$this->renewal("tally_qbzx_operation", "seal_picture", $this->seal);
		$this->renewal("tally_qbzx_empty_ctn_img", "empty_picture", $this->empty);
		$this->renewal("tally_qbzx_operation_level", "cargo_picture", $this->cargo);
		$this->renewal("tally_qbzx_level_damage_img", "damage_picture", $this->cdamage);
		$this->renewal("tally_qbzx_operation", "halfclose_door_picture", $this->half);
		$this->renewal("tally_qbzx_operation", "close_door_picture", $this->close);
		$this->renewal("tally_qbzx_operation", "seal_picture", $this->seal);
		$this->renewal("tally_qbzx_empty_ctn_img", "empty_picture", $this->empty);
		$this->renewal("tally_qbzx_operation_level", "cargo_picture", $this->cargo);
		$this->renewal("tally_qbzx_level_damage_img", "damage_picture", $this->cdamage);
		$this->alter("tally_dd_cargo_damage_img","img");
		$this->alter("tally_dd_ctn_damage_after_img","img");
		$this->alter("tally_dd_ctn_damage_img","img");
		$this->alter("tally_dd_operation","door_picture");
		$this->alter("tally_dd_operation","seal_picture");
		$this->alter("tally_dd_operation","cargo_picture");
		$this->alter("tally_dd_operation","empty_picture");
		$this->alter("tally_cfs_cargo_damage_img","img");
		$this->alter("tally_cfs_ctn_empty_img","empty_img");
		$this->alter("tally_cfs_operation_level","level_img");
		$this->alter("tally_cfs_operation","halfclose_door_picture");
		$this->alter("tally_cfs_operation","close_door_picture");
		$this->alter("tally_cfs_operation","seal_picture");
		// 二次修订
		$this->updateqbzx();
		$this->updatecfs();
	}
	private function renewal($table, $field, $filename)
	{
		// 获取数据
		$data = $this->tally->table($table)->field("id, $field")->where("$field <> ''")->select();
		// 获取图片文件名
		foreach ($data as $k => $v) {
			$data[$k][$field] = basename($v[$field]);
			// if( filesize($this->source.basename($v[$field])) ){
			// } else {
			// 	$data[$k][$field] = '';
			// }
		}
		foreach ($data as $k => $v) {
			if( filesize($this->source.$v[$field]) ){
				if(copy($this->source.$v[$field], $filename.$v[$field])){
				} else {
				}
			} else {
			}
			$this->tally->table($table)->where("id = {$v['id']}")->save($v);
		}
	}
	private function alter($table, $field)
	{
		// 获取数据
		$data = $this->tally->table($table)->field("id, $field")->where("$field <> ''")->select();
		// 修改数据
		foreach ($data as $k => $v) {
			$data[$k][$field] = basename($v[$field]);
		}
		// 重新写入数据库
		foreach ($data as $k => $v) {
			$this->tally->table($table)->where("id = {$v['id']}")->save($v);
		}
	}
	// 二次修订表内容
	public function updateqbzx(){
		// 获取起驳关表中的数据
		$levelData = $this->tally->table("tally_qbzx_operation_level")->select();
		// 取出表中的个别数据 重置为另一张表
		foreach ($levelData as $k => $v) {
			// 先判断原有数据中cargo_picture是否为空
			if($v['cargo_picture']){
				// 如果非空 则 取出数据
				$data[] = array(
						'level_id' => $v['id'],
						'level_num' => $v['level_num'],
						'cargo_picture' => $v['cargo_picture']
					);
			}
		}
		// 判断data 是否 为空
		if (empty($data[0])) {
		} else {
			// 将数据写入数据库
			if ($this->tally->table("tally_qbzx_level_cargo_img")->create($data)){
				$this->tally->add();
			} else {
			}
		}
	}
	public function updatecfs(){
		// 获取起驳关表中的数据
		$levelData = $this->tally->table("tally_cfs_operation_level")->select();
		// 取出表中的个别数据 重置为另一张表
		foreach ($levelData as $k => $v) {
			// 先判断原有数据中cargo_picture是否为空
			if($v['cargo_picture']){
				// 如果非空 则 取出数据
				$data[] = array(
						'level_id' => $v['id'],
						'level_num' => $v['level_num'],
						'cargo_picture' => $v['cargo_picture']
					);
			}
		}
		// 判断data 是否 为空
		if (empty($data[0])) {
		} else {
			// 将数据写入数据库
			if ($this->tally->table("tally_cfs_level_cargo_img")->create($data)){
				$this->tally->add();
			} else {
			}
		}
	}

}