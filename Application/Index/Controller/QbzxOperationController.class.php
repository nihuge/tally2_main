<?php
/**
 * 起泊装箱
 * 作业管理
 */
namespace Index\Controller;

use Index\Common\BaseController;

class QbzxOperationController extends BaseController
{
    public function index($ctn_id)
    {
        $this->assign('ctn_id', $ctn_id);
        //根据箱ID获取箱详情
        $container = new \Common\Model\QbzxInstructionCtnModel();
        $ctnMsg = $container->getContainerMsg($ctn_id);
        $this->assign('ctnMsg', $ctnMsg);
        //根据箱ID获取作业详情
        $operation = new \Common\Model\QbzxOperationModel();
        $msg = $operation->getOperationMsg($ctn_id);
        $this->assign('msg', $msg);

        //根据作业ID获取关列表
        $res_o = $operation->where("ctn_id='$ctn_id'")->field('id')->find();
        $operation_id = $res_o['id'];
        $level = new \Common\Model\QbzxOperationLevelModel();
        $levelList = $level->getLevelListByqbzx($operation_id);
        $this->assign('levelList', $levelList);
        $this->display();
    }

    //替换理货员
    public function replaceTallyClerk($instruction_id, $ctn_id)
    {
        layout(false);
        $uid = $_SESSION['uid'];
        //判断用户是否有权限进行派工
        $dispatch = new \Common\Model\DispatchModel();
        $res = $dispatch->isPermissionsForDispatching($uid, $instruction_id);
        if ($res['code'] != 0) {
            $this->error($res['msg']);
        } else {
            if (I('post.')) {
                //替换理货员
                if (I('post.operator') != '') {
                    $operator = I('post.operator');
                } else {
                    $this->error('请选择一位理货员进行替换！');
                }
                if (I('post.reason') != '' and I('post.reason') != '请填写修改原因') {
                    $reason = I('post.reason');
                } else {
                    $this->error('修改原因不能为空！');
                }
                $ctn_id = I('post.ctn_id');
                $uid = I('post.operator');
                $operation_id = I('post.operation_id');
                $instruction_id = I('post.instruction_id');
                //指令ID、shift_id获取派工ID
                $where = "instruction_id='$instruction_id' and shift_id='" . $res['shift_id'] . "'";
                $dispatchid = $dispatch->where($where)->field('id')->find();
                //1:替换的理货员是否派工
                //获取原先派工的人员id列表
                $dispatchdetail = new \Common\Model\DispatchDetailModel();
                $uidlist = $dispatchdetail->getclerkidlist($dispatchid['id']);
                if (!in_array($uid, $uidlist)) {
                    $data = array(
                        'dispatch_id' => $dispatchid['id'],
                        'clerk_id' => $uid,
                        'dispatch_time' => date('Y-m-d H:i:s')
                    );
                    $res = $dispatchdetail->add($data);
                    if ($res == false) {
                        $this->error('添加派工详情失败！');
                    }
                }
                //修改指令配箱的理货员
                $data_a = array(
                    'operator_id' => $uid
                );
                //修改指令配箱的操作人
                $QbzxInstructionCtn = new \Common\Model\QbzxInstructionCtnModel();
                $res_a = $QbzxInstructionCtn->where("id = '$ctn_id'")->save($data_a);
                if ($res_a !== false) {
                    //修改作业表的操作人
                    $operation = new \Common\Model\QbzxOperationModel();
                    $res_b = $operation->where("id=$operation_id")->save($data_a);
                    if ($res_b !== false) {
                        //保存修改记录
                        $data_c = array(
                            'ctn_id' => $ctn_id,
                            'operator_id' => $uid,
                            'reason' => $reason,
                            'replace_time' => date('Y-m-d H:i:s'),
                            'business' => 'qbzx'
                        );
                        $res_i = D('replace_clerk_record')->add($data_c);
                        if ($res_i !== false) {
                            echo '<script>alert("替换理货员成功!");top.location.reload(true);window.close();</script>';
                            exit();
                        } else {
                            $this->error('保存修改记录操作失败！');
                        }
                    } else {
                        $this->error('修改作业表操作人失败！');
                    }
                } else {
                    $this->error('修改指令配箱操作人失败');
                }
            } else {
                $workerlist = $res['workerlist'];
                //得到作业ID
                $operation = new \Common\Model\QbzxOperationModel();
                $res_o = $operation->where("ctn_id='$ctn_id'")->field('id')->find();
                $operation_id = $res_o['id'];
                $this->assign('workerlist', $workerlist);
                $this->assign('instruction_id', $instruction_id);
                $this->assign('operation_id', $operation_id);
                $this->assign('ctn_id', $ctn_id);
                $this->display();
            }
        }
    }

