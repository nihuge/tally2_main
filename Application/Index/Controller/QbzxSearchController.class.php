<?php
/**
 * 查询统计
 * 起驳装箱查询
 */

namespace Index\Controller;

use Index\Common\BaseController;

class QbzxSearchController extends BaseController
{
    // 实时作业查询
    public function RealTime()
    {
        \Common\Common\LogController::info(123);

        // 集装箱船列表
        $ship = new \Common\Model\ShipModel ();
        $ship_type = json_decode(ship_type, true);
        $shiplist = $ship->getShipList($ship_type ['container']);
        $this->assign('shiplist', $shiplist);
        // 作业场地
        $location = new \Common\Model\LocationModel ();
        $locationlist = $location->getLocationList();
        $this->assign('locationlist', $locationlist);
        // 港口信息
        $port = new \Common\Model\PortModel ();
        $portlist = $port->getPortList();
        $this->assign('portlist', $portlist);

        $where = "c.status in (1,2) and c.operator_id!='' and o.operation_examine in (1,3)";
        if (I('get.ship_name')) {
            $ship_name = I('get.ship_name');
            // 根据船名获取船ID
            $res_s = $ship->where("ship_name='$ship_name'")->field('id')->find();
            $ship_id = $res_s ['id'];
            $where .= " and p.ship_id='$ship_id'";
        }
        if (I('get.voyage')) {
            $voyage = I('get.voyage');
            $voyage = str_replace("'", " ", $voyage);
            $where .= " and p.voyage='$voyage'";
        }
        if (I('get.port')) {
            // 检验港口是否正确
            $port_name = I('get.port');
            $port_name = str_replace("'", " ", $port_name);
            // 根据港口名称获取港口ID
            $port_id = $port->where("name='$port_name'")->field('id')->find();
            $port_id = $port_id ['id'];
            $where .= " and pc.port_id='$port_id'";
        }
        if (I('get.location_name')) {
            $location_name = I('get.location_name');
            // 根据理货地点获取理货地点ID
            $res_l = $location->where("location_name='$location_name'")->field('id')->find();
            $location_id = $res_l ['id'];
            $where .= " and i.location_id='$location_id'";
        }
        if (I('get.billno')) {
            $billno = I('get.billno');
            $billno = str_replace("'", " ", $billno);
            $where .= " and pc.billno like '%$billno%'";
        }
        if (I('get.ctnno')) {
            $ctnno = I('get.ctnno');
            $ctnno = str_replace("'", " ", $ctnno);
            $where .= " and c.ctnno like '%$ctnno%'";
        }
        if (I('get.cstatus')) {
            $cstatus = I('get.cstatus');
            $where .= " and c.status='$cstatus'";
        }
        $sql = "select i.plan_id,pc.billno,po.name poname,c.*,u.user_name,p.voyage,s.ship_name,l.location_name
			from tally_qbzx_instruction_ctn c
			LEFT JOIN tally_qbzx_instruction i on i.id=c.instruction_id
			LEFT JOIN tally_location l on l.id=i.location_id
			LEFT JOIN tally_user u on u.uid =c.operator_id
			LEFT JOIN tally_qbzx_plan p on i.plan_id=p.id
			LEFT JOIN tally_qbzx_plan_cargo pc on pc.plan_id=p.id
			LEFT JOIN tally_ship s on p.ship_id=s.id
			LEFT JOIN tally_port po on pc.port_id=po.id
			LEFT JOIN tally_qbzx_operation o on o.ctn_id=c.id
			where $where GROUP BY c.id order by c.id desc";
        $list = M()->query($sql);
        $count = count($list);
        $per = 15;
        if ($_GET ['p']) {
            $p = $_GET ['p'];
        } else {
            $p = 1;
        }
        $Page = new \Think\Page ($count, $per); // 实例化分页类 传入总记录数和每页显示的记录数(25)
        $Page->rollPage = 10; // 分页栏每页显示的页数
        $Page->setConfig('header', '共%TOTAL_ROW%条');
        $Page->setConfig('first', '首页');
        $Page->setConfig('last', '共%TOTAL_PAGE%页');
        $Page->setConfig('prev', '上一页');
        $Page->setConfig('next', '下一页');
        $Page->setConfig('link', 'indexpagenumb'); // pagenumb 会替换成页码
        $Page->setConfig('theme', '%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% 第 ' . I('p', 1) . ' 页/共 %TOTAL_PAGE% 页 (<font color="red">' . $per . '</font> 条/页 共 %TOTAL_ROW% 条)');
        $show = $Page->show(); // 分页显示输出
        $this->assign('page', $show);

        $begin_num = ($p - 1) * $per;
        $sql = "select i.plan_id,pc.billno,po.name poname,c.*,u.user_name,p.voyage,s.ship_name,l.location_name,o.operation_examine,o.tmp_sealno
			from tally_qbzx_instruction_ctn c 
			LEFT JOIN tally_qbzx_instruction i on i.id=c.instruction_id 
			LEFT JOIN tally_location l on l.id=i.location_id
			LEFT JOIN tally_user u on u.uid =c.operator_id
			LEFT JOIN tally_qbzx_plan p on i.plan_id=p.id
			LEFT JOIN tally_qbzx_plan_cargo pc on pc.plan_id=p.id
			LEFT JOIN tally_ship s on p.ship_id=s.id
			left join tally_port po on pc.port_id=po.id
			LEFT JOIN tally_qbzx_operation o on o.ctn_id=c.id
			where  $where GROUP BY c.id order by c.id desc  limit $begin_num,$per";

        $list = M()->query($sql);
        // 遍历结果，取出其它数据
        $num = count($list);
        $level = new \Common\Model\QbzxOperationLevelModel ();
        for ($i = 0; $i < $num; $i++) {
            // 箱门下沉
            $str = substr(ltrim($list [$i] ['tmp_sealno']), 0, 4);
            if (strtolower($str) == 'xmxc') {
                $list [$i] ['tmp_sealno'] = "箱门下沉 " . substr(ltrim($list [$i] ['tmp_sealno']), 5);
            }
            $ctn_id = $list [$i] ['id'];
            $operation = new \Common\Model\QbzxOperationModel ();
            $res_o = $operation->where("ctn_id=$ctn_id")->find();
            if ($res_o ['id'] != '') {
                $operation_id = $res_o ['id'];
                $list [$i] ['begin_time'] = $res_o ['begin_time'];
                // 关数
                $levelnum = $level->sumLevelNum($operation_id);
                $list [$i] ['level_num'] = $levelnum;
                // 货物件数
                $cargonum = $level->sumCargoNum($operation_id);
                $list [$i] ['cargo_number'] = $cargonum;
                // 残损件数
                $damage_num = $level->sumDamageNum($operation_id);
                $list [$i] ['damage_num'] = $damage_num;
                // 最新操作时间
                $res_new = $level->where("operation_id=$operation_id")->field('createtime')->order("id desc")->find();
                if ($res_new ['createtime'] != '') {
                    $list [$i] ['newtime'] = $res_new ['createtime'];
                } else {
                    $list [$i] ['newtime'] = $res_o ['begin_time'];
                }
                $time1 = strtotime($list [$i] ['newtime']);
                $time2 = time();
                if (($time2 - $time1) / 300 > 1) {
                    $list [$i] ['red'] = 1;
                }
            }
        }
        $this->assign('list', $list);
        $this->display();
    }

