<?php
header("Content-type: text/html; charset=utf-8");
require_once 'WxToken.php';

/*
 * 获取变量
 */

class sendWxMsg
{
    public $data_arr = array();
    public $access_token;
    public $template;
    public $types = array(
        'OF0GeyxttNIXKztY4Ci6U7dSjj-gEwDr7aW9l-y0CdA',
    );


    function __construct($data, $type)
    {
        $this->template = $this->types[0];
        $this->data_arr['first'] = array('value' => "装箱进展通知", 'color' => '#173177');

        $this->data_arr['keyword4'] = array('value' => $data['ctnno'], 'color' => '#173177');
        $this->data_arr['keyword1'] = array('value' => $data['billno'], 'color' => '#173177');
/*        $this->data_arr['keyword4'] = array('value' => $data['ctn_master'], 'color' => '#173177');
        $this->data_arr['keyword1'] = array('value' => $data['ship_name'], 'color' => '#173177');
        $this->data_arr['voyage'] = array('value' => $data['voyage'], 'color' => '#173177');*/
        $this->data_arr['keyword3'] = array('value' => date('Y年m月d日 H时i分s秒',time()), 'color' => '#173177');


        if ($type == 1) {
            $this->data_arr['keyword2'] = array('value' => "装箱完成", 'color' => '#173177');
            $this->data_arr['remark'] = array('value' => "具体信息请点击查看", 'color' => '#173177');

            /*$this->template = $this->types[0];
            $this->data_arr['ctnno'] = array('value' => $data['ctnno'], 'color' => '#173177');
            $this->data_arr['ctn_type_code'] = array('value' => $data['ctn_type_code'], 'color' => '#173177');
            $this->data_arr['ctn_master'] = array('value' => $data['ctn_master'], 'color' => '#173177');
            $this->data_arr['ship_name'] = array('value' => $data['ship_name'], 'color' => '#173177');
            $this->data_arr['voyage'] = array('value' => $data['voyage'], 'color' => '#173177');
            $this->data_arr['ctn_time'] = array('value' => date('Y年m月d日 H时i分s秒',time()), 'color' => '#173177');*/
        } elseif ($type == 2) {

            $this->data_arr['keyword2'] = array('value' => "开始装箱", 'color' => '#173177');
            $this->data_arr['remark'] = array('value' => "具体信息请点击查看", 'color' => '#173177');

            /*$this->template = $this->types[1];
            $this->data_arr['entrustno'] = array('value' => $data['entrustno'], 'color' => '#173177');
            $this->data_arr['customer_name'] = array('value' => $data['customer_name'], 'color' => '#173177');
            $this->data_arr['voyage'] = array('value' => $data['voyage'], 'color' => '#173177');
            $this->data_arr['packing_require'] = array('value' => $data['packing_require'], 'color' => '#173177');
            $this->data_arr['entrust_time'] = array('value' => $data['entrust_time'], 'color' => '#173177');
            $this->data_arr['work_time'] = array('value' => date('Y年m月d日 H时i分s秒',time()), 'color' => '#173177');*/
        }
    }


    function send($openid)
    {
        //实例化token类
        $wxtoken = new WxToken();
        $wxToken = $wxtoken->getWxToken();


        /*
         * 获取token
         */
        if ($wxToken['error'] == '0') {
            $this->access_token = $wxToken['msg'];
        } else {
            return $wxToken;
        }


        $httpDo = new httpDo();
        $url = 'https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=' . $this->access_token;
        $data = array();
        $data['touser'] = $openid;
        //模板id，测试只有一种
        $data['template_id'] = $this->template;
        //用户点击信息后跳转网址
        $data['url'] = 'http://online.njtally.com/customer.php';
        //放入通知信息
        $data['data'] = $this->data_arr;

        file_put_contents('log.txt', $url . "\r\n" . json_encode($data));

        $result = $httpDo->post($url, json_encode($data));

//        echo $result;
        if ($result === false) {
            return array('error' => '500', 'msg' => $httpDo->httpError);
        } else {
            $result = json_decode($result, true);
            if ($result['errorcode'] == 0) {

                return array('error' => '0', 'msg' => $result['msgid']);
            } else {
                return array('error' => $result['errorcode'], 'msg' => $result["errmsg"]);
            }
        }

    }
}