    //修改铅封号
    public function editSealno($operation_id)
    {
        layout(false);
        $this->assign('operation_id', $operation_id);
        $uid = $_SESSION ['uid'];
        $where = array(
            'uid' => $uid
        );
        $userinfo = new \Common\Model\UserModel();
        $user = $userinfo->where($where)->find();
        //签到工班ID
        $shift_id = $user ['shift_id'];
        //判断用户是否为当班理货长
        $common = new \Common\Model\ShiftModel();
        $res_m = $common->isWorkMaster($uid, $shift_id);
        if ($res_m['code'] != 0) {
            $this->error('非当班理货长不得操作!');
        }
        $operation = new \Common\Model\QbzxOperationModel();
        $msg = $operation->where("id='$operation_id'")->find();
        $this->assign('sealno', $msg['sealno']);
        if (I('post.')) {
            if (I('post.sealno') and I('post.remark')) {
                $sealno = I('post.sealno');
                $remark = I('post.remark');
                //工作中，不允许修改
                $container = new \Common\Model\QbzxInstructionCtnModel();
                $ctn_id = $msg['ctn_id'];
                $res_c = $container->where("id='$ctn_id'")->find();
                if ($res_c ['status'] != 2) {
                    $this->error('工作中，不允许修改!');
                }
                //作业ID对应的箱ID
                $ctn_id = $res_c ['id'];

                // 作业状态为已交班，非部门长不允许修改
                $res_o = $operation->where("id=$operation_id")->find();
                if ($res_o ['per_no'] == 3) {
                    $u = $userinfo->where("uid=$uid")->find();
                    if ($u ['position'] == '理货长' || $u ['position'] == '理货员') {
                        $this->error('非部门长不允许修改!');
                    }
                }
                $seal = $res_o ['sealno'];
                if ($sealno != $seal) {
                    //修改铅封号
                    $data_s = array(
                        'sealno' => $sealno
                    );
                    $res_s = $operation->where("id=$operation_id")->save($data_s);
                    if ($res_s !== false) {
                        //保存修改记录
                        $data = array(
                            'business' => 'qbzx',
                            'category' => 'operation',
                            'operation_id' => $operation_id,
                            'info_id' => $operation_id,
                            'field_name' => 'sealno',
                            'field_old_value' => $seal,
                            'field_new_value' => $sealno,
                            'uid' => $uid,
                            'date' => date('Y-m-d H:i:s'),
                            'remark' => $remark
                        );
                        $amend = new \Common\Model\AmendModel();
                        if (!$amend->create($data)) {
                            //对data数据进行验证
                            $this->error($amend->getError());
                        } else {
                            //验证通过 可以对数据进行验证
                            $amend->add($data);
                        }
                    }
                }
                // 因对工作中的箱子不允许修改，所以修改的都是已铅封的箱子，所以需要删除原单证，重新生成单证
                // 根据箱id找出单证
                $prove = new \Common\Model\QbzxProveModel();
                $ctn_certify = $prove->where("ctn_id=$ctn_id")->find();
                // 将原单证备注保存
                $ccremark = $ctn_certify ['remark'];
                // 删除原单证
                $res_d = $prove->where("ctn_id=$ctn_id")->delete();
                if ($res_d !== false) {
                    // 重新生成单证
                    $prove->generateDocumentByQbzx($ctn_id, $ccremark);
                    echo '<script>alert("修改成功");top.location.reload(true);window.close();</script>';
                    exit ();
                } else {
                    $this->error('修改成功，重新生成单证失败！');
                }
            } else {
                $this->error('铅封号、修改原因不能为空！');
            }
        } else {
            $this->display();
        }
    }

    //修改关
    public function editlevel($operation_id, $level_id)
    {
        layout(false);
        $amend = new \Common\Model\AmendModel();
        $this->assign('operation_id', $operation_id);
        $this->assign('level_id', $level_id);

        //获取关残损照片
        $damageimg = new \Common\Model\QbzxLevelDamageImgModel();
        $level_damageimg_list = $damageimg->where("level_id='$level_id'")->select();
        $this->assign('damageimg', $level_damageimg_list);

        //根据关ID获取关照片
        $cargo_img = new \Common\Model\QbzxLevelCargoImgModel();
        $level_img_list = $cargo_img->where("level_id='$level_id'")->find();
        $this->assign('levelimg', $level_img_list);


        $uid = $_SESSION ['uid'];
        $where = array(
            'uid' => $uid
        );
        $user = new \Common\Model\UserModel();
        $user = $user->where($where)->find();
        $shift_id = $user ['shift_id'];
        // 如果是部门长，可以直接修改，否则需要判断是否为当班理货长
        $common = new \Common\Model\ShiftModel();
        if ($_SESSION ['u_group_id'] != '13') {
            //判断用户是否为当班理货长
            $res_m = $common->isWorkMaster($uid, $shift_id);
            if ($res_m['code'] != 0) {
                $this->error('非当班理货长不得操作!');
            }
        }
        //根据关ID获取关信息
        $level = new \Common\Model\QbzxOperationLevelModel();
        $msg = $level->getLevelMsg($level_id);
        $this->assign('msg', $msg);
        if (I('post.')) {
            if (I('post.remark')) {
                $remark = I('post.remark');
            } else {
                $this->error('修改原因不能为空！');
            }
            $cargo_number = I('post.cargo_number');
            $damage_num = I('post.damage_num');
            $billno = strtoupper(I('post.billno'));
            //工作中，不允许修改
            $operation = new \Common\Model\QbzxOperationModel();
            $res_c = $operation->where("id='$operation_id'")->find();

            //作业ID对应的箱ID
            $ctn_id = $res_c ['ctn_id'];

            // 作业状态为已交班，非部门长不允许修改
            if ($res_c ['per_no'] == '3') {
                $user = new \Common\Model\UserModel();
                $u = $user->where("uid='$uid'")->find();
                if ($u ['group_id'] != '13') {
                    $this->error('非部门长不允许修改!');
                }
            }
            $level = new \Common\Model\QbzxOperationLevelModel();
            $g = $level->where("id='$level_id'")->find();

            if ($g ['cargo_number'] != $cargo_number) {
                //修改关的货物件数
                $data_cn = array(
                    'cargo_number' => $cargo_number
                );
                $res_cn = $level->where("id=$level_id")->save($data_cn);
                if ($res_cn !== false) {
                    //保存修改记录
                    $data = array(
                        'business' => 'qbzx',
                        'category' => 'operation_level',
                        'operation_id' => $operation_id,
                        'info_id' => $level_id,
                        'field_name' => 'cargo_number',
                        'field_old_value' => $g ['cargo_number'],
                        'field_new_value' => $cargo_number,
                        'uid' => $uid,
                        'date' => date('Y-m-d H:i:s'),
                        'remark' => $remark
                    );
                    if (!$amend->create($data)) {
                        //对data数据进行验证
                        $this->error($amend->getError());
                    } else {
                        //验证通过 可以对数据进行操作
                        $amend->add($data);
                    }
                }
            }

            if ($g ['damage_num'] != $damage_num) {
                //修改关的残损件数
                $data_dn = array(
                    'damage_num' => $damage_num
                );
                if (!$level->create($data_dn)) {
                    //对数据进行验证
                    $this->error($level->getError());
                } else {
                    //验证通过 可以对数据进行操作
                    $res_dn = $level->where("id=$level_id")->save($data_dn);
                }
                if ($res_dn !== false) {
                    //保存修改记录
                    $data = array(
                        'business' => 'qbzx',
                        'category' => 'operation_level',
                        'operation_id' => $operation_id,
                        'info_id' => $level_id,
                        'field_name' => 'damage_num',
                        'field_old_value' => $g ['damage_num'],
                        'field_new_value' => $damage_num,
                        'uid' => $uid,
                        'date' => date('Y-m-d H:i:s', time()),
                        'remark' => $remark
                    );
                    if (!$amend->create($data)) {
                        //对data数据进行验证
                        $this->error($amend->getError());
                    } else {
                        //验证通过 可以对数据进行操作
                        $amend->add($data);
                    }
                }
            }

            if ($g ['billno'] != $billno) {
                //修改关的提单号
                $data_o = array(
                    'billno' => $billno
                );
                $res_o = $level->where("id=$level_id")->save($data_o);
                if ($res_o !== false) {
                    //保存修改记录
                    $data = array(
                        'business' => 'qbzx',
                        'category' => 'opration_level',
                        'operation_id' => $operation_id,
                        'info_id' => $level_id,
                        'field_name' => 'billno',
                        'field_old_value' => $g ['billno'],
                        'field_new_value' => $billno,
                        'uid' => $uid,
                        'date' => date('Y-m-d H:i:s', time()),
                        'remark' => $remark
                    );
                    if (!$amend->create($data)) {
                        //对data数据进行验证
                        $this->error($amend->getError());
                    } else {
                        //验证通过 可以对数据进行操作
                        $amend->add($data);
                    }
                }
            }
            $container = new \Common\Model\QbzxInstructionCtnModel();
            $ctnMsg = $container->where("id='$ctn_id'")->field('status')->find();
            $status = $ctnMsg['status'];
            if ($res_c['operation_examine'] != '2') {
                echo '<script>alert("修改成功");top.location.reload(true);window.close();</script>';
                exit ();
            } else {
                // 因对工作中的箱子不允许修改，所以修改的都是已铅封的箱子，所以需要删除原单证，重新生成单证
                // 根据箱id找出单证
                $prove = new \Common\Model\QbzxProveModel();
                $ctn_certify = $prove->where("ctn_id=$ctn_id")->find();
                // 将原单证备注保存
                $ccremark = $ctn_certify ['remark'];
                // 删除原单证
                $res_d = $prove->where("ctn_id=$ctn_id")->delete();
                if ($res_d !== false) {
                    // 重新生成单证
                    $document = new \Common\Model\QbzxProveModel();
                    $document->generateDocumentByQbzx($ctn_id, $ccremark);
                    echo '<script>alert("修改成功");top.location.reload(true);window.close();</script>';
                    exit ();
                } else {
                    $this->error('修改成功，重新生成单证失败！');
                }
            }
        } else {
            $this->display();
        }
    }