    //实时作业详情
    public function RealTimeDetail($ctn_id)
    {
        // 传入图片路径常量
        $this->assign('IMAGE_QBZX_CARGO', IMAGE_QBZX_CARGO);
        $this->assign('IMAGE_QBZX_SEAL', IMAGE_QBZX_SEAL);
        $this->assign('IMAGE_QBZX_EMPTY', IMAGE_QBZX_EMPTY);
        $this->assign('IMAGE_QBZX_CDAMAGE', IMAGE_QBZX_CDAMAGE);
        // 根据箱ID获取箱详情
        $container = new \Common\Model\QbzxInstructionCtnModel ();
        $msg = $container->getContainerMsg($ctn_id);
        $this->assign('msg', $msg);
        if ($msg !== false) {
            $instruction_id = $msg ['instruction_id'];
            $sql = "select i.*,s.ship_name,p.voyage,l.location_name from __PREFIX__qbzx_instruction i,__PREFIX__location l,__PREFIX__ship s,__PREFIX__qbzx_plan p where i.id='$instruction_id' and l.id=i.location_id and s.id=p.ship_id and i.plan_id=p.id  order by i.id desc";
            $res_i = M()->query($sql);
            $instructionMsg = $res_i [0];
            $this->assign('instructionMsg', $instructionMsg);
        }
        // 根据箱ID获取作业详情
        $operation = new \Common\Model\QbzxOperationModel ();
        $operationMsg = $operation->getOperationMsg($ctn_id);

        $this->assign('operationMsg', $operationMsg);
        if ($operationMsg ['id'] != '') {
            $operation_id = $operationMsg ['id'];
            // 根据作业ID获取关列表
            $level = new \Common\Model\QbzxOperationLevelModel ();
            $levellist = $level->getLevelList($operation_id);
            $this->assign('levellist', $levellist);
        }
        $this->display();
    }

    //完成作业查询
    public function OperationFinish()
    {
        //集装箱船列表
        $shipModel = new \Common\Model\ShipModel();
        $ship_type = json_decode(ship_type, true);
        $shiplist = $shipModel->getShipList($ship_type['container']);
        $this->assign('shiplist', $shiplist);
        //作业场地
        $location = new \Common\Model\LocationModel();
        $locationlist = $location->getLocationList();
        $this->assign('locationlist', $locationlist);
        //获取箱型列表
        $container = new \Common\Model\ContainerModel();
        $containerlist = $container->getContainerList();
        $this->assign('containerlist', $containerlist);

        $where = '1';
        if (I('get.ship_name')) {
            $ship_name = I('get.ship_name');
            $ship_id = $shipModel->field('id')->where("ship_name='$ship_name'")->find();
            $where .= " and ship_id='" . $ship_id['id'] . "'";
        }
        if (I('get.location_name')) {
            $location_name = I('get.location_name');
            $location_id = $location->field('id')->where("location_name='$location_name'")->find();
            $where .= " and location_id='" . $location_id['id'] . "'";
        }
        if (I('get.voyage')) {
            $voyage = I('get.voyage');
            $voyage = str_replace("'", "", $voyage);
            $where .= " and voyage='$voyage'";
        }
        if (I('get.ctnno')) {
            $ctnno = I('get.ctnno');
            $ctnno = str_replace("'", "", $ctnno);
            $where .= " and ctnno='$ctnno'";
        }

        //马金虎修改,获取打印记录表单
        if (I('get.printed')) {
            $printed = I('get.printed');
            if (is_numeric($printed)) {
                $where .= " and printed=$printed";
            }
        }

        if (I('get.flflag')) {
            $flflag = I('get.flflag');
            $where .= " and flflag='$flflag'";
        }
        if (I('get.ctn_type_code')) {
            $ctn_type_code = I('get.ctn_type_code');
            $ctn_type_code = str_replace("'", "", $ctn_type_code);
            $where .= " and ctn_type_code='$ctn_type_code'";
        }
        if (I('get.begin_time') && I('get.end_time')) {
            $begin_time = I('get.begin_time');
            $end_time = I('get.end_time');
            $end_time = strtotime("$end_time +1 day");
            $end_time = date('Y-m-d', $end_time);
            $where .= " and createtime between '$begin_time' and '$end_time' ";
        }
        if (I('get.billno')) {
            $billno = I('get.billno');
            $billno = str_replace("'", "", $billno);
            $where .= " and content like '" . '%"billno":"' . $billno . '%\'';
        }

        $prove = new \Common\Model\QbzxProveModel();
        $count = $prove->where($where)->count();
        $per = 15;
        if ($_GET['p']) {
            $p = $_GET['p'];
        } else {
            $p = 1;
        }
        $Page = new \Think\Page($count, $per);// 实例化分页类 传入总记录数和每页显示的记录数(25)
        $Page->rollPage = 10; // 分页栏每页显示的页数
        $Page->setConfig('header', '共%TOTAL_ROW%条');
        $Page->setConfig('first', '首页');
        $Page->setConfig('last', '共%TOTAL_PAGE%页');
        $Page->setConfig('prev', '上一页');
        $Page->setConfig('next', '下一页');
        $Page->setConfig('link', 'indexpagenumb');//pagenumb 会替换成页码
        $Page->setConfig('theme', '%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% 第 ' . I('p', 1) . ' 页/共 %TOTAL_PAGE% 页 (<font color="red">' . $per . '</font> 条/页 共 %TOTAL_ROW% 条)');
        $show = $Page->show();// 分页显示输出
        $this->assign('page', $show);

        //$begin_num=($p-1)*$per;
        /*$sql="select p.* from __PREFIX__qbzx_prove p where $where and p.ship=s.shipInfoId and p.location=l.operationLocationInfoId order by p.id desc limit $begin_num,$per";
        $list=M()->query($sql);*/
        $list = $prove->where($where)->page($p . ',' . $per)->order('id desc')->select();

        $this->assign('list', $list);
        $this->display();
    }

    //完成作业详情
    public function OperationFinishDetail($ctn_id)
    {
        // 引入图片路径
        $this->assign('IMAGE_QBZX_SEAL', IMAGE_QBZX_SEAL); // 铅封照
        $this->assign('IMAGE_QBZX_EMPTY', IMAGE_QBZX_EMPTY); // 空箱照
        $this->assign('IMAGE_QBZX_CARGO', IMAGE_QBZX_CARGO); // 货物照
        $this->assign('IMAGE_QBZX_CDAMAGE', IMAGE_QBZX_CDAMAGE); // 货残损照
        $this->assign('IMAGE_QBZX_HALFCLOSEDOOR', IMAGE_QBZX_HALFCLOSEDOOR); // 半关门照
        $this->assign('IMAGE_QBZX_CLOSEDOOR', IMAGE_QBZX_CLOSEDOOR); // 全关门照
        // 根据箱ID获取单证详情
        $prove = new \Common\Model\QbzxProveModel ();
        $msg = $prove->getDocumentMsgByCtn($ctn_id);
        $this->assign('msg', $msg);
        // 根据箱ID获取作业详情
        $operation = new \Common\Model\QbzxOperationModel ();
        $operationMsg = $operation->getOperationMsgByCtn($ctn_id);
        $this->assign('operationMsg', $operationMsg);
        if ($operationMsg ['id'] != '') {
            $operation_id = $operationMsg ['id'];
            // 根据作业ID获取空箱照片
            $empty = new \Common\Model\QbzxEmptyCtnImgModel ();
            $emptylist = $empty->where("operation_id='$operation_id'")->select();
            $this->assign('emptylist', $emptylist);
            // 根据作业ID获取关列表
            $level = new \Common\Model\QbzxOperationLevelModel ();
            $levellist = $level->getLevelList($operation_id);
            $this->assign('levellist', $levellist);
            //修改记录-待做
            $user = new \Common\Model\UserModel();
            $amendlist = $user->getamend('qbzx', $operation_id);
            $this->assign('amendlist', $amendlist);
        }
        $this->display();
    }

