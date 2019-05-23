<?php
/**
 * 起驳装箱业务类
 * 修改记录管理类
 */

namespace Common\Model;
use Think\Model;

class LongTanModel extends Model
{
	static private $config = array (  
            'DB_TYPE'               =>  'oracle',     // 数据库类型
            'DB_HOST'               =>  '192.168.86.200', // 服务器地址
            'DB_NAME'               =>  'pormals.lct2005.com',          // 数据库名
            'DB_USER'               =>  'njfor',      // 用户名
            'DB_PWD'                =>  'njfor',          // 密码
            'DB_PORT'               =>  '1521',        // 端口
        );
	/**
	* @param string $blno 提单号
	* @return array $data 过滤后的获取到的数据
	*/
    static public function getDataByBlno($blno){
        $config = self::$config;

    	$where = array(
    			'bl_so_no' => $blno
    		);
    	$data = M()->db(1,$config)->table('ACTOMS.TEMP_CFS_REPORT_TB')->where($where)->select();
    	return $data;
    }

    /**
    * @param string $ctnno  箱号
    * @return array $data   过滤后获取到的数据
    */
    static public function getDataByCtnno($ctnno){
        $config = self::$config;
    	$where = array(
    			'container_number'  	=> $ctnno,
    		);
    	$data = M()->db(1,$config)->table('ACTOMS.TEMP_CFS_REPORT_TB')->where($where)->select();
    	return $data;
    }
    /**
    * 获取装箱视图数据
    * @param string $blno 提单号
    * @return array $data 过滤后的获取到的数据
    */
    static public function getLoadingDataByBlno($blno){
        $config = self::$config;
        $where = array(
                'bl_so_no' => $blno
            );
        $data = M()->db(1,$config)->table('ACTOMS.TEMP_CFS_LOADING_PLAN')->where($where)->select();
        return $data;
    }
    /**
    * 获取装箱视图数据
    * @param string $ctnno  箱号
    * @return array $data   过滤后获取到的数据
    */
    static public function getLoadingDataByCtnno($ctnno){
        $config = self::$config;
        $where = array(
                'container_number'      => $ctnno,
            );
        $data = M()->db(1,$config)->table('ACTOMS.TEMP_CFS_LOADING_PLAN')->where($where)->select();
        return $data;
    }
    /**
    * 获取拆箱视图数据
    * @param string $blno 提单号
    * @return array $data 过滤后的获取到的数据
    */
    static public function getDismantleDataByBlno($blno){
        $config = self::$config;
        $where = array(
                'bl_so_no' => $blno
            );
        $data = M()->db(1,$config)->table('ACTOMS.TEMP_CFS_DISMANTLE_PLAN')->where($where)->select();
        return $data;
    }
    /**
    * 获取拆箱视图数据
    * @param string $ctnno  箱号
    * @return array $data   过滤后获取到的数据
    */
    static public function getDismantleDataByCtnno($ctnno){
        $config = self::$config;
        $where = array(
                'container_number'      => $ctnno,
            );
        $data = M()->db(1,$config)->table('ACTOMS.TEMP_CFS_DISMANTLE_PLAN')->where($where)->select();
        return $data;
    }

    /**
    * 测试用
    */
    static public function getLoadingData(){
        $config = self::$config;
        $data = M()->db(1,$config)->table('ACTOMS.TEMP_CFS_LOADING_PLAN')->limit(10)->select();
        return $data;
    }
    static public function getDismantleData(){
        $config = self::$config;
        $data = M()->db(1,$config)->table('ACTOMS.TEMP_CFS_DISMANTLE_PLAN')->limit(10)->select();
        return $data;
    }
}