<?php
namespace Home\Controller;
use Think\Controller;
header("Content-Type:text/html;charset=utf-8");
class IndexController extends Controller {
    public function index(){
    	$config = array (  
            'DB_TYPE'               =>  'oracle',     // 数据库类型
            'DB_HOST'               =>  '192.168.86.200', // 服务器地址
            'DB_NAME'               =>  'pormals.lct2005.com',          // 数据库名
            'DB_USER'               =>  'njfor',      // 用户名
            'DB_PWD'                =>  'njfor',          // 密码
            'DB_PORT'               =>  '1521',        // 端口
        );
    	// 下载对应的扩展文件
    	// 将扩展文件放到对应的ext目录下
    	// 修改php.ini文件 重启phpstudy
        // $sql = "SELECT * FROM OPENQUERY(LT, 'SELECT * from ACTOMS.TEMP_CFS_REPORT_TB');exit;";
        // $sql = "SELECT * from ACTOMS.temp_vessel_report_tb;";
    	// $sql = "select * from test_table";
    	// $data = M('ACTOMS.temp_vessel_report_tb','',$config)->limit(1)->select();
        // Select* from OPENQUERY(LT,’select* from ACTOMS.temp_cfs_report_tb ‘)
        // $data = M()->query("Select * from OPENQUERY(LT,'select * from ACTOMS.temp_cfs_report_tb')");
        $data = M()->db(1,'LONGTAN')->table('ACTOMS.TEMP_CFS_REPORT_TB')->limit(10)->select();
        echo "<pre>";
    	var_dump($data);
    }
}