    //分箱单证
    public function ProveByCtn()
    {
        //获取船舶列表
        $ship_type = json_decode(ship_type, true);
        $ship = new \Common\Model\ShipModel();
        $shiplist = $ship->getShipList($ship_type['container']);
        $this->assign('shiplist', $shiplist);
        //获取作业地点列表
        $location = new \Common\Model\LocationModel();
        $locationlist = $location->getLocationList();
        $this->assign('locationlist', $locationlist);

        $where = '1';
        if (I('get.ship_name')) {
            $ship_name = I('get.ship_name');
            $ship_id = $ship->field('id')->where("ship_name='$ship_name'")->find();
            $where .= " and ship_id='" . $ship_id['id'] . "'";
        }

        if (I('get.location_name')) {
            $location_name = I('get.location_name');
            $location_id = $location->field('id')->where("location_name='$location_name'")->find();
            $where .= " and location_id='" . $location_id['id'] . "'";
        }
        if (I('get.voyage')) {
            $voyage = I('get.voyage');
            $voyage = str_replace("'", "", $voyage);
            $where .= " and voyage='$voyage'";
        }
        if (I('get.ctnno')) {
            $ctnno = I('get.ctnno');
            $ctnno = str_replace("'", "", $ctnno);
            $where .= " and ctnno='$ctnno'";
        }
        if (I('get.flflag')) {
            $flflag = I('get.flflag');
            $where .= " and flflag='$flflag'";
        }
        if (I('begin_time') && I('end_time')) {
            $begin_time = I('get.begin_time');
            $end_time = I('get.end_time');
            $end_time = strtotime("$end_time +1 day");
            $end_time = date('Y-m-d', $end_time);
            $where .= " and createtime between '$begin_time' and '$end_time' ";
        }
        $prove = new \Common\Model\QbzxProveModel();
        //单证总数
        $count = $prove->where($where)->count();
        $per = 15;
        if ($_GET ['p']) {
            $p = $_GET ['p'];
        } else {
            $p = 1;
        }
        $Page = new \Think\Page ($count, $per); // 实例化分页类 传入总记录数和每页显示的记录数(25)
        $Page->rollPage = 10; // 分页栏每页显示的页数
        $Page->setConfig('header', '共%TOTAL_ROW%条');
        $Page->setConfig('first', '首页');
        $Page->setConfig('last', '共%TOTAL_PAGE%页');
        $Page->setConfig('prev', '上一页');
        $Page->setConfig('next', '下一页');
        $Page->setConfig('link', 'indexpagenumb'); // pagenumb 会替换成页码
        $Page->setConfig('theme', '%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% 第 ' . I('p', 1) . ' 页/共 %TOTAL_PAGE% 页 (<font color="red">' . $per . '</font> 条/页 共 %TOTAL_ROW% 条)');
        $show = $Page->show(); // 分页显示输出
        $this->assign('page', $show);

        $list = $prove->where($where)->page($p . ',' . $per)->order('id desc')->select();
        $this->assign('list', $list);
        $this->display();
    }

    //分箱单证详情
    public function ProveByCtnMsg($id)
    {
        $prove = new \Common\Model\QbzxProveModel();
        $msg = $prove->getDocumentMsg($id);
        $this->assign('msg', $msg);
        //根据箱ID获取关操作记录
        if ($msg['ctn_id'] != '') {
            $ctn_id = $msg['ctn_id'];
            //获取作业ID
            $operation = new \Common\Model\QbzxOperationModel();
            $res_o = $operation->getOperationMsgByCtn($ctn_id);
            if ($res_o['id'] != '') {
                $begin_time = $res_o['begin_time'];
                $this->assign('begin_time', $begin_time);
                $operation_id = $res_o['id'];
                $level = new \Common\Model\QbzxOperationLevelModel();
                $levellist = $level->getLevelList($operation_id);
                $this->assign('list', $levellist);
            }
        }
        $this->display();
    }

    //分票单证
    public function ProveByTicket()
    {
        //获取船舶列表
        $ship_type = json_decode(ship_type, true);
        $ship = new \Common\Model\ShipModel();
        $shiplist = $ship->getShipList($ship_type['container']);
        $this->assign('shiplist', $shiplist);
        //获取作业地点列表
        $location = new \Common\Model\LocationModel();
        $locationlist = $location->getLocationList();
        $this->assign('locationlist', $locationlist);

        //获取列表
        $instruction = new \Common\Model\QbzxInstructionModel();
        $where = '1';

        if (I('get.ship_name')) {
            $ship_name = I('get.ship_name');
            $ship_id = $ship->field('id')->where("ship_name='$ship_name'")->find();
            $where .= " and p.ship_id='" . $ship_id['id'] . "'";
        }

        if (I('get.location_name')) {
            $location_name = I('get.location_name');
            $location_id = $location->field('id')->where("location_name='$location_name'")->find();
            $where .= " and i.location_id='" . $location_id['id'] . "'";
        }
        if (I('get.voyage')) {
            $voyage = I('get.voyage');
            $voyage = str_replace("'", "", $voyage);
            $where .= " and p.voyage='$voyage'";
        }
        if (I('get.billno')) {
            $billno = I('get.billno');
            $billno = str_replace("'", "", $billno);
            $where .= " and c.billno='$billno'";
        }
        $sql = "select i.* from __PREFIX__qbzx_instruction i,__PREFIX__qbzx_plan_cargo c,__PREFIX__qbzx_plan p where i.plan_id=p.id and i.plan_id=c.plan_id  and $where";
        $list = M()->query($sql);
        $count = count($list);
        $per = 15;
        if ($_GET ['p']) {
            $p = $_GET ['p'];
        } else {
            $p = 1;
        }
        $begin_num = ($p - 1) * $per;
        $Page = new \Think\Page ($count, $per); // 实例化分页类 传入总记录数和每页显示的记录数(25)
        $Page->rollPage = 10; // 分页栏每页显示的页数
        $Page->setConfig('header', '共%TOTAL_ROW%条');
        $Page->setConfig('first', '首页');
        $Page->setConfig('last', '共%TOTAL_PAGE%页');
        $Page->setConfig('prev', '上一页');
        $Page->setConfig('next', '下一页');
        $Page->setConfig('link', 'indexpagenumb'); // pagenumb 会替换成页码
        $Page->setConfig('theme', '%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% 第 ' . I('p', 1) . ' 页/共 %TOTAL_PAGE% 页 (<font color="red">' . $per . '</font> 条/页 共 %TOTAL_ROW% 条)');
        $show = $Page->show(); // 分页显示输出
        $this->assign('page', $show);
        $sql = "select p.voyage,i.id,s.ship_name,l.location_name,c.billno from __PREFIX__qbzx_instruction i,__PREFIX__qbzx_plan_cargo c,__PREFIX__location l,__PREFIX__ship s,__PREFIX__qbzx_plan p where i.plan_id=c.plan_id and l.id=i.location_id and s.id=p.ship_id and i.plan_id=p.id and p.id=c.plan_id and $where order by i.id desc limit $begin_num,$per";
        $list = M()->query($sql);
        //$list = $instruction->where($where)->page($p.','.$per)->order('id desc')->select();

        $this->assign('list', $list);
        $this->display();
    }

