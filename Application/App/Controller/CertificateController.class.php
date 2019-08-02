<?php

/**
 * APP接口
 * 证明生成系统
 */

namespace App\Controller;

use App\Common\BaseController;

class CertificateController extends BaseController
{

    /**
     * 创建证明
     * @param uid 用户id
     * @param ward 进出口标识
     * @param ship_name 船名
     * @param voyage 航次号
     * @param nationality 船国家
     * @param commenced_time 开始时间
     * @param content 证明主体
     * @return array
     * @return @param code:返回码
     * @return @param msg:返回码说明
     * @return @param cert_id:成功时返回证明ID
     */
    public function createCert()
    {
        if (I('post.uid') and I('post.ward') and I('post.ship_name') and I('post.voyage') and I('post.nationality')
            and I('post.commenced_time')) {
            //接收post值
            $uid = I('post.uid');
            $ward = I('post.ward');
            $ship_name = I('post.ship_name');
            $voyage = I('post.voyage');
            $nationality = I('post.nationality');
            $commenced_time = strtotime(I('post.commenced_time'));
            $list_time = time();

            //初始化模型类
            $user = new \Common\Model\UserModel();
            $cert = new \Common\Model\CertificateModel();
            //查找员工信息
            $userinfo = $user->where('uid=' . $uid)->find();

            //如果员工有效的话
            if ($userinfo['user_status'] != 'N') {
                $data = array(
                    'uid' => $uid,
                    'ward' => $ward,
                    'ship_name' => $ship_name,
                    'voyage' => $voyage,
                    'nationality' => $nationality,
                    'commenced_time' => $commenced_time,
                    'list_time' => $list_time,
                    'operator_name' => $userinfo['user_name'],
                );
                //如果传入内容
                if (I('post.content')) {
                    $data['content'] = htmlspecialchars(urldecode(I('post.content')));
                }

                //对data数据进行验证
                if (!$cert->create($data)) {
                    $res = array(
                        'code' => $this->ERROR_CODE_COMMON['DB_ERROR'],
                        'msg' => $cert->getError(),
                    );
                    exit(json_encode($res, JSON_UNESCAPED_UNICODE));
                } else {
                    //验证通过 可以对数据进行操作
                    $cert->add($data);

                    $res = array(
                        'code' => $this->ERROR_CODE_COMMON['SUCCESS'],
                        'msg' => '成功',
                        'cert_id' => $cert->getLastInsID(),
                    );
                    exit(json_encode($res, JSON_UNESCAPED_UNICODE));
                }
            } else {
                // 用户被冻结
                $res = array(
                    'code' => $this->ERROR_CODE_USER['USER_FROZEN'],
                    'msg' => $this->ERROR_CODE_USER_ZH[$this->ERROR_CODE_USER['USER_FROZEN']]
                );
                exit(json_encode($res, JSON_UNESCAPED_UNICODE));
            }

        }
    }

