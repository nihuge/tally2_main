<?php
header("Content-type: text/html; charset=utf-8");
require_once 'WxToken.php';

class WxQrcode
{
    public $ticket;
    public $postData = array();
    public $url = 'https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token=';

    public function getTicket($scene_id, $expire = 0)
    {
        if ($expire) {
            $WxToken = new WxToken();
            $token_result = $WxToken->getWxToken();
            if ($token_result['error'] == '0') {
                $this->url .= $token_result['msg'];

                $this->postData['expire_seconds'] = $expire;
                $this->postData['action_name'] = "QR_SCENE";
                $this->postData['action_info'] = array(
                    'scene' => array(
                        'scene_id' => $scene_id
                    )
                );

                $httpDo = new httpDo();
                $result = $httpDo->post($this->url, json_encode($this->postData));
                if ($result == false) {
//                    echo $httpDo->httpError;
                    return false;
                } else {
                    $result_arr = json_decode($result, true);
//                    var_dump($result_arr);
//                    echo $result;
                    $this->ticket = $result_arr['ticket'];
                    return true;
                }
            } else {
//                echo $token_result['msg'];
                return false;
            }
        }
//        echo 2;
        return false;
    }
}


/*$wxQrcode = new WxQrcode();
if ($wxQrcode->getTicket($_POST['EventKey'], 1800)) {
    $img_src = 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=' . urlencode($wxQrcode->ticket);
    $html = '<img src="' . $img_src . '" width="600 px"/>';
    exit($html);
} else {
    exit('创建二维码失败');
}*/
