<?php
/**
 * APP接口
 * 用户管理接口
 */

namespace App\Controller;

use App\Common\BaseController;

class WxApiController extends BaseController
{
    public function wxdo()
    {
        $echostr = I('get.echostr');
        file_put_contents('log.txt', json_encode($_GET) . "\r\n", FILE_APPEND);
        if ($this->checkSignature()) {
            if (isset($_GET['echostr'])) {
                exit($echostr);
            } else {
                file_put_contents('log.txt', "认证成功，收到消息！\r\n", FILE_APPEND);
                $this->responseMsg();
            }
        } else {
//            file_put_contents('log.txt', "认证失败！\r\n", FILE_APPEND);
            exit("");
        }
    }


    public function checkSignature()
    {
        $signature = $_GET["signature"];
        $timestamp = $_GET["timestamp"];
        $nonce = $_GET["nonce"];
        $token = "majinhushidiyi2019";

        $tmpArr = array($timestamp, $nonce, $token);
        sort($tmpArr, SORT_STRING);
        $tmpStr = implode($tmpArr);
        $tmpStr = sha1($tmpStr);

//        file_put_contents('log.txt', $tmpStr . ":" . $signature . "\r\n", FILE_APPEND);
        if ($signature === $tmpStr) {
            return true;
        } else {
            return false;
        }


    }

    /*    public function to_utf8($in)
        {
            if (is_array($in)) {
                foreach ($in as $key => $value) {
                    $out[to_utf8($key)] = to_utf8($value);
                }
            } elseif (is_string($in)) {
                if (mb_detect_encoding($in) != "UTF-8")
                    return utf8_encode($in);
                else
                    return $in;
            } else {
                return $in;
            }
            return $out;
        }*/


    public function is_utf8($str)
    {
        return preg_match('//u', $str);
    }


//消息回复
    public function responseMsg()
    {
        //1.获取到微信推送过来post数据（xml格式）
        $postArr = file_get_contents('php://input');

        file_put_contents('wxmsglog.txt', $postArr . "aaaa", FILE_APPEND);

        //2.处理消息类型，并设置回复类型和内容
        $postObj = simplexml_load_string($postArr, 'SimpleXMLElement', LIBXML_NOCDATA);

        /*
         * 构造回复变量
         */
        $toUser = $postObj->FromUserName;
        $fromUser = $postObj->ToUserName;
        $msgType = 'text';
        $time = time();

        $updata_sql = "UPDATE __PREFIX__customer SET wx_openid='{{openid}}' WHERE wx_ticket='{{wx_ticket}}';";


        //判断该数据包是否是订阅事件推送
        if (strtolower($postObj->MsgType) == 'event') {
            $customer = new \Common\Model\CustomerModel();
            //如果是关注 subscribe事件
            if (strtolower($postObj->Event) == 'subscribe') {
                file_put_contents('wxmsglog.txt', "已关注", FILE_APPEND);
                if (empty($postObj->EventKey)) {
                    $content = '欢迎关注本公众号,测试请访问<a href="http://wx1.0csy.com">这里</a>';
                } else {
                    $customerMsg = $customer->where("wx_ticket='" . $postObj->Ticket . "'")->find();
                    if ($customerMsg['wx_openid'] == "") {
                        $updata_sql = str_replace('{{openid}}', $toUser, $updata_sql);
                        if (strlen($postObj->Ticket) > 6) {
                            $updata_sql = str_replace('{{wx_ticket}}', $postObj->Ticket, $updata_sql);
                            @M()->execute($updata_sql);
                        } else {
                            exit("");
                        }
//                        $customer->where("wx_ticket='" . $postObj->Ticket . "'")->save($data1);
                        $content = $customerMsg['customer_name'] . "，您好，感谢您的关注，您的账号已成功绑定此微信账号，重新刷新首页即可！";
                    } else {
                        $content = $customerMsg['customer_name'] . "，您好，请勿重复绑定！";
                    }
                }
            } elseif (strtolower($postObj->Event) == 'scan') {
                file_put_contents('wxmsglog.txt', "已扫描", FILE_APPEND);
                $customerMsg = $customer->where("wx_ticket='" . $postObj->Ticket . "'")->find();
                if ($customerMsg['wx_openid'] == "") {
                    $updata_sql = str_replace('{{openid}}', $toUser, $updata_sql);
                    if (strlen($postObj->Ticket) > 6) {
                        $updata_sql = str_replace('{{wx_ticket}}', $postObj->Ticket, $updata_sql);
                        @M()->execute($updata_sql);
                    } else {
                        exit("");
                    }
//                    $customer->where(" wx_ticket='" . $postObj->Ticket . "'")->save($data1);
                    $content = $customerMsg['customer_name'] . "，您好，感谢您的扫描，您的账号已成功绑定此微信账号，重新刷新首页即可！";
                } else {
                    $content = $customerMsg['customer_name'] . "，您好，请勿重复扫描绑定！";
                }
            }
        } else {
            $content = '您好，已收到您的信息，如需要查看货物信息，请登录官方网站查看，谢谢！';
        }


        //修改为utf-8编码
        if ($this->is_utf8($content)) {
            $content = $content;
        } else {
            $content = iconv('gb2312', 'UTF-8//IGNORE', $content);
        }

        $template = "<xml>
              <ToUserName><![CDATA[%s]]></ToUserName>
              <FromUserName><![CDATA[%s]]></FromUserName>
              <CreateTime>%s</CreateTime>
              <MsgType><![CDATA[%s]]></MsgType>
              <Content><![CDATA[%s]]></Content>
              </xml>";

        $info = sprintf($template, $toUser, $fromUser, $time, $msgType, $content);

        file_put_contents('wxmsglog.txt', $info . "aaac", FILE_APPEND);
        exit($info);
    }

//file_put_contents('wxmsglog.txt', json_encode($_REQUEST), FILE_APPEND);
//file_put_contents('wxmsglog.txt', file_get_contents('php://input'), FILE_APPEND);

}