    /**
     * 搜索证明
     * @param ward 进出口标识
     * @param ship_name 船名
     * @param voyage 航次号
     * @param nationality 船国家
     * @param commenced_start_time 开始时间开始搜索时间
     * @param commenced_end_time 开始时间结束搜索时间
     * @param list_start_time 单证时间开始搜索时间
     * @param list_end_time 单证时间结束搜索时间
     * @return array
     * @return @param code:返回码
     * @return @param msg:返回码说明
     * @return @param list:成功时返回的数据json
     */
    public function searchCert()
    {

        //获取证明列表
        $cert = new \Common\Model\CertificateModel();
        $where = '1';
        //检索进出口标记
        if (I('get.ward')) {
            $ward = I('get.ward');
            $where .= " and ward='" . $ward . "'";
        }
        //检索船名
        if (I('get.ship_name')) {
            $ship_name = I('get.ship_name');
            $where .= " and ship_name like '%" . $ship_name . "%'";
        }
        //检索航次
        if (I('get.voyage')) {
            $voyage = I('get.voyage');
            $where .= " and voyage like '%" . $voyage . "%'";
        }
        //检索船国家
        if (I('get.nationality')) {
            $nationality = I('get.nationality');
            $where .= " and nationality like '%" . $nationality . "%'";
        }
        //检索开始时间
        if (I('get.commenced_start_time') and I('get.commenced_end_time')) {
            $commenced_start_time = strtotime(I('get.commenced_start_time'));
            $commenced_end_time = strtotime(I('get.commenced_end_time'));
            $where .= " and commenced_time between " . $commenced_start_time . " and " . $commenced_end_time;
        }
        //检索证明创建时间
        if (I('get.list_start_time') and I('get.list_end_time')) {
            $list_start_time = strtotime(I('get.list_start_time'));
            $list_end_time = strtotime(I('get.list_end_time'));
            $where .= " and list_time between " . $list_start_time . " and " . $list_end_time;
        }

        //如果传入了cert_id，则放弃之前所有的检索条件
        if (I('get.cert_id')) {
            $cert_id = I('get.cert_id');
            $where = "id=" . $cert_id;
        }

        //分页逻辑
        $per = 15;
        if ($_GET ['p']) {
            $p = $_GET ['p'];
        } else {
            $p = 1;
        }
        $begin_num = ($p - 1) * $per;


//            $sql = "select * from __PREFIX__Certificate where $where order by i.id desc limit $begin_num,$per";
        $list = $cert->where($where)->order('id desc')->limit($begin_num, $per)->select();
        //$list = $instruction->where($where)->page($p.','.$per)->order('id desc')->select();

        if (I('get.cert_id')) {
            $list = $list[0];
            if ($list['sign_picture'] == "") {
                $list['signed'] = false;
            } else {
                $list['signed'] = true;
            }
            //时间戳转日期
            $list['list_time'] = date('Y-m-d H:i:s', $list['list_time']);
            $list['commenced_time'] = date('Y-m-d H:i:s', $list['commenced_time']);
        } else {
            foreach ($list as $key => $value) {
                //查看是否签名过
                if ($value['sign_picture'] == "") {
                    $list[$key]['signed'] = false;
                } else {
                    $list[$key]['signed'] = true;
                }
                //时间戳转日期
                $list[$key]['list_time'] = date('Y-m-d H:i:s', $value['list_time']);
                $list[$key]['commenced_time'] = date('Y-m-d H:i:s', $value['commenced_time']);
            }
        }

        // 成功
        $res = array(
            'code' => $this->ERROR_CODE_COMMON ['SUCCESS'],
            'msg' => $this->ERROR_CODE_COMMON_ZH [$this->ERROR_CODE_COMMON ['SUCCESS']],
            'list' => $list
        );

        exit(json_encode($res, JSON_UNESCAPED_UNICODE));


    }


