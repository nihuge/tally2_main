<?php
namespace Home\Controller;
use Think\Controller;
/**
* 修改文件中图片的遗留问题
*/
header("Content-Type:text/html;charset=utf-8;");
class FileController extends Controller{
	/*
	路径均用相对路径
	*/
	// 原图片路径
	private $source = "../AppUpload/";
	// 目标cargo图片路径
	private $cargo = "../Public/upload/qbzx/cargo/";
	// 目标cdamage图片路径
	private $cdamage = "../Public/upload/qbzx/cdamage/";
	// 目标closedoor图片路径
	private $close = "../Public/upload/qbzx/closedoor/";
	// 目标halfclosedoor图片路径
	private $half = "../Public/upload/qbzx/halfclosedoor/";
	// 目标empty图片路径
	private $empty = "../Public/upload/qbzx/empty/";
	// 目标seal图片路径
	private $seal = "../Public/upload/qbzx/seal/";
	private $tally;
	public function _initialize()
	{
		$this->tally = M();

	}
	public function index(){
		// $this->getCargoImgFile();
		$this->getCdamageImgFile();
		$this->getEmptyImgFile();
		$this->getLevelImgFile();
	}

	// 获取文件数据
	public function getCargoImgFile(){
		$data = $this->tally->field('cargo_picture')->table('tally_qbzx_level_cargo_img')->select();
		foreach ($data as $k => $v) {
			if($v['cargo_picture']){
				// 判断文件是否存在
				if (file_exists($this->source.$v['cargo_picture'])) {
					copy($this->source.$v['cargo_picture'],$this->cargo.$v['cargo_picture']);
				}
			}
		}

	}

	public function getCdamageImgFile(){
		$data = $this->tally->field('damage_picture')->table('tally_qbzx_level_damage_img')->select();
		foreach ($data as $k => $v) {
			if($v['damage_picture']){
				// 判断文件是否存在
				if (file_exists($this->source.$v['damage_picture'])) {
					copy($this->source.$v['damage_picture'],$this->cdamage.$v['damage_picture']);
				}
			}
		}
	}

	public function getEmptyImgFile(){
		$data = $this->tally->field('empty_picture')->table('tally_qbzx_empty_ctn_img')->select();
		foreach ($data as $k => $v) {
			if($v['empty_picture']){
				// 判断文件是否存在
				if (file_exists($this->source.$v['empty_picture'])) {
					copy($this->source.$v['empty_picture'],$this->empty.$v['empty_picture']);
				}
			}
		}
	}
	public function getHalfcloseImgFile(){
		$data = $this->tally->field('halfclose_door_picture')->table('tally_qbzx_operation')->select();
		foreach ($data as $k => $v) {
			if($v['halfclose_door_picture']){
				if (file_exists($this->source.$v['halfclose_door_picture'])) {
					copy($this->source.$v['halfclose_door_picture'],$this->half.$v['halfclose_door_picture']);
				}
				
			}
		}
	}
	public function getSealImgFile(){
		$data = $this->tally->field('seal_picture')->table('tally_qbzx_operation')->select();
		foreach ($data as $k => $v) {
			if($v['seal_picture']){
				if (file_exists($this->source.$v['seal_picture'])) {
					if(copy($this->source.$v['seal_picture'],$this->seal.$v['seal_picture'])){
						echo "文件复制成功<br>";
					} else {
						echo "文件复制失败<br>";
					}
				} else {
					echo "原文件不存在<br>";
				}
				
			} else {
				echo "seal_picture=>{$v['seal_picture']}<br>";
			}
		}
	}
	public function getCloseImgFile(){
		$data = $this->tally->field('close_door_picture')->table('tally_qbzx_operation')->select();
		foreach ($data as $k => $v) {
			if($v['close_door_picture']){
				if (file_exists($this->source.$v['close_door_picture'])) {
					copy($this->source.$v['close_door_picture'],$this->close.$v['close_door_picture']);
				}
			}
		}
	}


}