    //分票单证详情
    public function ProveByTicketMsg($billno, $instruction_id)
    {
        //根据指令ID获取指令详情
        $sql = "select p.voyage,s.ship_name,l.location_name,c.billno from __PREFIX__qbzx_instruction i,__PREFIX__qbzx_plan_cargo c,__PREFIX__location l,__PREFIX__ship s,__PREFIX__qbzx_plan p where i.id='$instruction_id' and i.plan_id=c.plan_id and i.plan_id=p.id and l.id=i.location_id and s.id=p.ship_id order by i.id desc";
        $res_i = M()->query($sql);
        $instructionMsg = $res_i[0];
        $this->assign('instructionMsg', $instructionMsg);
        //根据提单号查找单证列表
        $prove = new \Common\Model\QbzxProveModel();
        $bl = '"billno":"' . $billno . '",';
        $list = $prove->where("content like '%$bl%'")->select();
        $this->assign('list', $list);
        //计算总箱数、总件数、总残损
        $sql = "select count(id) as total_ctn,sum(total_package) as total_num,sum(damage_num) as total_damage from __PREFIX__qbzx_prove where content like '%$bl%'";
        $res = M()->query($sql);
        $this->assign('total_ctn', $res[0]['total_ctn']);
        $this->assign('total_num', $res[0]['total_num']);
        $this->assign('total_damage', $res[0]['total_damage']);
        //批注
        foreach ($list as $l) {
            $remark .= $l['ctnno'] . ':' . $l ['remark'] . ';';
        }
        $this->assign('remark', $remark);
        //完成时间
        $num = count($list);
        $finished_time = $list[$num - 1]['createtime'];
        $this->assign('finished_time', $finished_time);
        // var_dump()
        $this->display();
    }

    //分驳船单证
    public function ProveByShip()
    {
        $ship = new \Common\Model\ShipModel();
        $ship_type = json_decode(ship_type, true);
        //驳船列表
        $shiplist = $ship->getShipList($ship_type['barge']);
        $this->assign('shiplist', $shiplist);
        //集装箱船列表
        $shiplist2 = $ship->getShipList($ship_type['container']);
        $this->assign('shiplist2', $shiplist2);

        $per = 15;
        if ($_GET['p']) {
            $p = $_GET['p'];
        } else {
            $p = 1;
        }
        $begin_num = ($p - 1) * $per;
        $prove = new \Common\Model\QbzxProveModel();
        if (I('get.ship_container') or I('get.ship_barge') or I('get.voyage')) {
            if (I('get.ship_barge')) {
                //检验船舶名称是否正确
                $shipname = I('get.ship_barge');
                $res_s = $ship->where("ship_name='$shipname'")->field('id')->find();
                if ($res_s['id'] == '') {
                    layout(false);
                    $this->error('船舶名称不存在！');
                } else {
                    $ship_id = $res_s['id'];
                    $like_s = '"ship_id":"' . $ship_id . '"';
                    $where = " barge_ship_content like '%$like_s%' ";
                    $this->assign('ship_id', $ship_id);
                }
            } else {
                layout(false);
                $this->error('驳船名称不能为空！');
            }
            if (I('get.ship_container')) {
                //检验船舶名称是否正确
                $ship_container = I('get.ship_container');
                $res_s = $ship->where("ship_name='$ship_container'")->field('id')->find();
                if ($res_s['id'] == '') {
                    layout(false);
                    $this->error('船舶名称不存在！');
                } else {
                    $containership_id = $res_s['id'];
                    $where .= "and ship_id='$containership_id'";
                }
            }
            if (I('get.voyage')) {
                $voyage = I('get.voyage');
                $voyage = str_replace("'", "", $voyage);
                $where .= " and voyage='$voyage'";
            }

            //单证列表
            // $ctnlist = $prove->where($where)->page($p.','.$per)->order('id desc')->select();
            /*$sql2="select p.* from __PREFIX__qbzx_prove p,shipinfo s,operationlocationinfo l where c.ship=s.shipInfoId and c.location=l.operationLocationInfoId $where order by c.id desc limit $begin,$per";
            $ctnlist=M('')->query($sql2);*/
            //总记录条数--用于计算分页
            $res = $prove->where("$where and barge_ship_content!='null'")->order('id desc')->select();
            $count = count($res);
        } else {
            //单证列表
            // $ctnlist = $prove->page($p.','.$per)->order('id desc')->select();
            $where = "1 and barge_ship_content!='null'";
            //总记录条数--用于计算分页
            $res = $prove->where("$where")->order('id desc')->select();
            $count = count($res);
        }

        $Page = new \Think\Page ($count, $per); // 实例化分页类 传入总记录数和每页显示的记录数(25)
        $Page->rollPage = 10; // 分页栏每页显示的页数
        $Page->setConfig('header', '共%TOTAL_ROW%条');
        $Page->setConfig('first', '首页');
        $Page->setConfig('last', '共%TOTAL_PAGE%页');
        $Page->setConfig('prev', '上一页');
        $Page->setConfig('next', '下一页');
        $Page->setConfig('link', 'indexpagenumb'); // pagenumb 会替换成页码
        $Page->setConfig('theme', '%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% 第 ' . I('p', 1) . ' 页/共 %TOTAL_PAGE% 页 (<font color="red">' . $per . '</font> 条/页 共 %TOTAL_ROW% 条)');
        $show = $Page->show(); // 分页显示输出
        $this->assign('page', $show);

        $ctnlist = $prove->where("$where")->page($begin_num . ',' . $per)->order('id desc')->select();

        $this->assign('ctnlist', $ctnlist);
        $this->display();
    }

    //分驳船单证详情
    public function ProveByShipMsg($ctn_id, $ship_id)
    {
        //根据单证ID查询单证详情
        $prove = new \Common\Model\QbzxProveModel();
        $res = $prove->where("ctn_id='$ctn_id'")->select();
        $ctn_content = $res[0];
        //驳船对应的总件数，总残损数
        $ship_content = json_decode($ctn_content['barge_ship_content'], true);
        foreach ($ship_content as $s) {
            if ($s['ship_id'] == $ship_id) {
                $ctn_content['cargo_unit'] = $s['cargo_unit'];
                $ctn_content['damage_unit'] = $s['damage_unit'];
            }
        }
        //驳船名称
        $ship = new \Common\Model\ShipModel();
        $res_s = $ship->getShipMsg($ship_id);
        $ctn_content['ship_name'] = $res_s['ship_name'];
        $this->assign('ctn_content', $ctn_content);
        //箱ID
        $container_id = $ctn_content['ctn_id'];
        //根据箱ID查询作业ID
        $sql = "select c.*,o.id from __PREFIX__qbzx_operation o,__PREFIX__qbzx_instruction_ctn c where c.id=o.ctn_id and c.id='$container_id' and c.status = '2'";
        $res_o = M()->query($sql);
        if ($res_o) {
            $operation_id = $res_o[0]['id'];
            //根据作业ID统计关信息
            //并且驳船ID和查询的驳船相同
            $sql2 = "select l.*,u.user_name,c.pack,c.mark from __PREFIX__qbzx_operation_level l,__PREFIX__user u,__PREFIX__qbzx_plan_cargo c where l.operation_id=$operation_id and l.ship_id=$ship_id and l.operator_id=u.uid and l.billno=c.billno";
            //作业关列表
            $list = M()->query($sql2);
            $this->assign('list', $list);
            //装箱作业开始时间
            $level = new \Common\Model\QbzxOperationLevelModel();
            $res_t = $level->where("operation_id=$operation_id")->field('createtime')->find();
            if ($res_t !== false) {
                $this->assign('begin_time', $res_t['createtime']);
            }
            $this->display();
        }
    }