    /**
     * 上传签名
     * @param cert_id 证明ID
     * @file sign_picture 上传的base64图片
     * @return array
     * @return @param code:返回码
     * @return @param msg:返回码说明
     * @return @param sign_picture:签名图片路径
     */
    public function upSignPicture()
    {
        if (I('post.sign_picture') and I('get.cert_id')) {
            $cert_id = I('get.cert_id');
            $sign_picture = I('post.sign_picture');
            $path_s = '.' . IMAGE_CERT_SIGN;
            // 上传一张空箱图片
            $res_s = base64_upload($sign_picture, $path_s);
            if ($res_s ['code'] != 0) {
                // 上传失败
                $res = array(
                    'code' => $this->ERROR_CODE_COMMON ['FILE_UPLOAD_ERROR'],
                    'msg' => $res_s ['msg']
                );
                exit (json_encode($res, JSON_UNESCAPED_UNICODE));
            } else {
                // 上传成功，保存数据到证明表
                $data = array(
                    'sign_picture' => $res_s ['file']
                );
                $cert = new \Common\Model\CertificateModel();
                $result = $cert->where('id=' . $cert_id)->data($data)->save();
                if ($result) {
                    $res = array(
                        'code' => $this->ERROR_CODE_COMMON ['SUCCESS'],
                        'msg' => $this->ERROR_CODE_COMMON_ZH [$this->ERROR_CODE_COMMON ['SUCCESS']],
                        'sign_picture' => $path_s . $res_s ['file'],
                    );
                    exit(json_encode($res, JSON_UNESCAPED_UNICODE));
                } else {
                    // 保存失败
                    $res = array(
                        'code' => $this->ERROR_CODE_COMMON ['DB_ERROR'],
                        'msg' => $cert->getDbError(),
                    );
                    exit (json_encode($res, JSON_UNESCAPED_UNICODE));
                }
            }

        } else {
            $res = array(
                'code' => $this->ERROR_CODE_LOCATION['PARAMETER_ERROR'],
                'msg' => $this->ERROR_CODE_COMMON_ZH[$this->ERROR_CODE_LOCATION['PARAMETER_ERROR']]
            );
            exit(json_encode($res, JSON_UNESCAPED_UNICODE));
        }
    }


    /**
     * 获取证明
     * @param cert_id 证明ID
     * @file sign_picture 上传的base64图片
     * @return array
     * @return @param code:返回码
     * @return @param msg:返回码说明
     * @return @param sign_picture:签名图片路径
     */
    public function printCert()
    {
        if (I('get.cert_id')) {
            $cert_id = I('get.cert_id');
            $cert = new \Common\Model\CertificateModel();
            $cert_info = $cert->where('id=' . $cert_id)->find();
            $cert_info['content'] = json_decode(htmlspecialchars_decode($cert_info['content']), true);
            //时间戳转日期
            $cert_info['list_time'] = date('Y-m-d H:i:s', $cert_info['list_time']);
            $cert_info['commenced_time'] = date('Y-m-d H:i:s', $cert_info['commenced_time']);

            vendor('mpdf.outCert');
            $print_cert = new \outCert();
            $print_cert->setReportValue($cert_info);
            $print_cert->outputReport();
        }
    }

    /**
     * 获取新证明
     * @param cert_id 证明ID
     * @file sign_picture 上传的base64图片
     * @return array
     * @return @param code:返回码
     * @return @param msg:返回码说明
     * @return @param sign_picture:签名图片路径
     */
    public function printNewCert()
    {
        if (I('get.cert_id')) {
            $cert_id = I('get.cert_id');
            $cert = new \Common\Model\CertificateModel();
            $cert_info = $cert->where('id=' . $cert_id)->find();
            $cert_info['content'] = json_decode(htmlspecialchars_decode($cert_info['content']), true);
            //时间戳转日期
            $cert_info['list_time'] = date('Y-m-d H:i:s', $cert_info['list_time']);
            $cert_info['commenced_time'] = date('Y-m-d H:i:s', $cert_info['commenced_time']);

            vendor('mpdf.outCert');
            $print_cert = new \outCert();
            $print_cert->setReportValue($cert_info);
            $print_cert->outputReport('1');
        }
    }