    //打包下载所有箱作业照片
    public function pack_img()
    {
        layout(false);
        $uid = $_SESSION['uid'];
        //检验用户是否是当班理货长
        $user = new \Common\Model\UserModel();
        $instruction_id = I('get.instruction_id');
        $res_is = $user->isPermissionsforexamine($uid, $instruction_id, $business = 'qbzx');
        if ($res_is['code'] != 0) {
            $this->error($res_is['msg']);
        }
        $operation_id = I('get.operation_id');
        $ctn_id = I('get.ctn_id');
        //根据箱ID获取指令ID
        $instructctn = new \Common\Model\QbzxInstructionCtnModel();
        $instruction_id = $instructctn->field('instruction_id,ctnno')->where(array('id' => $ctn_id))->find();
        if ($instruction_id) {
            //新建一个ZipArchive的对象
            $zip = new \ZipArchive();
            //设置.zip下载后的文件名
            $zname = $instruction_id['ctnno'] . '.zip';
            //创建临时文件夹保存图片
            $filename = $instruction_id['ctnno'] . '_' . $ctn_id;
            if (!is_dir($filename)) mkdir($filename); // 如果不存在则创建

            //获取铅封照片，办关门照片，全关门照片，空想照片(获取作业详情)
            $operation = new \Common\Model\QbzxOperationModel();
            $msg = $operation->getOperationMsg($ctn_id);
            //获取关详情
            $level = new \Common\Model\QbzxOperationLevelModel();
            $levelList = $level->getLevelList($operation_id);
            //开始操作.zip压缩包
            if ($zip->open($zname, \ZIPARCHIVE::CREATE) === TRUE) {
                //向.zip压缩包里添加文件
                //关照片，关残损照片
                if ($levelList != '') {
                    foreach ($levelList as $vo) {

                        //根据管ID获取关照片
                        $cargo_img = new \Common\Model\QbzxLevelCargoImgModel();
                        $level_id = $vo['id'];
                        $level_id_list = $cargo_img->where("level_id='$level_id'")->select();
                        foreach ($level_id_list as $k) {
                            $cargo_name = "./Public/upload/qbzx/cargo/" . $k['cargo_picture'];
                            copy($cargo_name, './' . $filename . '/' . $k['cargo_picture']);
                            $zip->addFile('./' . $filename . '/' . $k['cargo_picture']);
                        }
                        //获取关残损照片
                        $damageimg = new \Common\Model\QbzxLevelDamageImgModel();
                        $level_damageimg_list = $damageimg->where("level_id='$level_id'")->select();
                        foreach ($level_damageimg_list as $v) {
                            $cdamage_name = "./Public/upload/qbzx/cdamage/" . $v['damage_picture'];
                            copy($cdamage_name, './' . $filename . '/' . $v['damage_picture']);
                            $zip->addFile('./' . $filename . '/' . $v['damage_picture']);
                        }
                    }
                }
                //铅封照片，办关门照片，全关门照片，空想照片
                if ($msg != '') {
                    //空箱照片
                    foreach ($msg['empty_picture'] as $vo) {
                        $empty_pic = "./Public/upload/qbzx/empty/" . $vo['empty_picture'];
                        copy($empty_pic, './' . $filename . '/' . $vo['empty_picture']);
                        $zip->addFile('./' . $filename . '/' . $vo['empty_picture']);
                    }

                    //铅封照片
                    $seal_pic = "./Public/upload/qbzx/seal/" . $msg ['seal_picture'];
                    copy($seal_pic, './' . $filename . '/' . $msg ['seal_picture']);
                    $zip->addFile('./' . $filename . '/' . $msg ['seal_picture']);
                    //半关门
                    $halfclose_door_picture = "./Public/upload/qbzx/halfclosedoor/" . $msg ['halfclose_door_picture'];
                    copy($halfclose_door_picture, './' . $filename . '/' . $msg ['halfclose_door_picture']);
                    $zip->addFile('./' . $filename . '/' . $msg ['halfclose_door_picture']);
                    //全关门
                    $close_door_picture = "./Public/upload/qbzx/closedoor/" . $msg ['close_door_picture'];
                    copy($close_door_picture, './' . $filename . '/' . $msg ['close_door_picture']);
                    $zip->addFile('./' . $filename . '/' . $msg ['close_door_picture']);
                }
                //文件添加完，关闭ZipArchive的对象
                $zip->close();
                //清空（擦除）缓冲区并关闭输出缓冲
                ob_end_clean();
                //下载建好的.zip压缩包
                header("Content-Type: application/force-download");//告诉浏览器强制下载
                header("Content-Transfer-Encoding: binary");//声明一个下载的文件
                header('Content-Type: application/zip');//设置文件内容类型为zip
                header('Content-Disposition: attachment; filename=' . $zname);//声明文件名
                header('Content-Length: ' . filesize($zname));//声明文件大小
                error_reporting(0);
                //将欲下载的zip文件写入到输出缓冲
                readfile($zname);
                //将缓冲区的内容立即发送到浏览器，输出
                flush();
            }
            unlink('./' . $zname);
            delDirAndFile('./' . $filename);
        } else {
            $this->error('没有找到该指令');
        }
    }

