<?php
namespace Test\Controller;
use Think\Controller;
class IndexController extends Controller {
    public function index(){
        // 测试页面
        if(empty($_POST)){
            $this->display();
        } else{
            var_dump($_POST);
            if($_POST['type'] == 'zx'){
                if(empty($_POST['blno'])){
                    $data = \Common\Model\LongTanModel::getLoadingDataByCtnno($_POST['ctnno']);
                } else {
                    $data = \Common\Model\LongTanModel::getLoadingDataByBlno($_POST['blno']);
                }
                echo "zx";
                echo "<pre>";
                var_dump($data);
                echo "</pre>";
                
            } else {
                if(empty($_POST['blno'])){
                    $data = \Common\Model\LongTanModel::getDismantleDataByCtnno($_POST['ctnno']);
                } else {
                    $data = \Common\Model\LongTanModel::getDismantleDataByBlno($_POST['blno']);
                }
                echo "cx";
                echo "<pre>";
                var_dump($data);
                echo "</pre>";
            }
        }
    }
    public function test(){
        $data[0] = \Common\Model\LongTanModel::getLoadingData();
        $data[1] = \Common\Model\LongTanModel::getDismantleData();

        echo "<pre>";
        print_r($data);
        echo "</pre>";
    }
}