    /**
     * 创建证明
     * @param uid 用户id
     * @param ward 进出口标识
     * @param ship_name 船名
     * @param voyage 航次号
     * @param nationality 船国家
     * @param commenced_time 开始时间
     * @param content 证明主体
     * @return array
     * @return @param code:返回码
     * @return @param msg:返回码说明
     * @return @param cert_id:成功时返回证明ID
     */
    public function createDamageCert()
    {
        if (I('post.uid') and I('post.berth') and I('post.ship_name') and I('post.voyage') and I('post.nationality')
            and I('post.commenced_time')) {
            //接收post值
            $uid = I('post.uid');
            $berth = I('post.berth');
            $ship_name = I('post.ship_name');
            $voyage = I('post.voyage');
            $nationality = I('post.nationality');
            $commenced_time = strtotime(I('post.commenced_time'));
            $list_time = time();

            //初始化模型类
            $user = new \Common\Model\UserModel();
            $cert = new \Common\Model\CertificateDamageModel();
            //查找员工信息
            $userinfo = $user->where('uid=' . $uid)->find();

            //如果员工有效的话
            if ($userinfo['user_status'] != 'N') {
                $data = array(
                    'uid' => $uid,
                    'berth' => $berth,
                    'ship_name' => $ship_name,
                    'voyage' => $voyage,
                    'nationality' => $nationality,
                    'commenced_time' => $commenced_time,
                    'list_time' => $list_time,
                    'operator_name' => $userinfo['user_name'],
                );
                //如果传入内容
                if (I('post.content')) {
                    $data['content'] = htmlspecialchars(urldecode(htmlspecialchars_decode(I('post.content'))));
                }

                //对data数据进行验证
                if (!$cert->create($data)) {
                    $res = array(
                        'code' => $this->ERROR_CODE_COMMON['DB_ERROR'],
                        'msg' => $cert->getError(),
                    );
                    exit(json_encode($res, JSON_UNESCAPED_UNICODE));
                } else {
                    //验证通过 可以对数据进行操作
                    $cert->add($data);

                    $res = array(
                        'code' => $this->ERROR_CODE_COMMON['SUCCESS'],
                        'msg' => '成功',
                        'cert_id' => $cert->getLastInsID(),
                    );
                    exit(json_encode($res, JSON_UNESCAPED_UNICODE));
                }
            } else {
                // 用户被冻结
                $res = array(
                    'code' => $this->ERROR_CODE_USER['USER_FROZEN'],
                    'msg' => $this->ERROR_CODE_USER_ZH[$this->ERROR_CODE_USER['USER_FROZEN']]
                );
                exit(json_encode($res, JSON_UNESCAPED_UNICODE));
            }

        } else {
            $res = array(
                'code' => $this->ERROR_CODE_COMMON['PARAMETER_ERROR'],
                'msg' => $this->ERROR_CODE_COMMON_ZH[$this->ERROR_CODE_COMMON['PARAMETER_ERROR']],
                'post' => I('post.'),
            );
            exit(json_encode($res, JSON_UNESCAPED_UNICODE));
        }
    }

