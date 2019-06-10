<?php
header("Content-type: text/html; charset=utf-8");
//include_once "wxBizMsgCrypt.php";

function checkSignature()
{
    $signature = $_GET["signature"];
    $timestamp = $_GET["timestamp"];
    $nonce = $_GET["nonce"];
    $token = "majinhushidiyi2019";

    $tmpArr = array($timestamp, $nonce, $token);
    sort($tmpArr, SORT_STRING);
    $tmpStr = implode($tmpArr);
    $tmpStr = sha1($tmpStr);

    if ($signature === $tmpStr) {
        return true;
    } else {
        return false;
    }
}

function to_utf8($in)
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
}


function is_utf8($str)
{
    return preg_match('//u', $str);
}


//消息回复
function responseMsg()
{

    //1.获取到微信推送过来post数据（xml格式）
    $postArr = file_get_contents('php://input');

//    file_put_contents('wxmsglog.txt', $postArr, FILE_APPEND);

    //2.处理消息类型，并设置回复类型和内容
    $postObj = simplexml_load_string($postArr, 'SimpleXMLElement', LIBXML_NOCDATA);

    /*
     * 构造回复变量
     */
    $toUser = $postObj->FromUserName;
    $fromUser = $postObj->ToUserName;
    $msgType = 'text';
    $time = time();


    //判断该数据包是否是订阅事件推送
    if (strtolower($postObj->MsgType) == 'event') {
        //如果是关注 subscribe事件
        if (strtolower($postObj->Event) == 'subscribe') {
//            file_put_contents('wxmsglog.txt', "已关注", FILE_APPEND);
            if (empty($postObj->EventKey)) {
                $content = '欢迎关注本测试公众号,测试请访问<a href="http://wx1.0csy.com">这里</a>';
            } else {
                $content = '欢迎关注本测试公众号,您扫描了参数id为' . $postObj->EventKey . "的二维码，欢迎!";
            }
        } elseif (strtolower($postObj->Event) == 'scan') {
            $content = '您扫描了参数id为' . $postObj->EventKey . "的二维码";
        } else {
            exit('');
        }
    } else {
        exit('');
    }


    //修改为utf-8编码
    if (is_utf8($content)) {
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
//    file_put_contents('wxmsglog.txt', $info, FILE_APPEND);
    exit($info);
}

//file_put_contents('wxmsglog.txt', json_encode($_REQUEST), FILE_APPEND);
//file_put_contents('wxmsglog.txt', file_get_contents('php://input'), FILE_APPEND);

if (checkSignature()) {
    if (isset($_GET['echostr'])) {
        exit($_GET['echostr']);
    } else {
        responseMsg();
    }
} else {
    exit('error sign');
}







