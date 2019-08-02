<?php
/**
 * 基础类
 * 客户管理类
 */

namespace Common\Model;

use Think\Model;

class CertificateDamageModel extends Model
{

    protected $_validate = array(
        array('uid', 'is_positive_int', '请传入正确的用户ID', self::EXISTS_VALIDATE, 'function'),//用户ID必须为正整数
        array('uid', 'require', '用户ID不能为空', self::EXISTS_VALIDATE, 'function'),//用户ID不能为空

        array('berth', '1,100', '泊位号不能大于100位', self::EXISTS_VALIDATE, 'length'),//长度只能1
        array('berth','require', '泊位号不能为空', self::EXISTS_VALIDATE, 'function'),//泊位号不能为空

        array('ship_name', '1,255', '船名不得超过255个字符', self::EXISTS_VALIDATE, 'length'),//值不为空即验证，长度不能超过255个字符
        array('ship_name', 'require', '船名不能为空！', self::EXISTS_VALIDATE),          //存在即验证，不能为空

        array('voyage', '1,60', '航次不得超过60个字符！', self::EXISTS_VALIDATE, 'length'),  //存在即验证，长度不能超过60个字符
        array('voyage', 'require', '航次不能为空', self::EXISTS_VALIDATE),  //存在即验证，不能为空

        array('nationality', 'require', '国家不能为空', self::EXISTS_VALIDATE),  //存在即验证，不能为空
        array('nationality', '1,100', '国家不得超过100个字符', self::VALUE_VALIDATE, 'length'),//值不为空验证,不得超过100个字符

        array('commenced_time', '10,30', '开始日期无法解析', self::VALUE_VALIDATE, 'length'),//值不为空即验证，不得超过13个字符
        array('commenced_time', 'is_positive_int', '开始日期无法解析', self::VALUE_VALIDATE, 'function'),//值不为空即验证，必须为正整数时间戳
        array('commenced_time', 'require', '开始日期不能为空', self::EXISTS_VALIDATE),  //存在即验证，不能为空

        array('list_time', '10,30', '证明日期无法解析', self::VALUE_VALIDATE, 'length'),//值不为空即验证，不得超过13个字符
        array('list_time', 'is_positive_int', '证明日期无法解析', self::VALUE_VALIDATE, 'function'),//值不为空即验证，必须为正整数时间戳
        array('list_time', 'require', '证明日期不能为空', self::EXISTS_VALIDATE),  //存在即验证，不能为空

        array('operator_name', 'require', '理货员不能为空', self::EXISTS_VALIDATE),  //存在即验证，不能为空

//        array('content', 'is_json', '内容主体必须为json', self::EXISTS_VALIDATE, 'callback'),  //存在即验证，不能为空
    );

//    public function is_json($string)
//    {
//        json_decode($string);
//        return (json_last_error() == JSON_ERROR_NONE);
//    }

}

?>