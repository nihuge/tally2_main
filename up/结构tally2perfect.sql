-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2017-09-08 08:59:33
-- 服务器版本： 5.6.26-log
-- PHP Version: 5.4.45

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tally2perfect`
--

-- --------------------------------------------------------

--
-- 表的结构 `tally_admin`
--

CREATE TABLE IF NOT EXISTS `tally_admin` (
  `uid` int(10) unsigned NOT NULL COMMENT 'auto_increment',
  `adminname` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `register_time` datetime NOT NULL,
  `register_ip` varchar(20) NOT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `last_login_ip` varchar(20) DEFAULT NULL,
  `login_num` int(10) unsigned DEFAULT NULL COMMENT '登陆次数',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1为正常，0为禁用',
  `group_id` int(10) unsigned NOT NULL COMMENT '组别'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tally_admin_group`
--

CREATE TABLE IF NOT EXISTS `tally_admin_group` (
  `id` mediumint(8) unsigned NOT NULL,
  `title` char(100) NOT NULL DEFAULT '',
  `introduce` varchar(300) DEFAULT NULL COMMENT '组别描述',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` varchar(255) NOT NULL DEFAULT '',
  `create_time` datetime NOT NULL COMMENT '创建时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tally_amend`
--

CREATE TABLE IF NOT EXISTS `tally_amend` (
  `id` int(11) unsigned NOT NULL,
  `business` varchar(10) DEFAULT NULL COMMENT '业务类型 qbzx起泊装箱',
  `category` varchar(100) DEFAULT NULL COMMENT '修改表名',
  `operation_id` int(11) DEFAULT NULL COMMENT '作业ID',
  `instruction_id` int(11) DEFAULT NULL COMMENT '指令ID',
  `field_name` varchar(20) DEFAULT NULL COMMENT '字段名称',
  `field_old_value` varchar(2000) DEFAULT NULL COMMENT '字段原值',
  `field_new_value` varchar(2000) DEFAULT NULL COMMENT '字段新值',
  `uid` int(11) DEFAULT NULL COMMENT '修改人ID',
  `date` datetime DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(2000) DEFAULT NULL COMMENT '修改原因'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tally_auth_rule`
--

CREATE TABLE IF NOT EXISTS `tally_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL,
  `name` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `condition` char(100) NOT NULL DEFAULT '',
  `pid` tinyint(5) NOT NULL DEFAULT '0' COMMENT '父级栏目ID',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` datetime NOT NULL COMMENT '创建时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tally_cargo_agent`
--

CREATE TABLE IF NOT EXISTS `tally_cargo_agent` (
  `id` int(10) NOT NULL,
  `code` varchar(20) NOT NULL COMMENT '货代代码',
  `name` varchar(50) NOT NULL COMMENT '货代中文名',
  `name_en` varchar(50) NOT NULL COMMENT '货代英文名',
  `contacter` varchar(20) DEFAULT NULL COMMENT '联系人',
  `telephone` varchar(50) DEFAULT NULL COMMENT '电话',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tally_cfs_cargo_damage_img`
--

CREATE TABLE IF NOT EXISTS `tally_cfs_cargo_damage_img` (
  `id` int(10) NOT NULL,
  `level_id` int(11) NOT NULL COMMENT '关id',
  `level_num` int(10) DEFAULT NULL COMMENT '第几关',
  `img` varchar(255) DEFAULT NULL COMMENT '箱残损照片'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tally_cfs_ctn_empty_img`
--

CREATE TABLE IF NOT EXISTS `tally_cfs_ctn_empty_img` (
  `id` int(11) NOT NULL COMMENT '空箱id',
  `empty_img` varchar(255) NOT NULL COMMENT '空箱照片',
  `operation_id` int(11) NOT NULL COMMENT '作业ID'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tally_cfs_ctn_overweight_reviewed`
--

CREATE TABLE IF NOT EXISTS `tally_cfs_ctn_overweight_reviewed` (
  `id` int(11) NOT NULL,
  `instruction_id` int(11) DEFAULT NULL COMMENT '指令ID',
  `ctn_id` int(11) DEFAULT NULL COMMENT '箱ID',
  `reason` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '通过的原因'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `tally_cfs_instruction`
--

CREATE TABLE IF NOT EXISTS `tally_cfs_instruction` (
  `id` int(11) unsigned NOT NULL COMMENT '自增主键',
  `ship_id` int(11) NOT NULL COMMENT '船Id',
  `voyage` varchar(17) NOT NULL COMMENT '航次',
  `operation_type` char(1) DEFAULT '0' COMMENT '装箱方式 0人工、1机械',
  `location_id` int(11) NOT NULL COMMENT '作业地点ID',
  `entrust_company` int(11) DEFAULT NULL COMMENT '委托单位ID',
  `department_id` int(10) NOT NULL COMMENT '所属部门组ID',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '指令状态，0.未派工、1.已派工、3.已完成',
  `date` date NOT NULL DEFAULT '0000-00-00' COMMENT '指令下达日期',
  `last_operator` int(11) DEFAULT NULL COMMENT '最后操作人',
  `last_operationtime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后操作时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tally_cfs_instruction_cargo`
--

CREATE TABLE IF NOT EXISTS `tally_cfs_instruction_cargo` (
  `id` int(11) unsigned NOT NULL COMMENT '自增主键',
  `blno` varchar(35) NOT NULL COMMENT '提单号',
  `crgno` varchar(35) DEFAULT NULL COMMENT '运输编号',
  `name` varchar(50) DEFAULT NULL COMMENT '货物名称',
  `number` int(11) DEFAULT NULL COMMENT '件数',
  `package` varchar(50) DEFAULT NULL COMMENT '包装',
  `mark` varchar(50) DEFAULT NULL COMMENT '标志',
  `totalweight` varchar(20) DEFAULT NULL COMMENT '总重量',
  `dangerlevel` varchar(20) DEFAULT NULL COMMENT '危险品等级',
  `totalvolume` varchar(20) DEFAULT NULL COMMENT '总体积',
  `po` varchar(20) DEFAULT NULL COMMENT 'PO号',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `instruction_id` int(11) NOT NULL COMMENT '指令id',
  `last_operator` int(11) NOT NULL COMMENT '最后操作人',
  `last_operationtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后操作时间',
  `port_id` int(11) DEFAULT NULL COMMENT '目的港ID'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tally_cfs_instruction_ctn`
--

CREATE TABLE IF NOT EXISTS `tally_cfs_instruction_ctn` (
  `id` int(11) unsigned NOT NULL COMMENT '自增主键',
  `ctnno` char(11) NOT NULL COMMENT '箱号',
  `ctn_size` varchar(10) DEFAULT NULL COMMENT '箱型尺寸',
  `ctn_master` int(11) DEFAULT NULL COMMENT '箱主 ID',
  `lcl` char(1) NOT NULL COMMENT '拼箱状态（提货方式），F整箱、L拼箱',
  `pre_number` int(11) DEFAULT NULL COMMENT '预配件数',
  `status` varchar(255) NOT NULL DEFAULT '0' COMMENT ' 0未开始 1工作中 2已铅封 -1箱残损 ',
  `operator_id` int(11) DEFAULT NULL COMMENT '理货员Id',
  `instruction_id` int(11) NOT NULL COMMENT '指令id',
  `overweight` varchar(2) NOT NULL DEFAULT 'N' COMMENT '是否允许超重  Y：允许超重  N：不允许超重',
  `load` varchar(100) DEFAULT NULL COMMENT '最大载重量'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tally_cfs_level_cargo_img`
--

CREATE TABLE IF NOT EXISTS `tally_cfs_level_cargo_img` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `level_id` int(11) NOT NULL COMMENT '关ID',
  `level_num` int(11) NOT NULL COMMENT '第几关（关序号）',
  `level_img` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '关照片'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `tally_cfs_operation`
--

CREATE TABLE IF NOT EXISTS `tally_cfs_operation` (
  `id` int(11) NOT NULL COMMENT '作业id',
  `ctn_id` int(11) NOT NULL COMMENT '箱id',
  `halfclose_door_picture` varchar(255) DEFAULT NULL,
  `close_door_picture` varchar(255) DEFAULT NULL,
  `empty_weight` varchar(20) DEFAULT NULL COMMENT '空箱重量',
  `sealno` varchar(20) DEFAULT NULL COMMENT '铅封号',
  `tmp_sealno` varchar(20) DEFAULT NULL,
  `seal_picture` varchar(255) DEFAULT NULL COMMENT '铅封照片',
  `cargo_weight` varchar(20) DEFAULT NULL COMMENT '货物重量',
  `step` char(1) NOT NULL DEFAULT '0' COMMENT '步骤 0未开始 1核对 2录关 3半关门 4关门 5铅封',
  `operator_id` int(11) NOT NULL COMMENT '操作人id',
  `begin_time` datetime DEFAULT NULL COMMENT '开始时间',
  `is_stop` char(1) DEFAULT 'N' COMMENT '是否暂停 Y是 N否',
  `is_reservation` char(1) DEFAULT 'N' COMMENT '是否预约 Y是N否',
  `laborteam_id` int(11) DEFAULT NULL COMMENT '劳务队ID',
  `operation_examine` int(1) NOT NULL DEFAULT '1' COMMENT '作业内容审核 1:未审核 2：审核通过3：审核未通过',
  `examine_remark` varchar(255) DEFAULT NULL COMMENT '审核不通过原因'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tally_cfs_operation_level`
--

CREATE TABLE IF NOT EXISTS `tally_cfs_operation_level` (
  `id` int(11) NOT NULL,
  `level_num` int(10) NOT NULL COMMENT '第几关',
  `level_img` varchar(255) DEFAULT NULL,
  `num` int(10) NOT NULL DEFAULT '0' COMMENT '货物件数',
  `damage_num` int(10) DEFAULT NULL COMMENT '残损件数',
  `blno` varchar(20) NOT NULL COMMENT '提单号',
  `operation_id` int(10) NOT NULL COMMENT '作业ID',
  `operator_id` int(10) NOT NULL COMMENT '理货员ID',
  `createtime` datetime NOT NULL COMMENT '操作时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tally_cfs_prove`
--

CREATE TABLE IF NOT EXISTS `tally_cfs_prove` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `ctn_id` int(11) NOT NULL COMMENT '箱ID',
  `ctnno` varchar(20) NOT NULL COMMENT '箱号',
  `ctn_type_code` varchar(10) DEFAULT NULL COMMENT '箱型尺寸',
  `ctn_master` varchar(20) DEFAULT NULL COMMENT '箱主',
  `ship_id` int(11) NOT NULL COMMENT '集装箱船ID',
  `ship_name` varchar(30) DEFAULT NULL COMMENT '船名',
  `voyage` varchar(20) NOT NULL COMMENT '航次',
  `total_ticket` int(11) NOT NULL COMMENT '总票数',
  `total_package` int(11) NOT NULL COMMENT '总件数',
  `flflag` char(1) NOT NULL COMMENT '整拼标志 F整箱  L拼箱',
  `loadingtype` char(1) NOT NULL COMMENT '装箱方式',
  `location_id` int(11) NOT NULL COMMENT '作业场地ID',
  `location_name` varchar(30) NOT NULL COMMENT '作业场地名称',
  `empty_weight` float(12,2) DEFAULT NULL COMMENT '空箱重量',
  `cargo_weight` float(12,2) DEFAULT NULL COMMENT '货物重量',
  `total_weight` float(12,2) NOT NULL COMMENT '总重量',
  `dangerlevel` varchar(100) NOT NULL COMMENT '危险品等级',
  `sealno` varchar(20) NOT NULL COMMENT '铅封号',
  `level_num` int(11) NOT NULL COMMENT '关数',
  `damage_num` int(11) DEFAULT NULL COMMENT '残损数量',
  `operator_id` int(11) NOT NULL COMMENT '操作人ID',
  `operator_name` varchar(30) NOT NULL COMMENT '操作人名称',
  `content` varchar(1000) NOT NULL COMMENT '内容 blno提单号 package 包装 mark 标志cargo_unit 货物数量damage_unit残损数量',
  `remark` varchar(1000) DEFAULT NULL COMMENT '备注',
  `consignee` varchar(20) DEFAULT NULL COMMENT '对接人',
  `createtime` datetime NOT NULL COMMENT '完成时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tally_cfs_supplement_picture`
--

CREATE TABLE IF NOT EXISTS `tally_cfs_supplement_picture` (
  `id` int(11) NOT NULL,
  `operation_id` int(11) NOT NULL COMMENT '作业ID',
  `supplement_picture` varchar(225) CHARACTER SET utf8 NOT NULL COMMENT '补充照片'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `tally_container`
--

CREATE TABLE IF NOT EXISTS `tally_container` (
  `id` int(11) NOT NULL COMMENT '箱ID',
  `ctn_type_code` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '箱型代码',
  `ctn_type` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '箱型',
  `ctn_size` int(11) DEFAULT NULL COMMENT '箱型尺寸',
  `operator` int(11) DEFAULT NULL COMMENT '最后操作人ID',
  `operationtime` datetime DEFAULT NULL COMMENT '最后操作时间'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `tally_container_master`
--

CREATE TABLE IF NOT EXISTS `tally_container_master` (
  `id` int(11) NOT NULL COMMENT '箱主ID',
  `ctn_master_code` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '箱主代码',
  `ctn_master` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '箱主名称',
  `operator` int(11) DEFAULT NULL COMMENT '最后操作人ID',
  `operationtime` datetime DEFAULT NULL COMMENT '最后操作时间'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `tally_customer`
--

CREATE TABLE IF NOT EXISTS `tally_customer` (
  `id` int(11) NOT NULL COMMENT '客户ID',
  `customer_code` varchar(10) CHARACTER SET utf8 NOT NULL COMMENT '客户代码',
  `customer_pwd` char(32) CHARACTER SET utf8 NOT NULL COMMENT '客户密码',
  `customer_name` varchar(60) CHARACTER SET utf8 DEFAULT NULL COMMENT '客户名称',
  `customer_shortname` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '客户简称',
  `customer_category` tinyint(1) NOT NULL COMMENT '客户类别 1代理 2货主 3港区 4其他',
  `paytype` tinyint(1) NOT NULL COMMENT '结算方法 1期结 2现结 3预付',
  `rate_id` int(10) DEFAULT NULL COMMENT '费率本ID',
  `linkman` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '联系人',
  `telephone` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '联系电话',
  `customer_status` char(1) CHARACTER SET utf8 DEFAULT NULL COMMENT '客户状态 Y正常 N冻结',
  `contract_number` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '合同编号',
  `contract_life` date DEFAULT NULL COMMENT '合同有效期',
  `operator` int(11) DEFAULT NULL COMMENT '最后操作人ID',
  `operationtime` datetime DEFAULT NULL COMMENT '最后操作时间',
  `authority` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '权限'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `tally_dd_cargo_damage_img`
--

CREATE TABLE IF NOT EXISTS `tally_dd_cargo_damage_img` (
  `id` int(20) unsigned NOT NULL,
  `level_id` int(20) unsigned NOT NULL COMMENT '关ID',
  `img` varchar(255) NOT NULL COMMENT '货残损照片',
  `level_num` int(20) NOT NULL COMMENT '关数'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='货残损照片表';

-- --------------------------------------------------------

--
-- 表的结构 `tally_dd_ctn_damage_after_img`
--

CREATE TABLE IF NOT EXISTS `tally_dd_ctn_damage_after_img` (
  `id` int(20) unsigned NOT NULL,
  `operation_id` int(11) NOT NULL COMMENT '作业ID',
  `img` varchar(255) NOT NULL COMMENT '箱残损图片'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='作业中造成的箱残损照片表';

-- --------------------------------------------------------

--
-- 表的结构 `tally_dd_ctn_damage_img`
--

CREATE TABLE IF NOT EXISTS `tally_dd_ctn_damage_img` (
  `id` int(20) unsigned NOT NULL,
  `operation_id` int(11) unsigned NOT NULL COMMENT '作业ID',
  `img` varchar(255) NOT NULL COMMENT '箱残损图片'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='作业箱残损照片表';

-- --------------------------------------------------------

--
-- 表的结构 `tally_dd_instruction`
--

CREATE TABLE IF NOT EXISTS `tally_dd_instruction` (
  `id` int(11) unsigned NOT NULL COMMENT '自增主键',
  `plan_id` int(10) NOT NULL COMMENT '预报计划ID',
  `department_id` int(10) DEFAULT NULL COMMENT '所属部门组ID',
  `date` date NOT NULL DEFAULT '0000-00-00' COMMENT '指令下达日期',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '指令状态 0未派工 1已派工 2已完成',
  `is_must` char(1) NOT NULL DEFAULT 'N' COMMENT '指令是否必须实际作业 Y是 N否'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tally_dd_level_cargo_img`
--

CREATE TABLE IF NOT EXISTS `tally_dd_level_cargo_img` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `level_id` int(11) NOT NULL COMMENT '关ID',
  `level_num` int(11) NOT NULL COMMENT '第几关（关序号）',
  `level_img` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '关照片'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `tally_dd_operation`
--

CREATE TABLE IF NOT EXISTS `tally_dd_operation` (
  `id` int(11) unsigned NOT NULL,
  `ctn_id` int(11) NOT NULL COMMENT '箱ID',
  `door_picture` varchar(255) DEFAULT NULL COMMENT '箱门照片',
  `seal_picture` varchar(255) DEFAULT NULL COMMENT '铅封照片',
  `damage_remark` varchar(200) DEFAULT NULL COMMENT '箱残损备注',
  `true_sealno` varchar(20) DEFAULT NULL COMMENT '实际铅封号',
  `cargo_picture` varchar(255) DEFAULT NULL COMMENT '整箱货物照片',
  `empty_picture` varchar(255) DEFAULT NULL COMMENT '空箱照片',
  `damage_after_remark` varchar(200) DEFAULT NULL COMMENT '作业中箱残损备注',
  `operator_id` int(10) NOT NULL COMMENT '操作理货员ID',
  `begin_time` datetime DEFAULT NULL COMMENT '开始时间',
  `is_stop` char(1) NOT NULL DEFAULT 'N' COMMENT '是否暂停 Y暂停 N正常',
  `tmp_sealno` varchar(20) DEFAULT NULL COMMENT '临时铅封号',
  `step` char(1) NOT NULL DEFAULT '0' COMMENT '工作步骤 0未开始 1拍完铅封照片 2已开门',
  `examine_remark` varchar(255) DEFAULT NULL COMMENT '审核不通过原因',
  `operation_examine` int(1) NOT NULL DEFAULT '1' COMMENT '作业内容审核 1:未审核 2：审核通过3：审核未通过'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='门到门拆箱作业表';

-- --------------------------------------------------------

--
-- 表的结构 `tally_dd_operation_level`
--

CREATE TABLE IF NOT EXISTS `tally_dd_operation_level` (
  `id` int(20) unsigned NOT NULL,
  `blno` varchar(20) DEFAULT NULL COMMENT '提单号',
  `operation_id` int(10) NOT NULL COMMENT '作业ID',
  `level_num` int(10) NOT NULL COMMENT '第几关',
  `num` int(10) NOT NULL COMMENT '货物件数',
  `damage_num` int(10) DEFAULT NULL COMMENT '残损件数',
  `operator_id` int(10) unsigned NOT NULL COMMENT '理货员ID',
  `createtime` datetime NOT NULL COMMENT '操作时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='作业关表';

-- --------------------------------------------------------

--
-- 表的结构 `tally_dd_plan`
--

CREATE TABLE IF NOT EXISTS `tally_dd_plan` (
  `id` int(11) unsigned NOT NULL COMMENT '自增主键',
  `business` varchar(10) DEFAULT NULL COMMENT '所属业务 dd门到门拆箱 cfsCFS装箱',
  `orderid` varchar(35) NOT NULL DEFAULT '' COMMENT '委托编号，港航社区系统业务编号',
  `orderdate` varchar(14) NOT NULL DEFAULT '' COMMENT '委托日期',
  `vslname` varchar(35) NOT NULL DEFAULT '' COMMENT '中文船名',
  `voyage` varchar(17) NOT NULL DEFAULT '' COMMENT '航次',
  `blno` varchar(35) NOT NULL DEFAULT '' COMMENT '提单号',
  `applycode` varchar(17) NOT NULL DEFAULT '' COMMENT '申报公司代码',
  `applyname` varchar(100) NOT NULL DEFAULT '' COMMENT '申报公司名称',
  `paycode` varchar(17) NOT NULL DEFAULT '' COMMENT '付费方代码',
  `payman` varchar(100) NOT NULL DEFAULT '' COMMENT '付费方名称',
  `amount` decimal(12,2) DEFAULT '0.00' COMMENT '金额',
  `paytype` char(1) DEFAULT '0' COMMENT '结算方式，0.线下结算、1.现结、2.月结',
  `cargoname` varchar(255) DEFAULT '' COMMENT '货物名称',
  `numbersofpackages` int(11) DEFAULT '0' COMMENT '件数',
  `package` varchar(50) DEFAULT NULL COMMENT '包装',
  `mark` varchar(50) DEFAULT NULL COMMENT '标志',
  `rcvflag` char(1) DEFAULT '' COMMENT '收款标识，1.已收、0.未收',
  `lcl` char(1) NOT NULL DEFAULT '' COMMENT '拼箱状态（提货方式），N整箱、Y拼箱',
  `consignee` varchar(30) DEFAULT '' COMMENT '收货人',
  `unpackagingplace` varchar(100) DEFAULT '' COMMENT '拆箱地点',
  `operating_type` char(1) DEFAULT '0' COMMENT '拆箱方式 0人工 1机械',
  `classes` varchar(5) DEFAULT '' COMMENT '危险品等级',
  `undgno` varchar(10) DEFAULT NULL COMMENT '联合国编号',
  `contactuser` varchar(30) DEFAULT '' COMMENT '联系人',
  `contact` varchar(30) DEFAULT '' COMMENT '联系方式',
  `note` varchar(100) DEFAULT '' COMMENT '备注',
  `transit` varchar(10) NOT NULL DEFAULT 'CY' COMMENT '运输条款',
  `category` char(1) NOT NULL DEFAULT '2' COMMENT '拆箱类别 1港内拆箱、2港外拆箱',
  `is_valid` char(1) NOT NULL DEFAULT 'N' COMMENT '是否有效 Y 有效 N无效',
  `getplantime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '接受指令时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tally_dd_plan_cargo`
--

CREATE TABLE IF NOT EXISTS `tally_dd_plan_cargo` (
  `id` int(10) NOT NULL,
  `plan_id` int(10) DEFAULT NULL COMMENT '预报计划ID',
  `paycode` varchar(17) CHARACTER SET utf8 DEFAULT NULL COMMENT '付费方代码',
  `payman` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '付费方名称',
  `blno` varchar(35) CHARACTER SET utf8 DEFAULT NULL COMMENT '提单号',
  `cargoname` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '货物名称',
  `numbersofpackages` int(11) DEFAULT '0' COMMENT '件数',
  `package` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '包装',
  `mark` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '标志',
  `consignee` varchar(30) CHARACTER SET utf8 DEFAULT '' COMMENT '收货人',
  `classes` varchar(5) CHARACTER SET utf8 DEFAULT '' COMMENT '危险品等级',
  `undgno` varchar(10) CHARACTER SET utf8 DEFAULT NULL COMMENT '联合国编号',
  `contactuser` varchar(30) CHARACTER SET utf8 DEFAULT '' COMMENT '联系人',
  `contact` varchar(30) CHARACTER SET utf8 DEFAULT '' COMMENT '联系方式',
  `last_operator` int(10) DEFAULT NULL COMMENT '最后操作人',
  `last_operationtime` datetime DEFAULT NULL COMMENT 'shijian'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `tally_dd_plan_container`
--

CREATE TABLE IF NOT EXISTS `tally_dd_plan_container` (
  `id` int(11) unsigned NOT NULL COMMENT '自增主键',
  `ctnno` varchar(12) NOT NULL DEFAULT '' COMMENT '箱号',
  `ctnsize` varchar(2) DEFAULT '' COMMENT '箱尺寸',
  `ctntype` varchar(2) DEFAULT '' COMMENT '箱型',
  `sealno` varchar(20) DEFAULT '' COMMENT '铅封号',
  `numbersofpackages` int(11) DEFAULT '0' COMMENT '件数',
  `weight` decimal(12,2) DEFAULT '0.00' COMMENT '重量',
  `volume` decimal(12,2) DEFAULT '0.00' COMMENT '体积',
  `flflag` char(1) NOT NULL DEFAULT '' COMMENT '集装箱状态，F整箱、L拼箱',
  `classes` varchar(5) DEFAULT '' COMMENT '危险品等级',
  `undgno` varchar(10) DEFAULT NULL COMMENT '联合国编号',
  `plan_id` int(11) NOT NULL COMMENT '预报计划ID',
  `status` varchar(2) NOT NULL DEFAULT '0' COMMENT '状态 0未开始 1工作中 2已完成 -1箱残损',
  `operator_id` int(11) DEFAULT NULL COMMENT '操作理货员ID'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tally_dd_prove`
--

CREATE TABLE IF NOT EXISTS `tally_dd_prove` (
  `id` int(11) unsigned NOT NULL,
  `ctn_id` int(11) unsigned NOT NULL COMMENT '箱ID',
  `ctn_no` varchar(20) NOT NULL COMMENT '箱号',
  `ctn_type_code` varchar(20) DEFAULT NULL COMMENT '箱型尺寸',
  `ctn_master` varchar(50) DEFAULT NULL COMMENT '箱主',
  `ship_id` int(11) unsigned NOT NULL COMMENT '集装箱船ID',
  `ship_name` varchar(150) DEFAULT NULL COMMENT '集装箱船名',
  `vargo` varchar(50) NOT NULL COMMENT '航次',
  `total_ticket` int(11) unsigned NOT NULL COMMENT '总票数',
  `total_package` int(11) unsigned NOT NULL COMMENT '总件数',
  `damaged_quantity` int(11) unsigned DEFAULT NULL COMMENT '残损数量',
  `level_num` int(11) unsigned NOT NULL COMMENT '关数',
  `flflag` char(1) DEFAULT NULL COMMENT '整拼标志 F整箱 L拼箱',
  `loadingtype` char(1) DEFAULT NULL COMMENT '拆箱方式 0人工 1机械',
  `location_id` int(11) unsigned NOT NULL COMMENT '作业场地ID',
  `location_name` varchar(50) NOT NULL COMMENT '作业场地名称',
  `empty_weight` float(12,2) DEFAULT '0.00' COMMENT '空箱重量',
  `cargo_weight` float(12,2) DEFAULT '0.00' COMMENT '货物重量',
  `total_weight` float(12,2) NOT NULL DEFAULT '0.00' COMMENT '总重量',
  `dangerlevel` varchar(100) DEFAULT NULL COMMENT '危险品等级',
  `sealno` varchar(20) DEFAULT NULL COMMENT '铅封号',
  `operator_id` int(11) unsigned NOT NULL COMMENT '理货员ID',
  `operator_name` varchar(20) NOT NULL COMMENT '理货员姓名',
  `content` varchar(1000) NOT NULL COMMENT '内容',
  `remark` varchar(1000) DEFAULT NULL COMMENT '备注',
  `consignee` varchar(20) DEFAULT NULL COMMENT '对接人',
  `createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tally_dd_supplement_picture`
--

CREATE TABLE IF NOT EXISTS `tally_dd_supplement_picture` (
  `id` int(11) NOT NULL,
  `operation_id` int(11) NOT NULL COMMENT '作业ID',
  `supplement_picture` varchar(225) CHARACTER SET utf8 NOT NULL COMMENT '补充照片'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `tally_department`
--

CREATE TABLE IF NOT EXISTS `tally_department` (
  `id` int(11) NOT NULL COMMENT '部门ID',
  `department_code` varchar(11) CHARACTER SET utf8 NOT NULL COMMENT '部门代码',
  `department_name` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '部门名称',
  `pid` int(11) DEFAULT NULL COMMENT '上级部门ID'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `tally_dispatch`
--

CREATE TABLE IF NOT EXISTS `tally_dispatch` (
  `id` int(11) NOT NULL,
  `chieftally` int(11) NOT NULL COMMENT '理货长ID',
  `shift_id` varchar(20) NOT NULL COMMENT '所属工班组ID',
  `instruction_id` int(11) NOT NULL COMMENT '指令ID',
  `business` varchar(10) NOT NULL COMMENT '所属业务 qbzx起泊装箱 dd门到门拆箱 cfsCFS装箱',
  `dispatch_time` timestamp NULL DEFAULT NULL COMMENT '派工时间',
  `mark` char(1) DEFAULT '0' COMMENT '交班标志 0未交班 1已交班'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tally_dispatch_detail`
--

CREATE TABLE IF NOT EXISTS `tally_dispatch_detail` (
  `id` int(11) NOT NULL,
  `dispatch_id` int(11) NOT NULL COMMENT '派工ID',
  `clerk_id` int(11) DEFAULT NULL COMMENT '理货员ID',
  `dispatch_time` timestamp NULL DEFAULT NULL COMMENT '派工日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tally_laborteam`
--

CREATE TABLE IF NOT EXISTS `tally_laborteam` (
  `id` int(10) NOT NULL,
  `labor_name` varchar(33) COLLATE utf8_bin NOT NULL COMMENT '劳务队名称',
  `creat_time` varchar(33) COLLATE utf8_bin DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 表的结构 `tally_location`
--

CREATE TABLE IF NOT EXISTS `tally_location` (
  `id` int(11) NOT NULL COMMENT '作业地点ID',
  `pid` int(11) DEFAULT NULL COMMENT '父级作业地点ID',
  `location_code` varchar(10) NOT NULL COMMENT '作业地点代码',
  `location_name` varchar(30) NOT NULL COMMENT '作业地点名称',
  `address` varchar(60) DEFAULT NULL COMMENT '详细地址',
  `linkman` varchar(20) DEFAULT NULL COMMENT '联系人',
  `telephone` varchar(100) DEFAULT NULL COMMENT '联系电话',
  `location_type` tinyint(2) DEFAULT NULL COMMENT '作业地点类型 1港内 2港内常驻 3港内非常驻',
  `comment` varchar(200) DEFAULT NULL COMMENT '备注',
  `operator` int(11) DEFAULT NULL COMMENT '最后操作人ID',
  `operationtime` datetime DEFAULT NULL COMMENT '最后操作时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tally_port`
--

CREATE TABLE IF NOT EXISTS `tally_port` (
  `id` int(10) unsigned NOT NULL,
  `code` varchar(20) NOT NULL COMMENT '港口代码',
  `name` varchar(50) NOT NULL COMMENT '中文港口名',
  `name_en` varchar(50) DEFAULT NULL COMMENT '英文港口名'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tally_qbzx_ctn_overweight_reviewed`
--

CREATE TABLE IF NOT EXISTS `tally_qbzx_ctn_overweight_reviewed` (
  `id` int(11) NOT NULL,
  `instruction_id` int(11) DEFAULT NULL COMMENT '指令ID',
  `ctn_id` int(11) DEFAULT NULL COMMENT '箱ID',
  `reason` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '通过的原因'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `tally_qbzx_empty_ctn_img`
--

CREATE TABLE IF NOT EXISTS `tally_qbzx_empty_ctn_img` (
  `id` int(11) NOT NULL COMMENT '空箱照片ID',
  `operation_id` int(11) NOT NULL COMMENT '作业ID',
  `empty_picture` varchar(255) NOT NULL COMMENT '空箱照片'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `tally_qbzx_instruction`
--

CREATE TABLE IF NOT EXISTS `tally_qbzx_instruction` (
  `id` int(11) NOT NULL COMMENT '指令ID',
  `plan_id` int(11) NOT NULL COMMENT '预报计划ID',
  `department_id` int(11) NOT NULL COMMENT '所属部门组ID',
  `location_id` int(11) NOT NULL COMMENT '作业地点ID',
  `loadingtype` char(1) CHARACTER SET utf8 DEFAULT NULL COMMENT '装箱方式 0人工 1机械',
  `ordertime` date NOT NULL COMMENT '指令下达日期',
  `status` char(1) CHARACTER SET utf8 NOT NULL DEFAULT '0' COMMENT '指令状态 0未派工 1已派工 2已完成',
  `last_operator` int(11) NOT NULL COMMENT '最后操作人ID',
  `last_operationtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后操作时间'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `tally_qbzx_instruction_ctn`
--

CREATE TABLE IF NOT EXISTS `tally_qbzx_instruction_ctn` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `instruction_id` int(11) NOT NULL COMMENT '指令ID',
  `ctnno` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '箱号',
  `ctn_type_code` varchar(10) CHARACTER SET utf8 DEFAULT NULL COMMENT '箱型尺寸',
  `ctn_master` int(11) DEFAULT NULL COMMENT '箱主ID',
  `status` varchar(2) CHARACTER SET utf8 DEFAULT NULL COMMENT '状态 0未开始 1工作中 2已铅封 3箱残损',
  `operator_id` int(11) DEFAULT NULL,
  `load` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `overweight` varchar(2) CHARACTER SET utf8 NOT NULL DEFAULT 'N' COMMENT '是否允许超重  Y：允许超重  N：不允许超重',
  `remark` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '允许超重原因'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `tally_qbzx_level_cargo_img`
--

CREATE TABLE IF NOT EXISTS `tally_qbzx_level_cargo_img` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `level_id` int(11) DEFAULT NULL COMMENT '关ID',
  `level_num` int(11) DEFAULT NULL COMMENT '第几关（关序号）',
  `cargo_picture` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '货物照片'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `tally_qbzx_level_damage_img`
--

CREATE TABLE IF NOT EXISTS `tally_qbzx_level_damage_img` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `level_id` int(11) NOT NULL COMMENT '关ID',
  `level_num` int(11) NOT NULL COMMENT '第几关（关序号）',
  `damage_picture` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '关残损照片'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `tally_qbzx_operation`
--

CREATE TABLE IF NOT EXISTS `tally_qbzx_operation` (
  `id` int(11) NOT NULL COMMENT '作业ID',
  `ctn_id` int(11) DEFAULT NULL COMMENT '箱ID',
  `empty_weight` int(11) DEFAULT NULL COMMENT '空箱重量',
  `halfclose_door_picture` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '半关门照片',
  `close_door_picture` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '全关门照片',
  `tmp_sealno` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '临时铅封号',
  `sealno` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '铅封号',
  `seal_picture` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '铅封照片',
  `cargo_weight` int(11) DEFAULT NULL COMMENT '货物重量',
  `operator_id` int(11) DEFAULT NULL COMMENT '操作人ID',
  `begin_time` datetime DEFAULT NULL COMMENT '开始时间（接单时间）',
  `is_stop` char(1) NOT NULL DEFAULT 'N' COMMENT '是否暂停 Y暂停 N正常',
  `is_reservation` char(1) NOT NULL DEFAULT 'N' COMMENT '是否预约 Y预约 N未预约',
  `step` char(1) NOT NULL DEFAULT '0' COMMENT '工作步骤 0初始化',
  `per_no` char(1) CHARACTER SET utf8 DEFAULT NULL COMMENT '权限 1工作中，只理货员自己可改 2已铅封，只理货长可改 3已交班，只部门长可修改',
  `laborteam_id` int(11) DEFAULT NULL COMMENT '劳务队ID',
  `operation_examine` int(1) NOT NULL DEFAULT '1' COMMENT '作业内容审核 1:未审核 2：审核通过3：审核未通过',
  `examine_remark` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '审核不通过原因'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `tally_qbzx_operation_level`
--

CREATE TABLE IF NOT EXISTS `tally_qbzx_operation_level` (
  `id` int(11) NOT NULL COMMENT '关ID',
  `operation_id` int(11) NOT NULL COMMENT '作业ID',
  `level_num` int(11) NOT NULL COMMENT '关数',
  `cargo_number` int(11) NOT NULL COMMENT '货物件数',
  `cargo_picture` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '关照片',
  `damage_num` int(11) DEFAULT NULL COMMENT '残损件数',
  `damage_explain` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '残损说明',
  `billno` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '提单号',
  `ship_id` int(11) DEFAULT NULL COMMENT '驳船ID',
  `location_id` int(11) DEFAULT NULL COMMENT '来源场地ID',
  `car` char(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '接车 Y是 N否',
  `comment` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  `operator_id` int(11) NOT NULL COMMENT '操作人ID',
  `createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '操作时间'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `tally_qbzx_plan`
--

CREATE TABLE IF NOT EXISTS `tally_qbzx_plan` (
  `id` int(11) NOT NULL COMMENT '预报计划ID',
  `entrustno` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '委托编号',
  `entrust_company` int(11) NOT NULL COMMENT '委托单位',
  `location_id` int(11) NOT NULL COMMENT '理货地点ID',
  `ship_id` int(11) NOT NULL COMMENT '船ID',
  `voyage` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '航次',
  `total_ctn` int(11) DEFAULT NULL COMMENT '总箱数',
  `total_ticket` int(11) NOT NULL COMMENT '总票数',
  `total_package` int(11) DEFAULT NULL COMMENT '总件数',
  `total_weight` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '总重量',
  `cargo_agent_id` int(11) NOT NULL COMMENT '货代ID',
  `packing_require` varchar(2000) CHARACTER SET utf8 DEFAULT NULL COMMENT '装箱要求',
  `entrust_time` date DEFAULT NULL COMMENT '委托时间',
  `last_operator` int(11) NOT NULL COMMENT '最后操作人ID',
  `last_operationtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后操作时间'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `tally_qbzx_plan_cargo`
--

CREATE TABLE IF NOT EXISTS `tally_qbzx_plan_cargo` (
  `id` int(11) NOT NULL COMMENT '货物ID',
  `plan_id` int(11) NOT NULL COMMENT '预报计划ID',
  `billno` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '提单号',
  `cargo_name` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '货物名称',
  `number` int(11) DEFAULT NULL COMMENT '件数',
  `pack` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '包装',
  `mark` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '标志',
  `total_weight` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '总重量',
  `dangerlevel` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '0' COMMENT '危险等级',
  `ship_id` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '驳船ID集合',
  `location_id` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源场地ID集合',
  `port_id` int(11) DEFAULT NULL COMMENT '目的港ID'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `tally_qbzx_plan_ctn`
--

CREATE TABLE IF NOT EXISTS `tally_qbzx_plan_ctn` (
  `id` int(11) NOT NULL COMMENT '箱ID',
  `plan_id` int(11) NOT NULL COMMENT '预报计划ID',
  `ctn_type_code` varchar(10) CHARACTER SET utf8 NOT NULL COMMENT '箱型尺寸',
  `quantity` int(11) NOT NULL COMMENT '箱子个数',
  `ctn_master` int(11) DEFAULT NULL COMMENT '箱主ID',
  `flflag` char(1) CHARACTER SET utf8 DEFAULT NULL COMMENT '整拼标志',
  `last_operator` int(11) NOT NULL COMMENT '最后操作人ID',
  `last_operationtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后操作时间'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `tally_qbzx_prove`
--

CREATE TABLE IF NOT EXISTS `tally_qbzx_prove` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `ctn_id` int(11) NOT NULL COMMENT '箱ID',
  `ctnno` varchar(20) NOT NULL COMMENT '箱号',
  `ctn_type_code` varchar(10) DEFAULT NULL COMMENT '箱型尺寸',
  `ctn_master` varchar(30) NOT NULL COMMENT '箱主',
  `ship_id` int(11) NOT NULL COMMENT '集装箱船ID',
  `ship_name` varchar(100) DEFAULT NULL COMMENT '船名',
  `voyage` varchar(20) NOT NULL COMMENT '航次',
  `total_ticket` int(11) NOT NULL COMMENT '总票数',
  `total_package` int(11) NOT NULL COMMENT '总件数',
  `flflag` char(1) NOT NULL COMMENT '整拼标志 F整箱 L拼箱',
  `loadingtype` char(1) NOT NULL COMMENT '装箱方式 0人工 1机械',
  `location_id` int(11) NOT NULL COMMENT '作业地点ID',
  `location_name` varchar(30) NOT NULL COMMENT '作业地点名',
  `empty_weight` float(12,2) NOT NULL COMMENT '空箱重量',
  `cargo_weight` float(12,2) NOT NULL COMMENT '货物重量',
  `total_weight` float(12,2) NOT NULL COMMENT '总重量',
  `dangerlevel` varchar(100) NOT NULL COMMENT '危险品等级',
  `sealno` varchar(20) DEFAULT NULL COMMENT '铅封号',
  `level_num` int(5) NOT NULL COMMENT '关数',
  `damage_num` int(5) DEFAULT NULL COMMENT '残损数',
  `barge_ship_content` varchar(3000) DEFAULT NULL COMMENT '驳船统计内容',
  `location_content` varchar(2000) DEFAULT NULL COMMENT '来源场地统计内容',
  `car_content` varchar(3000) DEFAULT NULL COMMENT '接车统计内容',
  `operator_id` int(11) NOT NULL COMMENT '操作人ID',
  `operator_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `content` varchar(5000) NOT NULL COMMENT '内容 billno提单号package 包装mark 标志cargo_unit 货物数量damage_unit残损数量',
  `remark` varchar(1000) DEFAULT NULL COMMENT '备注',
  `consignee` varchar(20) DEFAULT NULL COMMENT '对接人',
  `createtime` datetime NOT NULL COMMENT '完成时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tally_qbzx_supplement_picture`
--

CREATE TABLE IF NOT EXISTS `tally_qbzx_supplement_picture` (
  `id` int(11) NOT NULL,
  `operation_id` int(11) NOT NULL COMMENT '作业ID',
  `supplement_picture` varchar(225) CHARACTER SET utf8 NOT NULL COMMENT '补充照片'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `tally_rate`
--

CREATE TABLE IF NOT EXISTS `tally_rate` (
  `id` int(10) unsigned NOT NULL,
  `code` varchar(20) NOT NULL COMMENT '计费代码',
  `name` varchar(30) DEFAULT NULL COMMENT '费率名称',
  `discount` float DEFAULT '1' COMMENT '折扣率',
  `tax_rate` float DEFAULT NULL COMMENT '税率',
  `flag` char(255) NOT NULL DEFAULT 'Y' COMMENT '分档优惠标志 Y使用分档 N禁用',
  `first_amount` float(12,2) DEFAULT NULL COMMENT '一档金额',
  `first_rate` float DEFAULT '1' COMMENT '一档折扣率',
  `second_amount` float(12,2) DEFAULT NULL COMMENT '二档金额',
  `second_rate` float DEFAULT '1' COMMENT '二档折扣率',
  `third_amount` float(12,2) DEFAULT NULL COMMENT '三档金额',
  `third_rate` float DEFAULT '1' COMMENT '三档折扣率',
  `fourth_amount` float(12,2) DEFAULT NULL COMMENT '四档金额',
  `fourth_rate` float DEFAULT '1' COMMENT '四档折扣率',
  `fifth_amount` float(12,2) DEFAULT NULL COMMENT '五档金额',
  `fifth_rate` float DEFAULT '1' COMMENT '五档折扣率'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tally_rate_detail`
--

CREATE TABLE IF NOT EXISTS `tally_rate_detail` (
  `id` int(10) unsigned NOT NULL,
  `container_size` varchar(10) NOT NULL COMMENT '箱尺寸',
  `container_type` varchar(10) NOT NULL COMMENT '箱型',
  `full_rate` decimal(12,2) NOT NULL COMMENT '整箱费率',
  `mixed_rate` decimal(12,2) NOT NULL COMMENT '拼箱费率'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tally_replace_clerk_record`
--

CREATE TABLE IF NOT EXISTS `tally_replace_clerk_record` (
  `id` int(10) unsigned NOT NULL,
  `ctn_id` int(10) unsigned NOT NULL COMMENT '箱ID',
  `operator_id` int(10) unsigned NOT NULL COMMENT '操作人ID',
  `reason` varchar(200) NOT NULL COMMENT '修改原因',
  `replace_time` datetime NOT NULL COMMENT '替换时间',
  `business` varchar(10) NOT NULL COMMENT '业务系统 qbzx 起泊装箱 dd 门到门拆箱 cfs CFS装箱'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tally_replace_tallymaster_record`
--

CREATE TABLE IF NOT EXISTS `tally_replace_tallymaster_record` (
  `id` int(10) unsigned NOT NULL,
  `shift_id` varchar(30) NOT NULL COMMENT '工班ID',
  `operator_id` int(10) NOT NULL COMMENT '操作人ID',
  `reason` varchar(200) NOT NULL COMMENT '修改原因',
  `replace_time` datetime NOT NULL COMMENT '替换时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tally_shift`
--

CREATE TABLE IF NOT EXISTS `tally_shift` (
  `shift_id` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '工班ID',
  `shift_master` int(10) DEFAULT NULL COMMENT '当班理货长',
  `department_id` int(11) NOT NULL COMMENT '所属工班组',
  `classes` char(1) CHARACTER SET utf8 DEFAULT NULL COMMENT '班次 1白班 2夜班',
  `date` date DEFAULT NULL COMMENT '签到日期',
  `begin_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `mark` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '交班标志 0未交班 1已交班'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `tally_shift_amendment_record`
--

CREATE TABLE IF NOT EXISTS `tally_shift_amendment_record` (
  `id` int(10) unsigned NOT NULL,
  `shift_id` varchar(30) NOT NULL COMMENT '工班ID',
  `operator_id` int(10) NOT NULL COMMENT '操作人ID',
  `reason` varchar(200) NOT NULL COMMENT '修改原因',
  `resume_time` datetime NOT NULL COMMENT '恢复时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tally_shift_detail`
--

CREATE TABLE IF NOT EXISTS `tally_shift_detail` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `exchanged_id` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '交班工班ID',
  `user_exchanged_id` int(11) DEFAULT NULL COMMENT '交班人ID',
  `exchanged_time` datetime DEFAULT NULL COMMENT '交班时间',
  `carryon_id` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '接班工班ID',
  `user_carryon_id` int(11) DEFAULT NULL COMMENT '接班人ID',
  `carryon_time` datetime DEFAULT NULL COMMENT '接班时间',
  `note` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '交班信息'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `tally_ship`
--

CREATE TABLE IF NOT EXISTS `tally_ship` (
  `id` int(11) NOT NULL COMMENT '船舶ID',
  `ship_code` varchar(20) NOT NULL COMMENT '船舶代码',
  `ship_name` varchar(20) NOT NULL COMMENT '船舶名称',
  `ship_english_name` varchar(100) NOT NULL COMMENT '船舶英文名称',
  `ship_type` tinyint(2) DEFAULT NULL COMMENT '船舶类型 1集装箱船 2杂货船 3散货船 4滚装船 5油船 6木材船 7冷藏船 8危险品船 9货驳船',
  `nationality` varchar(20) DEFAULT NULL COMMENT '国籍',
  `linkman` varchar(20) DEFAULT NULL COMMENT '联系人',
  `telephone` varchar(30) DEFAULT NULL COMMENT '联系电话',
  `ship_route` tinyint(1) DEFAULT NULL COMMENT '航线 1内贸支线 2外贸干线 3外贸支线',
  `regular_ship` tinyint(1) DEFAULT NULL COMMENT '是否为班轮 1班轮 2非班轮',
  `warehouse_number` int(10) DEFAULT NULL COMMENT '仓数',
  `imo` varchar(100) DEFAULT NULL COMMENT 'IMO号',
  `agent_id` int(11) DEFAULT NULL COMMENT '船代ID',
  `operator` int(11) DEFAULT NULL COMMENT '最后操作人ID',
  `operationtime` datetime DEFAULT NULL COMMENT '最后操作时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tally_ship_agent`
--

CREATE TABLE IF NOT EXISTS `tally_ship_agent` (
  `id` int(10) unsigned NOT NULL,
  `code` varchar(20) NOT NULL COMMENT '船代代码',
  `name` varchar(50) NOT NULL COMMENT '船代中文名',
  `name_en` varchar(50) NOT NULL COMMENT '船代英文名',
  `enterprise_code` varchar(50) DEFAULT NULL COMMENT '企业代码',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `postcode` varchar(20) DEFAULT NULL COMMENT '邮编',
  `contacter` varchar(20) DEFAULT NULL COMMENT '联系人',
  `telephone` varchar(50) DEFAULT NULL COMMENT '电话',
  `fax` varchar(50) DEFAULT NULL COMMENT '传真',
  `telex` varchar(50) DEFAULT NULL COMMENT '电传',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tally_ship_schedule`
--

CREATE TABLE IF NOT EXISTS `tally_ship_schedule` (
  `id` int(10) unsigned NOT NULL,
  `ship_id` int(10) unsigned NOT NULL COMMENT '船ID',
  `voyage` varchar(50) NOT NULL COMMENT '航次',
  `sailing_date` date DEFAULT NULL COMMENT '开航日期',
  `arrival_date` date DEFAULT NULL COMMENT '到港日期',
  `loading_port` int(10) unsigned DEFAULT NULL COMMENT '起运港',
  `destination_port` int(10) unsigned DEFAULT NULL COMMENT '目的港',
  `uid` int(10) DEFAULT NULL COMMENT '录入人ID',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tally_user`
--

CREATE TABLE IF NOT EXISTS `tally_user` (
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `staffno` varchar(10) NOT NULL COMMENT '工号',
  `user_name` varchar(20) NOT NULL COMMENT '用户名',
  `user_pwd` char(32) NOT NULL COMMENT '密码',
  `department_id` char(4) DEFAULT '' COMMENT '部门ID',
  `position` varchar(20) DEFAULT '' COMMENT '职务',
  `group_id` char(4) DEFAULT '' COMMENT '用户组ID',
  `user_status` char(1) NOT NULL DEFAULT 'Y' COMMENT '用户状态 Y正常N冻结',
  `shift_id` varchar(20) DEFAULT NULL COMMENT '签到ID',
  `last_logintime` datetime DEFAULT NULL COMMENT '最后登录时间',
  `operator` varchar(30) DEFAULT '' COMMENT '操作人',
  `operationtime` datetime DEFAULT NULL COMMENT '操作时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- --------------------------------------------------------

--
-- 表的结构 `tally_user_auth_rule`
--

CREATE TABLE IF NOT EXISTS `tally_user_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL,
  `name` char(80) NOT NULL DEFAULT '' COMMENT '权限名称',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '中文名称',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `condition` char(100) NOT NULL DEFAULT '',
  `pid` int(10) NOT NULL DEFAULT '0' COMMENT '父级栏目ID',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` datetime NOT NULL COMMENT '创建时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tally_user_group`
--

CREATE TABLE IF NOT EXISTS `tally_user_group` (
  `id` int(11) NOT NULL,
  `title` varchar(20) DEFAULT NULL,
  `rules` varchar(1000) DEFAULT NULL,
  `status` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tally_admin`
--
ALTER TABLE `tally_admin`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `tally_admin_group`
--
ALTER TABLE `tally_admin_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_amend`
--
ALTER TABLE `tally_amend`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_auth_rule`
--
ALTER TABLE `tally_auth_rule`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `tally_cargo_agent`
--
ALTER TABLE `tally_cargo_agent`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_cfs_cargo_damage_img`
--
ALTER TABLE `tally_cfs_cargo_damage_img`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_cfs_ctn_empty_img`
--
ALTER TABLE `tally_cfs_ctn_empty_img`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_cfs_ctn_overweight_reviewed`
--
ALTER TABLE `tally_cfs_ctn_overweight_reviewed`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_cfs_instruction`
--
ALTER TABLE `tally_cfs_instruction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_cfs_instruction_cargo`
--
ALTER TABLE `tally_cfs_instruction_cargo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_cfs_instruction_ctn`
--
ALTER TABLE `tally_cfs_instruction_ctn`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_cfs_level_cargo_img`
--
ALTER TABLE `tally_cfs_level_cargo_img`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_cfs_operation`
--
ALTER TABLE `tally_cfs_operation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_cfs_operation_level`
--
ALTER TABLE `tally_cfs_operation_level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_cfs_prove`
--
ALTER TABLE `tally_cfs_prove`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_cfs_supplement_picture`
--
ALTER TABLE `tally_cfs_supplement_picture`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_container`
--
ALTER TABLE `tally_container`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_container_master`
--
ALTER TABLE `tally_container_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_customer`
--
ALTER TABLE `tally_customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_dd_cargo_damage_img`
--
ALTER TABLE `tally_dd_cargo_damage_img`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_dd_ctn_damage_after_img`
--
ALTER TABLE `tally_dd_ctn_damage_after_img`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_dd_ctn_damage_img`
--
ALTER TABLE `tally_dd_ctn_damage_img`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_dd_instruction`
--
ALTER TABLE `tally_dd_instruction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_dd_level_cargo_img`
--
ALTER TABLE `tally_dd_level_cargo_img`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_dd_operation`
--
ALTER TABLE `tally_dd_operation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_dd_operation_level`
--
ALTER TABLE `tally_dd_operation_level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_dd_plan`
--
ALTER TABLE `tally_dd_plan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_dd_plan_cargo`
--
ALTER TABLE `tally_dd_plan_cargo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_dd_plan_container`
--
ALTER TABLE `tally_dd_plan_container`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_dd_prove`
--
ALTER TABLE `tally_dd_prove`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_dd_supplement_picture`
--
ALTER TABLE `tally_dd_supplement_picture`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_department`
--
ALTER TABLE `tally_department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_dispatch`
--
ALTER TABLE `tally_dispatch`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_dispatch_detail`
--
ALTER TABLE `tally_dispatch_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orderRepairId` (`dispatch_id`) USING BTREE;

--
-- Indexes for table `tally_laborteam`
--
ALTER TABLE `tally_laborteam`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_location`
--
ALTER TABLE `tally_location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_port`
--
ALTER TABLE `tally_port`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_qbzx_ctn_overweight_reviewed`
--
ALTER TABLE `tally_qbzx_ctn_overweight_reviewed`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_qbzx_empty_ctn_img`
--
ALTER TABLE `tally_qbzx_empty_ctn_img`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_qbzx_instruction`
--
ALTER TABLE `tally_qbzx_instruction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_qbzx_instruction_ctn`
--
ALTER TABLE `tally_qbzx_instruction_ctn`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_qbzx_level_cargo_img`
--
ALTER TABLE `tally_qbzx_level_cargo_img`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_qbzx_level_damage_img`
--
ALTER TABLE `tally_qbzx_level_damage_img`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_qbzx_operation`
--
ALTER TABLE `tally_qbzx_operation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_qbzx_operation_level`
--
ALTER TABLE `tally_qbzx_operation_level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_qbzx_plan`
--
ALTER TABLE `tally_qbzx_plan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_qbzx_plan_cargo`
--
ALTER TABLE `tally_qbzx_plan_cargo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_qbzx_plan_ctn`
--
ALTER TABLE `tally_qbzx_plan_ctn`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_qbzx_prove`
--
ALTER TABLE `tally_qbzx_prove`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_qbzx_supplement_picture`
--
ALTER TABLE `tally_qbzx_supplement_picture`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_rate`
--
ALTER TABLE `tally_rate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_rate_detail`
--
ALTER TABLE `tally_rate_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_replace_clerk_record`
--
ALTER TABLE `tally_replace_clerk_record`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_replace_tallymaster_record`
--
ALTER TABLE `tally_replace_tallymaster_record`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_shift`
--
ALTER TABLE `tally_shift`
  ADD PRIMARY KEY (`shift_id`);

--
-- Indexes for table `tally_shift_amendment_record`
--
ALTER TABLE `tally_shift_amendment_record`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_shift_detail`
--
ALTER TABLE `tally_shift_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_ship`
--
ALTER TABLE `tally_ship`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_ship_agent`
--
ALTER TABLE `tally_ship_agent`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_ship_schedule`
--
ALTER TABLE `tally_ship_schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tally_user`
--
ALTER TABLE `tally_user`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `tally_user_auth_rule`
--
ALTER TABLE `tally_user_auth_rule`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `tally_user_group`
--
ALTER TABLE `tally_user_group`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tally_admin`
--
ALTER TABLE `tally_admin`
  MODIFY `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'auto_increment';
--
-- AUTO_INCREMENT for table `tally_admin_group`
--
ALTER TABLE `tally_admin_group`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tally_amend`
--
ALTER TABLE `tally_amend`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tally_auth_rule`
--
ALTER TABLE `tally_auth_rule`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tally_cargo_agent`
--
ALTER TABLE `tally_cargo_agent`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tally_cfs_cargo_damage_img`
--
ALTER TABLE `tally_cfs_cargo_damage_img`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tally_cfs_ctn_empty_img`
--
ALTER TABLE `tally_cfs_ctn_empty_img`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '空箱id';
--
-- AUTO_INCREMENT for table `tally_cfs_ctn_overweight_reviewed`
--
ALTER TABLE `tally_cfs_ctn_overweight_reviewed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tally_cfs_instruction`
--
ALTER TABLE `tally_cfs_instruction`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键';
--
-- AUTO_INCREMENT for table `tally_cfs_instruction_cargo`
--
ALTER TABLE `tally_cfs_instruction_cargo`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键';
--
-- AUTO_INCREMENT for table `tally_cfs_instruction_ctn`
--
ALTER TABLE `tally_cfs_instruction_ctn`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键';
--
-- AUTO_INCREMENT for table `tally_cfs_level_cargo_img`
--
ALTER TABLE `tally_cfs_level_cargo_img`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- AUTO_INCREMENT for table `tally_cfs_operation`
--
ALTER TABLE `tally_cfs_operation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '作业id';
--
-- AUTO_INCREMENT for table `tally_cfs_operation_level`
--
ALTER TABLE `tally_cfs_operation_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tally_cfs_prove`
--
ALTER TABLE `tally_cfs_prove`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- AUTO_INCREMENT for table `tally_cfs_supplement_picture`
--
ALTER TABLE `tally_cfs_supplement_picture`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tally_container`
--
ALTER TABLE `tally_container`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '箱ID';
--
-- AUTO_INCREMENT for table `tally_container_master`
--
ALTER TABLE `tally_container_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '箱主ID';
--
-- AUTO_INCREMENT for table `tally_customer`
--
ALTER TABLE `tally_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '客户ID';
--
-- AUTO_INCREMENT for table `tally_dd_cargo_damage_img`
--
ALTER TABLE `tally_dd_cargo_damage_img`
  MODIFY `id` int(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tally_dd_ctn_damage_after_img`
--
ALTER TABLE `tally_dd_ctn_damage_after_img`
  MODIFY `id` int(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tally_dd_ctn_damage_img`
--
ALTER TABLE `tally_dd_ctn_damage_img`
  MODIFY `id` int(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tally_dd_instruction`
--
ALTER TABLE `tally_dd_instruction`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键';
--
-- AUTO_INCREMENT for table `tally_dd_level_cargo_img`
--
ALTER TABLE `tally_dd_level_cargo_img`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- AUTO_INCREMENT for table `tally_dd_operation`
--
ALTER TABLE `tally_dd_operation`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tally_dd_operation_level`
--
ALTER TABLE `tally_dd_operation_level`
  MODIFY `id` int(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tally_dd_plan`
--
ALTER TABLE `tally_dd_plan`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键';
--
-- AUTO_INCREMENT for table `tally_dd_plan_cargo`
--
ALTER TABLE `tally_dd_plan_cargo`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tally_dd_plan_container`
--
ALTER TABLE `tally_dd_plan_container`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键';
--
-- AUTO_INCREMENT for table `tally_dd_prove`
--
ALTER TABLE `tally_dd_prove`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tally_dd_supplement_picture`
--
ALTER TABLE `tally_dd_supplement_picture`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tally_department`
--
ALTER TABLE `tally_department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门ID';
--
-- AUTO_INCREMENT for table `tally_dispatch`
--
ALTER TABLE `tally_dispatch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tally_dispatch_detail`
--
ALTER TABLE `tally_dispatch_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tally_laborteam`
--
ALTER TABLE `tally_laborteam`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tally_location`
--
ALTER TABLE `tally_location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '作业地点ID';
--
-- AUTO_INCREMENT for table `tally_port`
--
ALTER TABLE `tally_port`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tally_qbzx_ctn_overweight_reviewed`
--
ALTER TABLE `tally_qbzx_ctn_overweight_reviewed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tally_qbzx_empty_ctn_img`
--
ALTER TABLE `tally_qbzx_empty_ctn_img`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '空箱照片ID';
--
-- AUTO_INCREMENT for table `tally_qbzx_instruction`
--
ALTER TABLE `tally_qbzx_instruction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '指令ID';
--
-- AUTO_INCREMENT for table `tally_qbzx_instruction_ctn`
--
ALTER TABLE `tally_qbzx_instruction_ctn`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- AUTO_INCREMENT for table `tally_qbzx_level_cargo_img`
--
ALTER TABLE `tally_qbzx_level_cargo_img`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- AUTO_INCREMENT for table `tally_qbzx_level_damage_img`
--
ALTER TABLE `tally_qbzx_level_damage_img`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- AUTO_INCREMENT for table `tally_qbzx_operation`
--
ALTER TABLE `tally_qbzx_operation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '作业ID';
--
-- AUTO_INCREMENT for table `tally_qbzx_operation_level`
--
ALTER TABLE `tally_qbzx_operation_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '关ID';
--
-- AUTO_INCREMENT for table `tally_qbzx_plan`
--
ALTER TABLE `tally_qbzx_plan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '预报计划ID';
--
-- AUTO_INCREMENT for table `tally_qbzx_plan_cargo`
--
ALTER TABLE `tally_qbzx_plan_cargo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '货物ID';
--
-- AUTO_INCREMENT for table `tally_qbzx_plan_ctn`
--
ALTER TABLE `tally_qbzx_plan_ctn`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '箱ID';
--
-- AUTO_INCREMENT for table `tally_qbzx_prove`
--
ALTER TABLE `tally_qbzx_prove`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- AUTO_INCREMENT for table `tally_qbzx_supplement_picture`
--
ALTER TABLE `tally_qbzx_supplement_picture`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tally_rate`
--
ALTER TABLE `tally_rate`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tally_rate_detail`
--
ALTER TABLE `tally_rate_detail`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tally_replace_clerk_record`
--
ALTER TABLE `tally_replace_clerk_record`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tally_replace_tallymaster_record`
--
ALTER TABLE `tally_replace_tallymaster_record`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tally_shift_amendment_record`
--
ALTER TABLE `tally_shift_amendment_record`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tally_shift_detail`
--
ALTER TABLE `tally_shift_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- AUTO_INCREMENT for table `tally_ship`
--
ALTER TABLE `tally_ship`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '船舶ID';
--
-- AUTO_INCREMENT for table `tally_ship_agent`
--
ALTER TABLE `tally_ship_agent`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tally_ship_schedule`
--
ALTER TABLE `tally_ship_schedule`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tally_user`
--
ALTER TABLE `tally_user`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID';
--
-- AUTO_INCREMENT for table `tally_user_auth_rule`
--
ALTER TABLE `tally_user_auth_rule`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tally_user_group`
--
ALTER TABLE `tally_user_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