    //箱子的作业内容审核通过
    public function operation_examine()
    {
        layout(false);
        $instruction_ctn = new \Common\Model\QbzxInstructionCtnModel();
        $operation = new \Common\Model\QbzxOperationModel();
        $uid = $_SESSION['uid'];
        //检验用户是否是当班理货长
        $user = new \Common\Model\UserModel();
        $instruction_id = I('get.instruction_id');
        $res_is = $user->isPermissionsforexamine($uid, $instruction_id, $business = 'qbzx');
        if ($res_is['code'] != 0) {
            $this->error($res_is['msg']);
        }
        //判断箱子是否铅封
        $ctn_id = I('get.ctn_id');
        $res = $instruction_ctn->field('status,instruction_id')->where("id='$ctn_id'")->find();

        if ($res['status'] != 2) {
            $this->error('该箱子尚未铅封！');
        } else {
            //铅封，申城单证，改变审核状态
            $operation_id = I('get.operation_id');
//			$remark = ''; //2019-5-21 读取opration表中记录的批注信息转存进单证表
            $remark = $operation->field('remark')->where("id='$operation_id'")->find();
            $prove = new \Common\Model\QbzxProveModel ();
            //判断箱子是否已经生成单证
            $count = $prove->where(array('ctn_id' => $ctn_id))->count();
            if ($count > 0) {
                $this->error('该箱已有单证！！');
            }
            $res_p = $prove->generateDocumentByQbzx($ctn_id, $remark);
            if ($res_p ['code'] == '0') {
                // 判断指令下的配箱是否都已经完成，都完成将指令状态改为完成
                $instruction_id = $res['instruction_id'];
                $no_container_num = $instruction_ctn->where("instruction_id='$instruction_id' and status not in(2,-1)")->count();
                if ($no_container_num == 0) {
                    // 修改指令状态为已完成
                    $data_i = array(
                        'status' => '2'
                    );
                    $instruction = new \Common\Model\QbzxInstructionModel ();
                    $instruction->where("id='$instruction_id'")->save($data_i);
                }
                // 修改箱作业为相应的审核通过状态
                $data_t = array(
                    'operation_examine' => I('get.operation_examine')
                );
                $operation->where("id='$operation_id'")->save($data_t);




                //得到客户的openid
                $openid_search_sql = "SELECT cus.customer_name,cus.wx_openid from __PREFIX__qbzx_instruction as ins left JOIN __PREFIX__qbzx_plan as plan on ins.plan_id=plan.id LEFT JOIN __PREFIX__customer as cus on cus.id=plan.entrust_company where ins.id=" . $instruction_id . ";";
                $customer_info = M()->query($openid_search_sql);
                $openid = $customer_info[0]['wx_openid'];
                //得到单证内容
                $proveMsg = $prove->where(array("ctn_id" => $ctn_id))->find();


                #todo 发送微信模板消息
                if ($openid != "") {
                    $data = array();
                    $data['ctnno'] = $proveMsg['ctnno'];
                    $data['ctn_type_code'] = $proveMsg['ctn_type_code'];;
                    $data['ctn_master'] = $proveMsg['ctn_master'];;
                    $data['ship_name'] = $proveMsg['ship_name'];;
                    $data['voyage'] = $proveMsg['voyage'];

                    vendor('WeChat.sendWxMsg');
                    $WxMsg = new \sendWxMsg($data, 1);
                    $result = $WxMsg->send($openid);

                    if ($result['error'] == 0) {
                        $this->success('审核成功,状态已成功通知到' . $customer_info[0]['customer_name'] . "客户绑定的微信");
                    } else {
                        $this->success('审核成功，但无法通知状态到' . $customer_info[0]['customer_name'] . "客户绑定的微信");
                    }
                } else {
                    $this->success('审核成功，' . $customer_info[0]['customer_name'] . "客户未绑定微信");
                }
            } else {
// 				$this->error('生成单证失败，审核操作失败');
                $this->error($res_p ['msg']);
            }
        }
    }