    /**
     * 搜索证明
     * @param
     * @param ship_name 船名
     * @param voyage 航次号
     * @param nationality 船国家
     * @param commenced_start_time 开始时间开始搜索时间
     * @param commenced_end_time 开始时间结束搜索时间
     * @param list_start_time 单证时间开始搜索时间
     * @param list_end_time 单证时间结束搜索时间
     * @return array
     * @return @param code:返回码
     * @return @param msg:返回码说明
     * @return @param list:成功时返回的数据json
     */
    public function searchDamageCert()
    {

        //获取证明列表
        $cert = new \Common\Model\CertificateDamageModel();
        $where = '1';
        //检索进出口标记
        if (I('get.berth')) {
            $ward = I('get.berth');
            $where .= " and berth like '%" . $ward . "'%";
        }
        //检索船名
        if (I('get.ship_name')) {
            $ship_name = I('get.ship_name');
            $where .= " and ship_name like '%" . $ship_name . "%'";
        }
        //检索航次
        if (I('get.voyage')) {
            $voyage = I('get.voyage');
            $where .= " and voyage like '%" . $voyage . "%'";
        }
        //检索船国家
        if (I('get.nationality')) {
            $nationality = I('get.nationality');
            $where .= " and nationality like '%" . $nationality . "%'";
        }
        //检索开始时间
        if (I('get.commenced_start_time') and I('get.commenced_end_time')) {
            $commenced_start_time = strtotime(I('get.commenced_start_time'));
            $commenced_end_time = strtotime(I('get.commenced_end_time'));
            $where .= " and commenced_time between " . $commenced_start_time . " and " . $commenced_end_time;
        }
        //检索证明创建时间
        if (I('get.list_start_time') and I('get.list_end_time')) {
            $list_start_time = strtotime(I('get.list_start_time'));
            $list_end_time = strtotime(I('get.list_end_time'));
            $where .= " and list_time between " . $list_start_time . " and " . $list_end_time;
        }

        //如果传入了cert_id，则放弃之前所有的检索条件
        if (I('get.cert_id')) {
            $cert_id = I('get.cert_id');
            $where = "id=" . $cert_id;
        }

        //分页逻辑
        $per = 15;
        if ($_GET ['p']) {
            $p = $_GET ['p'];
        } else {
            $p = 1;
        }
        $begin_num = ($p - 1) * $per;


//            $sql = "select * from __PREFIX__Certificate where $where order by i.id desc limit $begin_num,$per";
        $list = $cert->where($where)->order('id desc')->limit($begin_num, $per)->select();
        //$list = $instruction->where($where)->page($p.','.$per)->order('id desc')->select();

        if (I('get.cert_id')) {
            $list = $list[0];
            if ($list['sign_picture'] == "") {
                $list['signed'] = false;
            } else {
                $list['signed'] = true;
            }
            //时间戳转日期
            $list['list_time'] = date('Y-m-d H:i:s', $list['list_time']);
            $list['commenced_time'] = date('Y-m-d H:i:s', $list['commenced_time']);
        } else {
            foreach ($list as $key => $value) {
                //查看是否签名过
                if ($value['sign_picture'] == "") {
                    $list[$key]['signed'] = false;
                } else {
                    $list[$key]['signed'] = true;
                }
                //时间戳转日期
                $list[$key]['list_time'] = date('Y-m-d H:i:s', $value['list_time']);
                $list[$key]['commenced_time'] = date('Y-m-d H:i:s', $value['commenced_time']);
            }
        }

        // 成功
        $res = array(
            'code' => $this->ERROR_CODE_COMMON ['SUCCESS'],
            'msg' => $this->ERROR_CODE_COMMON_ZH [$this->ERROR_CODE_COMMON ['SUCCESS']],
            'list' => $list
        );

        exit(json_encode($res, JSON_UNESCAPED_UNICODE));


    }


    /**
     * 上传签名
     * @param cert_id 残损证明ID
     * @file sign_picture 上传的base64图片
     * @return array
     * @return @param code:返回码
     * @return @param msg:返回码说明
     * @return @param sign_picture:签名图片路径
     */
    public function upDamageSignPicture()
    {
        if (I('post.sign_picture') and I('get.cert_id')) {
            $cert_id = I('get.cert_id');
            $sign_picture = I('post.sign_picture');
            $path_s = '.' . IMAGE_CERT_DAMAGESIGN;
            // 上传一张空箱图片
            $res_s = base64_upload($sign_picture, $path_s);
            if ($res_s ['code'] != 0) {
                // 上传失败
                $res = array(
                    'code' => $this->ERROR_CODE_COMMON ['FILE_UPLOAD_ERROR'],
                    'msg' => $res_s ['msg']
                );
                exit (json_encode($res, JSON_UNESCAPED_UNICODE));
            } else {
                // 上传成功，保存数据到证明表
                $data = array(
                    'sign_picture' => $res_s ['file']
                );
                $cert = new \Common\Model\CertificateDamageModel();
                $result = $cert->where('id=' . $cert_id)->data($data)->save();
                if ($result) {
                    $res = array(
                        'code' => $this->ERROR_CODE_COMMON ['SUCCESS'],
                        'msg' => $this->ERROR_CODE_COMMON_ZH [$this->ERROR_CODE_COMMON ['SUCCESS']],
                        'sign_picture' => $path_s . $res_s ['file'],
                    );
                    exit(json_encode($res, JSON_UNESCAPED_UNICODE));
                } else {
                    // 保存失败
                    $res = array(
                        'code' => $this->ERROR_CODE_COMMON ['DB_ERROR'],
                        'msg' => $cert->getDbError(),
                    );
                    exit (json_encode($res, JSON_UNESCAPED_UNICODE));
                }
            }

        } else {
            $res = array(
                'code' => $this->ERROR_CODE_COMMON['PARAMETER_ERROR'],
                'msg' => $this->ERROR_CODE_COMMON_ZH[$this->ERROR_CODE_COMMON['PARAMETER_ERROR']]
            );
            exit(json_encode($res, JSON_UNESCAPED_UNICODE));
        }
    }

