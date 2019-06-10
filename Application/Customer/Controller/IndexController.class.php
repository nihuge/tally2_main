<?php

namespace Customer\Controller;

use Think\Controller;
//use WxQrcode;

class IndexController extends CommonController
{
    public function index()
    {

        if ($_SESSION['id']) {
            $id = $_SESSION['id'];
            $customer = new \Common\Model\CustomerModel();
            //客户信息
            $customerMsg = $customer->getCustomerMsg($id);

            if ($customerMsg['wx_openid'] == "") {
                $nowTime = time();
                if ($customerMsg['ticket_expires'] < $nowTime) {
                    vendor('WeChat.WxQrcode');
                    $wxQrcode = new \WxQrcode();
                    if ($wxQrcode->getTicket($id, 2592000)) {//设置有效期为1个月
                        $ticket = $wxQrcode->ticket;
                        $data = array(
                            'wx_ticket' => $ticket,
                            'ticket_expires' => $nowTime + 2591900,//过期时间提前一百秒，防止扫描到过期二维码
                        );
                        $customer->where("id=" . $id)->data($data)->save();
                    }
                } else {
                    $ticket = $customerMsg['wx_ticket'];
                }
                $img_src = 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=' . urlencode($ticket);
                $html = '<img src="' . $img_src . '" width="200 px"/>';
            }else{
                $html = "no";
            }
            $this->assign('WxQrimg', $html);
            $this->assign('customerMsg', $customerMsg);
            $this->display();
        } else {
            layout(false);
            $this->error('对不起，您尚未登录，请先登录', U('User/login'));
        }
    }
}