    //修改箱子详细信息
    public function editCtn($operation_id)
    {
        layout(false);
        $this->assign('operation_id', $operation_id);
        $uid = $_SESSION ['uid'];
        $where = array(
            'uid' => $uid
        );
        $userinfo = new \Common\Model\UserModel();
        $user = $userinfo->where($where)->find();
        //签到工班ID
        $shift_id = $user ['shift_id'];
        //判断用户是否为当班理货长
        $common = new \Common\Model\ShiftModel();
        $res_m = $common->isWorkMaster($uid, $shift_id);
        if ($res_m['code'] != 0) {
            $this->error('非当班理货长不得操作!');
        }

        //根据作业ID获取作业基本信息
        $operation = new \Common\Model\QbzxOperationModel();
        $msg = $operation->where("id='$operation_id'")->find();

        //根据作业ID获取空箱照片
        $empty = new \Common\Model\QbzxEmptyCtnImgModel();
        $empty_picture = $empty->where("operation_id='" . $operation_id . "'")->select();

        $this->assign('empty_picture', $empty_picture);

        $this->assign('msg', $msg);

        if (I('post.')) {
            if (I('post.remark')) {
                $remark = I('post.remark');
            } else {
                $this->error('修改原因不能为空！');
            }


            //工作中，不允许修改
            $container = new \Common\Model\QbzxInstructionCtnModel();
            $ctn_id = $msg['ctn_id'];
            $res_c = $container->where("id='$ctn_id'")->find();
            if ($res_c ['status'] != 2) {
                $this->error('工作中，不允许修改!');
            }
            //作业ID对应的箱ID
            $ctn_id = $res_c ['id'];

            // 作业状态为已交班，非部门长不允许修改
            $res_o = $operation->where("id=$operation_id")->find();
            if ($res_o ['per_no'] == 3) {
                $u = $userinfo->where("uid=$uid")->find();
                if ($u ['position'] == '理货长' || $u ['position'] == '理货员') {
                    $this->error('非部门长不允许修改!');
                }
            }

            if (I('post.sealno')) {
                $sealno = I('post.sealno');
                $seal = $res_o ['sealno'];
                if ($sealno != $seal) {
                    //修改铅封号
                    $data_s = array(
                        'sealno' => $sealno
                    );
                    $res_s = $operation->where("id=$operation_id")->save($data_s);
                    if ($res_s !== false) {
                        //保存修改记录
                        $data = array(
                            'business' => 'qbzx',
                            'category' => 'operation',
                            'operation_id' => $operation_id,
                            'info_id' => $operation_id,
                            'field_name' => 'sealno',
                            'field_old_value' => $seal,
                            'field_new_value' => $sealno,
                            'uid' => $uid,
                            'date' => date('Y-m-d H:i:s'),
                            'remark' => $remark
                        );
                        $amend = new \Common\Model\AmendModel();
                        if (!$amend->create($data)) {
                            //对data数据进行验证
                            $this->error($amend->getError());
                        } else {
                            //验证通过 可以对数据进行验证
                            $amend->add($data);
                        }
                    }
                }

            } else {
                $this->error('铅封号不能为空！');
            }


            if (I('post.empty_weight')) {
                $empty_weight_new = I('post.empty_weight');
                $empty_weight_old = $res_o ['empty_weight'];
                if ($empty_weight_new != $empty_weight_old) {
                    //修改铅封号
                    $data_s = array(
                        'empty_weight' => $empty_weight_new
                    );
                    $res_s = $operation->where("id=$operation_id")->save($data_s);
                    if ($res_s !== false) {
                        //保存修改记录
                        $data = array(
                            'business' => 'qbzx',
                            'category' => 'operation',
                            'operation_id' => $operation_id,
                            'info_id' => $operation_id,
                            'field_name' => 'empty_weight',
                            'field_old_value' => $empty_weight_old,
                            'field_new_value' => $empty_weight_new,
                            'uid' => $uid,
                            'date' => date('Y-m-d H:i:s'),
                            'remark' => $remark
                        );
                        $amend = new \Common\Model\AmendModel();
                        if (!$amend->create($data)) {
                            //对data数据进行验证
                            $this->error($amend->getError());
                        } else {
                            //验证通过 可以对数据进行验证
                            $amend->add($data);
                        }
                    }
                }

            } else {
                $this->error('空箱重量不能为空！');
            }

            if (I('post.cargo_weight')) {
                $cargo_weight_new = I('post.cargo_weight');
                $cargo_weight_old = $res_o ['cargo_weight'];
                if ($cargo_weight_new != $cargo_weight_old) {
                    //修改铅封号
                    $data_s = array(
                        'cargo_weight' => $cargo_weight_new
                    );
                    $res_s = $operation->where("id=$operation_id")->save($data_s);
                    if ($res_s !== false) {
                        //保存修改记录
                        $data = array(
                            'business' => 'qbzx',
                            'category' => 'operation',
                            'operation_id' => $operation_id,
                            'info_id' => $operation_id,
                            'field_name' => 'cargo_weight',
                            'field_old_value' => $cargo_weight_old,
                            'field_new_value' => $cargo_weight_new,
                            'uid' => $uid,
                            'date' => date('Y-m-d H:i:s'),
                            'remark' => $remark
                        );
                        $amend = new \Common\Model\AmendModel();
                        if (!$amend->create($data)) {
                            //对data数据进行验证
                            $this->error($amend->getError());
                        } else {
                            //验证通过 可以对数据进行验证
                            $amend->add($data);
                        }
                    }
                }

            } else {
                $this->error('货物重量不能为空！');
            }


            // 因对工作中的箱子不允许修改，所以修改的都是已铅封的箱子，所以需要删除原单证，重新生成单证
            // 根据箱id找出单证
            $prove = new \Common\Model\QbzxProveModel();
            $ctn_certify = $prove->where("ctn_id=$ctn_id")->find();
            // 将原单证备注保存
            $ccremark = $ctn_certify ['remark'];
            // 删除原单证
            $res_d = $prove->where("ctn_id=$ctn_id")->delete();
            if ($res_d !== false) {
                // 重新生成单证
                $prove->generateDocumentByQbzx($ctn_id, $ccremark);
                echo '<script>alert("修改成功");top.location.reload(true);window.close();</script>';
                exit ();
            } else {
                $this->error('修改成功，重新生成单证失败！');
            }

        } else {
            $this->display();
        }
    }


