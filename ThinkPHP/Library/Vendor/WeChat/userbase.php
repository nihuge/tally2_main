<?php
header("Content-type: text/html; charset=utf-8");
require_once 'httpDo.php';
$wxConfig = require 'wxconfig.php';
$code = $_POST['code'];

$response_arr = array();
$url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=" . $wxConfig['AppId'] . "&secret=" . $wxConfig['AppSecret'] . "&code=" . $code . "&grant_type=authorization_code";

$httpDo = new httpDo();
$output = $httpDo->get($url);
if ($output === FALSE) {
    $response_arr['error'] = '500';
    $response_arr['msg'] = $httpDo->httpError;
}else{
    $result = json_decode($output, true);
    if (!empty($result['errcode'])) {
        $response_arr['error'] = $result['errcode'];
        $response_arr['msg'] = $result['errmsg'];
    } else {
        $response_arr['error'] = '0';
        $response_arr['msg'] = $result['openid'];
    }
}


exit(json_encode($response_arr));