    //完成作业查询批量打包照片
    public function pack_img()
    {
        layout(false);
        if (I('post.ctn_id')) {
            $ctn_id_list = $_POST['ctn_id'];
            //新建一个ZipArchive的对象
            $img_file = new \ZipArchive();
            //设置.zip下载后的文件名
            $zname1 = '起驳图片打包' . '.zip';
            if ($img_file->open($zname1, \ZIPARCHIVE::CREATE) === TRUE) {
                foreach ($ctn_id_list as $o) {
                    //根据箱ID获取指令ID
                    $instructctn = new \Common\Model\QbzxInstructionCtnModel();
                    $instruction_id = $instructctn->field('instruction_id,ctnno')->where("id='$o'")->find();
                    if ($instruction_id) {
                        // 新建一个ZipArchive的对象
                        $zip = new \ZipArchive();
                        //设置.zip下载后的文件名
                        $zname = $instruction_id['ctnno'] . "_" . $o . '.zip';
                        $filelist[] = $zname;
                        //获取铅封照片，办关门照片，全关门照片，空想照片(获取作业详情)
                        $operation = new \Common\Model\QbzxOperationModel();
                        $msg = $operation->getOperationMsg($o);

                        //获取关详情
                        $level = new \Common\Model\QbzxOperationLevelModel();
                        $levelList = $level->getLevelList($msg['id']);

                        //创建临时文件夹保存图片
                        $filename = $instruction_id['ctnno'] . "_" . $o;
                        if (!is_dir($filename)) mkdir($filename); // 如果不存在则创建

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
                            //$zip->addFromString("图片打包文件说明.txt", "cargo：关照片\r\ncdamage：关残损照片\r\nempty：空箱照片\r\nseal：铅封照片\r\nhalfclose_door_picture_a：半关门照片\r\nclose_door_picture_a：全关门照片");
                            //文件添加完，关闭ZipArchive的对象
                            $zip->close();
                            //清空（擦除）缓冲区并关闭输出缓冲
                            ob_end_clean();
                            $img_file->addFile('./' . $zname);
                        }
                        delDirAndFile('./' . $filename);
                    }
                }
                // 文件添加完，关闭ZipArchive的对象
                $img_file->close();
                //清空（擦除）缓冲区并关闭输出缓冲
                ob_end_clean();
                //下载建好的.zip压缩包
                header("Content-Type: application/force-download");//告诉浏览器强制下载
                header("Content-Transfer-Encoding: binary");//声明一个下载的文件
                header('Content-Type: application/zip');//设置文件内容类型为zip
                header('Content-Disposition: attachment; filename=' . $zname1);//声明文件名
                header('Content-Length: ' . filesize($zname1));//声明文件大小
                error_reporting(0);
                //将欲下载的zip文件写入到输出缓冲
                readfile($zname1);
                //将缓冲区的内容立即发送到浏览器，输出
                flush();
                foreach ($filelist as $k) {
                    unlink('./' . $k);
                }
                unlink('./' . $zname1);

            }
        } else {
            $this->error("未选择箱");
        }
    }


    //打印单证PDF
    public function print_pdf()
    {
        layout(false);
        if (I('post.ctn_id')) {
            $ctn_id_list = $_POST['ctn_id'];
            //引入类库
            Vendor('mpdf.mpdf');
            //设置中文编码
            $mpdf = new \mPDF('zh-cn', 'A4', 0, '宋体', 0, 0);
            //模板
            $html = <<<aac
<div style="text-align: center;"><h2>可交箱清单</h2></div>
<div style="text-align: center;">打印时间:{print_time}</div>
<div>
<div>
	<table width="90%" style="border-collapse: collapse; height: 56px; font-family: 宋体; font-size: 18px; position: relative; margin-left: 40px;">
		<tbody>
		<tr style="text-align:center;font-size:14px">
			<th style="border: 1px solid #ccc;">箱号</th>
			<th style="border: 1px solid #ccc;">提单号</th>
			<th style="border: 1px solid #ccc;">箱型尺寸</th>
			<th style="border: 1px solid #ccc;">铅封号</th>
			<th style="border: 1px solid #ccc;">票数</th>
			<th style="border: 1px solid #ccc;">件数</th>
			<th style="border: 1px solid #ccc;">重量</th>
			<th style="border: 1px solid #ccc;">残损</th>
			<th style="border: 1px solid #ccc;">完成时间</th>
		</tr>
		
			{document}
		</tbody>

	</table>
</div>
<div>
	
</div>
</div>
aac;

            //开始构成表

            $replace_html = "";
            $prove = new \Common\Model\QbzxProveModel();
            foreach ($ctn_id_list as $o) {
                if (is_numeric($o)) {
                    $msg = $prove->where("ctn_id='$o'")->select();
                    if (!empty($msg)) {
                        $replace_html .= "<tr style=\"height:32px;text-align:center;font-size:14px\">";


                        //放入箱号
                        $replace_html .= "<td style=\"border: 1px solid #ccc;font-weight: normal; text-align:center;font-size:14px;\">" . $msg[0]['ctnno'] . "</td>";

                        //放入提单号，可能多个
                        $billno = "";
                        $content = json_decode($msg[0]['content'], true);
                        foreach ($content as $b) {
                            $billno .= $b['billno'] . "<br/>";
                        }
                        $replace_html .= "<td style=\"border: 1px solid #ccc;font-weight: normal; text-align:center;font-size:14px;\">$billno</td>";

                        //放入箱型尺寸
                        $replace_html .= "<td style=\"border: 1px solid #ccc;font-weight: normal; text-align:center;font-size:14px;\">" . $msg[0]['ctn_type_code'] . "</td>";

                        //放入铅封号
                        $replace_html .= "<td style=\"border: 1px solid #ccc;font-weight: normal; text-align:center;font-size:14px;\">" . $msg[0]['sealno'] . "</td>";

                        //放入总票数
                        $replace_html .= "<td style=\"border: 1px solid #ccc;font-weight: normal; text-align:center;font-size:14px;\">" . $msg[0]['total_ticket'] . "</td>";

                        //放入总件数
                        $replace_html .= "<td style=\"border: 1px solid #ccc;font-weight: normal; text-align:center;font-size:14px;\">" . $msg[0]['total_package'] . "</td>";

                        //放入总重量
                        $replace_html .= "<td style=\"border: 1px solid #ccc;font-weight: normal; text-align:center;font-size:14px;\">" . $msg[0]['total_weight'] . "</td>";

                        //放入总残损
                        $replace_html .= "<td style=\"border: 1px solid #ccc;font-weight: normal; text-align:center;font-size:14px;\">" . $msg[0]['damage_num'] . "</td>";

                        //放入完成时间
                        $replace_html .= "<td style=\"border: 1px solid #ccc;font-weight: normal; text-align:center;font-size:14px;\">" . $msg[0]['createtime'] . "</td>";

                        $replace_html .= "</tr>";

                        $printed = array("printed" => 1);

                        $prove->where("ctn_id='$o'")->data($printed)->save();

                    } else {
                        $this->error("没有找到单证数据，请联系网站管理员");
                    }
                } else {
                    $this->error("请提交正确的数据");
                }

            }
            //获得打印时间
            $print_time = date('Y-m-d h:i:s', time());

            //时间放入模板
            $html = str_replace("{print_time}", $print_time, $html);
            //表放入pdf模板
            $html = str_replace("{document}", $replace_html, $html);
            //渲染过的页面放入pdf
            $mpdf->WriteHTML($html);
            //输出
            $mpdf->Output();


            //不需要后续处理，直接退出
            exit();
        } else {
            $this->error("未选择箱");
        }
    }


    //危险品查询
    public function DangerSearch()
    {
        //集装箱船列表
        $shipModel = new \Common\Model\ShipModel();
        $ship_type = json_decode(ship_type, true);
        $shiplist = $shipModel->getShipList($ship_type['container']);
        $this->assign('shiplist', $shiplist);
        //作业场地
        $location = new \Common\Model\LocationModel();
        $locationlist = $location->getLocationList();
        $this->assign('locationlist', $locationlist);
        //获取箱型列表
        $container = new \Common\Model\ContainerModel();
        $containerlist = $container->getContainerList();
        $this->assign('containerlist', $containerlist);

        $where = '1';
        if (I('get.ship_name')) {
            $ship_name = I('get.ship_name');
            $ship_id = $shipModel->field('id')->where("ship_name='$ship_name'")->find();
            $where .= " and ship_id='" . $ship_id['id'] . "'";
        }
        if (I('get.location_name')) {
            $location_name = I('get.location_name');
            $location_id = $location->field('id')->where("location_name='$location_name'")->find();
            $where .= " and location_id='" . $location_id['id'] . "'";
        }
        if (I('get.voyage')) {
            $voyage = I('get.voyage');
            $voyage = str_replace("'", "", $voyage);
            $where .= " and voyage='$voyage'";
        }
        if (I('get.ctnno')) {
            $ctnno = I('get.ctnno');
            $ctnno = str_replace("'", "", $ctnno);
            $where .= " and ctnno='$ctnno'";
        }

        if (I('get.printed')) {
            $printed = I('get.printed');
            if (is_numeric($printed)) {
                $where .= " and printed=$printed";
            }
        }

        //由于只统计危险品，所以就算没提交等级也不显示没有危险品等级的货物
        if (I('get.dangerlevel')) {
            $dangerlevel = I('get.dangerlevel');
            $dangerlevel = str_replace("'", "", $dangerlevel);
            $where .= " and dangerlevel='" . $dangerlevel . "'";
        } else {
            $where .= " and dangerlevel<>'' and dangerlevel<>'0'";
        }

        if (I('get.flflag')) {
            $flflag = I('get.flflag');
            $where .= " and flflag='$flflag'";
        }
        if (I('get.ctn_type_code')) {
            $ctn_type_code = I('get.ctn_type_code');
            $ctn_type_code = str_replace("'", "", $ctn_type_code);
            $where .= " and ctn_type_code='$ctn_type_code'";
        }
        if (I('get.begin_time') && I('get.end_time')) {
            $begin_time = I('get.begin_time');
            $end_time = I('get.end_time');
            $end_time = strtotime("$end_time +1 day");
            $end_time = date('Y-m-d', $end_time);
            $where .= " and createtime between '$begin_time' and '$end_time' ";
        }
        if (I('get.billno')) {
            $billno = I('get.billno');
            $billno = str_replace("'", "", $billno);
            $where .= " and content like '" . '%"billno":"' . $billno . '%\'';
        }

        $prove = new \Common\Model\QbzxProveModel();

        $cargo = new \Common\Model\QbzxPlanCargoModel();

        $count = $prove->where($where)->count();
        $per = 15;
        if ($_GET['p']) {
            $p = $_GET['p'];
        } else {
            $p = 1;
        }

        $Page = new \Think\Page($count, $per);// 实例化分页类 传入总记录数和每页显示的记录数(25)
        $Page->rollPage = 10; // 分页栏每页显示的页数
        $Page->setConfig('header', '共%TOTAL_ROW%条');
        $Page->setConfig('first', '首页');
        $Page->setConfig('last', '共%TOTAL_PAGE%页');
        $Page->setConfig('prev', '上一页');
        $Page->setConfig('next', '下一页');
        $Page->setConfig('link', 'indexpagenumb');//pagenumb 会替换成页码
        $Page->setConfig('theme', '%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% 第 ' . I('p', 1) . ' 页/共 %TOTAL_PAGE% 页 (<font color="red">' . $per . '</font> 条/页 共 %TOTAL_ROW% 条)');
        $show = $Page->show();// 分页显示输出
        $this->assign('page', $show);

        $list = $prove->where($where)->page($p . ',' . $per)->order('id desc')->select();
        $cargo_name_billno = "";
        $cargo_name = array();

        //将content内的json参数转换成数组，并且得出需要取出货物名的提货单号
        foreach ($list as $key => $l) {

            $list[$key]['content'] = json_decode($l['content'], true);

            //货物名只取当前箱号的第一个提单号对应的货物名，所以不循环取出所有的货物名。（如果客户需要看全部的，可以点击查看详情）这句划掉
            $cargo_name_billno .= "'" . $list[$key]['content'][0]['billno'] . "',";

        }


        //创建去预报货物表内查询货物名称的匹配参数
        if ($cargo_name_billno !== "") {
            $cargo_name_billno = rtrim($cargo_name_billno, ',');
            $cargo_name_result = $cargo->where("billno in(" . $cargo_name_billno . ")")->field('cargo_name,billno')->select();

            //开始将获得的数据转换成易取的数组格式
            foreach ($cargo_name_result as $cargo_name_value) {
                $cargo_name[$cargo_name_value['billno']] = $cargo_name_value['cargo_name'];
            }
        }

        $this->assign('list', $list);
        $this->assign('cargo_name', $cargo_name);
        $this->display();
    }


    //打印危险品报告PDF
    public function print_danger_pdf()
    {
        layout(false);
        if (I('post.ctn_id')) {
            $ctn_id_list = $_POST['ctn_id'];
            //引入类库
            Vendor('mpdf.mpdf');
            //设置中文编码
            $mpdf = new \mPDF('zh-cn', 'A4', 0, '黑体', 0, 0);
            //首页模板
            $index_html = <<<aaa
            <div style="text-align: center;top: 50px;left: 50%;margin:0px 0 0 -210px;position:absolute;">
            
            <p>
            <h1 style="font-size: 80px;">危险品监装</h1>
            </p>
            
            <p style="margin-top: 80px;">
            <h1 style="font-size: 60px">报告书</h1>
            </p>
               
            <p style="margin-top: 40px;">
            <img src="./Public/img/report_logo.png" width="200px" />
            </p>
            </div>
            <div style="left:0px; position:fixed; width:100%; height:100px; text-align:center; font-size:18px; font-weight:bold; bottom:0px;">
            <p>
            南&nbsp;&nbsp;京&nbsp;&nbsp;中&nbsp;&nbsp;理&nbsp;&nbsp;外&nbsp;&nbsp;轮&nbsp;&nbsp;理&nbsp;&nbsp;货&nbsp;&nbsp;有&nbsp;&nbsp;限&nbsp;&nbsp;公&nbsp;&nbsp;司
            </p>
            <p>
            CHINA&nbsp;&nbsp;OCEAN&nbsp;&nbsp;SHIPPING&nbsp;&nbsp;TALLY&nbsp;&nbsp;CO.,LTD.NANJING
            </p>
</div>
aaa;

            //单据模板
            $prove_html = <<<aab
            <div style="text-align: center;"><h1>装箱汇总</h1></div>
            <div>
            <div>
                <table width="90%" style="border-collapse: collapse; height: 56px; font-family: 宋体; font-size: 18px; position: relative; margin-left: 40px;">
                    <tbody>
                    <tr style="text-align:center;font-size:14px">
                        <th style="border: 1px solid #ccc;">提单号</th>
                        <th style="border: 1px solid #ccc;">箱号</th>
                        <th style="border: 1px solid #ccc;">箱型</th>
                        <th style="border: 1px solid #ccc;">箱主</th>
                        <th style="border: 1px solid #ccc;">货名</th>
                        <th style="border: 1px solid #ccc;">总件数</th>
                        <th style="border: 1px solid #ccc;">单位</th>
                        <th style="border: 1px solid #ccc;">危险品等级</th>
                        <th style="border: 1px solid #ccc;">备注</th>
                    </tr>
                    
                        {document}
                    
                    </tbody>
            
                </table>
            </div>
            <div>
                
            </div>
            </div>
aab;


            /*
             * 此段代码收集前期需要用到的数据
             */

            //开始构成汇总表页面
            $replace_html = "";

            //初始化序列箱id变量
            $ctn_id_str = "";

            //初始化提单号变量
            $billno_str = "";

            //初始化货物名称和委托单位名称数组
            $billno_name_array = array();

            //实例化单证类
            $prove = new \Common\Model\QbzxProveModel();

            //货物名称和客户名称的检索sql
            $name_sql = "SELECT cargo.cargo_name,cargo.billno,cus.customer_name FROM __PREFIX__qbzx_plan_cargo AS cargo LEFT JOIN __PREFIX__qbzx_plan AS plan ON cargo.plan_id=plan.id LEFT JOIN __PREFIX__customer as cus on plan.entrust_company=cus.id WHERE cargo.billno IN (#billno);";

            //序列化箱id,获得单证表数据
            foreach ($ctn_id_list as $o1) {
                if (is_numeric($o1)) {
                    $ctn_id_str .= $o1 . ',';
                } else {
                    $this->error("非法箱id");
                }
            }

            //获取去除多余的逗号，然后获取单证信息
            $ctn_id_str = rtrim($ctn_id_str, ',');
            $msg = $prove->where("ctn_id in(" . $ctn_id_str . ")")->select();

            //循环处理单证信息，然后获得所有提单号
            foreach ($msg as $msg_key => $msg_value) {
                $msg[$msg_key]['content'] = json_decode($msg_value['content'], true);
                foreach ($msg[$msg_key]['content'] as $content) {
                    $billno_str .= "'" . $content['billno'] . "',";
                }
            }


            //处理提单号，并且根据提单号获取信息
            $billno_str = rtrim($billno_str, ',');
            if ($billno_str == "") {
                $this->error('无法取到提单号');
            }
            $name_sql = str_replace("#billno", $billno_str, $name_sql);
            //搜索结果
            $billno_name_result = M()->query($name_sql);

            //序列化结果，将结果转为易读取的数组
            foreach ($billno_name_result as $billno_name_value) {
                //防止类型错误，判断是否为空，为空则初始化
                if (empty($billno_name_array[$billno_name_value['billno']])) {
                    $billno_name_array[$billno_name_value['billno']] = array();
                }
                $billno_name_array[$billno_name_value['billno']]['cargo_name'] = $billno_name_value['cargo_name'];
                $billno_name_array[$billno_name_value['billno']]['customer_name'] = $billno_name_value['customer_name'];
            }


            /*
             * 此段代码处理汇总页面的逻辑
             */

            foreach ($msg as $value) {
                //初始化货物名称变量值
//                $cargo_name_billno = "";

                $cargo_name = "";

                //初始化提单号变量值
                $billno = "";

                //初始化包装变量值
                $package = "";

                //构成提单号，单位和货物名称，可能多个
                foreach ($value['content'] as $b) {
                    //拼接提单号
                    $billno .= $b['billno'] . "<br/>";

                    //拼接单位
                    $package .= $b['package'] . "<br/>";

                    //拼接货物名称,此段utf-8编码，防止编码失败
                    $cargo_name .= mb_convert_encoding($billno_name_array[$b['billno']]['cargo_name'] . "<br/>", 'UTF-8', 'UTF-8');

                }


                $replace_html .= "<tr style=\"height:32px;text-align:center;font-size:14px\">";

                //放入提单号
                $replace_html .= "<td style=\"border: 1px solid #ccc;font-weight: normal; text-align:center;font-size:14px;\">$billno</td>";


                //放入箱号
                $replace_html .= "<td style=\"border: 1px solid #ccc;font-weight: normal; text-align:center;font-size:14px;\">" . $value['ctnno'] . "</td>";


                //放入箱型尺寸
                $replace_html .= "<td style=\"border: 1px solid #ccc;font-weight: normal; text-align:center;font-size:14px;\">" . $value['ctn_type_code'] . "</td>";

                //放入箱主
                $replace_html .= "<td style=\"border: 1px solid #ccc;font-weight: normal; text-align:center;font-size:14px;\">" . $value['ctn_master'] . "</td>";

                //放入货名
                $replace_html .= "<td style=\"border: 1px solid #ccc;font-weight: normal; text-align:center;font-size:14px;\">" . $cargo_name . "</td>";

                //放入总件数
                $replace_html .= "<td style=\"border: 1px solid #ccc;font-weight: normal; text-align:center;font-size:14px;\">" . $value['total_package'] . "</td>";

                //放入单位
                $replace_html .= "<td style=\"border: 1px solid #ccc;font-weight: normal; text-align:center;font-size:14px;\">" . $package . "</td>";

                //放入危险品等级
                $replace_html .= "<td style=\"border: 1px solid #ccc;font-weight: normal; text-align:center;font-size:14px;\">" . $value['dangerlevel'] . "</td>";

                //放入备注
                $replace_html .= "<td style=\"border: 1px solid #ccc;font-weight: normal; text-align:center;font-size:14px;\">" . $value['remark'] . "</td>";

                $replace_html .= "</tr>";

                //更新生成报告记录
//                        $prove->where("ctn_id='$o'")->data(array("printed" => 1))->save();
            }
            //表放入pdf模板
            $prove_html = str_replace("{document}", $replace_html, $prove_html);

            //强制转换编码，防止编译utf-8失败
//            $index_html = mb_convert_encoding($index_html, 'UTF-8', 'UTF-8');
//            $prove_html = mb_convert_encoding($prove_html, 'UTF-8', 'UTF-8');

            //首页放入pdf
            $mpdf->WriteHTML($index_html);
            //添加汇总页
            $mpdf->AddPage();
            //渲染过的汇总页面放入pdf
            $mpdf->WriteHTML($prove_html);


            /*
             * 构成详细汇报页面逻辑
             *
             */
            foreach ($msg as $value1) {

                //报告页模板
                $report_html = <<<aac
            <table width="80%" style="border-collapse: collapse; height: 56px; font-family: 宋体; font-size: 18px; position: relative; margin-left: 20px;text-align: center;">
                    <tbody>
                    <tr style="text-align:center;font-size:14px;height: 40px;">
                        <td style="border: 2px solid #000;width: 80px;">委托单位</td>
                        <td style="border: 2px solid #000">{customer_name}</td>
                        <td style="border: 2px solid #000">装箱地点</td>
                        <td style="border: 2px solid #000">{location_name}</td>
                    </tr>
                    <tr style="text-align:center;font-size:14px;height: 40px;">
                        <td style="border: 2px solid #000;width: 80px;">装箱日期</td>
                        <td style="border: 2px solid #000">{createtime}</td>
                        <td style="border: 2px solid #000">天气情况</td>
                        <td style="border: 2px solid #000">暂无</td>
                    </tr>
                    <tr style="text-align:center;font-size:14px;height: 40px;">
                        <td style="border: 2px solid #000;width: 80px;">箱号</td>
                        <td style="border: 2px solid #000">{ctnno}</td>
                        <td style="border: 2px solid #000">箱型</td>
                        <td style="border: 2px solid #000">{ctn_type_code}</td>
                    </tr>
                    <tr style="text-align:center;font-size:14px;height: 40px;">
                        <td style="border: 2px solid #000;width: 80px;">铅封号</td>
                        <td style="border: 2px solid #000">{sealno}</td>
                        <td style="border: 2px solid #000">总件数</td>
                        <td style="border: 2px solid #000">{total_package}</td>
                    </tr>
                    <tr style="text-align:center;font-size:14px;height: 40px;">
                        <td style="border: 2px solid #000;width: 80px;">监装人员</td>
                        <td style="border: 2px solid #000;text-align: left;" colspan="3">{operator_name}</td>
                    </tr>
                    <tr style="text-align:center;font-size:14px;height: 60px;">
                        <td style="border: 2px solid #000" colspan="4">装箱照片</td>
                    </tr>
                    <tr style="text-align:center;font-size:14px;height: 200px;">
                        <td style="border: 2px solid #000;width: 80px;">空箱</td>
                        <td style="border: 2px solid #000"><img src="{empty_pic}" height="200" width="280" /></td>
                        <td style="border: 2px solid #000;width: 80px;">半箱</td>
                        <td style="border: 2px solid #000"><img src="{level2}" height="200" width="280" /></td>
                    </tr>
                    <tr style="text-align:center;font-size:14px;height: 200px;">
                        <td style="border: 2px solid #000;width: 80px;">满箱全开门</td>
                        <td style="border: 2px solid #000"><img src="{level3}" height="200" width="280" /></td>
                        <td style="border: 2px solid #000;width: 80px;">满箱半开门</td>
                        <td style="border: 2px solid #000"><img src="{halfclose_door_picture}" height="200" width="280" /></td>
                    </tr>
                    <tr style="text-align:center;font-size:14px;height: 200px;">
                        <td style="border: 2px solid #000;width: 80px;">满箱全关门</td>
                        <td style="border: 2px solid #000"><img src="{close_door_picture}" height="200" width="280" /></td>
                        <td style="border: 2px solid #000;width: 80px;">铅封照</td>
                        <td style="border: 2px solid #000"><img src="{seal_pic}" height="200" width="280" /></td>
                    </tr>
                    <tr style="text-align:center;font-size:14px;height: 200px;">
                        <td style="border: 2px solid #000;width: 80px;">货物特写照</td>
                        <td style="border: 2px solid #000;"><img src="{level1}" height="200" width="280" /></td>
                        <td style="border: 2px solid #000;width: 80px;">货物特写照</td>
                        <td style="border: 2px solid #000"><img src="" height="200" width="280" /></td>
                    </tr>
                    </tbody>
                </table>
aac;

                //获得委托单位
                $customer = $billno_name_array[$value['content'][0]['billno']]['customer_name'];


                //获取铅封照片，半关门照片，全关门照片，空箱照片(获取作业详情)
                $operation = new \Common\Model\QbzxOperationModel();
                $operation_result = $operation->getOperationMsg($value1['ctn_id']);

                //获取第1,2,3关的照片详情
                $level_sql = "SELECT opl.level_num,lci.cargo_picture from tally_qbzx_operation_level as opl LEFT JOIN tally_qbzx_operation as op on op.id=opl.operation_id LEFT JOIN tally_qbzx_level_cargo_img as lci on lci.id=opl.id where op.ctn_id=" . $value1['ctn_id'] . ";";
                $level_result = M()->query($level_sql);

                //初始化关照片信息
                $level_array = array();

                //转换为易读数组
                if ($level_result != '') {
                    foreach ($level_result as $vo) {
                        $level_array[$vo['level_num']] = $vo['cargo_picture'];
                    }
                    if ($level_array[1] != '') {
                        $level1 = "./Public/upload/qbzx/cargo/" . $level_array[1];//特写照片路径（取第一关）
                    } else {
                        $level1 = "暂无照片";
                    }
                    if ($level_array[2] != '') {
                        $level2 = "./Public/upload/qbzx/cargo/" . $level_array[2];//半箱照片(取第二关)
                    } else {
                        $level2 = "暂无照片";
                    }
                    if ($level_array[3] != '') {
                        $level3 = "./Public/upload/qbzx/cargo/" . $level_array[3];//满箱全开照片(取第三关)
                    } else {
                        $level3 = "暂无照片";
                    }

                }

                //空箱照片，取第一个
                $empty_pic = "./Public/upload/qbzx/empty/" . $operation_result['empty_picture'][0]['empty_picture'];
                //铅封照片
                $seal_pic = "./Public/upload/qbzx/seal/" . $operation_result ['seal_picture'];
                //半关门
                $halfclose_door_picture = "./Public/upload/qbzx/halfclosedoor/" . $operation_result ['halfclose_door_picture'];
                //全关门
                $close_door_picture = "./Public/upload/qbzx/closedoor/" . $operation_result ['close_door_picture'];

                //放入委托单位
                $report_html = str_replace("{customer_name}", $customer, $report_html);
                //放入装箱地点
                $report_html = str_replace("{location_name}", $value1['location_name'], $report_html);
                //放入装箱日期
                $report_html = str_replace("{createtime}", $value1['createtime'], $report_html);
                //放入箱号
                $report_html = str_replace("{ctnno}", $value1['ctnno'], $report_html);
                //放入箱型
                $report_html = str_replace("{ctn_type_code}", $value1['ctn_type_code'], $report_html);
                //放入铅封号
                $report_html = str_replace("{sealno}", $value1['sealno'], $report_html);
                //放入总件数
                $report_html = str_replace("{total_package}", $value1['total_package'], $report_html);
                //放入监装人员名
                $report_html = str_replace("{operator_name}", $value1['operator_name'], $report_html);

                //放入空箱照片
                $report_html = str_replace("{empty_pic}", $empty_pic, $report_html);
                //放入半箱照片
                $report_html = str_replace("{level2}", $level2, $report_html);
                //放入满箱全开照片
                $report_html = str_replace("{level3}", $level3, $report_html);
                //放入满箱半开照片
                $report_html = str_replace("{halfclose_door_picture}", $halfclose_door_picture, $report_html);
                //放入满箱全关照片
                $report_html = str_replace("{close_door_picture}", $close_door_picture, $report_html);
                //放入铅封照
                $report_html = str_replace("{seal_pic}", $seal_pic, $report_html);
                //放入货物特写
                $report_html = str_replace("{level1}", $level1, $report_html);

                //加页并写入
                $mpdf->AddPage();
                $mpdf->WriteHTML($report_html);
            }

            //输出
            $mpdf->Output();

            //不需要后续处理，直接退出
            exit();
        } else {
            $this->error("未选择箱");
        }


    }

}