    //修改箱子照片，如半开门，全开门，铅封照片
    public function ctnImgUpload($operation_id, $type)
    {
        layout(false);
        $this->assign('operation_id', $operation_id);
        $uid = $_SESSION ['uid'];
        $where = array(
            'uid' => $uid
        );
        $userinfo = new \Common\Model\UserModel();
        $user = $userinfo->where($where)->find();
        //签到工班ID
        $shift_id = $user ['shift_id'];
        //判断用户是否为当班理货长
        $common = new \Common\Model\ShiftModel();
        $res_m = $common->isWorkMaster($uid, $shift_id);
        if ($res_m['code'] != 0) {
            exit(json_encode(array(
                'status' => 'no',
                'msg' => "非当班理货长不得操作"
            )));
        }

        //根据作业ID获取作业基本信息
        $operation = new \Common\Model\QbzxOperationModel();
        $msg = $operation->where("id='$operation_id'")->find();


        //工作中，不允许修改
        $container = new \Common\Model\QbzxInstructionCtnModel();
        $ctn_id = $msg['ctn_id'];
        $res_c = $container->where("id='$ctn_id'")->find();
        if ($res_c ['status'] != 2) {
            exit(json_encode(array(
                'status' => 'no',
                'msg' => "工作中，不准修改!"
            )));
        }

        // 作业状态为已交班，非部门长不允许修改
        $res_o = $operation->where("id=$operation_id")->find();
        if ($res_o ['per_no'] == 3) {
            $u = $userinfo->where("uid=$uid")->find();
            if ($u ['position'] == '理货长' || $u ['position'] == '理货员') {
                exit(json_encode(array(
                    'status' => 'no',
                    'msg' => "非部门长不允许修改"
                )));
            }
        }


        if (IS_AJAX) {
            Vendor('Nx.FileUpload');

            $file_upload = new \FileUpload();
            $files = $file_upload->getFiles();
            if ($type == "halfclose") {
                $path = "./Public/upload/qbzx/halfclosedoor";
                $res_s = $file_upload->uploadFile($files[0], $path);
                if ($res_s['mes'] != "上传成功") {
                    $res = array(
                        'status' => 'no',
                        'msg' => $res_s ['mes']
                    );
                } else {
                    //获取原来的照片地址，用于添加更改记录。
                    $halfclose_pic = $msg['halfclose_door_picture'];

                    //修改半开门图片
                    $data_s = array(
                        'halfclose_door_picture' => $res_s ['name']
                    );
                    $res_c = $operation->where("id=$operation_id")->save($data_s);
                    if ($res_c !== false) {
                        //保存修改记录
                        $data = array(
                            'business' => 'qbzx',
                            'category' => 'operation',
                            'operation_id' => $operation_id,
                            'info_id' => $operation_id,
                            'field_name' => 'halfclose_door_picture',
                            'field_old_value' => $halfclose_pic,
                            'field_new_value' => $res_s ['name'],
                            'uid' => $uid,
                            'date' => date('Y-m-d H:i:s'),
                        );
                        $amend = new \Common\Model\AmendModel();
                        if (!$amend->create($data)) {
                            //对data数据进行验证
                            exit(json_encode(array(
                                'status' => 'no',
                                'msg' => $amend->getError()
                            )));
                        } else {
                            //验证通过 可以对数据进行验证
                            $amend->add($data);
                        }
                    }
                    $res = array(
                        'status' => 'ok',
                        'url' => $res_s ['dest']
                    );

                }
            } elseif ($type == "close") {
                $path = "./Public/upload/qbzx/closedoor";
                $res_s = $file_upload->uploadFile($files[0], $path);
                if ($res_s['mes'] != "上传成功") {
                    $res = array(
                        'status' => 'no',
                        'msg' => $res_s ['mes']
                    );

                } else {
                    //获取原来的照片地址，用于添加更改记录。
                    $close_pic = $msg['close_door_picture'];

                    //修改全开门图片
                    $data_s = array(
                        'close_door_picture' => $res_s ['name']
                    );


                    $res_c = $operation->where("id=$operation_id")->save($data_s);
                    if ($res_c !== false) {
                        //保存修改记录
                        $data = array(
                            'business' => 'qbzx',
                            'category' => 'operation',
                            'operation_id' => $operation_id,
                            'info_id' => $operation_id,
                            'field_name' => 'close_door_picture',
                            'field_old_value' => $close_pic,
                            'field_new_value' => $res_s ['name'],
                            'uid' => $uid,
                            'date' => date('Y-m-d H:i:s'),
                        );
                        $amend = new \Common\Model\AmendModel();
                        if (!$amend->create($data)) {
                            //对data数据进行验证
                            exit(json_encode(array(
                                'status' => 'no',
                                'msg' => $amend->getError()
                            )));
                        } else {
                            //验证通过 可以对数据进行验证
                            $amend->add($data);
                        }
                    }
                    $res = array(
                        'status' => 'ok',
                        'url' => $res_s ['dest']
                    );
                }
            } elseif ($type == "seal") {
                $path = "./Public/upload/qbzx/seal";
                $res_s = $file_upload->uploadFile($files[0], $path);
                if ($res_s['mes'] != "上传成功") {
                    $res = array(
                        'status' => 'no',
                        'msg' => $res_s ['mes']
                    );
                } else {
                    //获取原来的照片地址，用于添加更改记录。
                    $seal_pic = $msg['seal_picture'];

                    //修改铅封号图片
                    $data_s = array(
                        'seal_picture' => $res_s ['name']
                    );
                    $res_c = $operation->where("id=$operation_id")->save($data_s);
                    if ($res_c !== false) {
                        //保存修改记录
                        $data = array(
                            'business' => 'qbzx',
                            'category' => 'operation',
                            'operation_id' => $operation_id,
                            'info_id' => $operation_id,
                            'field_name' => 'seal_picture',
                            'field_old_value' => $seal_pic,
                            'field_new_value' => $res_s ['name'],
                            'uid' => $uid,
                            'date' => date('Y-m-d H:i:s'),
                        );
                        $amend = new \Common\Model\AmendModel();
                        if (!$amend->create($data)) {
                            //对data数据进行验证
                            exit(json_encode(array(
                                'status' => 'no',
                                'msg' => $amend->getError()
                            )));
                        } else {
                            //验证通过 可以对数据进行验证
                            $amend->add($data);
                        }
                    }
                    $res = array(
                        'status' => 'ok',
                        'url' => $res_s ['dest']
                    );
                }
            } else {
                $res = array(
                    'status' => 'no',
                    'msg' => "错误的提交方式"
                );
            }


            echo json_encode($res);
        }
//        echo I('get.callback') . "(" . json_encode($res) . ")";//跨域json
    }