    /**
     * 获取证明
     * @param cert_id 证明ID
     * @file sign_picture 上传的base64图片
     * @return array
     * @return @param code:返回码
     * @return @param msg:返回码说明
     * @return @param sign_picture:签名图片路径
     */
    public function printDamageCert()
    {
        if (I('get.cert_id')) {
            $cert_id = I('get.cert_id');
            $cert = new \Common\Model\CertificateDamageModel();
            $cert_info = $cert->where('id=' . $cert_id)->find();
            $cert_info['content'] = json_decode(htmlspecialchars_decode($cert_info['content']), true);
            //时间戳转日期
            $cert_info['list_time'] = date('Y-m-d H:i:s', $cert_info['list_time']);
            $cert_info['commenced_time'] = date('Y-m-d H:i:s', $cert_info['commenced_time']);

            vendor('mpdf.outDamageCert');
            $print_cert = new \outDamageCert();
            $print_cert->setReportValue($cert_info);
            $print_cert->outputReport();
        }
    }
    /**
     * 获取新残损证明
     * @param cert_id 证明ID
     * @file sign_picture 上传的base64图片
     * @return array
     * @return @param code:返回码
     * @return @param msg:返回码说明
     * @return @param sign_picture:签名图片路径
     */
    public function printNewDamageCert()
    {
        if (I('get.cert_id')) {
            $cert_id = I('get.cert_id');
            $cert = new \Common\Model\CertificateDamageModel();
            $cert_info = $cert->where('id=' . $cert_id)->find();
            $cert_info['content'] = json_decode(htmlspecialchars_decode($cert_info['content']), true);
            //时间戳转日期
            $cert_info['list_time'] = date('Y-m-d H:i:s', $cert_info['list_time']);
            $cert_info['commenced_time'] = date('Y-m-d H:i:s', $cert_info['commenced_time']);

            vendor('mpdf.outDamageCert');
            $print_cert = new \outDamageCert();
            $print_cert->setReportValue($cert_info);
            $print_cert->outputReport();
        }
    }

    /**
     * 获取新残损证明
     * @param cert_id 证明ID
     * @file sign_picture 上传的base64图片
     * @return array
     * @return @param code:返回码
     * @return @param msg:返回码说明
     * @return @param sign_picture:签名图片路径
     */
    public function printAppDamageCert()
    {
        if (I('get.cert_id')) {
            $cert_id = I('get.cert_id');
            $cert = new \Common\Model\CertificateDamageModel();
            $cert_info = $cert->where('id=' . $cert_id)->find();
            $cert_info['content'] = json_decode(htmlspecialchars_decode($cert_info['content']), true);
            //时间戳转日期
            $cert_info['list_time'] = date('Y-m-d H:i:s', $cert_info['list_time']);
            $cert_info['commenced_time'] = date('Y-m-d H:i:s', $cert_info['commenced_time']);

            vendor('mpdf.outDamageCert');
            $print_cert = new \outDamageCert();
            $print_cert->setReportValue($cert_info);
            $print_cert->outputReport('1');
        }
    }

}