    //修改箱子对应的空箱照片，可能有多个
    public function emptyImgUpload($operation_id, $id)
    {
        layout(false);
        $this->assign('operation_id', $operation_id);
        $uid = $_SESSION ['uid'];
        $where = array(
            'uid' => $uid
        );
        $userinfo = new \Common\Model\UserModel();
        $user = $userinfo->where($where)->find();
        //签到工班ID
        $shift_id = $user ['shift_id'];
        //判断用户是否为当班理货长
        $common = new \Common\Model\ShiftModel();
        $res_m = $common->isWorkMaster($uid, $shift_id);
        if ($res_m['code'] != 0) {
            exit(json_encode(array(
                'status' => 'no',
                'msg' => '非当班理货长不得操作!'
            )));

        }

        //根据作业ID获取作业基本信息
        $operation = new \Common\Model\QbzxOperationModel();
        $msg = $operation->where("id='$operation_id'")->find();

        //根据作业ID获取空箱照片
        $empty = new \Common\Model\QbzxEmptyCtnImgModel();
        $empty_picture = $empty->where("id=" . $id . " and operation_id='" . $operation_id . "'")->select();


        //工作中，不允许修改
        $container = new \Common\Model\QbzxInstructionCtnModel();
        $ctn_id = $msg['ctn_id'];
        $res_c = $container->where("id='$ctn_id'")->find();
        if ($res_c ['status'] != 2) {
            exit(json_encode(array(
                'status' => 'no',
                'msg' => '工作中，不允许修改!'
            )));
        }

        // 作业状态为已交班，非部门长不允许修改
        $res_o = $operation->where("id=$operation_id")->find();
        if ($res_o ['per_no'] == 3) {
            $u = $userinfo->where("uid=$uid")->find();
            if ($u ['position'] == '理货长' || $u ['position'] == '理货员') {
                exit(json_encode(array(
                    'status' => 'no',
                    'msg' => '非部门长不允许修改!'
                )));
            }
        }


        if (IS_AJAX) {
            vendor('Nx.FileUpload');

            $file_upload = new \FileUpload();
            $files = $file_upload->getFiles();
            if (!empty($empty_picture)) {
                $path = "./Public/upload/qbzx/empty";
                $res_s = $file_upload->uploadFile($files[0], $path);
                if ($res_s['mes'] != "上传成功") {
                    $res = array(
                        'status' => 'no',
                        'msg' => $res_s ['mes']
                    );
                } else {
                    //获取原来的照片地址，用于添加更改记录。
                    $empty_pic = $empty_picture[0]['empty_picture'];

                    //修改空箱图片名
                    $data_s = array(
                        'empty_picture' => $res_s ['name']
                    );
                    $res_c = $empty->where("id=$id and operation_id=$operation_id")->save($data_s);

                    if ($res_c !== false) {
                        //保存修改记录
                        $data = array(
                            'business' => 'qbzx',
                            'category' => 'empty_ctn_img',
                            'operation_id' => $operation_id,
                            'info_id' => $id,
                            'field_name' => 'empty_picture',
                            'field_old_value' => $empty_pic,
                            'field_new_value' => $res_s ['name'],
                            'uid' => $uid,
                            'date' => date('Y-m-d H:i:s'),
                        );
                        $amend = new \Common\Model\AmendModel();
                        if (!$amend->create($data)) {
                            //对data数据进行验证
                            exit(json_encode(array(
                                'status' => 'no',
                                'msg' => $amend->getError()
                            )));
                        } else {
                            //验证通过 可以对数据进行验证
                            $amend->add($data);
                        }
                    }
                    $res = array(
                        'status' => 'ok',
                        'url' => $res_s ['dest']
                    );

                }
            } else {
                $res = array(
                    'status' => 'no',
                    'msg' => "需要更改的图片记录不存在"
                );
            }

            echo json_encode($res);
        }
//        echo I('get.callback') . "(" . json_encode($res) . ")";//跨域json
    }


    //修改关照片
    public function levelImgUpload($operation_id, $level_id)
    {
        layout(false);
        $uid = $_SESSION ['uid'];
        $where = array(
            'uid' => $uid
        );

        $userinfo = new \Common\Model\UserModel();
        $user = $userinfo->where($where)->find();
        //签到工班ID
        $shift_id = $user ['shift_id'];
        //判断用户是否为当班理货长
        $common = new \Common\Model\ShiftModel();
        $res_m = $common->isWorkMaster($uid, $shift_id);
        if ($res_m['code'] != 0) {
            exit(json_encode(array(
                'status' => 'no',
                'msg' => '非当班理货长不得操作!'
            )));
        }

        //根据作业ID获取作业基本信息
        $operation = new \Common\Model\QbzxOperationModel();
        $msg = $operation->where("id='$operation_id'")->find();

        //根据关ID获取关照片
        $cargo_img = new \Common\Model\QbzxLevelCargoImgModel();
        $level_img_list = $cargo_img->where("level_id='$level_id'")->find();

        //工作中，不允许修改
        $container = new \Common\Model\QbzxInstructionCtnModel();
        $ctn_id = $msg['ctn_id'];
        $res_c = $container->where("id='$ctn_id'")->find();
        if ($res_c ['status'] != 2) {
            exit(json_encode(array(
                'status' => 'no',
                'msg' => '工作中，不允许修改!'
            )));
        }

        // 作业状态为已交班，非部门长不允许修改
        $res_o = $operation->where("id=$operation_id")->find();
        if ($res_o ['per_no'] == 3) {
            $u = $userinfo->where("uid=$uid")->find();
            if ($u ['position'] == '理货长' || $u ['position'] == '理货员') {
                exit(json_encode(array(
                    'status' => 'no',
                    'msg' => '非部门长不允许修改!'
                )));
            }
        }

        if (IS_AJAX) {
            Vendor('Nx.FileUpload');

            $file_upload = new \FileUpload();
            $files = $file_upload->getFiles();
            $path = "./Public/upload/qbzx/cargo";
            $res_s = $file_upload->uploadFile($files[0], $path);
            if ($res_s['mes'] != "上传成功") {
                $res = array(
                    'status' => 'no',
                    'msg' => $res_s ['mes']
                );
            } else {
                //获取原来的照片地址，用于添加更改记录。
                $level_pic = $level_img_list['cargo_picture'];

                //修改关图片
                $data_s = array(
                    'cargo_picture' => $res_s ['name']
                );
                $res_c = $cargo_img->where("level_id='$level_id'")->save($data_s);
                if ($res_c !== false) {
                    //保存修改记录
                    $data = array(
                        'business' => 'qbzx',
                        'category' => 'level_cargo_img',
                        'operation_id' => $operation_id,
                        'info_id' => $level_id,
                        'field_name' => 'cargo_picture',
                        'field_old_value' => $level_pic,
                        'field_new_value' => $res_s ['name'],
                        'uid' => $uid,
                        'date' => date('Y-m-d H:i:s'),
                    );
                    $amend = new \Common\Model\AmendModel();
                    if (!$amend->create($data)) {
                        //对data数据进行验证
                        exit(json_encode(array(
                            'status' => 'no',
                            'msg' => $amend->getError()
                        )));
                    } else {
                        //验证通过 可以对数据进行验证
                        $amend->add($data);
                    }
                }
                $res = array(
                    'status' => 'ok',
                    'url' => $res_s ['dest']
                );
            }
            echo json_encode($res);
        } else {

            $this->display();
        }


//        echo I('get.callback') . "(" . json_encode($res) . ")";//跨域json
    }


    //修改关对应的残损照片，可能有多个
    public function damageImgUpload($operation_id, $level_id, $id)
    {
        layout(false);
        $this->assign('operation_id', $operation_id);
        $uid = $_SESSION ['uid'];
        $where = array(
            'uid' => $uid
        );
        $userinfo = new \Common\Model\UserModel();
        $user = $userinfo->where($where)->find();
        //签到工班ID
        $shift_id = $user ['shift_id'];
        //判断用户是否为当班理货长
        $common = new \Common\Model\ShiftModel();
        $res_m = $common->isWorkMaster($uid, $shift_id);
        if ($res_m['code'] != 0) {
            exit(json_encode(array(
                'status' => 'no',
                'msg' => '非当班理货长不得操作!'
            )));
        }
        //获取关残损照片
        $damageimg = new \Common\Model\QbzxLevelDamageImgModel();
        $level_damageimg_list = $damageimg->where("id='$id' and level_id='$level_id'")->find();

        //根据作业ID获取作业基本信息
        $operation = new \Common\Model\QbzxOperationModel();
        $msg = $operation->where("id='$operation_id'")->find();


        //工作中，不允许修改
        $container = new \Common\Model\QbzxInstructionCtnModel();
        $ctn_id = $msg['ctn_id'];
        $res_c = $container->where("id='$ctn_id'")->find();
        if ($res_c ['status'] != 2) {
            exit(json_encode(array(
                'status' => 'no',
                'msg' => '工作中，不允许修改!'
            )));
        }

        // 作业状态为已交班，非部门长不允许修改
        $res_o = $operation->where("id=$operation_id")->find();
        if ($res_o ['per_no'] == 3) {
            $u = $userinfo->where("uid=$uid")->find();
            if ($u ['position'] == '理货长' || $u ['position'] == '理货员') {
                exit(json_encode(array(
                    'status' => 'no',
                    'msg' => '非部门长不允许修改!'
                )));
            }
        }

        if (IS_AJAX) {
            vendor('Nx.FileUpload');
            $file_upload = new \FileUpload();
            $files = $file_upload->getFiles();
            if (!empty($level_damageimg_list)) {
                $path = "./Public/upload/qbzx/cdamage";
                $res_s = $file_upload->uploadFile($files[0], $path);
                if ($res_s['mes'] != "上传成功") {
                    $res = array(
                        'status' => 'no',
                        'msg' => $res_s ['mes']
                    );
                } else {
                    //获取原来的照片地址，用于添加更改记录。
                    $damage_pic = $level_damageimg_list['damage_picture'];

                    //修改空箱图片名
                    $data_s = array(
                        'damage_picture' => $res_s ['name']
                    );
                    $res_c = $damageimg->where("id=$id and level_id=$level_id")->save($data_s);

                    if ($res_c !== false) {
                        //保存修改记录
                        $data = array(
                            'business' => 'qbzx',
                            'category' => 'level_damage_img',
                            'operation_id' => $operation_id,
                            'info_id' => $id,
                            'field_name' => 'empty_picture',
                            'field_old_value' => $damage_pic,
                            'field_new_value' => $res_s ['name'],
                            'uid' => $uid,
                            'date' => date('Y-m-d H:i:s'),
                        );
                        $amend = new \Common\Model\AmendModel();
                        if (!$amend->create($data)) {
                            //对data数据进行验证
                            exit(json_encode(array(
                                'status' => 'no',
                                'msg' => $amend->getError()
                            )));
                        } else {
                            //验证通过 可以对数据进行验证
                            $amend->add($data);
                        }
                    }
                    $res = array(
                        'status' => 'ok',
                        'url' => $res_s ['dest']
                    );

                }
            } else {
                $res = array(
                    'status' => 'no',
                    'msg' => "需要更改的图片记录不存在"
                );
            }

            echo json_encode($res);
        }
//        echo I('get.callback') . "(" . json_encode($res) . ")";//跨域json
    }

}

?>
