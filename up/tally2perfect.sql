-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2017-09-08 10:44:19
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tally_admin`
--

INSERT INTO `tally_admin` (`uid`, `adminname`, `password`, `email`, `phone`, `register_time`, `register_ip`, `last_login_time`, `last_login_ip`, `login_num`, `status`, `group_id`) VALUES
(1, 'admin', '3b38b2847ed9ab2692b06ca257acb2af', '250961728@qq.com', '13913024200', '2016-04-16 15:29:27', '127.0.0.1', '2017-09-02 15:37:01', '192.168.1.111', 441, 1, 1),
(6, 'TallyAdmin1', '3b38b2847ed9ab2692b06ca257acb2af', '', '', '2016-05-20 09:17:59', '192.168.1.127', '2016-11-29 16:12:02', '192.168.1.115', 2, 1, 5),
(9, 'TallyAdmin3', '3b38b2847ed9ab2692b06ca257acb2af', '', '', '2016-05-20 09:36:53', '192.168.1.127', NULL, NULL, NULL, 1, 5),
(10, 'TallyAdmin2', '3b38b2847ed9ab2692b06ca257acb2af', 'aaa@co.com', '13357832165', '2016-05-20 09:38:55', '192.168.1.127', '2017-02-17 14:08:21', '192.168.1.101', 4, 1, 5);

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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tally_admin_group`
--

INSERT INTO `tally_admin_group` (`id`, `title`, `introduce`, `status`, `rules`, `create_time`) VALUES
(1, '超级管理员', NULL, 1, '', '2016-03-23 14:28:00'),
(5, '普通管理员', '普通管理员具备大多数管理权限，但无法管理其它管理员和管理员组。', 1, '1,2,3,74,75,76,5,6,7,77,78,79,80,81,82,9,10,11,12,14,15,16,18,19,20,22,23,24,25,26,27,28,30,31,32,33,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49', '2016-05-20 09:14:52');

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
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tally_amend`
--

INSERT INTO `tally_amend` (`id`, `business`, `category`, `operation_id`, `instruction_id`, `field_name`, `field_old_value`, `field_new_value`, `uid`, `date`, `remark`) VALUES
(12, 'qbzx', 'operation', 16, NULL, 'sealno', '12212', '122121', 6, '2016-12-05 09:33:13', '123'),
(13, 'qbzx', 'operation', 16, NULL, 'sealno', '122121', '1221211', 6, '2016-12-05 09:34:36', '111'),
(14, 'qbzx', 'operation', 16, NULL, 'sealno', NULL, '123', 6, '2016-12-06 08:45:14', '11'),
(15, 'qbzx', 'operation', 2, NULL, 'sealno', '69', '689', 6, '2016-12-21 09:11:57', '110'),
(16, 'qbzx', 'operation', 4, NULL, 'sealno', '1145', '11458989', 37, '2016-12-26 10:22:46', '89898'),
(17, 'qbzx', 'operation_level', 4, NULL, 'cargo_number', '36', '360', 6, '2016-12-27 15:39:28', '哈哈哈'),
(18, 'qbzx', 'operation_level', 4, NULL, 'cargo_number', '360', '36', 6, '2016-12-27 15:39:42', '哈哈哈'),
(19, 'qbzx', 'operation_level', 4, NULL, 'cargo_number', '36', '360', 6, '2016-12-27 15:40:48', '按时'),
(20, 'qbzx', 'operation_level', 4, NULL, 'cargo_number', '360', '36', 6, '2016-12-27 15:47:31', '对的'),
(21, 'qbzx', 'operation_level', 4, NULL, 'cargo_number', '36', '360', 6, '2016-12-27 15:48:03', '666'),
(22, 'qbzx', 'operation_level', 4, NULL, 'cargo_number', '69', '690', 6, '2016-12-27 15:51:24', '的'),
(23, 'qbzx', 'operation_level', 4, NULL, 'billno', 'td11', 'TD11', 6, '2016-12-27 15:51:24', '的'),
(24, 'qbzx', 'operation_level', 4, NULL, 'cargo_number', '56', '560', 6, '2016-12-27 15:54:47', '的'),
(25, 'qbzx', 'operation_level', 2, NULL, 'cargo_number', '690', '6901', 6, '2016-12-27 15:55:39', '是'),
(26, 'qbzx', 'operation_level', 4, NULL, 'cargo_number', '360', '3601', 6, '2016-12-27 15:55:57', '神仙'),
(27, 'qbzx', 'operation_level', 2, NULL, 'cargo_number', '560', '5601', 6, '2016-12-27 15:56:17', '四点多'),
(28, 'qbzx', 'operation_level', 2, NULL, 'cargo_number', '6901', '69011', 6, '2016-12-27 15:56:41', ' 的'),
(29, 'qbzx', 'operation_level', 2, NULL, 'billno', 'TD11', 'TD111', 6, '2016-12-27 16:03:41', '的'),
(30, 'qbzx', 'operation_level', 2, NULL, 'damage_num', '1', '', 6, '2016-12-27 16:04:06', '看'),
(31, 'qbzx', 'operation_level', 2, NULL, 'billno', 'TD111', 'TD11', 6, '2016-12-27 16:04:06', '看'),
(32, 'qbzx', 'operation_level', 2, NULL, 'cargo_number', '69011', '6901', 6, '2016-12-27 16:04:23', 'i'),
(33, 'qbzx', 'operation_level', 2, NULL, 'damage_num', '0', '1', 6, '2016-12-27 16:04:23', 'i'),
(34, 'qbzx', 'operation_level', 2, NULL, 'damage_num', '333', '3', 6, '2016-12-27 16:04:33', '机会'),
(35, 'qbzx', 'operation', NULL, NULL, 'empty_weight', '23', '230', 6, '2016-12-27 16:14:31', '爱的'),
(36, 'qbzx', 'operation', 2, NULL, 'sealno', '689', '6891', 6, '2016-12-27 16:14:49', '1'),
(37, 'qbzx', 'operation_level', 2, NULL, 'cargo_number', '89', '23', 6, '2017-01-04 09:36:44', 'Ggg'),
(38, 'qbzx', 'operation_level', 2, NULL, 'billno', 'b1', 'B1', 6, '2017-01-04 09:36:44', 'Ggg'),
(39, 'qbzx', 'operation_level', 2, NULL, 'billno', 'b1', 'B1', 6, '2017-01-04 09:36:54', 'Gggf'),
(40, 'qbzx', 'operation', NULL, NULL, 'empty_weight', '36', '432', 6, '2017-01-04 09:37:08', 'Rrr'),
(41, 'qbzx', 'operation_level', 15, NULL, 'cargo_number', '22222', '20', 6, '2017-01-18 10:16:31', '2324'),
(42, 'qbzx', 'opration_level', 15, NULL, 'billno', 'bill123', '', 6, '2017-01-18 10:16:31', '2324'),
(43, 'qbzx', 'operation_level', 15, NULL, 'cargo_number', '20', '23', 6, '2017-01-18 10:31:25', '432432'),
(44, 'qbzx', 'operation_level', 15, NULL, 'cargo_number', '511', '30', 6, '2017-01-18 10:35:05', '33244'),
(45, 'qbzx', 'opration_level', 15, NULL, 'billno', 'bill123', '', 6, '2017-01-18 10:35:05', '33244'),
(46, 'qbzx', 'opration_level', 15, NULL, 'billno', '', 'BILL223', 6, '2017-01-18 10:37:11', '3243'),
(47, 'qbzx', 'opration_level', 15, NULL, 'billno', '', 'BILL1', 6, '2017-01-18 10:37:18', '3432'),
(48, 'qbzx', 'operation_level', 15, NULL, 'cargo_number', '30', '60', 6, '2017-01-18 10:44:54', '432423'),
(49, 'qbzx', 'operation_level', 15, NULL, 'cargo_number', '60', '65', 6, '2017-01-18 10:45:34', 'trtr'),
(50, 'qbzx', 'operation_level', 15, NULL, 'cargo_number', '23', '21', 6, '2017-01-18 10:49:23', '4353'),
(51, 'qbzx', 'operation_level', 15, NULL, 'cargo_number', '65', '69', 6, '2017-01-18 10:52:58', '554');

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
) ENGINE=MyISAM AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tally_auth_rule`
--

INSERT INTO `tally_auth_rule` (`id`, `name`, `title`, `type`, `status`, `condition`, `pid`, `sort`, `create_time`) VALUES
(1, 'Location/index', '作业地点维护（查看）', 1, 1, '', 0, 20, '2016-05-17 16:41:56'),
(2, 'Location/add', '新增作业地点', 1, 1, '', 1, 0, '2016-05-17 16:42:14'),
(3, 'Location/edit', '修改作业地点', 1, 1, '', 1, 0, '2016-05-17 16:42:36'),
(78, 'ShipAgent/add', '新增船代', 1, 1, '', 77, 0, '2016-11-29 16:35:42'),
(5, 'Ship/index', '船舶信息维护（查看）', 1, 1, '', 0, 18, '2016-05-17 16:51:20'),
(6, 'Ship/add', '新增船舶', 1, 1, '', 5, 0, '2016-05-17 16:51:38'),
(7, 'Ship/edit', '编辑船舶', 1, 1, '', 5, 0, '2016-05-17 16:51:53'),
(77, 'ShipAgent/index', '船代信息维护（查看）', 1, 1, '', 0, 17, '2016-11-29 16:35:21'),
(9, 'Container', '集装箱信息维护', 1, 1, '', 0, 15, '2016-05-18 10:15:52'),
(10, 'Container/index', '箱型信息维护（查看）', 1, 1, '', 9, 0, '2016-05-18 10:16:16'),
(11, 'Container/add', '新增箱型', 1, 1, '', 10, 0, '2016-05-18 10:16:35'),
(12, 'Container/edit', '编辑箱型', 1, 1, '', 10, 0, '2016-05-18 10:16:56'),
(14, 'ContainerMaster/index', '箱主信息维护（查看）', 1, 1, '', 9, 0, '2016-05-18 10:19:12'),
(15, 'ContainerMaster/add', '新增箱主', 1, 1, '', 14, 0, '2016-05-18 10:19:30'),
(16, 'ContainerMaster/edit', '编辑箱主', 1, 1, '', 14, 0, '2016-05-18 10:19:46'),
(18, 'Customer/index', '客户信息维护（查看）', 1, 1, '', 0, 14, '2016-05-18 10:21:51'),
(19, 'Customer/add', '新增客户', 1, 1, '', 18, 0, '2016-05-18 10:22:11'),
(20, 'Customer/edit', '编辑客户', 1, 1, '', 18, 0, '2016-05-18 10:22:28'),
(22, 'Customer/changestatus', '修改客户状态', 1, 1, '', 18, 0, '2016-05-18 10:23:04'),
(23, 'Customer/resetpwd', '重置密码', 1, 1, '', 18, 0, '2016-05-18 10:23:27'),
(24, 'Customer/import', '批量导入客户列表', 1, 1, '', 18, 0, '2016-05-18 10:23:49'),
(25, 'Customer/export', '导出客户列表', 1, 1, '', 18, 0, '2016-05-18 10:24:11'),
(26, 'Department/index', '部门管理（查看）', 1, 1, '', 0, 13, '2016-05-18 10:26:00'),
(27, 'Department/add', '新增部门', 1, 1, '', 26, 0, '2016-05-18 10:26:20'),
(28, 'Department/edit', '编辑部门', 1, 1, '', 26, 0, '2016-05-18 10:26:34'),
(30, 'User', '用户管理', 1, 1, '', 0, 12, '2016-05-19 11:37:19'),
(31, 'User/index', '用户管理（查看）', 1, 1, '', 30, 0, '2016-05-19 11:37:52'),
(32, 'User/add', '新增用户', 1, 1, '', 31, 0, '2016-05-19 11:38:29'),
(33, 'User/edit', '编辑用户', 1, 1, '', 31, 0, '2016-05-19 11:40:48'),
(35, 'User/changestatus', '修改用户状态', 1, 1, '', 31, 0, '2016-05-19 11:41:39'),
(36, 'User/resetpwd', '重置密码', 1, 1, '', 31, 0, '2016-05-19 11:41:57'),
(37, 'User/import', '批量导入用户列表', 1, 1, '', 31, 0, '2016-05-19 11:42:24'),
(38, 'User/export', '导出用户列表', 1, 1, '', 31, 0, '2016-05-19 11:42:42'),
(39, 'UserGroup/index', '用户组管理（查看）', 1, 1, '', 30, 0, '2016-05-19 12:09:52'),
(40, 'UserGroup/addgroup', '新增用户组', 1, 1, '', 39, 0, '2016-05-19 12:10:16'),
(41, 'UserGroup/editgroup', '编辑用户组', 1, 1, '', 39, 0, '2016-05-19 12:10:53'),
(42, 'UserGroup/delgroup', '删除用户组', 1, 1, '', 39, 0, '2016-05-19 12:11:18'),
(43, 'UserGroup/changestatus', '修改分组状态', 1, 1, '', 39, 0, '2016-05-19 12:11:41'),
(44, 'UserAuthRule/index', '用户权限管理（查看）', 1, 1, '', 30, 0, '2016-05-19 12:12:11'),
(45, 'UserAuthRule/addrule', '添加权限规则', 1, 1, '', 44, 0, '2016-05-19 12:12:31'),
(46, 'UserAuthRule/editrule', '编辑权限规则', 1, 1, '', 44, 0, '2016-05-19 12:12:49'),
(47, 'UserAuthRule/changestatus', '修改权限状态', 1, 1, '', 44, 0, '2016-05-19 12:13:17'),
(48, 'UserAuthRule/delrule', '删除权限规则', 1, 1, '', 44, 0, '2016-05-19 12:14:25'),
(49, 'UserAuthRule/changesort', '批量修改排序', 1, 1, '', 44, 0, '2016-05-19 12:14:46'),
(50, 'Admin', '管理员管理', 1, 1, '', 0, 0, '2016-05-19 12:15:49'),
(51, 'Admin/index', '管理员管理（查看）', 1, 1, '', 50, 0, '2016-05-19 12:16:16'),
(52, 'Admin/add', '新增管理员', 1, 1, '', 51, 0, '2016-05-19 12:16:40'),
(53, 'Admin/edit', '编辑管理员', 1, 1, '', 51, 0, '2016-05-19 12:16:55'),
(54, 'Admin/del', '删除管理员', 1, 1, '', 51, 0, '2016-05-19 12:17:10'),
(55, 'Admin/changestatus', '修改管理员禁用状态', 1, 1, '', 51, 0, '2016-05-19 12:17:42'),
(56, 'AdminGroup/index', '组别管理（查看）', 1, 1, '', 50, 0, '2016-05-19 12:18:44'),
(57, 'AdminGroup/addgroup', '新增管理员组', 1, 1, '', 56, 0, '2016-05-19 12:19:05'),
(58, 'AdminGroup/editgroup', '编辑管理员组', 1, 1, '', 56, 0, '2016-05-19 12:19:30'),
(59, 'AdminGroup/delgroup', '删除管理员组', 1, 1, '', 56, 0, '2016-05-19 12:20:01'),
(60, 'AdminGroup/changestatus', '修改分组状态', 1, 1, '', 56, 0, '2016-05-19 12:20:21'),
(67, 'Rate', '计费维护', 1, 1, '', 0, 11, '2016-06-16 09:38:44'),
(68, 'Rate/index', '费率本管理（查看）', 1, 1, '', 67, 0, '2016-06-16 09:39:43'),
(69, 'Rate/add', '新增费率本', 1, 1, '', 68, 0, '2016-06-16 09:40:17'),
(70, 'Rate/edit', '编辑费率本', 1, 1, '', 68, 0, '2016-06-16 09:40:46'),
(71, 'RateDetail/index', '费率明细管理（查看）', 1, 1, '', 67, 0, '2016-06-16 09:42:02'),
(72, 'RateDetail/add', '新增费率明细', 1, 1, '', 71, 0, '2016-06-16 09:42:31'),
(73, 'RateDetail/edit', '编辑费率明细', 1, 1, '', 71, 0, '2016-06-16 09:42:47'),
(74, 'Port/index', '港口地点维护（查看）', 1, 1, '', 0, 19, '2016-11-29 16:24:11'),
(75, 'Port/add', '新增港口', 1, 1, '', 74, 0, '2016-11-29 16:25:28'),
(76, 'Port/edit', '修改港口', 1, 1, '', 74, 0, '2016-11-29 16:26:53'),
(79, 'ShipAgent/edit', '编辑船代', 1, 1, '', 77, 0, '2016-11-29 16:36:01'),
(80, 'CargoAgent/index', '货代信息维护（查看）', 1, 1, '', 0, 16, '2016-11-29 16:36:26'),
(81, 'CargoAgent/add', '新增货代', 1, 1, '', 80, 0, '2016-11-29 16:36:46'),
(82, 'CargoAgent/edit', '编辑货代', 1, 1, '', 80, 0, '2016-11-29 16:37:04');

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
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tally_cargo_agent`
--

INSERT INTO `tally_cargo_agent` (`id`, `code`, `name`, `name_en`, `contacter`, `telephone`, `remark`) VALUES
(1, 'BDD', '博达得', 'BDD', '', '', ''),
(2, 'DFWL', '达飞物流', 'DFWL', '', '', ''),
(3, 'FTL', '丰特利', 'FTL', '', '', ''),
(4, 'GTW', '盖特威', 'GTW', '', '', ''),
(5, 'HMGJ', '华贸国际', 'HMGJ', '', '', ''),
(6, 'JG', '嘉格', 'JG', '', '', ''),
(7, 'JT', '江铜', 'JT', '', '', ''),
(8, 'JIUT', '九天', 'JIUT', '', '', ''),
(9, 'KY', '康宇', 'KY', '', '', ''),
(10, 'NC', '诺诚', 'NC', '', '', ''),
(11, 'RJ', '瑞嘉', 'RJ', '', '', ''),
(12, 'YY', '远洋', 'YY', '', '', ''),
(13, 'HY', '宏谊', 'HY', '', '', ''),
(14, 'ZTH', '中通华', 'ZTH', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `tally_cfs_cargo_damage_img`
--

CREATE TABLE IF NOT EXISTS `tally_cfs_cargo_damage_img` (
  `id` int(10) NOT NULL,
  `level_id` int(11) NOT NULL COMMENT '关id',
  `level_num` int(10) DEFAULT NULL COMMENT '第几关',
  `img` varchar(255) DEFAULT NULL COMMENT '箱残损照片'
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tally_cfs_cargo_damage_img`
--

INSERT INTO `tally_cfs_cargo_damage_img` (`id`, `level_id`, `level_num`, `img`) VALUES
(7, 78, 3, '5965dd3caff05607.jpg'),
(8, 80, 2, '5965e93788797503.jpg'),
(9, 82, 2, '5968678c41794515.jpg'),
(10, 86, 1, '598146c498bee113.jpg'),
(12, 94, 1, '59ae6910ef006583.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `tally_cfs_ctn_empty_img`
--

CREATE TABLE IF NOT EXISTS `tally_cfs_ctn_empty_img` (
  `id` int(11) NOT NULL COMMENT '空箱id',
  `empty_img` varchar(255) NOT NULL COMMENT '空箱照片',
  `operation_id` int(11) NOT NULL COMMENT '作业ID'
) ENGINE=MyISAM AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tally_cfs_ctn_empty_img`
--

INSERT INTO `tally_cfs_ctn_empty_img` (`id`, `empty_img`, `operation_id`) VALUES
(89, '5965daec496c2415.jpg', 138),
(90, '5965e91725834984.jpg', 139),
(91, '5968678b1262b108.jpg', 140),
(99, '598146a5bd9c1637.jpg', 160),
(94, '597db1dddc30f793.jpg', 153),
(106, '59ae36f24a11f821.jpg', 173),
(101, '598190db20d73759.jpg', 164),
(102, '598190db3403c367.jpg', 164),
(104, '59acfa124c464563.jpg', 169),
(107, '59ae68dc8f799402.jpg', 173);

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
  `last_operationtime` datetime COMMENT '最后操作时间'
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tally_cfs_instruction`
--

INSERT INTO `tally_cfs_instruction` (`id`, `ship_id`, `voyage`, `operation_type`, `location_id`, `entrust_company`, `department_id`, `status`, `date`, `last_operator`, `last_operationtime`) VALUES
(16, 319, 'one1', '0', 2, NULL, 51, '1', '2017-07-12', 7, '2017-08-02 16:34:25'),
(18, 363, 'sdfsd', '1', 5, 10, 51, '2', '2017-07-28', 8, '2017-08-14 14:11:02'),
(19, 753, '8', '0', 1, 4, 51, '0', '2017-08-08', 21, '2017-09-05 16:51:13'),
(20, 352, '~!@#$%^&amp;*()', '1', 15, 12, 51, '0', '2017-08-08', 8, '2017-09-05 14:54:37'),
(21, 363, '不知道', '0', 5, 10, 53, '1', '2017-08-14', 8, '2017-08-14 16:32:22');

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
  `last_operationtime` datetime NOT NULL COMMENT '最后操作时间',
  `port_id` int(11) DEFAULT NULL COMMENT '目的港ID'
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tally_cfs_instruction_cargo`
--

INSERT INTO `tally_cfs_instruction_cargo` (`id`, `blno`, `crgno`, `name`, `number`, `package`, `mark`, `totalweight`, `dangerlevel`, `totalvolume`, `po`, `remark`, `instruction_id`, `last_operator`, `last_operationtime`, `port_id`) VALUES
(14, 'aaaaa', '2', '8', 5, '5', '5', '4', '55', '5', '5', '5', 16, 7, '2017-07-12 16:13:48', 4),
(15, 'bbbbb', '5', '5', 5, '5', '5', '23', '2', '6546', '65', '65', 16, 7, '2017-07-12 16:14:05', 4),
(16, 'ccccc', 'qwe', '98', 566565, '2', '2', '2', '23', '32', '3232', '32', 16, 7, '2017-07-12 16:14:19', 5),
(17, 'dddddd', 'sada', '654665', 654, '654', '6', '46', '4', '64', '65', '45', 16, 7, '2017-07-12 16:14:38', 5),
(18, '123', '132', '1', 2, '32', '321', '3213', '32', '312', '2', '', 18, 8, '2017-08-14 14:28:27', 4),
(19, '123', '~!@#$%^&amp;*()&lt;', '~!@#$%^&amp;*()_+|}{&quot;:?&gt;&lt;', 100, '~!@#$%^&amp;*()_+|}{&quot;:?&gt;&lt;', '~!@#$%^&amp;*()_+|}{&quot;:?&gt;&lt;', '1150', '~!@#$%?&gt;&lt;', '1.002', '~!%^&quot;:?&gt;&lt;', '~!@#$%^&amp;*()_+|}{&quot;:?&gt;&lt;', 20, 21, '2017-08-08 14:23:31', 4),
(21, 'dsasa', 'sadsaf', '衣服', 1, '打算的撒', '打算的', '', '4', '', '', '', 21, 8, '2017-08-14 14:20:06', 4);

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
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tally_cfs_instruction_ctn`
--

INSERT INTO `tally_cfs_instruction_ctn` (`id`, `ctnno`, `ctn_size`, `ctn_master`, `lcl`, `pre_number`, `status`, `operator_id`, `instruction_id`, `overweight`, `load`) VALUES
(45, 'AXIU2195931', '20GP', 1, 'F', 56, '1', 21, 16, 'N', NULL),
(46, 'MSKU2951046', '40GP', 4, 'F', 63, '0', NULL, 16, 'N', NULL),
(47, 'BMOU2852245', '40RH', 6, 'F', 65, '2', 13, 16, 'N', NULL),
(48, 'MSKU2951046', '40HC', 3, 'F', 56, '2', 13, 16, 'N', NULL),
(49, 'BMOU2852245', '40HC', 4, 'L', 63, '2', 21, 16, 'N', NULL),
(50, 'CBHU4320724', '40FR', 2, 'F', 0, '1', 21, 16, 'N', NULL),
(51, 'AXIU2195931', '40RH', 5, 'F', 63, '1', 21, 16, 'N', NULL),
(52, 'MSKU2951046', '20TK', 5, 'F', 63, '1', 21, 16, 'N', NULL),
(53, 'CBHU4320724', '40FR', 3, 'L', 56, '2', 21, 16, 'N', NULL),
(54, 'MSKU2951046', '40FR', 4, 'F', 63, '2', 5, 16, 'N', NULL),
(55, 'GESU3923454', '40HC', 4, 'L', 1, '2', 21, 18, 'N', NULL),
(56, 'CXDU1057784', '40FR', 3, 'F', 123, '2', 21, 20, 'N', NULL),
(57, 'GESU3923454', '20GP', 2, 'F', 0, '0', NULL, 21, 'N', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `tally_cfs_level_cargo_img`
--

CREATE TABLE IF NOT EXISTS `tally_cfs_level_cargo_img` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `level_id` int(11) NOT NULL COMMENT '关ID',
  `level_num` int(11) NOT NULL COMMENT '第几关（关序号）',
  `level_img` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '关照片'
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `tally_cfs_level_cargo_img`
--

INSERT INTO `tally_cfs_level_cargo_img` (`id`, `level_id`, `level_num`, `level_img`) VALUES
(59, 76, 1, '5965db0db444e655.jpg'),
(60, 77, 2, '5965dd08dd672778.jpg'),
(61, 78, 3, '5965dd3caf82b795.jpg'),
(62, 79, 1, '5965e925a2ced855.jpg'),
(63, 80, 2, '5965e937880fe772.jpg'),
(64, 81, 1, '5968678b3dcb8694.jpg'),
(65, 82, 2, '5968678c4122b566.jpg'),
(67, 84, 1, '597db1ed4cb3f921.jpg'),
(69, 86, 1, '598146c4982a1775.jpg'),
(71, 88, 1, '5981910209c6f612.jpg'),
(73, 90, 1, '59acfd3a89728108.jpg'),
(75, 92, 2, '59ad0037bb1e5808.jpg'),
(77, 94, 1, '59ae6910ee616923.jpg');

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
) ENGINE=MyISAM AUTO_INCREMENT=178 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tally_cfs_operation`
--

INSERT INTO `tally_cfs_operation` (`id`, `ctn_id`, `halfclose_door_picture`, `close_door_picture`, `empty_weight`, `sealno`, `tmp_sealno`, `seal_picture`, `cargo_weight`, `step`, `operator_id`, `begin_time`, `is_stop`, `is_reservation`, `laborteam_id`, `operation_examine`, `examine_remark`) VALUES
(138, 47, '5965e020cb08c617.jpg', '5965e08673f82430.jpg', '6', '649', NULL, '5965e0c4b83d6827.jpg', '6', '5', 13, '2017-07-12 16:16:20', 'N', 'N', NULL, 2, NULL),
(139, 48, '5965e94eadc67351.jpg', '5965e95c2e76a440.jpg', '69', '6469', NULL, '5965e96900bc7352.jpg', '6', '5', 13, '2017-07-12 17:16:56', 'N', 'N', NULL, 2, NULL),
(140, 54, '5968678c5e548131.jpg', '5968678c78193173.jpg', '5', 'ndnzi', NULL, '5968678c91b02218.jpg', '9', '5', 5, '2017-07-14 14:38:36', 'N', 'N', NULL, 1, NULL),
(160, 53, '598146efd6908452.jpg', '598146fc51b4a738.jpg', '1', '11', NULL, '5981470a3a163185.jpg', '1', '5', 21, '2017-08-02 11:27:00', 'N', 'N', NULL, 2, NULL),
(153, 55, '597db1f7e2c24137.jpg', '597db205c6192648.jpg', '3', '1', '1325', '597db214604a6215.jpg', '1', '5', 21, '2017-07-30 18:12:28', 'N', 'N', NULL, 2, NULL),
(169, 56, '59ad039c5732f678.jpg', '59ad0604f1a8d243.jpg', '1', 'Free', NULL, '59ad0b174ae92658.jpg', '25', '5', 21, '2017-09-04 15:00:22', 'N', 'N', NULL, 1, NULL),
(164, 49, '59819137c4013432.jpg', '5981916ba1db2174.jpg', '1', '123', NULL, '5981919883b89391.jpg', '1', '5', 21, '2017-08-02 16:43:18', 'N', 'N', NULL, 1, NULL),
(176, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 21, '2017-09-05 12:28:04', 'N', 'N', NULL, 1, NULL),
(173, 52, NULL, NULL, '22', NULL, NULL, NULL, NULL, '2', 21, '2017-09-05 11:07:34', 'N', 'N', NULL, 1, NULL),
(175, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 21, '2017-09-05 11:08:11', 'N', 'N', NULL, 1, NULL),
(177, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 21, '2017-09-05 17:04:48', 'N', 'N', NULL, 1, NULL);

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
) ENGINE=MyISAM AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tally_cfs_operation_level`
--

INSERT INTO `tally_cfs_operation_level` (`id`, `level_num`, `level_img`, `num`, `damage_num`, `blno`, `operation_id`, `operator_id`, `createtime`) VALUES
(76, 1, NULL, 6, 0, 'dddddd', 138, 13, '2017-07-12 16:17:17'),
(77, 2, NULL, 6, 0, 'dddddd', 138, 13, '2017-07-12 16:25:44'),
(78, 3, NULL, 9, 6, 'dddddd', 138, 13, '2017-07-12 16:26:36'),
(79, 1, NULL, 3, 0, 'aaaaa', 139, 13, '2017-07-12 17:17:25'),
(80, 2, NULL, 9, 6, 'aaaaa', 139, 13, '2017-07-12 17:17:43'),
(81, 1, NULL, 6, 0, 'aaaaa', 140, 5, '2017-07-14 14:41:15'),
(82, 2, NULL, 6, 9, 'ccccc', 140, 5, '2017-07-14 14:41:16'),
(84, 1, NULL, 1, 0, '123', 153, 21, '2017-07-30 18:16:13'),
(86, 1, NULL, 1, 1, 'aaaaa', 160, 21, '2017-08-02 11:28:04'),
(90, 1, NULL, 36, 0, '123', 169, 21, '2017-09-04 15:14:02'),
(88, 1, NULL, 1, 0, 'aaaaa', 164, 21, '2017-08-02 16:44:50'),
(92, 2, NULL, 69, 0, '123', 169, 21, '2017-09-04 15:26:47'),
(94, 1, NULL, 33, 33, 'aaaaa', 173, 21, '2017-09-05 17:06:24');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tally_cfs_prove`
--

INSERT INTO `tally_cfs_prove` (`id`, `ctn_id`, `ctnno`, `ctn_type_code`, `ctn_master`, `ship_id`, `ship_name`, `voyage`, `total_ticket`, `total_package`, `flflag`, `loadingtype`, `location_id`, `location_name`, `empty_weight`, `cargo_weight`, `total_weight`, `dangerlevel`, `sealno`, `level_num`, `damage_num`, `operator_id`, `operator_name`, `content`, `remark`, `consignee`, `createtime`) VALUES
(7, 47, 'BMOU2852245', '40RH', '6', 319, '宝旺99', 'one1', 1, 21, 'F', '0', 2, '南京龙潭港802泊位', 6.00, 6.00, 12.00, '4', '649', 3, 6, 13, '中远', '[{"blno":"dddddd","package":"654","mark":"6","cargo_unit":"21","damage_unit":"6"}]', '', '', '2017-07-12 16:45:17'),
(8, 48, 'MSKU2951046', '40HC', '3', 319, '宝旺99', 'one1', 1, 12, 'F', '0', 2, '南京龙潭港802泊位', 69.00, 6.00, 75.00, '55', '6469', 2, 6, 13, 'COSCO', '[{"blno":"aaaaa","package":"5","mark":"5","cargo_unit":"12","damage_unit":"6"}]', '', '', '2017-08-02 16:48:30'),
(9, 53, 'CBHU4320724', '40FR', '3', 319, '宝旺99', 'one1', 1, 1, 'L', '0', 2, '南京龙潭港802泊位', 1.00, 1.00, 2.00, '55', '11', 1, 1, 21, 'COSCO', '[{"blno":"aaaaa","package":"5","mark":"5","cargo_unit":"1","damage_unit":"1"}]', '', '', '2017-08-02 16:50:01'),
(10, 55, 'GESU3923454', '40HC', '4', 363, '长宏4', 'sdfsd', 1, 1, 'L', '1', 5, '南京龙潭港805泊位', 3.00, 1.00, 4.00, '32', '1', 1, 0, 21, '太平', '[{"blno":"123","package":"32","mark":"321","cargo_unit":"1","damage_unit":"0"}]', '', '', '2017-08-02 16:56:07');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `tally_container`
--

INSERT INTO `tally_container` (`id`, `ctn_type_code`, `ctn_type`, `ctn_size`, `operator`, `operationtime`) VALUES
(1, '20GP', 'GP', 20, NULL, NULL),
(2, '40HC', 'HC', 40, NULL, NULL),
(3, '40FR', 'FR', 40, NULL, NULL),
(4, '40OT', 'OT', 40, NULL, NULL),
(5, '40RH', 'RH', 40, NULL, NULL),
(6, '20TK', 'TK', 20, NULL, NULL),
(7, '40GP', 'GP', 40, NULL, NULL),
(8, '3OQB', 'QB', 30, NULL, NULL),
(9, '40TK', 'TK', 40, NULL, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `tally_container_master`
--

INSERT INTO `tally_container_master` (`id`, `ctn_master_code`, `ctn_master`, `operator`, `operationtime`) VALUES
(1, 'MSK', '马士基', NULL, NULL),
(2, 'KT', '凯通', NULL, NULL),
(3, 'COSCO', 'COSCO', NULL, NULL),
(4, 'TP', '太平', NULL, NULL),
(5, 'ZH', '中海', NULL, NULL),
(6, 'ZY', '中远', NULL, NULL),
(7, 'MSC', 'MSC', NULL, NULL),
(8, 'SDHF', '山东海丰', NULL, NULL),
(9, 'SMD', 'SMD', NULL, NULL),
(10, 'OOCL', 'OOCL', NULL, NULL),
(11, 'APL', 'APL', NULL, NULL),
(12, 'CR', '长荣', NULL, NULL),
(13, 'CMC', '达飞', NULL, NULL),
(14, 'YML', 'YML', NULL, NULL),
(15, 'MOSK', 'MOSK', NULL, NULL),
(16, 'TJHY', '通集海运', NULL, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=1684 DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `tally_customer`
--

INSERT INTO `tally_customer` (`id`, `customer_code`, `customer_pwd`, `customer_name`, `customer_shortname`, `customer_category`, `paytype`, `rate_id`, `linkman`, `telephone`, `customer_status`, `contract_number`, `contract_life`, `operator`, `operationtime`, `authority`) VALUES
(1, 'JSJL', '54d35fd875676bd46ce033b5753f1657', '江苏金轮国际货运代理有限公司', '', 1, 0, 0, '', '', 'Y', '', '2018-12-13', NULL, '2017-05-22 14:15:23', NULL),
(2, 'JSKY', '54d35fd875676bd46ce033b5753f1657', '江苏康宇物流有限公司', '', 1, 0, 0, '', '', 'Y', '', '2017-12-13', NULL, '2017-02-13 09:20:59', NULL),
(3, 'JSYY', '54d35fd875676bd46ce033b5753f1657', '江苏远洋', '', 1, 0, 0, '', '', 'Y', '', '2017-12-13', NULL, '2017-05-04 13:41:52', NULL),
(4, 'RJ', '54d35fd875676bd46ce033b5753f1657', '瑞嘉', '', 1, 0, 0, '', '', 'Y', '', '2018-12-13', NULL, '2017-09-01 09:43:55', NULL),
(5, 'NC', '54d35fd875676bd46ce033b5753f1657', '诺诚', '', 1, 0, 0, '', '', 'Y', '', '2018-12-13', NULL, '2017-02-13 13:40:44', NULL),
(6, 'JIUT', '54d35fd875676bd46ce033b5753f1657', '九天', '', 1, 0, 0, '', '', 'Y', '', '2018-12-13', NULL, NULL, NULL),
(7, 'JT', '54d35fd875676bd46ce033b5753f1657', '江铜', '', 1, 0, 0, '', '', 'Y', '', '2018-12-13', NULL, '2017-09-01 09:42:41', '{"id":"7","photo":["1","2"]}'),
(8, 'JG', '54d35fd875676bd46ce033b5753f1657', '嘉格', '', 1, 0, 0, '', '', 'Y', '', '2018-12-13', NULL, NULL, NULL),
(9, 'HMGJ', '54d35fd875676bd46ce033b5753f1657', '华贸国际', '', 1, 0, 0, '', '', 'Y', '', '2018-12-13', NULL, NULL, NULL),
(10, 'GTW', '54d35fd875676bd46ce033b5753f1657', '盖特威', '', 1, 0, 0, '', '', 'Y', '', '2018-12-13', NULL, '2017-09-07 09:25:43', '{"id":"10","photo":["1"]}'),
(11, 'FTL', '54d35fd875676bd46ce033b5753f1657', '丰特利', '', 1, 0, 0, '', '', 'Y', '', '2018-12-13', NULL, '2017-02-09 08:45:07', NULL),
(12, 'BDD', '54d35fd875676bd46ce033b5753f1657', '博达得', '', 1, 0, 0, '张三', '12345', 'Y', '', '2018-12-13', NULL, '2017-07-21 16:07:02', NULL),
(13, 'DFWL', '54d35fd875676bd46ce033b5753f1657', '达飞物流', '', 1, 0, 0, '', '', 'Y', '', '2018-12-13', NULL, NULL, NULL),
(14, 'WY', '54d35fd875676bd46ce033b5753f1657', '外运', '', 1, 0, 0, '', '', 'Y', '', '2017-12-12', NULL, NULL, NULL),
(15, 'HY', '54d35fd875676bd46ce033b5753f1657', '宏谊', '', 1, 0, 0, '', '', 'Y', '', '2018-08-30', NULL, NULL, NULL),
(16, 'WYCJ', '54d35fd875676bd46ce033b5753f1657', '中国外运长江有限公司南京分公司', '外运长江', 1, 0, 2, '联系人11', '12345678', 'Y', 'ht09011', '2020-10-20', NULL, '2017-02-15 08:38:54', NULL),
(18, 'TSC', '54d35fd875676bd46ce033b5753f1657', '德翔航运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(19, 'HJS', '54d35fd875676bd46ce033b5753f1657', '韩进海运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(20, 'SNKO', '54d35fd875676bd46ce033b5753f1657', '韩国长锦商船株式会社', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(21, 'NTJW', '54d35fd875676bd46ce033b5753f1657', '南通杰旺', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(22, 'SHSZ', '54d35fd875676bd46ce033b5753f1657', '上海申舟船务', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(23, 'SHHD', '54d35fd875676bd46ce033b5753f1657', '上海翰东国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(24, 'JLHY', '54d35fd875676bd46ce033b5753f1657', '巨龙航运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(25, 'BHZZ', '54d35fd875676bd46ce033b5753f1657', '边行中转', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(26, 'HSDCW', '54d35fd875676bd46ce033b5753f1657', '恒顺达船务有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, '2017-07-28 15:00:57', NULL),
(27, 'NYNB', '54d35fd875676bd46ce033b5753f1657', '南远宁波', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(28, 'THHY', '54d35fd875676bd46ce033b5753f1657', '通海弘阳', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(30, 'JCH', '54d35fd875676bd46ce033b5753f1657', '南京金诚海', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(31, 'NQ', '54d35fd875676bd46ce033b5753f1657', '南海青年实业公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(32, 'ZHCW', '54d35fd875676bd46ce033b5753f1657', '中海船务', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(33, 'CQJH', '54d35fd875676bd46ce033b5753f1657', '重庆集海', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(34, 'JSWY', '54d35fd875676bd46ce033b5753f1657', '江苏外运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(35, 'CJGJ', '54d35fd875676bd46ce033b5753f1657', '江苏长江国际货运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(36, 'ZBHY', '54d35fd875676bd46ce033b5753f1657', '振邦货运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(37, 'SCSY', '54d35fd875676bd46ce033b5753f1657', '四川水运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(38, 'NJWD', '54d35fd875676bd46ce033b5753f1657', '南京外代', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(39, 'YAHU', '54d35fd875676bd46ce033b5753f1657', '其它（托管）', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(40, 'H-J', '54d35fd875676bd46ce033b5753f1657', '韩进', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(41, 'ZGHY', '54d35fd875676bd46ce033b5753f1657', '中钢货运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(42, 'JSSY', '54d35fd875676bd46ce033b5753f1657', '江苏时运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(43, 'ZJSD', '54d35fd875676bd46ce033b5753f1657', '南通中集顺达集装箱有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(44, 'UNIWILL', '54d35fd875676bd46ce033b5753f1657', '江苏众诚', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(45, 'JOSCO', '54d35fd875676bd46ce033b5753f1657', '江苏远洋新世纪', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(46, 'CJWL', '54d35fd875676bd46ce033b5753f1657', '长江物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(47, 'NJYY', '54d35fd875676bd46ce033b5753f1657', '南京远洋国际船舶代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(48, 'JSCD', '54d35fd875676bd46ce033b5753f1657', '江苏船代', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(49, 'SUYA', '54d35fd875676bd46ce033b5753f1657', '江苏苏亚国际货运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(51, 'JUM', '54d35fd875676bd46ce033b5753f1657', '江苏海运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(52, 'ZXWL', '54d35fd875676bd46ce033b5753f1657', '直效物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(53, 'JSZY', '54d35fd875676bd46ce033b5753f1657', '江苏中艺', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(54, 'JSHL', '54d35fd875676bd46ce033b5753f1657', '江苏恒隆船舶代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(55, 'HBWY', '54d35fd875676bd46ce033b5753f1657', '湖北外运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(56, 'SYMS', '54d35fd875676bd46ce033b5753f1657', '烟台海运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(57, 'JSGD', '54d35fd875676bd46ce033b5753f1657', '江苏国际船舶代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(58, 'LMWL', '54d35fd875676bd46ce033b5753f1657', '龙门物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(59, 'CQP', '54d35fd875676bd46ce033b5753f1657', '重庆太平洋', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(60, 'CSCLJS', '54d35fd875676bd46ce033b5753f1657', '中海集运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(61, 'SHHF', '54d35fd875676bd46ce033b5753f1657', '上海海富', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(63, 'JSWYHY', '54d35fd875676bd46ce033b5753f1657', '江苏外运货运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(64, 'JSYYGJ', '54d35fd875676bd46ce033b5753f1657', '江苏右原国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(65, 'SWGL', '54d35fd875676bd46ce033b5753f1657', '芜湖申芜港联', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(66, 'AQWD', '54d35fd875676bd46ce033b5753f1657', '安庆外代', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(67, 'RYWL', '54d35fd875676bd46ce033b5753f1657', '润扬物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(69, 'JSHY', '54d35fd875676bd46ce033b5753f1657', '江苏航远', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(70, 'THCS', '54d35fd875676bd46ce033b5753f1657', '通海集穿梭巴士', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(72, 'LTZH', '54d35fd875676bd46ce033b5753f1657', '龙潭中货', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(73, 'LTHL', '54d35fd875676bd46ce033b5753f1657', '龙潭恒隆', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(74, 'LTJHT', '54d35fd875676bd46ce033b5753f1657', '龙潭江海通', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(75, 'LTSL', '54d35fd875676bd46ce033b5753f1657', '龙潭神鹿', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(76, 'JSHH', '54d35fd875676bd46ce033b5753f1657', '江苏航华国际船务有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(77, 'CHJF', '54d35fd875676bd46ce033b5753f1657', '长航集装箱发展有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(78, 'HNYY', '54d35fd875676bd46ce033b5753f1657', '湖南远洋', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(79, 'RCHY', '54d35fd875676bd46ce033b5753f1657', '江苏荣澄航运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(80, 'HJWL', '54d35fd875676bd46ce033b5753f1657', '华基物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(81, 'NTYZH', '54d35fd875676bd46ce033b5753f1657', '南通永正海船务有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(82, 'ZGXL', '54d35fd875676bd46ce033b5753f1657', '中谷新良', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(83, 'SHGWL', '54d35fd875676bd46ce033b5753f1657', '上港物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(84, 'DHWL', '54d35fd875676bd46ce033b5753f1657', '上海东翰物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(85, 'MFHY', '54d35fd875676bd46ce033b5753f1657', '明发海运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(86, 'JXYY', '54d35fd875676bd46ce033b5753f1657', '江西远洋', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(88, 'SHLY', '54d35fd875676bd46ce033b5753f1657', '市联运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(89, 'NUC', '54d35fd875676bd46ce033b5753f1657', '宁波联合集海', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(91, 'AJWL', '54d35fd875676bd46ce033b5753f1657', '安吉物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(92, 'LCTYAHU', '54d35fd875676bd46ce033b5753f1657', 'LCT其它', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(93, 'JAS', '54d35fd875676bd46ce033b5753f1657', '长沙捷安航运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(94, 'LTTPY', '54d35fd875676bd46ce033b5753f1657', '龙潭太平洋', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(95, 'JSWYNM', '54d35fd875676bd46ce033b5753f1657', '江苏外运内贸运输分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(96, 'LTMS', '54d35fd875676bd46ce033b5753f1657', '龙潭民生', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(97, 'HNFH', '54d35fd875676bd46ce033b5753f1657', '海南福海', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(98, 'CHZHYH', '54d35fd875676bd46ce033b5753f1657', '池洲远航', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(99, 'JSYD', '54d35fd875676bd46ce033b5753f1657', '江苏永德', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(100, 'ATL', '54d35fd875676bd46ce033b5753f1657', '泉州安通物流有限公司南京办事处', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(101, 'NTDX', '54d35fd875676bd46ce033b5753f1657', '南通大新航运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(102, 'JYCD', '54d35fd875676bd46ce033b5753f1657', '江苏远洋国际船舶代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(103, 'SWWL', '54d35fd875676bd46ce033b5753f1657', '南京森伟物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(104, 'BBHH', '54d35fd875676bd46ce033b5753f1657', '蚌埠华航', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(105, 'JSLY（一）', '54d35fd875676bd46ce033b5753f1657', '江苏省联运有限公司第一分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(106, 'DDWL', '54d35fd875676bd46ce033b5753f1657', '德达物流集装箱', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(107, 'JSZCWL', '54d35fd875676bd46ce033b5753f1657', '江苏中驰物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(108, 'NJHKBG', '54d35fd875676bd46ce033b5753f1657', '江苏宏康通关物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(109, 'JSZY', '54d35fd875676bd46ce033b5753f1657', '江苏中艺', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(110, 'ZXGJNJ', '54d35fd875676bd46ce033b5753f1657', '中新国际·运输服务有限公司南京', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(111, 'CJHD', '54d35fd875676bd46ce033b5753f1657', '江苏长江国际货运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(112, 'UPSSCSNKG', '54d35fd875676bd46ce033b5753f1657', '天津泛艺江苏分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(113, 'JSHT', '54d35fd875676bd46ce033b5753f1657', '江苏恒通国际货运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(114, 'NJGJHY', '54d35fd875676bd46ce033b5753f1657', '南京国际货运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(115, 'ZLHY', '54d35fd875676bd46ce033b5753f1657', '洋浦中良海运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(116, 'JSYDNJ', '54d35fd875676bd46ce033b5753f1657', '江苏悦达国际货物运输代理有限公', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(117, 'DHWL', '54d35fd875676bd46ce033b5753f1657', '南京东华物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(118, 'FOS', '54d35fd875676bd46ce033b5753f1657', '福建东方集装箱物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(119, 'GH', '54d35fd875676bd46ce033b5753f1657', '国货', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(120, 'GOLDENSUN', '54d35fd875676bd46ce033b5753f1657', '金阳船务', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(121, 'HBHH', '54d35fd875676bd46ce033b5753f1657', '湖北航华国际船务代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(123, 'HHJX', '54d35fd875676bd46ce033b5753f1657', '弘海集装箱服务有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(124, 'HLC', '54d35fd875676bd46ce033b5753f1657', '赫伯罗特', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(125, 'HMM', '54d35fd875676bd46ce033b5753f1657', '现代商船', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(126, 'HNDLWL', '54d35fd875676bd46ce033b5753f1657', '湖南电力物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(128, 'HNYY', '54d35fd875676bd46ce033b5753f1657', '湖南远洋', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(131, 'HTRS', '54d35fd875676bd46ce033b5753f1657', '汉嘉国际物流（江苏）有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(133, 'JINJ', '54d35fd875676bd46ce033b5753f1657', '上海市锦江航运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(138, 'JSHU', '54d35fd875676bd46ce033b5753f1657', '江苏嘉仕和航运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(141, 'JSSLY', '54d35fd875676bd46ce033b5753f1657', '江苏省联运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(146, 'JSWYSHW', '54d35fd875676bd46ce033b5753f1657', '江苏外运商务中心', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(147, 'JSYD', '54d35fd875676bd46ce033b5753f1657', '江苏永德', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(148, 'JSZY', '54d35fd875676bd46ce033b5753f1657', '江苏中艺', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(149, 'JUM', '54d35fd875676bd46ce033b5753f1657', '江苏远东国际货运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(152, 'LMWL', '54d35fd875676bd46ce033b5753f1657', '龙门物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(155, 'LTKT', '54d35fd875676bd46ce033b5753f1657', '龙潭凯通', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(159, 'LTZH', '54d35fd875676bd46ce033b5753f1657', '龙潭中货', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(161, 'MOSK', '54d35fd875676bd46ce033b5753f1657', '商船三井', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(162, 'MSC', '54d35fd875676bd46ce033b5753f1657', '地中海航运(香港)有限公司南京代', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(163, 'MSK', '54d35fd875676bd46ce033b5753f1657', '马士基', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(164, 'NJLD', '54d35fd875676bd46ce033b5753f1657', '南京联代', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(167, 'NQ', '54d35fd875676bd46ce033b5753f1657', '海南青年实业有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(168, 'NTMC', '54d35fd875676bd46ce033b5753f1657', '南通中集顺达暂存箱', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(171, 'XDSH', '54d35fd875676bd46ce033b5753f1657', '新达海运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(172, 'TEMP', '54d35fd875676bd46ce033b5753f1657', '临时箱主', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(173, 'DNM', '54d35fd875676bd46ce033b5753f1657', '东南亚航运（中海货运代管）', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(174, 'LTCT', '54d35fd875676bd46ce033b5753f1657', '系统缺省箱主', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(175, 'LHKH', '54d35fd875676bd46ce033b5753f1657', '洋浦中良联合快航', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(176, 'CAPITAL', '54d35fd875676bd46ce033b5753f1657', 'CAPITAL租箱', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(177, 'TMSC', '54d35fd875676bd46ce033b5753f1657', '南京联代', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(178, 'MRYD', '54d35fd875676bd46ce033b5753f1657', '南美邮船（江苏远东代管）', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(179, 'TCMC', '54d35fd875676bd46ce033b5753f1657', '太仓中集暂存箱', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(180, 'MCL', '54d35fd875676bd46ce033b5753f1657', '迈捷箱运(江苏外运商务代管）', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(181, 'QITA', '54d35fd875676bd46ce033b5753f1657', '其他(商务代管）', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(182, 'STL', '54d35fd875676bd46ce033b5753f1657', '斯图尔特罐箱', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(183, 'YZJH', '54d35fd875676bd46ce033b5753f1657', '扬州集海内贸箱', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(184, 'AJWL', '54d35fd875676bd46ce033b5753f1657', '安吉物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(185, 'TMM', '54d35fd875676bd46ce033b5753f1657', '墨西哥航运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(188, 'SCSY', '54d35fd875676bd46ce033b5753f1657', '四川水运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(190, 'KTD', '54d35fd875676bd46ce033b5753f1657', '凯通航运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(191, 'APL', '54d35fd875676bd46ce033b5753f1657', '美国总统', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(193, 'BHL', '54d35fd875676bd46ce033b5753f1657', '巴克皓', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(194, 'ZHHT', '54d35fd875676bd46ce033b5753f1657', '深圳中海通', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(195, 'CQCH', '54d35fd875676bd46ce033b5753f1657', '重庆轮船集装箱经营分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(196, 'CNC', '54d35fd875676bd46ce033b5753f1657', '正利', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(197, 'DMS', '54d35fd875676bd46ce033b5753f1657', '法国达贸', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(198, 'CMZ', '54d35fd875676bd46ce033b5753f1657', '法国达飞(CMZ)', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(199, 'CMD', '54d35fd875676bd46ce033b5753f1657', '法国达飞（CMD目的港限制）', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(200, 'CME', '54d35fd875676bd46ce033b5753f1657', '法国达飞（CME目的港限制）', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(201, 'CMF', '54d35fd875676bd46ce033b5753f1657', '法国达飞（CMF目的港限制）', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(202, 'CMC', '54d35fd875676bd46ce033b5753f1657', '法国达飞（进口重箱CMC）', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(203, 'CMB', '54d35fd875676bd46ce033b5753f1657', '法国达飞（CMB目的港限制）', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(204, 'CMA', '54d35fd875676bd46ce033b5753f1657', '法国达飞', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(205, 'COSCO', '54d35fd875676bd46ce033b5753f1657', '中远集运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(206, 'CQHY', '54d35fd875676bd46ce033b5753f1657', '重庆海运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(207, 'CQMS', '54d35fd875676bd46ce033b5753f1657', '重庆民生内贸箱', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(208, 'MSL', '54d35fd875676bd46ce033b5753f1657', '重庆民生外贸箱', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(210, 'CSC', '54d35fd875676bd46ce033b5753f1657', '中海外贸箱', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(211, 'LCSC', '54d35fd875676bd46ce033b5753f1657', '中海内贸', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(212, 'THK', '54d35fd875676bd46ce033b5753f1657', '天津海运(大新华代管)', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(213, 'GCS', '54d35fd875676bd46ce033b5753f1657', '大新华轮船', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(214, 'EGH', '54d35fd875676bd46ce033b5753f1657', '长荣', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(216, 'NOR', '54d35fd875676bd46ce033b5753f1657', '北欧亚', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(217, 'CJIN', '54d35fd875676bd46ce033b5753f1657', '淳进', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(218, 'CQGSL', '54d35fd875676bd46ce033b5753f1657', '重庆港盛船务有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(219, 'GTMS', '54d35fd875676bd46ce033b5753f1657', '台州市港泰海运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(220, 'YQZH', '54d35fd875676bd46ce033b5753f1657', '乐清振华', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(222, 'WZJH', '54d35fd875676bd46ce033b5753f1657', '温州江海', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(223, 'PHJ', '54d35fd875676bd46ce033b5753f1657', '韩进指定航线箱', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(224, 'HSD', '54d35fd875676bd46ce033b5753f1657', '汉堡南美航运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(225, 'CCNI', '54d35fd875676bd46ce033b5753f1657', '华林船务', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(226, 'SNL', '54d35fd875676bd46ce033b5753f1657', '上海箱运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(227, 'SWIR', '54d35fd875676bd46ce033b5753f1657', '太古船务', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(228, 'WJS', '54d35fd875676bd46ce033b5753f1657', '佑进', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(229, 'HAL', '54d35fd875676bd46ce033b5753f1657', '兴亚海运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(230, 'PO', '54d35fd875676bd46ce033b5753f1657', 'PANOCEAN(潘欧绅：外运船代代)', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(231, 'FWSC', '54d35fd875676bd46ce033b5753f1657', '英之杰航运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(232, 'SMH', '54d35fd875676bd46ce033b5753f1657', '青岛海隆达', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(233, 'SWRZ', '54d35fd875676bd46ce033b5753f1657', '中艺太古', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(234, 'JUM', '54d35fd875676bd46ce033b5753f1657', '海运自有箱（新）', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(235, 'JSM', '54d35fd875676bd46ce033b5753f1657', '海运自有箱（旧）', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(236, 'KKK', '54d35fd875676bd46ce033b5753f1657', '川崎汽船', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(239, 'XZW', '54d35fd875676bd46ce033b5753f1657', '马士基', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(240, 'MSKYS', '54d35fd875676bd46ce033b5753f1657', '马士基中转箱只能装船不能D/D', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(241, 'OOG', '54d35fd875676bd46ce033b5753f1657', '马士基特种箱', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(242, 'YPY', '54d35fd875676bd46ce033b5753f1657', '马士基（无梁箱）', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(243, 'JSHY', '54d35fd875676bd46ce033b5753f1657', '江苏鸿雅物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(244, 'JSYCWL', '54d35fd875676bd46ce033b5753f1657', '江苏远驰国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(245, 'SHYH', '54d35fd875676bd46ce033b5753f1657', '上海元瀚国际货物运输代理有限公', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(247, 'NJTS', '54d35fd875676bd46ce033b5753f1657', '南京图胜精细化工有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(248, 'NJGJ', '54d35fd875676bd46ce033b5753f1657', '南京高集货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(249, 'PEILIAN', '54d35fd875676bd46ce033b5753f1657', '上海沛联国际货运代理公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(250, 'ROYAL', '54d35fd875676bd46ce033b5753f1657', '南京荣誉物流有限责任公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(251, 'SUZY', '54d35fd875676bd46ce033b5753f1657', '海硕根据货运（上海）有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(252, 'HS', '54d35fd875676bd46ce033b5753f1657', '南京恒商货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(253, 'MST', '54d35fd875676bd46ce033b5753f1657', '南京美思泰机械设备有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(254, 'NJFM', '54d35fd875676bd46ce033b5753f1657', '南京泛贸国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(256, 'NJTH', '54d35fd875676bd46ce033b5753f1657', '青岛天虎国际货运有限南京分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(257, 'FBHY', '54d35fd875676bd46ce033b5753f1657', '富邦航运（深圳）有限公司南京分', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(258, 'ZSWLNJ', '54d35fd875676bd46ce033b5753f1657', '招商局物流集团南京有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(259, 'NJTYWL', '54d35fd875676bd46ce033b5753f1657', '南京拓越物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(260, 'NJKX', '54d35fd875676bd46ce033b5753f1657', '南京凯翔国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(261, 'CFS-YGSH', '54d35fd875676bd46ce033b5753f1657', 'CFS_阳光速航江苏分公司(新闻纸)', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(262, 'NQ', '54d35fd875676bd46ce033b5753f1657', '海口南青集装箱班轮有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(263, 'ALWL', '54d35fd875676bd46ce033b5753f1657', '上海澳隆物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(264, 'ZYGL', '54d35fd875676bd46ce033b5753f1657', '中远格力', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(265, 'ZC-QSY', '54d35fd875676bd46ce033b5753f1657', '众诚-起酥油', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(266, 'CFS-LY(LH)', '54d35fd875676bd46ce033b5753f1657', 'CFS-嘉兴良友进出口集团（硫磺）', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(267, 'JSYMGJ', '54d35fd875676bd46ce033b5753f1657', '江苏英明国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(268, 'CFS-ST(LH)', '54d35fd875676bd46ce033b5753f1657', 'CFS-江苏舜天机械进出口有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(269, 'JHJ', '54d35fd875676bd46ce033b5753f1657', '锦海捷亚国际货运有限公司(南京)', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(270, 'NJJYGJ', '54d35fd875676bd46ce033b5753f1657', '南京津岳国际货运代理公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(272, 'JSJG', '54d35fd875676bd46ce033b5753f1657', '江苏嘉格国际货物运输代理公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(273, 'NJHJL', '54d35fd875676bd46ce033b5753f1657', '韩进物流(上海)有限公司南京分', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(274, 'JH', '54d35fd875676bd46ce033b5753f1657', '江苏锦航国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(275, 'DPRL', '54d35fd875676bd46ce033b5753f1657', '江苏东甫润量国际货物运输代理有', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(276, 'HRHY', '54d35fd875676bd46ce033b5753f1657', '南京恒瑞海运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(277, 'JSYDGJ', '54d35fd875676bd46ce033b5753f1657', '江苏远东国际船舶代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(278, 'NJNJGJ', '54d35fd875676bd46ce033b5753f1657', '南京凝结国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(280, 'YLDF', '54d35fd875676bd46ce033b5753f1657', '永利东方国际物流（中国）有限公', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(281, 'ZBJY', '54d35fd875676bd46ce033b5753f1657', '南京振邦集装箱物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(283, 'LTWL', '54d35fd875676bd46ce033b5753f1657', '利通物流有限公司南京分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(284, 'PT', '54d35fd875676bd46ce033b5753f1657', '南京鹏腾国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(285, 'JSDPHY', '54d35fd875676bd46ce033b5753f1657', '江苏东沛进出口货运有限责任公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(286, 'SHHJGJ', '54d35fd875676bd46ce033b5753f1657', '上海华基国际代理有限公司南京分', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(287, 'SYGJ', '54d35fd875676bd46ce033b5753f1657', '江苏苏亚国际货运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(289, 'JSKTWL', '54d35fd875676bd46ce033b5753f1657', '江苏凯通国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(291, 'NJYL', '54d35fd875676bd46ce033b5753f1657', '南京云龙汽车运输有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(292, 'ZWYCJ', '54d35fd875676bd46ce033b5753f1657', '中外运长江有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(293, 'NJJS', '54d35fd875676bd46ce033b5753f1657', '南京佳盛运输有限责任公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(294, 'JHF', '54d35fd875676bd46ce033b5753f1657', '景华峰江苏分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(295, 'YPZH', '54d35fd875676bd46ce033b5753f1657', '洋浦中僡物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(296, 'TXHG', '54d35fd875676bd46ce033b5753f1657', '岳池泰鑫精细化工有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(297, 'MSYY', '54d35fd875676bd46ce033b5753f1657', '民生烟叶', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(298, 'JSWD', '54d35fd875676bd46ce033b5753f1657', '江苏纬达国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(299, 'SHJM', '54d35fd875676bd46ce033b5753f1657', '上海锦鸣国际货运代理有限公司南', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(300, 'ABML', '54d35fd875676bd46ce033b5753f1657', '埃彼穆勒环球物流(上海)有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(301, 'JSYW', '54d35fd875676bd46ce033b5753f1657', '江苏永威国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(302, 'ZGWD', '54d35fd875676bd46ce033b5753f1657', '中国南京外轮代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(303, 'HUIHANG', '54d35fd875676bd46ce033b5753f1657', '江苏汇航国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(304, 'NJXHX', '54d35fd875676bd46ce033b5753f1657', '南京新航线船务有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(305, 'JY', '54d35fd875676bd46ce033b5753f1657', '基业国际货运(中国)有限公司南京', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(306, 'NJYDGJ', '54d35fd875676bd46ce033b5753f1657', '南京远东国际船舶代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(307, 'JRQHMY', '54d35fd875676bd46ce033b5753f1657', '句容强华贸易有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(308, 'SHHR', '54d35fd875676bd46ce033b5753f1657', '上海恒荣国际货运南京分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(309, 'JSWYCD-TJK', '54d35fd875676bd46ce033b5753f1657', '江苏外运船代铜精矿', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(310, 'NJBH', '54d35fd875676bd46ce033b5753f1657', '南京碧海物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(311, 'HLD', '54d35fd875676bd46ce033b5753f1657', '汇利达国际货运上海分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(312, 'TMT', '54d35fd875676bd46ce033b5753f1657', '上海铁洋多式联运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(313, 'AHZY', '54d35fd875676bd46ce033b5753f1657', '安徽中远物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(315, 'NJFP', '54d35fd875676bd46ce033b5753f1657', '富邦航运（深圳）南京分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(316, 'SHZH', '54d35fd875676bd46ce033b5753f1657', '中荷(上海)货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(317, 'NJWS', '54d35fd875676bd46ce033b5753f1657', '南京伟仕物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(318, 'JSHF', '54d35fd875676bd46ce033b5753f1657', '江苏华富物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(319, 'RSZCL', '54d35fd875676bd46ce033b5753f1657', '日圣中储粮', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(320, 'NJZX', '54d35fd875676bd46ce033b5753f1657', '上海泽翔国际货物运输代理南京分', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(321, 'JLJYJXZ', '54d35fd875676bd46ce033b5753f1657', '江苏金陵交运集团南京集装箱物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(322, 'KFWL', '54d35fd875676bd46ce033b5753f1657', '南京柯发物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(323, 'NJLHCY', '54d35fd875676bd46ce033b5753f1657', '南京利恒储运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(324, 'JHWL', '54d35fd875676bd46ce033b5753f1657', '南京锦鸿物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(325, 'SHJF', '54d35fd875676bd46ce033b5753f1657', '上海巨帆国际货运代理有限公司南', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(326, 'SHBD', '54d35fd875676bd46ce033b5753f1657', '上海邦达天原国际货运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(327, 'JSJYCW', '54d35fd875676bd46ce033b5753f1657', '南京暨阳船务有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(328, 'DYWL', '54d35fd875676bd46ce033b5753f1657', '上海德誉国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(329, 'JSHCWL', '54d35fd875676bd46ce033b5753f1657', '江苏恒川国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(331, 'NJHH', '54d35fd875676bd46ce033b5753f1657', '南京瀚航物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(332, 'JSHQHY', '54d35fd875676bd46ce033b5753f1657', '江苏环球国际货运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(333, 'NJHJ', '54d35fd875676bd46ce033b5753f1657', '南京航捷国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(334, 'GXJBSH', '54d35fd875676bd46ce033b5753f1657', '上海国信捷豹国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(335, 'JSYDWL', '54d35fd875676bd46ce033b5753f1657', '江苏远东物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(336, 'TCWLYT', '54d35fd875676bd46ce033b5753f1657', '通诚物流（烟台）有限公司南京分', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(337, 'JSJTL', '54d35fd875676bd46ce033b5753f1657', '江苏九天国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(338, 'JSFD', '54d35fd875676bd46ce033b5753f1657', '江苏富鼎国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(339, 'AJWL', '54d35fd875676bd46ce033b5753f1657', '安吉物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(342, 'AQWY', '54d35fd875676bd46ce033b5753f1657', '安庆外运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(348, 'CJCD', '54d35fd875676bd46ce033b5753f1657', '南京长江船务代理有限责任公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(350, 'CJGS', '54d35fd875676bd46ce033b5753f1657', '中外运长江公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(358, 'DT', '54d35fd875676bd46ce033b5753f1657', '达通国际船务', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(360, 'BCD', '54d35fd875676bd46ce033b5753f1657', '白俄罗斯国家铁路公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(361, 'STC', '54d35fd875676bd46ce033b5753f1657', '海铁联捷', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(363, 'SOC', '54d35fd875676bd46ce033b5753f1657', '货主自备箱', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(365, 'MSC', '54d35fd875676bd46ce033b5753f1657', '地中海航运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(366, 'STX', '54d35fd875676bd46ce033b5753f1657', '世腾国际船务', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(367, 'KKS', '54d35fd875676bd46ce033b5753f1657', '神源汽船', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(368, 'NOS', '54d35fd875676bd46ce033b5753f1657', '新东方', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(369, 'DNY', '54d35fd875676bd46ce033b5753f1657', '东南亚海运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(370, 'SCI', '54d35fd875676bd46ce033b5753f1657', '印度国家航运公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(371, 'SMD', '54d35fd875676bd46ce033b5753f1657', '萨姆达拉', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(372, 'KMTC', '54d35fd875676bd46ce033b5753f1657', '高丽海运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(373, 'YTL', '54d35fd875676bd46ce033b5753f1657', '巴商亿通', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(374, 'SHWD', '54d35fd875676bd46ce033b5753f1657', '上海外代（南京外代代理）', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(375, 'SENATO', '54d35fd875676bd46ce033b5753f1657', '德国胜利', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(378, 'HZQX', '54d35fd875676bd46ce033b5753f1657', '海之源(海南福海）', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(379, 'XSHY', '54d35fd875676bd46ce033b5753f1657', '兴顺航运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(382, 'HRTZ', '54d35fd875676bd46ce033b5753f1657', '恒瑞退租箱', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(383, 'FBS', '54d35fd875676bd46ce033b5753f1657', '福布斯海运（印度）', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(384, 'RLS', '54d35fd875676bd46ce033b5753f1657', '美国海天航运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(385, 'UTTA', '54d35fd875676bd46ce033b5753f1657', '联合罐式集装箱边行中转', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(386, 'MHM', '54d35fd875676bd46ce033b5753f1657', '华荣海运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(388, 'AMT', '54d35fd875676bd46ce033b5753f1657', '武汉长伟', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(389, 'WS', '54d35fd875676bd46ce033b5753f1657', '福州万洲船务有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(390, 'XF', '54d35fd875676bd46ce033b5753f1657', '宁波利信物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(391, 'XMH', '54d35fd875676bd46ce033b5753f1657', '广西新闽航海运有限责任公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(392, 'YP', '54d35fd875676bd46ce033b5753f1657', '厦门元鹏船运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(393, 'CCL', '54d35fd875676bd46ce033b5753f1657', '中通国际海运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(394, 'YML', '54d35fd875676bd46ce033b5753f1657', '阳明海运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(395, 'YS', '54d35fd875676bd46ce033b5753f1657', '广西永盛船务有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(400, 'ZIMA', '54d35fd875676bd46ce033b5753f1657', '以星(ONEWAY)', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(401, 'ZIM', '54d35fd875676bd46ce033b5753f1657', '以星', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(402, 'GSL', '54d35fd875676bd46ce033b5753f1657', '以星物流公司（干线中转箱）', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(404, 'FES', '54d35fd875676bd46ce033b5753f1657', '俄罗斯航运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(405, 'ISL', '54d35fd875676bd46ce033b5753f1657', '伊朗航运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(406, 'QP', '54d35fd875676bd46ce033b5753f1657', '强平船务', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(407, 'NQ', '54d35fd875676bd46ce033b5753f1657', '南青', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(408, 'NQTZ', '54d35fd875676bd46ce033b5753f1657', '南青退租', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(409, 'NYK', '54d35fd875676bd46ce033b5753f1657', '日本邮船', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(410, 'OOCL', '54d35fd875676bd46ce033b5753f1657', '东方海外', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(411, 'PANB', '54d35fd875676bd46ce033b5753f1657', '东方海外FREEUSE箱', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(412, 'PIL', '54d35fd875676bd46ce033b5753f1657', '太平船务', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(413, 'PKE', '54d35fd875676bd46ce033b5753f1657', '汎韩物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(414, 'PKEDP', '54d35fd875676bd46ce033b5753f1657', '泛韩自备箱（只空出）', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(415, 'WANG', '54d35fd875676bd46ce033b5753f1657', '铁航渣华FREEUSE箱', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(416, 'PON', '54d35fd875676bd46ce033b5753f1657', '铁航渣华', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(417, 'POS', '54d35fd875676bd46ce033b5753f1657', '海南泛洋航运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(418, 'QZHY', '54d35fd875676bd46ce033b5753f1657', '泉州华阳公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(419, 'RCHY', '54d35fd875676bd46ce033b5753f1657', '江苏荣澄航运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(420, 'RCL', '54d35fd875676bd46ce033b5753f1657', '宏海箱运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(421, 'RFHY', '54d35fd875676bd46ce033b5753f1657', '润丰航运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(422, 'PDZ', '54d35fd875676bd46ce033b5753f1657', '大众海运（马来西亚）', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(425, 'WGHY', '54d35fd875676bd46ce033b5753f1657', '重庆万港航运有限公司南京汉嘉代', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(426, 'MIS', '54d35fd875676bd46ce033b5753f1657', '马来西亚航运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(427, 'JINC', '54d35fd875676bd46ce033b5753f1657', '锦城', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(428, 'MRBA', '54d35fd875676bd46ce033b5753f1657', '南美邮船', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(429, 'TOLL', '54d35fd875676bd46ce033b5753f1657', '塔斯曼东方', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(430, 'AAL', '54d35fd875676bd46ce033b5753f1657', '嘉宏（澳大利亚线）', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(431, 'JSCO', '54d35fd875676bd46ce033b5753f1657', '江苏远洋', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(432, 'ASL', '54d35fd875676bd46ce033b5753f1657', '亚海航运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(433, 'WWL', '54d35fd875676bd46ce033b5753f1657', '环世捷运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(434, 'NDAL', '54d35fd875676bd46ce033b5753f1657', '尼罗河航运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(435, 'HASXP', '54d35fd875676bd46ce033b5753f1657', '海华夏普用箱', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(436, 'MAT', '54d35fd875676bd46ce033b5753f1657', '美森', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(437, 'HAS', '54d35fd875676bd46ce033b5753f1657', '海华', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(439, 'NDS', '54d35fd875676bd46ce033b5753f1657', '香港立德荷兰有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(440, 'SNT', '54d35fd875676bd46ce033b5753f1657', '江苏外运(外贸用箱）', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(441, 'FSCO', '54d35fd875676bd46ce033b5753f1657', '省外运代管远东国际海运箱', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(442, 'HGA', '54d35fd875676bd46ce033b5753f1657', '省外运借用、错用箱', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(443, 'SCL', '54d35fd875676bd46ce033b5753f1657', '省外运借用上海箱运箱', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(444, 'JSU', '54d35fd875676bd46ce033b5753f1657', '省外运退租箱', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(445, 'DON', '54d35fd875676bd46ce033b5753f1657', '江苏外运（松下专用）', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(446, 'TOY', '54d35fd875676bd46ce033b5753f1657', '外运油污箱', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(447, 'SUN', '54d35fd875676bd46ce033b5753f1657', '江苏外运阳光速航（内贸）', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(448, 'HUB', '54d35fd875676bd46ce033b5753f1657', '德利航运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(449, 'HTM', '54d35fd875676bd46ce033b5753f1657', '恒泰航运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(450, 'CSAV', '54d35fd875676bd46ce033b5753f1657', '南美轮船', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(452, 'MXL', '54d35fd875676bd46ce033b5753f1657', '玛利亚那船务', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(453, 'SITC', '54d35fd875676bd46ce033b5753f1657', '山东海丰（夏普）', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(454, 'NJXY', '54d35fd875676bd46ce033b5753f1657', '南京新运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(455, 'YCQDHY', '54d35fd875676bd46ce033b5753f1657', '源诚青岛货运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(456, 'KASE', '54d35fd875676bd46ce033b5753f1657', '源诚（青岛）国际货运公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(457, 'ZQGQLY', '54d35fd875676bd46ce033b5753f1657', '浙江国桥联运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(458, 'ZDDWSH', '54d35fd875676bd46ce033b5753f1657', '上海中大德威国际货运代理公司南', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(459, 'NJDFWL', '54d35fd875676bd46ce033b5753f1657', '南京鼎丰物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(460, 'NJSH', '54d35fd875676bd46ce033b5753f1657', '南京速航', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(461, 'NJJY', '54d35fd875676bd46ce033b5753f1657', '南京集运货运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(462, 'EZ', '54d35fd875676bd46ce033b5753f1657', '上海永璟物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(463, 'XHHTSH', '54d35fd875676bd46ce033b5753f1657', '新华海天南京办', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(464, 'JSQCHY', '54d35fd875676bd46ce033b5753f1657', '江苏浅草国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(465, 'MFTSHA', '54d35fd875676bd46ce033b5753f1657', '澳大利亚普运国际有限公司上海代', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(466, 'NJTJWL', '54d35fd875676bd46ce033b5753f1657', '南京梯级国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(467, 'ZXGJYS(4)', '54d35fd875676bd46ce033b5753f1657', '中新国际运输服务有限公司南京分', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(468, 'YZWLNJ', '54d35fd875676bd46ce033b5753f1657', '南京邮政电子商务物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(469, 'HY', '54d35fd875676bd46ce033b5753f1657', '安徽华洋国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(470, 'SZHYSH', '54d35fd875676bd46ce033b5753f1657', '深圳市华运物流有限公司上海分公', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(471, 'NJXGFB', '54d35fd875676bd46ce033b5753f1657', '南京新港富宝儲运有限责任公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(472, 'HUAHUI', '54d35fd875676bd46ce033b5753f1657', '华辉', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(473, 'SHDR', '54d35fd875676bd46ce033b5753f1657', '上海东日物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(474, 'TREK', '54d35fd875676bd46ce033b5753f1657', '上海信克灏鑫国际货运代理有限公', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(475, 'NJGHMY', '54d35fd875676bd46ce033b5753f1657', '南京冠华贸易有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(476, 'JSRJHD', '54d35fd875676bd46ce033b5753f1657', '江苏锐进国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(477, 'HFCXXT', '54d35fd875676bd46ce033b5753f1657', '华飞彩色系统有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tally_customer` (`id`, `customer_code`, `customer_pwd`, `customer_name`, `customer_shortname`, `customer_category`, `paytype`, `rate_id`, `linkman`, `telephone`, `customer_status`, `contract_number`, `contract_life`, `operator`, `operationtime`, `authority`) VALUES
(478, 'JSSTGF', '54d35fd875676bd46ce033b5753f1657', '江苏舜天股份有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(479, 'KTNQ', '54d35fd875676bd46ce033b5753f1657', '凯通南汽', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(480, 'JSPZ', '54d35fd875676bd46ce033b5753f1657', '江苏鹏志国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(481, 'NJTHWL(--)', '54d35fd875676bd46ce033b5753f1657', '南京天和物流实业有限公司第一分', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(482, 'YTXC', '54d35fd875676bd46ce033b5753f1657', '运通迅弛', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(483, 'JSJJ', '54d35fd875676bd46ce033b5753f1657', '江苏京锦', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(484, 'ZDYD/ZDSL', '54d35fd875676bd46ce033b5753f1657', '江苏正大远东国际物流中达申龙', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(485, 'NJLH', '54d35fd875676bd46ce033b5753f1657', '南京乐航国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(486, 'HOYE', '54d35fd875676bd46ce033b5753f1657', '南京鸿晔国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(487, 'NJTHWL一', '54d35fd875676bd46ce033b5753f1657', '南京天禾物流实业有限公司第一分', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(488, 'ZHJY', '54d35fd875676bd46ce033b5753f1657', '江苏中海集装箱运输有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(489, 'SHLYYS', '54d35fd875676bd46ce033b5753f1657', '上海乐耀国际货物运输代理有限公', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(490, 'STHX', '54d35fd875676bd46ce033b5753f1657', '江苏舜天恒信国际货运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(491, 'JSRJWL', '54d35fd875676bd46ce033b5753f1657', '江苏瑞嘉国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(492, 'NQ-GLKT', '54d35fd875676bd46ce033b5753f1657', '南青-格力空调', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(493, 'NJXINLIWL', '54d35fd875676bd46ce033b5753f1657', '南京鑫利物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(494, 'NJXL-WLY', '54d35fd875676bd46ce033b5753f1657', '南京鑫利－五粮液', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(495, 'ZCLOG', '54d35fd875676bd46ce033b5753f1657', '南京中驰物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(496, 'WDCO', '54d35fd875676bd46ce033b5753f1657', '东方海外物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(498, 'JSSY-YZHQ', '54d35fd875676bd46ce033b5753f1657', '江苏时运－仪征化纤', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(499, 'JSSY－PTA', '54d35fd875676bd46ce033b5753f1657', '江苏时运－PTA', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(500, 'JSSJWL', '54d35fd875676bd46ce033b5753f1657', '江苏时进国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(501, 'WYHY-GLKT', '54d35fd875676bd46ce033b5753f1657', '外运货运－格力空调', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(502, 'JSDSGJHY', '54d35fd875676bd46ce033b5753f1657', '江苏德舜国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(503, 'PDCWNJ', '54d35fd875676bd46ce033b5753f1657', '上海海兴国际货运有限公司江苏分', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(504, 'JSHRWL', '54d35fd875676bd46ce033b5753f1657', '江苏恒瑞物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(505, 'JSWYLY', '54d35fd875676bd46ce033b5753f1657', '江苏外运物流分公司陆运部', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(506, 'NJRH', '54d35fd875676bd46ce033b5753f1657', '南京瑞华国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(507, 'HKNQ', '54d35fd875676bd46ce033b5753f1657', '海口南青集装箱班轮公司南京办事', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(508, 'NJGHWL', '54d35fd875676bd46ce033b5753f1657', '南京广汇国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(509, 'NJHJWL', '54d35fd875676bd46ce033b5753f1657', '南京恒佳物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(510, 'JSCYWL', '54d35fd875676bd46ce033b5753f1657', '江苏诚运物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(511, 'NJDEHON', '54d35fd875676bd46ce033b5753f1657', '南京德鸿国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(512, 'CTGJWL', '54d35fd875676bd46ce033b5753f1657', '南京长天国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(513, 'HGNX', '54d35fd875676bd46ce033b5753f1657', '韩国南星海运株式会社', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(514, 'APLL', '54d35fd875676bd46ce033b5753f1657', '美集物流运输有限公司南京分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(515, 'JSHW', '54d35fd875676bd46ce033b5753f1657', '江苏航远国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(516, 'JSMIC', '54d35fd875676bd46ce033b5753f1657', '江苏海运国际货柜有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(517, 'NJHGHY', '54d35fd875676bd46ce033b5753f1657', '南京慧舸国际货运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(518, 'ZYPX', '54d35fd875676bd46ce033b5753f1657', '中艺拼箱', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(519, 'ZFH', '54d35fd875676bd46ce033b5753f1657', '中菲行国际货运代理有限公司南京', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(521, 'AHALK', '54d35fd875676bd46ce033b5753f1657', '安徽安利克', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(522, 'SHDXNJ', '54d35fd875676bd46ce033b5753f1657', '上海东曦船务有限公司南京分', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(523, 'SHDX', '54d35fd875676bd46ce033b5753f1657', '上海东曦船务有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(524, 'NJHF', '54d35fd875676bd46ce033b5753f1657', '南京华富集装箱运输有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(525, 'XHF', '54d35fd875676bd46ce033b5753f1657', '新海丰物流有限公司南京分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(526, 'SHTJ', '54d35fd875676bd46ce033b5753f1657', '上海天骏航运有限公司南京分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(527, 'HLS', '54d35fd875676bd46ce033b5753f1657', '上海华莱士南京分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(528, 'SHZX', '54d35fd875676bd46ce033b5753f1657', '上海泽翔国际货物运输代理有限公', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(529, 'ZGWY', '54d35fd875676bd46ce033b5753f1657', '中国外运江苏公司南京国际货运分', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(530, 'WK', '54d35fd875676bd46ce033b5753f1657', '五矿物流江苏有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(531, 'DPPX', '54d35fd875676bd46ce033b5753f1657', '东沛拼箱', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(532, 'HWHY', '54d35fd875676bd46ce033b5753f1657', '华威货运（中国）有限公司南京分', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(533, 'CQCAMS', '54d35fd875676bd46ce033b5753f1657', '重庆长安民生物流股份有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(534, 'NJZT', '54d35fd875676bd46ce033b5753f1657', '南京中腾物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(535, 'ADCNJ', '54d35fd875676bd46ce033b5753f1657', '上海伟集国际物流公司南京分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(536, 'BBCA', '54d35fd875676bd46ce033b5753f1657', '安徽丰原国际货运公司上海分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(537, 'YCWL', '54d35fd875676bd46ce033b5753f1657', '怡诚物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(538, 'NSS', '54d35fd875676bd46ce033b5753f1657', '南星海运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(539, 'JSLY', '54d35fd875676bd46ce033b5753f1657', '江苏省联运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(540, 'MAGANG', '54d35fd875676bd46ce033b5753f1657', '马钢', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(541, 'JSYYXSJ', '54d35fd875676bd46ce033b5753f1657', '江苏远洋新世纪货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(542, 'NJRFHY', '54d35fd875676bd46ce033b5753f1657', '南京润丰航运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(543, 'JSJM', '54d35fd875676bd46ce033b5753f1657', '江苏金茂储运有限公司南京分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(544, 'BGNL', '54d35fd875676bd46ce033b5753f1657', '江苏环球国际货运公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(545, 'XUANHONG', '54d35fd875676bd46ce033b5753f1657', '南京轩宏', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(546, 'LYGJ', '54d35fd875676bd46ce033b5753f1657', '江苏凌云国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(547, 'NJJLBG', '54d35fd875676bd46ce033b5753f1657', '南京金陵报关公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(548, 'MCI', '54d35fd875676bd46ce033b5753f1657', '脉中(上海)国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(549, 'SHYDGJ', '54d35fd875676bd46ce033b5753f1657', '上海亚东国际货运南京分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(551, 'SHHYHY', '54d35fd875676bd46ce033b5753f1657', '上海宏谊货运代理公司南京分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(552, 'CMALOG', '54d35fd875676bd46ce033b5753f1657', '达飞物流（中国）公司南京分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(553, 'ATWL', '54d35fd875676bd46ce033b5753f1657', '安徽艾特物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(555, 'NJLD', '54d35fd875676bd46ce033b5753f1657', '南京联合国际船舶代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(556, 'TCZJ', '54d35fd875676bd46ce033b5753f1657', '太仓中集集装箱制造有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(557, 'HJWL', '54d35fd875676bd46ce033b5753f1657', '华基物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(559, 'NJJHWL', '54d35fd875676bd46ce033b5753f1657', '南京捷泓国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(561, 'DFGJ', '54d35fd875676bd46ce033b5753f1657', '东方国际物流（集团）江苏分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(562, 'ZJWC', '54d35fd875676bd46ce033b5753f1657', '浙江物产国际货运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(563, 'TSHD', '54d35fd875676bd46ce033b5753f1657', '唐山海港海德船务货运代理有限公', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(564, 'OLCLHF', '54d35fd875676bd46ce033b5753f1657', '东方海外物流有限公司合肥分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(565, 'NLCNJ', '54d35fd875676bd46ce033b5753f1657', '日邮物流中国有限公司南京分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(566, 'NJKW', '54d35fd875676bd46ce033b5753f1657', '南京锟铻国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(567, 'SYGJ(一)', '54d35fd875676bd46ce033b5753f1657', '江苏苏亚国际货运有限公司1', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(568, 'JSSTGJ', '54d35fd875676bd46ce033b5753f1657', '江苏舜通国际物流有限公司南京分', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(569, 'CFS-JS(LH)', '54d35fd875676bd46ce033b5753f1657', 'CFS-上海嘉胜石油化工有限(硫磺)', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(570, 'CXIC', '54d35fd875676bd46ce033b5753f1657', '常州新华昌', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(571, 'DXHWL', '54d35fd875676bd46ce033b5753f1657', '大新华物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(575, 'TYC', '54d35fd875676bd46ce033b5753f1657', '扬州通运箱厂', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(576, 'JSYYGJ', '54d35fd875676bd46ce033b5753f1657', '江苏右原国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(577, 'TLSY', '54d35fd875676bd46ce033b5753f1657', '铜陵首运船货代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(578, 'NJJH', '54d35fd875676bd46ce033b5753f1657', '南京集海物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(579, 'JJWY', '54d35fd875676bd46ce033b5753f1657', '九江外运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(580, 'NJHQWL', '54d35fd875676bd46ce033b5753f1657', '南京海桥物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(581, 'SHYUANHAN', '54d35fd875676bd46ce033b5753f1657', '上海元瀚国际货运代理公司南京分', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(582, 'ZYGJCY', '54d35fd875676bd46ce033b5753f1657', '中艺储运江苏有限责任公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(583, 'JSYDKL', '54d35fd875676bd46ce033b5753f1657', '江苏远东快鹿物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(584, 'JSRH', '54d35fd875676bd46ce033b5753f1657', '江苏润航国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(585, 'QDYM', '54d35fd875676bd46ce033b5753f1657', '青岛阳明国际货运有限公司南京分', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(586, 'ZHCW-YHP', '54d35fd875676bd46ce033b5753f1657', '中海船务-氧化皮', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(587, 'YDGJWL', '54d35fd875676bd46ce033b5753f1657', '江苏永德国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(588, 'NJWS-LH', '54d35fd875676bd46ce033b5753f1657', '南京伟仕硫磺', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(589, 'DY', '54d35fd875676bd46ce033b5753f1657', '东映海运株式会社', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(590, 'CNNKGLT', '54d35fd875676bd46ce033b5753f1657', '南京龙潭码头', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(591, 'BA-SHI', '54d35fd875676bd46ce033b5753f1657', '江苏巴士悦信物流发展有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(598, 'GS', '54d35fd875676bd46ce033b5753f1657', '重庆港盛船务有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(599, 'JLBG', '54d35fd875676bd46ce033b5753f1657', '金陵报关', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(600, 'NJYH', '54d35fd875676bd46ce033b5753f1657', '南京运鸿国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(601, 'PDHYSH', '54d35fd875676bd46ce033b5753f1657', '上海浦东国际货运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(602, 'BJYGSH', '54d35fd875676bd46ce033b5753f1657', '北京阳光国际货运有限公司上海分', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(603, 'SHFY', '54d35fd875676bd46ce033b5753f1657', '上海泛洋货运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(604, 'JHDL', '54d35fd875676bd46ce033b5753f1657', '嘉宏国际运输代理有限公司南京分', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(605, 'JSSMKS', '54d35fd875676bd46ce033b5753f1657', '江苏苏迈克斯国际货运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(606, 'SHHX', '54d35fd875676bd46ce033b5753f1657', '上海海兴国际货运江苏分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(607, 'NJSLY', '54d35fd875676bd46ce033b5753f1657', '南京联运国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(608, 'SHD', '54d35fd875676bd46ce033b5753f1657', '江苏苏华达新材料有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(609, 'MSLC', '54d35fd875676bd46ce033b5753f1657', '民生轮船有限公司南京分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(610, 'NJLY', '54d35fd875676bd46ce033b5753f1657', '上海乐耀南京分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(611, 'JSLY(2)', '54d35fd875676bd46ce033b5753f1657', '江苏省联运有限公司第二分公司.', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(612, 'AHXJWL', '54d35fd875676bd46ce033b5753f1657', '安徽迅捷物流有限责任公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(613, 'JSHXL', '54d35fd875676bd46ce033b5753f1657', '江苏恒鑫隆国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(614, 'AHXC', '54d35fd875676bd46ce033b5753f1657', '安徽星辰国际货运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(615, 'NJTHWL', '54d35fd875676bd46ce033b5753f1657', '南京天禾物流实业有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(616, 'JSDT', '54d35fd875676bd46ce033b5753f1657', '江苏大田国际货运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(617, 'YFWL', '54d35fd875676bd46ce033b5753f1657', '南京元飞物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(620, 'SIT', '54d35fd875676bd46ce033b5753f1657', '山东海丰', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(621, 'JSKT', '54d35fd875676bd46ce033b5753f1657', '江苏凯通', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(622, 'NTJHT', '54d35fd875676bd46ce033b5753f1657', '南通江海通集装箱运输有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(625, 'NJHY', '54d35fd875676bd46ce033b5753f1657', '南京华运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(626, 'JSJY', '54d35fd875676bd46ce033b5753f1657', '江苏暨阳国际货运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(627, 'IFBNJ', '54d35fd875676bd46ce033b5753f1657', '南京国桥联运有限公司南京', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(629, 'KKK', '54d35fd875676bd46ce033b5753f1657', '川崎汽船', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(630, 'MSHD', '54d35fd875676bd46ce033b5753f1657', '民生国际货运代理有限公司江苏分', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(631, 'SHATY', '54d35fd875676bd46ce033b5753f1657', '上海泰缘货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(632, 'SHRJHY', '54d35fd875676bd46ce033b5753f1657', '上海日进国际货运有限公司江苏分', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(633, 'NJLM-GLKT', '54d35fd875676bd46ce033b5753f1657', '南京龙门－格力空调', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(635, 'HYGJ', '54d35fd875676bd46ce033b5753f1657', '南京鸿晔国际货运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(636, 'JSZH', '54d35fd875676bd46ce033b5753f1657', '江苏中远国际货运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(637, 'WSDC', '54d35fd875676bd46ce033b5753f1657', '伟士德诚中国有限公司南京分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(638, 'JSJC', '54d35fd875676bd46ce033b5753f1657', '江苏锦程国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(639, 'YZJ', '54d35fd875676bd46ce033b5753f1657', '中国扬子江轮船股份有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(640, 'JSYZJHY', '54d35fd875676bd46ce033b5753f1657', '江苏永之景国际货运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(641, 'ZGHY', '54d35fd875676bd46ce033b5753f1657', '中钢集团国际货运公司江苏分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(642, 'NJGH', '54d35fd875676bd46ce033b5753f1657', '南京国货', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(643, 'JSLT', '54d35fd875676bd46ce033b5753f1657', '江苏领通国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(645, 'JLJY', '54d35fd875676bd46ce033b5753f1657', '江苏金陵交运国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(646, 'JDGJ', '54d35fd875676bd46ce033b5753f1657', '捷达国际运输公司南京分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(647, 'NJHWHY', '54d35fd875676bd46ce033b5753f1657', '南京海外国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(649, 'CSCLLJ', '54d35fd875676bd46ce033b5753f1657', '江苏中海集装箱运输有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(652, 'ZYCD', '54d35fd875676bd46ce033b5753f1657', '中远船代', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(654, 'SHJH', '54d35fd875676bd46ce033b5753f1657', '上海集海', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(655, 'YHHY', '54d35fd875676bd46ce033b5753f1657', '运河航运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(658, 'HACW', '54d35fd875676bd46ce033b5753f1657', '华安船务有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(661, 'JSZDYD', '54d35fd875676bd46ce033b5753f1657', '江苏正大远东国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(662, 'NIFC', '54d35fd875676bd46ce033b5753f1657', '南京国际货运有限责任公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(663, 'SHLY-FLJK', '54d35fd875676bd46ce033b5753f1657', '上海乐耀废料进口', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(664, 'JSJLGJ', '54d35fd875676bd46ce033b5753f1657', '江苏君临国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(665, 'KTPX', '54d35fd875676bd46ce033b5753f1657', '凯通拼箱', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(666, 'WYXY', '54d35fd875676bd46ce033b5753f1657', '江苏中外运有限公司集装箱运输公', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(667, 'CHGLKT', '54d35fd875676bd46ce033b5753f1657', '重海-格立空调', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(668, 'YFYY', '54d35fd875676bd46ce033b5753f1657', '元丰远洋物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(669, 'YADONG', '54d35fd875676bd46ce033b5753f1657', '上海亚东', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(670, 'JSYTXC', '54d35fd875676bd46ce033b5753f1657', '江苏运通迅驰物流贸易有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(671, 'SHQZ', '54d35fd875676bd46ce033b5753f1657', '上海勤展物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(672, 'HM', '54d35fd875676bd46ce033b5753f1657', '港中旅华贸国际物流股份有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(673, 'WFNJ', '54d35fd875676bd46ce033b5753f1657', '南京长茂国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(674, 'TPJY', '54d35fd875676bd46ce033b5753f1657', '太平集运服务(中国)南京分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(675, 'JLJYHG', '54d35fd875676bd46ce033b5753f1657', '江苏金陵交运集团南京化工物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(677, 'CQLC', '54d35fd875676bd46ce033b5753f1657', '重庆长江轮船公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(680, 'THSY', '54d35fd875676bd46ce033b5753f1657', '通海水运公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(681, 'SCSY', '54d35fd875676bd46ce033b5753f1657', '四川水运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(682, 'SHSG', '54d35fd875676bd46ce033b5753f1657', '上海顺港', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(683, 'OLCL', '54d35fd875676bd46ce033b5753f1657', '东方海外物流南京分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(686, 'MSKLOG', '54d35fd875676bd46ce033b5753f1657', '马士基物流南京分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(689, 'COH', '54d35fd875676bd46ce033b5753f1657', '京汉航运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(692, 'SHYYWL', '54d35fd875676bd46ce033b5753f1657', '上海亚运物流有限公司南京分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(693, 'JSWYWL', '54d35fd875676bd46ce033b5753f1657', '江苏中外运有限公司物流分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(694, 'JSZBGJ', '54d35fd875676bd46ce033b5753f1657', '江苏致邦国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(695, 'YZHS', '54d35fd875676bd46ce033b5753f1657', '扬州华顺船务', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(696, 'SHWL', '54d35fd875676bd46ce033b5753f1657', '上海中外运化工国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(697, 'NJXHYJ', '54d35fd875676bd46ce033b5753f1657', '南京信航亚捷国际货运代理有限', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(698, 'KZK', '54d35fd875676bd46ce033b5753f1657', '南京阔之阔国际贸易有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(699, 'NJXBHY', '54d35fd875676bd46ce033b5753f1657', '南京鑫邦国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(701, 'FHHGJ', '54d35fd875676bd46ce033b5753f1657', '南京富亨华国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(702, 'FREEUSE', '54d35fd875676bd46ce033b5753f1657', '免费使用箱', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(703, 'TSCA', '54d35fd875676bd46ce033b5753f1657', '德翔航运有限公司(指定港口用箱', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(704, 'NJXYH', '54d35fd875676bd46ce033b5753f1657', '南京信源和有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(705, 'DHHY', '54d35fd875676bd46ce033b5753f1657', '上海东翰航运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(706, 'ZTH', '54d35fd875676bd46ce033b5753f1657', '江苏中通华物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(707, 'PCS', '54d35fd875676bd46ce033b5753f1657', '上海振华国际船务代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(708, 'UNICO', '54d35fd875676bd46ce033b5753f1657', '上海优尼康国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(709, 'TJTZ', '54d35fd875676bd46ce033b5753f1657', '通集退租', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(710, 'SAP', '54d35fd875676bd46ce033b5753f1657', '江苏外运阳光速航（内贸）', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(711, 'TJHY', '54d35fd875676bd46ce033b5753f1657', '通集海运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(713, 'SHHS', '54d35fd875676bd46ce033b5753f1657', '上海汉升', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(714, 'YZSZ', '54d35fd875676bd46ce033b5753f1657', '扬州顺泽船务有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(715, 'TLZR', '54d35fd875676bd46ce033b5753f1657', '铜陵志润物流有限责任公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(716, 'CHXYS', '54d35fd875676bd46ce033b5753f1657', '长航新洋山公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(718, 'DFHR', '54d35fd875676bd46ce033b5753f1657', '东方鸿润', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(721, 'WHCW', '54d35fd875676bd46ce033b5753f1657', '武汉长伟国际船舶代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(722, 'CZWY', '54d35fd875676bd46ce033b5753f1657', '池州外运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(723, 'HACY', '54d35fd875676bd46ce033b5753f1657', '淮安漕运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(724, 'HWWL', '54d35fd875676bd46ce033b5753f1657', '航威物流江苏有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(725, 'NJYN', '54d35fd875676bd46ce033b5753f1657', '南京甬宁', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(727, 'MSL', '54d35fd875676bd46ce033b5753f1657', '民生国际江苏分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(729, 'RSUN', '54d35fd875676bd46ce033b5753f1657', '弘阳货运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(731, 'MSA', '54d35fd875676bd46ce033b5753f1657', '海事', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(733, 'TJHD', '54d35fd875676bd46ce033b5753f1657', '通集合德', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(734, 'MSADZ', '54d35fd875676bd46ce033b5753f1657', '海事代征点', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(735, 'LTXG', '54d35fd875676bd46ce033b5753f1657', '龙潭箱管', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(736, 'TLWY', '54d35fd875676bd46ce033b5753f1657', '中国外运安徽有限公司铜陵分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(737, 'HAPAG', '54d35fd875676bd46ce033b5753f1657', '赫伯罗特船务（中国）有限公司南京分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(738, 'HBNMX', '54d35fd875676bd46ce033b5753f1657', '汉堡南美航运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(739, 'KTE', '54d35fd875676bd46ce033b5753f1657', '凯通内贸上水', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(740, 'DEV', '54d35fd875676bd46ce033b5753f1657', '开发船代', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(741, 'BBHL', '54d35fd875676bd46ce033b5753f1657', '蚌埠货轮', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(742, 'NJDJ', '54d35fd875676bd46ce033b5753f1657', '南京德锦船务有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(743, 'NICC', '54d35fd875676bd46ce033b5753f1657', 'NICC', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(744, 'AHJH', '54d35fd875676bd46ce033b5753f1657', '中赢吉海物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(755, 'NJDJ', '54d35fd875676bd46ce033b5753f1657', '南京德锦船务有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(756, 'ZEN', '54d35fd875676bd46ce033b5753f1657', '全通（天津）实业有限公司上海分', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(763, 'WYCZ', '54d35fd875676bd46ce033b5753f1657', '中国外运安徽有限公司池州分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(764, 'CUL', '54d35fd875676bd46ce033b5753f1657', '中联航运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(766, 'ZYDNY', '54d35fd875676bd46ce033b5753f1657', '中远集运东南亚有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(767, 'MSAJ', '54d35fd875676bd46ce033b5753f1657', '民生内贸借用箱', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(768, 'NUC', '54d35fd875676bd46ce033b5753f1657', '宁波远洋内贸', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(769, 'NBOS', '54d35fd875676bd46ce033b5753f1657', '宁波远洋外贸', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(774, 'BBHL', '54d35fd875676bd46ce033b5753f1657', '蚌埠货轮', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(775, 'HSDNKG', '54d35fd875676bd46ce033b5753f1657', '汉堡南美（中国）有限公司南京分', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(776, 'NBYY', '54d35fd875676bd46ce033b5753f1657', '宁波远洋运输有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(779, 'CKS', '54d35fd875676bd46ce033b5753f1657', '天敬海运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(780, 'TC', '54d35fd875676bd46ce033b5753f1657', '天策', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(781, 'ZT', '54d35fd875676bd46ce033b5753f1657', '中天', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(783, 'SUNA', '54d35fd875676bd46ce033b5753f1657', '江苏外运阳光速航内贸', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(784, 'ESL', '54d35fd875676bd46ce033b5753f1657', '香港阿联酋船务', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(785, 'NQB', '54d35fd875676bd46ce033b5753f1657', '南青B', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(786, 'LX', '54d35fd875676bd46ce033b5753f1657', '力轩', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(787, 'ACSC', '54d35fd875676bd46ce033b5753f1657', '中海优质箱', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(788, 'GTX', '54d35fd875676bd46ce033b5753f1657', '宁波港通顺达物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, '2017-09-04 11:45:20', NULL),
(789, 'AHFY', '54d35fd875676bd46ce033b5753f1657', '安徽丰原国际货运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(790, 'AHMAS', '54d35fd875676bd46ce033b5753f1657', '安徽马鞍山中外运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(791, 'AHXW', '54d35fd875676bd46ce033b5753f1657', '安徽翔威国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(792, 'AQDW', '54d35fd875676bd46ce033b5753f1657', '安庆大旺食品有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(793, 'AQWW', '54d35fd875676bd46ce033b5753f1657', '安庆旺旺食品有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(794, 'BAXK', '54d35fd875676bd46ce033b5753f1657', '博爱新开源制药股份有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(795, 'BJBF', '54d35fd875676bd46ce033b5753f1657', '北京百福东方国际物流有限责任公司南京分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(796, 'BJSJ', '54d35fd875676bd46ce033b5753f1657', '北京世纪震天商贸有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(797, 'BSPR', '54d35fd875676bd46ce033b5753f1657', '宝胜普睿司曼电缆有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(798, 'CZXX', '54d35fd875676bd46ce033b5753f1657', '常州闲兴服饰有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(799, 'DLCS', '54d35fd875676bd46ce033b5753f1657', '大连传世佰斯物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(800, 'DTNJ', '54d35fd875676bd46ce033b5753f1657', '大唐南京发电厂', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(801, 'GJGJ', '54d35fd875676bd46ce033b5753f1657', '港捷（中国）国际货运有限公司南京分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(802, 'GZLNJ', '54d35fd875676bd46ce033b5753f1657', '港中旅华贸国际物流股份有限公司南京分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(803, 'GZLYZ', '54d35fd875676bd46ce033b5753f1657', '港中旅华贸国际物流股份有限公司扬州分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(804, 'HAJR', '54d35fd875676bd46ce033b5753f1657', '淮安境润食品有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(805, 'HAWB', '54d35fd875676bd46ce033b5753f1657', '淮安万邦香料工业有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(806, 'HAWW', '54d35fd875676bd46ce033b5753f1657', '淮安旺旺食品有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(807, 'HAYH', '54d35fd875676bd46ce033b5753f1657', '淮安市羽韩时装有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(808, 'HFWW', '54d35fd875676bd46ce033b5753f1657', '合肥旺旺食品有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(809, 'HHGJ', '54d35fd875676bd46ce033b5753f1657', '华辉国际运输服务有限公司江苏分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(810, 'HHHY', '54d35fd875676bd46ce033b5753f1657', '华威货运（中国）有限公司南京分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(811, 'HNDL', '54d35fd875676bd46ce033b5753f1657', '华能国际电力股份有限公司南京电厂', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(812, 'HNFY', '54d35fd875676bd46ce033b5753f1657', '海南泛洋航运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(813, 'HNKY', '54d35fd875676bd46ce033b5753f1657', '淮南矿业(集团)有限责任公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(814, 'HTJQ', '54d35fd875676bd46ce033b5753f1657', '恒通机械', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(815, 'JHGJ', '54d35fd875676bd46ce033b5753f1657', '嘉宏国际运输代理有限公司南京分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(816, 'JSAES', '54d35fd875676bd46ce033b5753f1657', '江苏艾尔斯国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(817, 'JSAS', '54d35fd875676bd46ce033b5753f1657', '江苏安森国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(818, 'JSCH', '54d35fd875676bd46ce033b5753f1657', '江苏驰航国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(820, 'JSDW', '54d35fd875676bd46ce033b5753f1657', '江苏东威国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(821, 'JSDY', '54d35fd875676bd46ce033b5753f1657', '江苏德运国际货运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(822, 'JSFS', '54d35fd875676bd46ce033b5753f1657', '江苏富时国际贸易有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(823, 'JSGH', '54d35fd875676bd46ce033b5753f1657', '江苏广汇国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(824, 'JSGTW', '54d35fd875676bd46ce033b5753f1657', '江苏盖特威物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(826, 'JSHR', '54d35fd875676bd46ce033b5753f1657', '江苏恒瑞物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(827, 'JSHRGJ', '54d35fd875676bd46ce033b5753f1657', '江苏恒瑞国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(828, 'JSHYGJHY', '54d35fd875676bd46ce033b5753f1657', '江苏恒扬国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(829, 'JSHZ', '54d35fd875676bd46ce033b5753f1657', '江苏皓泽国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(830, 'JSHZJ', '54d35fd875676bd46ce033b5753f1657', '江苏海之杰国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(831, 'JSHZT', '54d35fd875676bd46ce033b5753f1657', '江苏汇众通国际供应链管理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(832, 'JSJT', '54d35fd875676bd46ce033b5753f1657', '江苏九天国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(834, '50', '54d35fd875676bd46ce033b5753f1657', '马鞍山钢铁股份有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(835, 'JSLN', '54d35fd875676bd46ce033b5753f1657', '江苏律宁国际货物运输代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(836, 'MDHY', '54d35fd875676bd46ce033b5753f1657', '江苏美度国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(837, 'JSNJ', '54d35fd875676bd46ce033b5753f1657', '江苏凝结国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(838, 'JSNR', '54d35fd875676bd46ce033b5753f1657', '江苏南热发电有限责任公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(839, '56', '54d35fd875676bd46ce033b5753f1657', '安徽马鞍山中外运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(840, 'JSOX', '54d35fd875676bd46ce033b5753f1657', '江苏欧新国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(841, '405', '54d35fd875676bd46ce033b5753f1657', '安徽马鞍山中外运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(842, 'JSQC', '54d35fd875676bd46ce033b5753f1657', '江苏浅草国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(843, 'JSRJ', '54d35fd875676bd46ce033b5753f1657', '江苏瑞嘉国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(844, 'JSSJ', '54d35fd875676bd46ce033b5753f1657', '江苏时进国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(845, 'JSSW', '54d35fd875676bd46ce033b5753f1657', '江苏苏皖煤电有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(846, 'JSTC', '54d35fd875676bd46ce033b5753f1657', '江苏天策报关代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(847, 'JSWL', '54d35fd875676bd46ce033b5753f1657', '江苏物利国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(848, 'JSWLD', '54d35fd875676bd46ce033b5753f1657', '江苏万利达国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(849, 'JSWM', '54d35fd875676bd46ce033b5753f1657', '江苏唯美国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(850, 'JSXHT', '54d35fd875676bd46ce033b5753f1657', '江苏新海天国际贸易有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(851, 'JSYM', '54d35fd875676bd46ce033b5753f1657', '江苏英明国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(852, 'JSYY', '54d35fd875676bd46ce033b5753f1657', '江苏远洋新世纪货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, '2017-05-04 13:41:52', NULL),
(853, 'JSZHCW', '54d35fd875676bd46ce033b5753f1657', '江苏中海船务代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(854, 'JSZP', '54d35fd875676bd46ce033b5753f1657', '江苏中浦国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(855, 'JSZR', '54d35fd875676bd46ce033b5753f1657', '江苏中瑞国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(856, 'JSZTH', '54d35fd875676bd46ce033b5753f1657', '江苏中通华物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(857, 'MAGT', '54d35fd875676bd46ce033b5753f1657', '马鞍山钢铁股份有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(858, 'MASDTF', '54d35fd875676bd46ce033b5753f1657', '马鞍山当涂发电有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(859, 'MSGJJS', '54d35fd875676bd46ce033b5753f1657', '民生国际货物运输代理有限公司江苏分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(860, 'NBYY', '54d35fd875676bd46ce033b5753f1657', '宁波远洋运输有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(861, 'NJBA', '54d35fd875676bd46ce033b5753f1657', '南京倍安集装箱运输有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(862, 'NJBS', '54d35fd875676bd46ce033b5753f1657', '南京博尚国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(863, 'NJCMGD', '54d35fd875676bd46ce033b5753f1657', '南京长明光电科技有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(864, 'NJCM', '54d35fd875676bd46ce033b5753f1657', '南京丞美通关有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(865, 'NJCT', '54d35fd875676bd46ce033b5753f1657', '南京长天国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(866, 'NJCWY', '54d35fd875676bd46ce033b5753f1657', '南京晨威阳国际贸易有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(867, 'NJDF', '54d35fd875676bd46ce033b5753f1657', '南京东方集装箱有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(868, 'NJDHGJ', '54d35fd875676bd46ce033b5753f1657', '南京德鸿国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(869, 'NJDHWL', '54d35fd875676bd46ce033b5753f1657', '南京东华物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(870, 'NJDS', '54d35fd875676bd46ce033b5753f1657', '南京港第三港务公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(871, 'NJJTDS', '54d35fd875676bd46ce033b5753f1657', '南京港口集团第四港务公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(872, 'NJDSYS', '54d35fd875676bd46ce033b5753f1657', '南京德舜运输有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(873, 'NJDW', '54d35fd875676bd46ce033b5753f1657', '南京大旺食品有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(874, 'NJFBS', '54d35fd875676bd46ce033b5753f1657', '南京富布斯建材有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(875, 'NJFLD', '54d35fd875676bd46ce033b5753f1657', '南京复德利物资购销中心', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(876, 'NJFST', '54d35fd875676bd46ce033b5753f1657', '南京富士通计算机设备有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(877, 'NJFW', '54d35fd875676bd46ce033b5753f1657', '南京福旺食品有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(878, 'NJFX', '54d35fd875676bd46ce033b5753f1657', '南京福星国际船舶代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(879, 'NJGHGJ', '54d35fd875676bd46ce033b5753f1657', '南京广汇国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(880, 'NJGLX', '54d35fd875676bd46ce033b5753f1657', '南京高利兴国际货物运输代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(881, 'NJGP', '54d35fd875676bd46ce033b5753f1657', '南京高平物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(883, 'NJHB', '54d35fd875676bd46ce033b5753f1657', '南京汉宝工业原料有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(884, 'NJHHJY', '54d35fd875676bd46ce033b5753f1657', '南京浩航集运国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(885, 'NJHK', '54d35fd875676bd46ce033b5753f1657', '南京宏康报关有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(886, 'NJHRHY', '54d35fd875676bd46ce033b5753f1657', '南京恒瑞海运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(887, 'JSHK', '54d35fd875676bd46ce033b5753f1657', '江苏宏康通关物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'N', NULL, NULL, NULL, NULL, NULL),
(888, 'NJHR', '54d35fd875676bd46ce033b5753f1657', '南京华润热电有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(890, 'NJJL', '54d35fd875676bd46ce033b5753f1657', '南京金陵报关公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(891, 'NJKF', '54d35fd875676bd46ce033b5753f1657', '南京柯发物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(892, 'NJKFWL', '54d35fd875676bd46ce033b5753f1657', '南京凯丰物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(893, 'NJKH', '54d35fd875676bd46ce033b5753f1657', '南京琨华货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(894, 'NJKS', '54d35fd875676bd46ce033b5753f1657', '南京卡森物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(895, 'NJKT', '54d35fd875676bd46ce033b5753f1657', '南京开泰集装箱储运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(896, 'NJKY', '54d35fd875676bd46ce033b5753f1657', '南京坤源运输仓储有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(897, 'NJLC', '54d35fd875676bd46ce033b5753f1657', '南京联诚物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(898, 'NJLL', '54d35fd875676bd46ce033b5753f1657', '南京利龙物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(899, 'NJLT', '54d35fd875676bd46ce033b5753f1657', '南京龙潭港集装箱有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(900, 'NJLZ', '54d35fd875676bd46ce033b5753f1657', '南京联众快运物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(901, 'NJMYM', '54d35fd875676bd46ce033b5753f1657', '南京美裕鸣货运服务有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(902, 'NJNJ', '54d35fd875676bd46ce033b5753f1657', '南京凝结国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(903, 'NJSL', '54d35fd875676bd46ce033b5753f1657', '南京神鹿运输有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(904, 'NJSN', '54d35fd875676bd46ce033b5753f1657', '南京泗宁绿色食品开发运用服务部', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(905, 'NJST', '54d35fd875676bd46ce033b5753f1657', '南京速腾物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(906, 'NJSYD', '54d35fd875676bd46ce033b5753f1657', '南京顺亚达物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(907, 'ZWYCW', '54d35fd875676bd46ce033b5753f1657', '江苏中外运船务代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(908, 'NJTHGJ', '54d35fd875676bd46ce033b5753f1657', '南京天钬国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(909, 'NJTHJ', '54d35fd875676bd46ce033b5753f1657', '南京通海集装箱航运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(910, 'NJTTDY', '54d35fd875676bd46ce033b5753f1657', '南京通天达宇集装箱运输公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(911, 'NJTX', '54d35fd875676bd46ce033b5753f1657', '南京腾翔国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(912, 'ZGNJWD', '54d35fd875676bd46ce033b5753f1657', '中国南京外轮代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(913, 'NJWW', '54d35fd875676bd46ce033b5753f1657', '南京旺旺食品有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(914, 'NJDH', '54d35fd875676bd46ce033b5753f1657', '南京东华物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(916, 'NJXED', '54d35fd875676bd46ce033b5753f1657', '南京协尔达国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(917, 'NJXH', '54d35fd875676bd46ce033b5753f1657', '南京轩宏国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(918, 'NJXK', '54d35fd875676bd46ce033b5753f1657', '南京欣快物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(919, 'NJXL', '54d35fd875676bd46ce033b5753f1657', '南京鑫利物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(920, 'NJXM', '54d35fd875676bd46ce033b5753f1657', '南京新木物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(921, 'NJYD', '54d35fd875676bd46ce033b5753f1657', '南京远东国际船舶代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(922, 'NJYN', '54d35fd875676bd46ce033b5753f1657', '南京优能国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(923, 'NJYR', '54d35fd875676bd46ce033b5753f1657', '南京宇瑞物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(924, 'NJYYGJ', '54d35fd875676bd46ce033b5753f1657', '南京远运国际船舶代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(925, 'NJYYWL', '54d35fd875676bd46ce033b5753f1657', '南京宇业物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(926, 'NJZYCW', '54d35fd875676bd46ce033b5753f1657', '南京中远集装箱船务代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(927, 'NTDX', '54d35fd875676bd46ce033b5753f1657', '南通大新物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(928, 'QJHL', '54d35fd875676bd46ce033b5753f1657', '全椒海螺水泥有限责任公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(929, 'SGCJ', '54d35fd875676bd46ce033b5753f1657', '上港集团长江港口物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(930, 'SHAW', '54d35fd875676bd46ce033b5753f1657', '上海遨未国际物流有限公司南京分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(931, 'SHCSD', '54d35fd875676bd46ce033b5753f1657', '上海畅顺达国际物流有限公司南京分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(932, 'SHFYHY', '54d35fd875676bd46ce033b5753f1657', '上海富怡货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(933, 'NQA', '54d35fd875676bd46ce033b5753f1657', '南青A', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(934, 'TCLC', '54d35fd875676bd46ce033b5753f1657', '太仓港集装箱海运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(935, 'TCLA', '54d35fd875676bd46ce033b5753f1657', '太仓海运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(937, 'TLPE', '54d35fd875676bd46ce033b5753f1657', '太仓海运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(938, 'TLPR', '54d35fd875676bd46ce033b5753f1657', '太仓海运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(939, 'AHHQ', '54d35fd875676bd46ce033b5753f1657', '安徽省海桥集装箱有运输有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tally_customer` (`id`, `customer_code`, `customer_pwd`, `customer_name`, `customer_shortname`, `customer_category`, `paytype`, `rate_id`, `linkman`, `telephone`, `customer_status`, `contract_number`, `contract_life`, `operator`, `operationtime`, `authority`) VALUES
(940, 'LTGCFS', '54d35fd875676bd46ce033b5753f1657', '龙潭港进口拼箱提货', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(941, 'ZWYHG', '54d35fd875676bd46ce033b5753f1657', '中外运化工', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(942, 'NJFC', '54d35fd875676bd46ce033b5753f1657', '食检处', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(944, 'SHPH', '54d35fd875676bd46ce033b5753f1657', '上海浦海航运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(945, 'SHSMD', '54d35fd875676bd46ce033b5753f1657', '上海苏美达国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(946, 'SHTH', '54d35fd875676bd46ce033b5753f1657', '上海天恒国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(947, 'NJYY', '54d35fd875676bd46ce033b5753f1657', '南京远洋国际船舶代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(948, 'TCHY', '54d35fd875676bd46ce033b5753f1657', '太仓港集装箱海运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(949, 'TCWL', '54d35fd875676bd46ce033b5753f1657', '通诚物流（烟台）有限公司南京分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(950, 'WKCW', '54d35fd875676bd46ce033b5753f1657', '五矿船务代理有限责任公司南京分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(951, 'WKWL', '54d35fd875676bd46ce033b5753f1657', '五矿物流江苏有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(952, 'XZDW', '54d35fd875676bd46ce033b5753f1657', '徐州大旺食品有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(953, 'YDLS', '54d35fd875676bd46ce033b5753f1657', '江苏亚东朗升国际物流有限公司南京分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(954, 'YGSH', '54d35fd875676bd46ce033b5753f1657', '中国外运阳光速航运输有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(955, 'YTYY', '54d35fd875676bd46ce033b5753f1657', '烟台市翔宇物资有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(956, 'ZGGJ', '54d35fd875676bd46ce033b5753f1657', '中钢国际货运江苏有限责任公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(957, 'ZGSL', '54d35fd875676bd46ce033b5753f1657', '中国水泥厂有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(959, 'ZGWYGC', '54d35fd875676bd46ce033b5753f1657', '中国外运长江有限公司工程项目物流事业部', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(960, 'ZGWYHD', '54d35fd875676bd46ce033b5753f1657', '中国外运华东有限公司金陵分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(961, 'ZGWYNJ', '54d35fd875676bd46ce033b5753f1657', '中国外运长江有限公司南京分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(962, 'ZLNM', '54d35fd875676bd46ce033b5753f1657', '中铝内蒙古国贸有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(963, 'ZWYJS', '54d35fd875676bd46ce033b5753f1657', '中外运集装箱运输有限公司江苏分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(964, 'ZYJZX', '54d35fd875676bd46ce033b5753f1657', '中远集装箱运输有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(965, 'ALMY', '54d35fd875676bd46ce033b5753f1657', '南京傲朗贸易有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(966, 'ASGJ', '54d35fd875676bd46ce033b5753f1657', '江苏安森国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(967, 'BCGJ', '54d35fd875676bd46ce033b5753f1657', '上海宝驰国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(968, 'BHWL', '54d35fd875676bd46ce033b5753f1657', '镇江宝华物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(969, 'BSWL', '54d35fd875676bd46ce033b5753f1657', '南京博尚国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(970, 'BTYY', '54d35fd875676bd46ce033b5753f1657', '南京博通洋运船舶管理有限责任公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(971, 'CJGK', '54d35fd875676bd46ce033b5753f1657', '上港集团长江港口物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(972, 'CMGD', '54d35fd875676bd46ce033b5753f1657', '南京长明光电科技有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(973, 'CQHH', '54d35fd875676bd46ce033b5753f1657', '重庆浩航国际船舶代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(974, 'CQLMZ', '54d35fd875676bd46ce033b5753f1657', '重庆市辣妹子商贸有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(975, 'CWGJ', '54d35fd875676bd46ce033b5753f1657', '上海遨未国际物流有限公司南京分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(976, 'CXWL', '54d35fd875676bd46ce033b5753f1657', '江苏长兴国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(977, 'DFHY', '54d35fd875676bd46ce033b5753f1657', '福建东方海运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(978, 'DFTJ', '54d35fd875676bd46ce033b5753f1657', '江苏省东方糖酒有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(979, 'DFWL', '54d35fd875676bd46ce033b5753f1657', '东方海外物流南京分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(980, 'DHSM', '54d35fd875676bd46ce033b5753f1657', '南京鼎华商贸有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(981, 'DONGPEI', '54d35fd875676bd46ce033b5753f1657', '江苏东沛进出口货运有限责任公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(982, 'DSCY', '54d35fd875676bd46ce033b5753f1657', '南通德仕储运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(983, 'DWGJ', '54d35fd875676bd46ce033b5753f1657', '江苏东威国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(984, 'DZHY', '54d35fd875676bd46ce033b5753f1657', '上海定展航运有限公司南京分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(986, 'FSGJ', '54d35fd875676bd46ce033b5753f1657', '江苏富时国际贸易有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(987, 'FST', '54d35fd875676bd46ce033b5753f1657', '南京富士通计算机设备有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(988, 'FYHY', '54d35fd875676bd46ce033b5753f1657', '上海富怡货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(989, 'GCHY', '54d35fd875676bd46ce033b5753f1657', '南京沽晨货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(990, 'GFGJ', '54d35fd875676bd46ce033b5753f1657', '上海共繁国际货物运输代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(991, 'GY', '54d35fd875676bd46ce033b5753f1657', '基业国际货运(中国)有限公司南京', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(992, 'GZWL', '54d35fd875676bd46ce033b5753f1657', '南京广泽物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(993, 'HBGY', '54d35fd875676bd46ce033b5753f1657', '南京汉宝工业原料有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(994, 'JSLH', '54d35fd875676bd46ce033b5753f1657', '江苏联鸿国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(996, 'JSSANFENG', '54d35fd875676bd46ce033b5753f1657', '江苏三峰国际货运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(997, 'JSSFGJHY', '54d35fd875676bd46ce033b5753f1657', '江苏三丰国际货运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(998, 'JSSMD', '54d35fd875676bd46ce033b5753f1657', '江苏苏美达机电有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1000, 'HCGJ', '54d35fd875676bd46ce033b5753f1657', '江苏恒川国际物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1001, 'HDGJ', '54d35fd875676bd46ce033b5753f1657', '江苏省华鼎国际物流发展有限公司南京分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1002, 'HENGCHUAN', '54d35fd875676bd46ce033b5753f1657', '恒川', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1003, 'HENGLONG', '54d35fd875676bd46ce033b5753f1657', '江苏恒隆物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1004, 'HHCC', '54d35fd875676bd46ce033b5753f1657', '江苏汇鸿畜产嘉画文体有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1005, 'HHJY', '54d35fd875676bd46ce033b5753f1657', '南京浩航集运国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1006, 'HJGJ', '54d35fd875676bd46ce033b5753f1657', '南京恒杰国际货运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1008, 'HMHY', '54d35fd875676bd46ce033b5753f1657', '江苏航美国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1010, 'HQWL', '54d35fd875676bd46ce033b5753f1657', '南京海桥物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1012, 'HUWL', '54d35fd875676bd46ce033b5753f1657', '和记物流(上海)有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1013, 'HWGJ', '54d35fd875676bd46ce033b5753f1657', '上海汉万国际物流有限公司南京分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1015, 'HXWL', '54d35fd875676bd46ce033b5753f1657', '江苏和旭物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1016, 'HYHY', '54d35fd875676bd46ce033b5753f1657', '江苏恒扬国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1017, 'HYMY', '54d35fd875676bd46ce033b5753f1657', '江苏省海亚贸易有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1018, 'HZGJ', '54d35fd875676bd46ce033b5753f1657', '江苏皓泽国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1019, 'HZTGJ', '54d35fd875676bd46ce033b5753f1657', '江苏汇众通国际供应链管理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1020, 'JCGJWL', '54d35fd875676bd46ce033b5753f1657', '锦程国际物流服务有限公司南京分', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1021, 'JDHK', '54d35fd875676bd46ce033b5753f1657', '上海畅顺达国际物流有限公司南京分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1022, 'JHFGJHY', '54d35fd875676bd46ce033b5753f1657', '景华峰国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1023, 'JHTHY', '54d35fd875676bd46ce033b5753f1657', '南通江海通国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1024, 'JLDT', '54d35fd875676bd46ce033b5753f1657', '嘉里大通物流有限公司安徽分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1025, 'JLHSM', '54d35fd875676bd46ce033b5753f1657', '南京金陵亨斯迈新材料有限责任公', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1026, 'JRKJ', '54d35fd875676bd46ce033b5753f1657', '南京捷润科技有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1027, 'JSBH', '54d35fd875676bd46ce033b5753f1657', '江苏博晗国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1028, 'JSDP', '54d35fd875676bd46ce033b5753f1657', '江苏东沛', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1029, 'JSHC', '54d35fd875676bd46ce033b5753f1657', '江苏瀚程国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1030, 'JSHD', '54d35fd875676bd46ce033b5753f1657', '江苏省华鼎国际物流发展有限公司南京分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1031, 'JSHQ', '54d35fd875676bd46ce033b5753f1657', '江苏环球', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1034, 'JSYDDL', '54d35fd875676bd46ce033b5753f1657', '江苏永德', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1035, 'JSYDHY', '54d35fd875676bd46ce033b5753f1657', '江苏远东国际', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1036, 'JSYS', '54d35fd875676bd46ce033b5753f1657', '江苏奕舜国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1037, 'JSYT', '54d35fd875676bd46ce033b5753f1657', '江苏远东国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1039, 'JSZD', '54d35fd875676bd46ce033b5753f1657', '江苏正大远东国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1040, 'JTSH', '54d35fd875676bd46ce033b5753f1657', '金桐石油化工有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1041, 'JWHY', '54d35fd875676bd46ce033b5753f1657', '南京经纬国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1042, 'JYGJ', '54d35fd875676bd46ce033b5753f1657', '南京津岳国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1043, 'KAFE', '54d35fd875676bd46ce033b5753f1657', '南京凯丰物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1044, 'KCGJ', '54d35fd875676bd46ce033b5753f1657', '江苏康成国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1045, 'KCHY', '54d35fd875676bd46ce033b5753f1657', '上海凯畅国际货物运输代理有限公司南京分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1046, 'KHHY', '54d35fd875676bd46ce033b5753f1657', '南京琨华货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1047, 'KQGJ', '54d35fd875676bd46ce033b5753f1657', '上海康祺国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1048, 'KSLC', '54d35fd875676bd46ce033b5753f1657', '民生轮船有限公司南京分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1049, 'KTJZX', '54d35fd875676bd46ce033b5753f1657', '江苏凯通集装箱服务有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1050, 'LCWL', '54d35fd875676bd46ce033b5753f1657', '南京联诚物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1051, 'LGCW', '54d35fd875676bd46ce033b5753f1657', '上海乐高船务有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1052, 'LITON', '54d35fd875676bd46ce033b5753f1657', '利通国际货运有限公司南京分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1053, 'LNGJ', '54d35fd875676bd46ce033b5753f1657', '江苏律宁国际货物运输代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1054, 'LNMH', '54d35fd875676bd46ce033b5753f1657', '辽宁美航国际货运有限公司南京分', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1055, 'LQGJ', '54d35fd875676bd46ce033b5753f1657', '南京朗沁国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1056, 'LTTY', '54d35fd875676bd46ce033b5753f1657', '南京港龙潭天宇码头有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1057, 'LTWLFW', '54d35fd875676bd46ce033b5753f1657', '南京龙潭物流服务有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1058, 'LTWLJD', '54d35fd875676bd46ce033b5753f1657', '南京龙潭物流基地开发有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1059, 'LZKY', '54d35fd875676bd46ce033b5753f1657', '南京联众快运物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1060, 'MASZWY', '54d35fd875676bd46ce033b5753f1657', '安徽马鞍山中外运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1061, 'MDHY', '54d35fd875676bd46ce033b5753f1657', '江苏美度国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1062, 'MQWL', '54d35fd875676bd46ce033b5753f1657', '上海明乾物流有限公司南京办事处', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1063, 'MSC', '54d35fd875676bd46ce033b5753f1657', 'MSC Mediterranean Shipping company S.A.', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1064, 'MSCW', '54d35fd875676bd46ce033b5753f1657', '重庆民生国际船务代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1065, 'MSGJ', '54d35fd875676bd46ce033b5753f1657', '重庆民生国际船务代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1066, 'MYMHY', '54d35fd875676bd46ce033b5753f1657', '南京美裕鸣货运服务有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1067, 'MYWL', '54d35fd875676bd46ce033b5753f1657', '自贡市民宇物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1068, 'NCGJ', '54d35fd875676bd46ce033b5753f1657', '江苏诺诚国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1069, 'NJATWL', '54d35fd875676bd46ce033b5753f1657', '南京安泰物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1070, 'NJMY', '54d35fd875676bd46ce033b5753f1657', '南京名扬物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1071, 'NJRQ', '54d35fd875676bd46ce033b5753f1657', '南京润桥货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1072, 'OXWL', '54d35fd875676bd46ce033b5753f1657', '江苏欧新国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1073, 'PDXY', '54d35fd875676bd46ce033b5753f1657', '上海浦东幸运船务有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1074, 'PLDGJ', '54d35fd875676bd46ce033b5753f1657', '南京普拉达国际贸易有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1075, 'QDKM', '54d35fd875676bd46ce033b5753f1657', '南京前多科贸有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1076, 'QSZX', '54d35fd875676bd46ce033b5753f1657', '南京群首装卸服务中心', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1077, 'RJGJ', '54d35fd875676bd46ce033b5753f1657', '江苏润金国际贸易有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1078, 'RTWL', '54d35fd875676bd46ce033b5753f1657', '合肥市荣泰物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1079, 'RYGJ', '54d35fd875676bd46ce033b5753f1657', '南京瑞裕国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1080, 'RYHY', '54d35fd875676bd46ce033b5753f1657', '江苏瑞洋国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1081, 'RZHY', '54d35fd875676bd46ce033b5753f1657', '南京瑞泽国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1082, 'SDGJ', '54d35fd875676bd46ce033b5753f1657', '上海桑德国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1083, 'SHCH', '54d35fd875676bd46ce033b5753f1657', '南京顺春物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1084, 'SHHDGJ', '54d35fd875676bd46ce033b5753f1657', '上海合德国际货物运输代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1085, 'SHHLSGJ', '54d35fd875676bd46ce033b5753f1657', '上海华莱士国际货物运输（南京）', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1086, 'SHWJ', '54d35fd875676bd46ce033b5753f1657', '上海伟集国际物流有限公司南京分', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1087, 'SHYJ', '54d35fd875676bd46ce033b5753f1657', '上海永璟', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1088, 'SJHY', '54d35fd875676bd46ce033b5753f1657', '南京顺锦航运有限责任公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1089, 'SMD', '54d35fd875676bd46ce033b5753f1657', '苏美达', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1090, 'MSACX', '54d35fd875676bd46ce033b5753f1657', '海事港建费公共查询', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1091, 'ZENC', '54d35fd875676bd46ce033b5753f1657', '全通-美国线', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1093, 'KM', '54d35fd875676bd46ce033b5753f1657', '康茂', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1094, 'IAL', '54d35fd875676bd46ce033b5753f1657', '深圳市运达国际船舶代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1095, 'LCT', '54d35fd875676bd46ce033b5753f1657', '龙潭港集装箱公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1096, 'SMDDJ', '54d35fd875676bd46ce033b5753f1657', '江苏苏美达机电国际贸易有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1097, 'SMDJS', '54d35fd875676bd46ce033b5753f1657', '江苏苏美达国际技术贸易有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1098, 'SMKS', '54d35fd875676bd46ce033b5753f1657', '江苏苏迈克斯国际货运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1099, 'SRGJ', '54d35fd875676bd46ce033b5753f1657', '镇江苏润国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1100, 'SYHY', '54d35fd875676bd46ce033b5753f1657', '江苏双渔国际货运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1101, 'SZJY', '54d35fd875676bd46ce033b5753f1657', '苏州交运物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1102, 'SZZHWL', '54d35fd875676bd46ce033b5753f1657', '苏州中海物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1103, 'THGJ', '54d35fd875676bd46ce033b5753f1657', '上海天恒国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1104, 'TLGJ', '54d35fd875676bd46ce033b5753f1657', '上海同霖国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1105, 'TLLSTK', '54d35fd875676bd46ce033b5753f1657', '江苏特林蓝色天空国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1106, 'TZJHY', '54d35fd875676bd46ce033b5753f1657', '江苏天之杰国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1107, 'WYHD', '54d35fd875676bd46ce033b5753f1657', '中国外运华东有限公司金陵分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1108, 'WYHTWL', '54d35fd875676bd46ce033b5753f1657', '中国外运长江有限公司合同物流事业部', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1109, 'XEDGJ', '54d35fd875676bd46ce033b5753f1657', '南京协尔达国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1110, 'XFHD', '54d35fd875676bd46ce033b5753f1657', '浙江兴港国际货运代理有限南京分', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1111, 'XHT', '54d35fd875676bd46ce033b5753f1657', '江苏新海天国际贸易有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1112, 'XQGJ', '54d35fd875676bd46ce033b5753f1657', '上海暄淇国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1113, 'XRWL', '54d35fd875676bd46ce033b5753f1657', '南京鑫润物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1114, 'XSLSM', '54d35fd875676bd46ce033b5753f1657', '新实力商贸（南京）有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1115, 'XSLSP', '54d35fd875676bd46ce033b5753f1657', '新实力食品科技（南京）有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1116, 'XWCW', '54d35fd875676bd46ce033b5753f1657', '南京鑫崴船务有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1117, 'XYGJ', '54d35fd875676bd46ce033b5753f1657', '重庆兴洋国际货物运输有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1118, 'YGLX', '54d35fd875676bd46ce033b5753f1657', '宁波营港利信物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1119, 'YKYX', '54d35fd875676bd46ce033b5753f1657', '香港阳凯有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1120, 'YLWL', '54d35fd875676bd46ce033b5753f1657', '江苏一联物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1121, 'YMCW', '54d35fd875676bd46ce033b5753f1657', '誉名船务', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1122, 'YPJP', '54d35fd875676bd46ce033b5753f1657', '洋浦骏鹏物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1123, 'YTWL', '54d35fd875676bd46ce033b5753f1657', '江苏亿通万联国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1124, 'YXGJ', '54d35fd875676bd46ce033b5753f1657', '江苏优星国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1125, 'YYGJ', '54d35fd875676bd46ce033b5753f1657', '南京远洋国际船舶代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1127, 'ZGGJHY', '54d35fd875676bd46ce033b5753f1657', '中钢国际货运江苏有限责任公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1128, 'ZGJY', '54d35fd875676bd46ce033b5753f1657', '中国检验认证集团江苏有限公司南京分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1129, 'ZHHY', '54d35fd875676bd46ce033b5753f1657', '安徽纵横国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1131, 'ZJSDTK', '54d35fd875676bd46ce033b5753f1657', '南通中集罐式储运设备制造有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1132, 'ZLWL', '54d35fd875676bd46ce033b5753f1657', '南京中理外轮理货有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1133, 'ZRGJ', '54d35fd875676bd46ce033b5753f1657', '江苏中瑞国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1134, 'ZTBG', '54d35fd875676bd46ce033b5753f1657', '南京中天报关有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1135, 'ZWEGUOJI', '54d35fd875676bd46ce033b5753f1657', '展威国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1136, 'ZWHY', '54d35fd875676bd46ce033b5753f1657', '南京尊威货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1137, 'ZYGJ', '54d35fd875676bd46ce033b5753f1657', '江苏泽运国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1138, 'ZYHK', '54d35fd875676bd46ce033b5753f1657', '中远国际航空货运代理有限公司江苏分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1139, 'TEX', '54d35fd875676bd46ce033b5753f1657', '美国天泰货柜租赁有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1140, 'AHHY', '54d35fd875676bd46ce033b5753f1657', '南京安和集装箱货运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1141, 'ALWL', '54d35fd875676bd46ce033b5753f1657', '上海澳隆物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1142, 'AT', '54d35fd875676bd46ce033b5753f1657', '南京安泰物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1143, 'AY', '54d35fd875676bd46ce033b5753f1657', '南京奥亿集装箱运输有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1144, 'BA', '54d35fd875676bd46ce033b5753f1657', '南京倍安集装箱运输有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1145, 'BC', '54d35fd875676bd46ce033b5753f1657', '南京百春物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1146, 'BCWL', '54d35fd875676bd46ce033b5753f1657', '南京伯辰物流有限责任公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1147, 'BDWL', '54d35fd875676bd46ce033b5753f1657', '南京邦达物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1148, 'BFWL', '54d35fd875676bd46ce033b5753f1657', '南京宝丰物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1149, 'BGWL', '54d35fd875676bd46ce033b5753f1657', '南京博港物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1150, 'BGYS', '54d35fd875676bd46ce033b5753f1657', '南京宝国运输有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1152, 'BT', '54d35fd875676bd46ce033b5753f1657', '江苏博腾物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1153, 'CHYS', '54d35fd875676bd46ce033b5753f1657', '南京春海运输有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1154, 'CJ', '54d35fd875676bd46ce033b5753f1657', '南京晨锦集装箱有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1155, 'CLD', '54d35fd875676bd46ce033b5753f1657', '南京长来东物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1156, 'CM', '54d35fd875676bd46ce033b5753f1657', '南京驰美货运配载中心', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1157, 'CMYS', '54d35fd875676bd46ce033b5753f1657', '南京昌茂集装箱运输有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1158, 'CQJY', '54d35fd875676bd46ce033b5753f1657', '重庆集洋国际物流南京分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1159, 'CTWL', '54d35fd875676bd46ce033b5753f1657', '南京长天国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1160, 'CYHY', '54d35fd875676bd46ce033b5753f1657', '南京宸月货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1161, 'CZWL', '54d35fd875676bd46ce033b5753f1657', '南京昌泽物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1162, 'DF', '54d35fd875676bd46ce033b5753f1657', '南京东方集装箱服务有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1163, 'DJHD', '54d35fd875676bd46ce033b5753f1657', '北京大金汇德物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1164, 'DL', '54d35fd875676bd46ce033b5753f1657', '江苏省东联国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1165, 'DLT', '54d35fd875676bd46ce033b5753f1657', '南京迪莱特物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1166, 'DM', '54d35fd875676bd46ce033b5753f1657', '南京大明运输有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1167, 'DSWL', '54d35fd875676bd46ce033b5753f1657', '南京道森物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1168, 'DSYS', '54d35fd875676bd46ce033b5753f1657', '南京德舜运输有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1169, 'DT', '54d35fd875676bd46ce033b5753f1657', '南京道途物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1170, 'DTWL', '54d35fd875676bd46ce033b5753f1657', '南京东铁物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1171, 'DW', '54d35fd875676bd46ce033b5753f1657', '南京大卫运输有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1172, 'DWWL', '54d35fd875676bd46ce033b5753f1657', '南京德旺物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1173, 'DYWL', '54d35fd875676bd46ce033b5753f1657', '南京大亚物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1174, 'FB', '54d35fd875676bd46ce033b5753f1657', '南京新港富宝储运有限责任公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1175, 'FSWL', '54d35fd875676bd46ce033b5753f1657', '南京丰硕物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1176, 'GDWL', '54d35fd875676bd46ce033b5753f1657', '南京罡达物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1177, 'GPWL', '54d35fd875676bd46ce033b5753f1657', '南京高平物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1179, 'HAWL', '54d35fd875676bd46ce033b5753f1657', '南京恒爱物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1180, 'HBCY', '54d35fd875676bd46ce033b5753f1657', '南京华宝储运公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1181, 'HF', '54d35fd875676bd46ce033b5753f1657', '南京华富集装箱有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1182, 'HFWL', '54d35fd875676bd46ce033b5753f1657', '南京恒丰物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1183, 'HH', '54d35fd875676bd46ce033b5753f1657', '南京鸿昊物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1184, 'HHCY', '54d35fd875676bd46ce033b5753f1657', '南京恒辉储运服务有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1185, 'HHWL', '54d35fd875676bd46ce033b5753f1657', '南京红火物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1186, 'HLWL', '54d35fd875676bd46ce033b5753f1657', '南京恒联集装箱物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1187, 'HP', '54d35fd875676bd46ce033b5753f1657', '南京海鹏货运代理服务有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1188, 'HQ', '54d35fd875676bd46ce033b5753f1657', '南京恒强运输有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1189, 'HR', '54d35fd875676bd46ce033b5753f1657', '南京恒瑞海运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1191, 'HSWL', '54d35fd875676bd46ce033b5753f1657', '盐城市恒盛物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1192, 'HTYM', '54d35fd875676bd46ce033b5753f1657', '南京宏天运贸有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1193, 'HXWL', '54d35fd875676bd46ce033b5753f1657', '南京宏轩物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1194, 'HYWY', '54d35fd875676bd46ce033b5753f1657', '华英外运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1195, 'HZWL', '54d35fd875676bd46ce033b5753f1657', '南京华展物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1196, 'JCWL', '54d35fd875676bd46ce033b5753f1657', '南京骏辰物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1197, 'JD', '54d35fd875676bd46ce033b5753f1657', '南京市下关区捷达货物运输经营部', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1199, 'JF', '54d35fd875676bd46ce033b5753f1657', '南京嘉丰物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1200, 'JHWL', '54d35fd875676bd46ce033b5753f1657', '南京集海物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1201, 'JLQY', '54d35fd875676bd46ce033b5753f1657', '江苏金陵汽车运输宗公司快运物流分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1202, 'JLWL', '54d35fd875676bd46ce033b5753f1657', '南京巨雷物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1203, 'JN5', '54d35fd875676bd46ce033b5753f1657', '南京江宁第五汽车运输有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1204, 'JSD', '54d35fd875676bd46ce033b5753f1657', '南京捷顺达运输有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1205, 'JSJLQY', '54d35fd875676bd46ce033b5753f1657', '江苏金陵汽车运输总公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1207, 'JSSL', '54d35fd875676bd46ce033b5753f1657', '江苏省省联危险品物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1209, 'JSZS', '54d35fd875676bd46ce033b5753f1657', '江苏中舜物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1210, 'JWWL', '54d35fd875676bd46ce033b5753f1657', '南京嘉伟物流贸易有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1211, 'JXWL', '54d35fd875676bd46ce033b5753f1657', '南京九旭物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1212, 'JY5', '54d35fd875676bd46ce033b5753f1657', '江苏金陵交运集团第五物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1213, 'JYGJ', '54d35fd875676bd46ce033b5753f1657', '江苏金陵交运集团国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1214, 'JYHG', '54d35fd875676bd46ce033b5753f1657', '江苏金陵交运集团南京化工物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1215, 'JYHY', '54d35fd875676bd46ce033b5753f1657', '金陵交运货运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1216, 'JYJZX', '54d35fd875676bd46ce033b5753f1657', '江苏金陵交运集团南京集装箱物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1217, 'KF', '54d35fd875676bd46ce033b5753f1657', '南京柯发物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1218, 'KFWL', '54d35fd875676bd46ce033b5753f1657', '南京凯丰物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1219, 'KQWL', '54d35fd875676bd46ce033b5753f1657', '南京康乾物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1220, 'KSWL', '54d35fd875676bd46ce033b5753f1657', '南京卡森物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1221, 'KT', '54d35fd875676bd46ce033b5753f1657', '南京坤腾物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1222, 'KT1', '54d35fd875676bd46ce033b5753f1657', '南京开泰集装箱储运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1223, 'KT2', '54d35fd875676bd46ce033b5753f1657', '南京开泰集装箱储运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1224, 'KT3', '54d35fd875676bd46ce033b5753f1657', '南京开泰集装箱储运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1225, 'KT4', '54d35fd875676bd46ce033b5753f1657', '南京开泰集装箱储运公司4', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1226, 'KT5', '54d35fd875676bd46ce033b5753f1657', '南京开泰集装箱储运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1227, 'KT6', '54d35fd875676bd46ce033b5753f1657', '南京开泰集装箱储运公司（上海大生货运）', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1228, 'KTWL', '54d35fd875676bd46ce033b5753f1657', '南京凯腾物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1229, 'KWY', '54d35fd875676bd46ce033b5753f1657', '南京柯威亚物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1230, 'KY', '54d35fd875676bd46ce033b5753f1657', '南京坤源运输仓储有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1231, 'KYWL', '54d35fd875676bd46ce033b5753f1657', '南京鲲羽物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1233, 'LH', '54d35fd875676bd46ce033b5753f1657', '南京利恒储运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1234, 'LHQC', '54d35fd875676bd46ce033b5753f1657', '南京联合全程物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1235, 'LJL', '54d35fd875676bd46ce033b5753f1657', '南京零距离运输车队', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1236, 'LJWL', '54d35fd875676bd46ce033b5753f1657', '南京联杰物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1237, 'LLWL', '54d35fd875676bd46ce033b5753f1657', '南京利龙物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1238, 'LS', '54d35fd875676bd46ce033b5753f1657', '临时进港车辆', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1239, 'LT', '54d35fd875676bd46ce033b5753f1657', '南京龙腾运输实业有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1240, 'LYGD', '54d35fd875676bd46ce033b5753f1657', '南京联运国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1241, 'MHWL', '54d35fd875676bd46ce033b5753f1657', '南京明花物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1242, 'MMWL', '54d35fd875676bd46ce033b5753f1657', '南京木马物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1243, 'MSGJ', '54d35fd875676bd46ce033b5753f1657', '民生国际集装箱运输有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1244, 'MYWL', '54d35fd875676bd46ce033b5753f1657', '南京名扬物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1245, 'NJGT', '54d35fd875676bd46ce033b5753f1657', '南京广通物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1246, 'NJSHWL', '54d35fd875676bd46ce033b5753f1657', '南京世辉物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1247, 'NJTY', '54d35fd875676bd46ce033b5753f1657', '南京拓越物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1248, 'NQWL', '54d35fd875676bd46ce033b5753f1657', '跃进集团南京物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1249, 'PBHY', '54d35fd875676bd46ce033b5753f1657', '南京鹏博货运代理服务有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1250, 'PC', '54d35fd875676bd46ce033b5753f1657', '江苏鹏程国际车运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1251, 'TRITON', '54d35fd875676bd46ce033b5753f1657', '海神租赁', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1252, 'NJZLWL', '54d35fd875676bd46ce033b5753f1657', '南京中理外轮理货有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1253, 'PGWL', '54d35fd875676bd46ce033b5753f1657', '南京浦港物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1254, 'PTHY', '54d35fd875676bd46ce033b5753f1657', '南京磐泰货运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1255, 'QG', '54d35fd875676bd46ce033b5753f1657', '南京庆广物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1256, 'QGWL', '54d35fd875676bd46ce033b5753f1657', '南京全高物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1257, 'QKWL', '54d35fd875676bd46ce033b5753f1657', '全奎物流中心', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1258, 'QLWL', '54d35fd875676bd46ce033b5753f1657', '南京全联物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1259, 'QNWL', '54d35fd875676bd46ce033b5753f1657', '南京乾宁物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1260, 'QRWL', '54d35fd875676bd46ce033b5753f1657', '南京强仁物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1261, 'QT', '54d35fd875676bd46ce033b5753f1657', '南京全通集装箱运输有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1262, 'RQWL', '54d35fd875676bd46ce033b5753f1657', '南京润泉物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1263, 'RSHY', '54d35fd875676bd46ce033b5753f1657', '上海日圣航运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1264, 'SBHY', '54d35fd875676bd46ce033b5753f1657', '南京市雨花台区沙博货运配载服务中心', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1265, 'SCWL', '54d35fd875676bd46ce033b5753f1657', '南京宋诚物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1266, 'SGWL', '54d35fd875676bd46ce033b5753f1657', '南京顺港物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1267, 'SH', '54d35fd875676bd46ce033b5753f1657', '南京晟昊国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1269, 'SHTJ', '54d35fd875676bd46ce033b5753f1657', '上海铁集汽车运输有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1270, 'SHWL', '54d35fd875676bd46ce033b5753f1657', '南京世辉物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1271, 'SJ', '54d35fd875676bd46ce033b5753f1657', '南京苏集运输有限责任公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1272, 'SL', '54d35fd875676bd46ce033b5753f1657', '南京神鹿物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1273, 'SN', '54d35fd875676bd46ce033b5753f1657', '南京泗宁绿色食品开发应用服务部', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1274, 'SSWL', '54d35fd875676bd46ce033b5753f1657', '南京三圣物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1275, 'STWL', '54d35fd875676bd46ce033b5753f1657', '南京速腾物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1276, 'SX', '54d35fd875676bd46ce033b5753f1657', '南京沙鑫物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1277, 'SY', '54d35fd875676bd46ce033b5753f1657', '南京顺宇集装箱运输有限责任公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1278, 'SYD', '54d35fd875676bd46ce033b5753f1657', '南京顺亚达物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1279, 'SYWL', '54d35fd875676bd46ce033b5753f1657', '上海舜羽物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1280, 'TDWL', '54d35fd875676bd46ce033b5753f1657', '南京腾达物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1281, 'TGWL', '54d35fd875676bd46ce033b5753f1657', '南京通港物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1282, 'THD', '54d35fd875676bd46ce033b5753f1657', '南京天瀚德物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1283, 'TLWL', '54d35fd875676bd46ce033b5753f1657', '南京涛丽物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1284, 'TLYS', '54d35fd875676bd46ce033b5753f1657', '南京通联运输有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1285, 'TRWL', '54d35fd875676bd46ce033b5753f1657', '南京天人物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1286, 'TTDY', '54d35fd875676bd46ce033b5753f1657', '南京通天达宇集装箱运输有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1287, 'TY', '54d35fd875676bd46ce033b5753f1657', '南京天宇运输有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1288, 'WD', '54d35fd875676bd46ce033b5753f1657', '江苏纬达国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1289, 'WDBG', '54d35fd875676bd46ce033b5753f1657', '南京外代报关行有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1290, 'WFWL', '54d35fd875676bd46ce033b5753f1657', '南京沃帆物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1291, 'WHT', '54d35fd875676bd46ce033b5753f1657', '南京旺惠通物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1292, 'WSD', '54d35fd875676bd46ce033b5753f1657', '南京沃赛得物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1293, 'WTWL', '54d35fd875676bd46ce033b5753f1657', '南京万腾物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1294, 'WYWL', '54d35fd875676bd46ce033b5753f1657', '江苏外运物流有限责任公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1295, 'WZHY', '54d35fd875676bd46ce033b5753f1657', '南京万洲货运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1296, 'XDP', '54d35fd875676bd46ce033b5753f1657', '南京鑫东屏物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1297, 'XGDY', '54d35fd875676bd46ce033b5753f1657', '南京新港鼎元物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1298, 'XHWL', '54d35fd875676bd46ce033b5753f1657', '南京仙花物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1299, 'XHYS', '54d35fd875676bd46ce033b5753f1657', '南京炫煌运输配载有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1300, 'XINLI', '54d35fd875676bd46ce033b5753f1657', '南京溧水新力物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1301, 'XK', '54d35fd875676bd46ce033b5753f1657', '南京新凯运输有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1302, 'XKWL', '54d35fd875676bd46ce033b5753f1657', '南京欣快物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1303, 'XL', '54d35fd875676bd46ce033b5753f1657', '南京鑫联运输代理有限责任公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1304, 'XL3', '54d35fd875676bd46ce033b5753f1657', '鑫联运输代理有限责任公司第三分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1305, 'XLWL', '54d35fd875676bd46ce033b5753f1657', '南京鑫利物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1306, 'XMWL', '54d35fd875676bd46ce033b5753f1657', '南京新木物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1307, 'XQWL', '54d35fd875676bd46ce033b5753f1657', '南京小桥物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1308, 'XRR', '54d35fd875676bd46ce033b5753f1657', '南京新冉瑞物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1310, 'XS', '54d35fd875676bd46ce033b5753f1657', '南京翔盛集装箱货运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1311, 'YF', '54d35fd875676bd46ce033b5753f1657', '南京远方物流集团有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1313, 'YH', '54d35fd875676bd46ce033b5753f1657', '南京永恒集装箱运输有限责任公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1314, 'YHWL', '54d35fd875676bd46ce033b5753f1657', '南京宇昊物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1315, 'YIHE', '54d35fd875676bd46ce033b5753f1657', '南京易和物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1316, 'YJWL', '54d35fd875676bd46ce033b5753f1657', '南京友佳物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1317, 'YL', '54d35fd875676bd46ce033b5753f1657', '南京云龙物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1318, 'YLWL', '54d35fd875676bd46ce033b5753f1657', '南京源力物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1319, 'YMT', '54d35fd875676bd46ce033b5753f1657', '南京易美特集装箱运输有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1321, 'YRWL', '54d35fd875676bd46ce033b5753f1657', '南京宇瑞物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1322, 'YTP', '54d35fd875676bd46ce033b5753f1657', '南京亿通平物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1323, 'YUYANG', '54d35fd875676bd46ce033b5753f1657', '南京宇航集装箱运输有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1324, 'YXWL', '54d35fd875676bd46ce033b5753f1657', '南京宜轩物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1325, 'YYWL', '54d35fd875676bd46ce033b5753f1657', '南京宇业物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1326, 'YZWL', '54d35fd875676bd46ce033b5753f1657', '南京远卓物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1327, 'ZAHY', '54d35fd875676bd46ce033b5753f1657', '南京中安货运服务部', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1328, 'ZBWL', '54d35fd875676bd46ce033b5753f1657', '江苏振邦物流发展有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1329, 'ZCJY', '54d35fd875676bd46ce033b5753f1657', '南京众诚集装箱运输有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1330, 'ZCWL', '54d35fd875676bd46ce033b5753f1657', '江苏众诚国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1331, 'ZJ', '54d35fd875676bd46ce033b5753f1657', '南京中集集装箱责任有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1332, 'ZJCY', '54d35fd875676bd46ce033b5753f1657', '镇江创源货运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1333, 'ZPWL', '54d35fd875676bd46ce033b5753f1657', '江苏中浦国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1334, 'ZS', '54d35fd875676bd46ce033b5753f1657', '招商局物流集团南京有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1335, 'ZSWL', '54d35fd875676bd46ce033b5753f1657', '南京众升物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1336, 'HK', '54d35fd875676bd46ce033b5753f1657', '南京恒康集装箱运输有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1337, 'ZY', '54d35fd875676bd46ce033b5753f1657', '中艺国际储运公司江苏公司', '', 0, 0, 0, '', '', 'Y', '', NULL, NULL, NULL, NULL),
(1338, 'MEL', '54d35fd875676bd46ce033b5753f1657', '太平船务', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1339, 'YHJC', '54d35fd875676bd46ce033b5753f1657', '优惠稽查', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1340, 'AHQD', '54d35fd875676bd46ce033b5753f1657', '安徽启德机械安装有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1341, 'BLWL', '54d35fd875676bd46ce033b5753f1657', '南京炳龙物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1342, 'CHWL', '54d35fd875676bd46ce033b5753f1657', '江苏驰航国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1343, 'DS', '54d35fd875676bd46ce033b5753f1657', '南京兑硕物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1344, 'DY', '54d35fd875676bd46ce033b5753f1657', '南京东宇物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1345, 'FLT', '54d35fd875676bd46ce033b5753f1657', '南京弗兰特物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tally_customer` (`id`, `customer_code`, `customer_pwd`, `customer_name`, `customer_shortname`, `customer_category`, `paytype`, `rate_id`, `linkman`, `telephone`, `customer_status`, `contract_number`, `contract_life`, `operator`, `operationtime`, `authority`) VALUES
(1346, 'FRWL', '54d35fd875676bd46ce033b5753f1657', '南京丰饶物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1347, 'FYD', '54d35fd875676bd46ce033b5753f1657', '南京丰源达物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1348, 'GGYS', '54d35fd875676bd46ce033b5753f1657', '南京阁阁运输有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1349, 'GJY', '54d35fd875676bd46ce033b5753f1657', '南京广聚源物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1350, 'GTWL', '54d35fd875676bd46ce033b5753f1657', '南京广通物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1351, 'HJWL', '54d35fd875676bd46ce033b5753f1657', '南京环际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1352, 'HSHY', '54d35fd875676bd46ce033b5753f1657', '南京恒商货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1353, 'HYT', '54d35fd875676bd46ce033b5753f1657', '南京汇运通物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1354, 'HYWL', '54d35fd875676bd46ce033b5753f1657', '南京浩宇物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1355, 'HZY', '54d35fd875676bd46ce033b5753f1657', '南京海之韵物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1356, 'JSJH', '54d35fd875676bd46ce033b5753f1657', '江苏佳华物流发展有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1357, 'LCHY', '54d35fd875676bd46ce033b5753f1657', '南京联程化运物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1358, 'LFWL', '54d35fd875676bd46ce033b5753f1657', '南京连飞物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1359, 'LYWL', '54d35fd875676bd46ce033b5753f1657', '南京龙跃物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1360, 'MCWL', '54d35fd875676bd46ce033b5753f1657', '南京迈川物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1361, 'NJKT', '54d35fd875676bd46ce033b5753f1657', '南京坤通物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1362, 'NJLC', '54d35fd875676bd46ce033b5753f1657', '南京联灿物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1363, 'NJYJD', '54d35fd875676bd46ce033b5753f1657', '南京易聚得物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1364, 'NJZH', '54d35fd875676bd46ce033b5753f1657', '南京子恒物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1365, 'PDWL', '54d35fd875676bd46ce033b5753f1657', '南京品德物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1366, 'SHHY', '54d35fd875676bd46ce033b5753f1657', '上海焕运物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1367, 'SHTH', '54d35fd875676bd46ce033b5753f1657', '上海天恒国际物流有限公司南京分公', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1368, 'SLWL', '54d35fd875676bd46ce033b5753f1657', '南京神鹿物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1369, 'XINKE', '54d35fd875676bd46ce033b5753f1657', '南京鑫科物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1370, 'XTWL', '54d35fd875676bd46ce033b5753f1657', '南京鑫通物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1371, 'XYWL', '54d35fd875676bd46ce033b5753f1657', '南京轩玥物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1372, 'YCWL', '54d35fd875676bd46ce033b5753f1657', '南京源成物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1373, 'YDT', '54d35fd875676bd46ce033b5753f1657', '江苏易达通国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1374, 'YWWL', '54d35fd875676bd46ce033b5753f1657', '南京有为物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1375, 'ZHWL', '54d35fd875676bd46ce033b5753f1657', '南京振鸿物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1376, 'ZTWL', '54d35fd875676bd46ce033b5753f1657', '南京志通物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1378, 'KWLWY', '54d35fd875676bd46ce033b5753f1657', '柯物流威亚', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1379, 'AHJGJWL', '54d35fd875676bd46ce033b5753f1657', '南京安宏基国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1380, 'NJXH', '54d35fd875676bd46ce033b5753f1657', '南京昶辉', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1381, 'NJGYJWL', '54d35fd875676bd46ce033b5753f1657', '南京广源聚物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1383, 'NJJSD', '54d35fd875676bd46ce033b5753f1657', '南京捷顺达货运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1384, 'NJJTWL', '54d35fd875676bd46ce033b5753f1657', '南京骏天物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1385, 'NJKTWL', '54d35fd875676bd46ce033b5753f1657', '南京凯腾物流有公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1386, 'NJSCWL', '54d35fd875676bd46ce033b5753f1657', '南京宋城物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1387, 'NJWHTWL', '54d35fd875676bd46ce033b5753f1657', '南京汪慧通物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1388, 'NJZD', '54d35fd875676bd46ce033b5753f1657', '南京振德供应链管理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1389, 'LAXXAYS', '54d35fd875676bd46ce033b5753f1657', '来安县兴安运输有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1390, 'NJCDWL', '54d35fd875676bd46ce033b5753f1657', '南京骋达物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1391, 'NJHHWL', '54d35fd875676bd46ce033b5753f1657', '南京瀚海物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1392, 'NJMJWL', '54d35fd875676bd46ce033b5753f1657', '南京明佳物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1393, 'NJXFHY', '54d35fd875676bd46ce033b5753f1657', '南京喜发货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1394, 'SHAWWL', '54d35fd875676bd46ce033b5753f1657', '上海安威物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1395, 'SHZJGL', '54d35fd875676bd46ce033b5753f1657', '上海中集公联集装箱储运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1396, 'ZHGHSTJ', '54d35fd875676bd46ce033b5753f1657', '张家港宏顺铁集货运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1398, 'NJYN', '54d35fd875676bd46ce033b5753f1657', '南京优能国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1399, 'JM', '54d35fd875676bd46ce033b5753f1657', '南京捷美集装箱有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1401, 'TH', '54d35fd875676bd46ce033b5753f1657', '通海', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1402, 'XPD', '54d35fd875676bd46ce033b5753f1657', '南京喜蓬得物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1403, 'NJJSDWL', '54d35fd875676bd46ce033b5753f1657', '南京捷顺达物流集团有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1404, 'NJHL', '54d35fd875676bd46ce033b5753f1657', '南京恒隆', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1405, 'HDWL', '54d35fd875676bd46ce033b5753f1657', '南京宏鼎物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1406, 'ATLA', '54d35fd875676bd46ce033b5753f1657', '泉州安通物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1408, 'JSDY', '54d35fd875676bd46ce033b5753f1657', '江苏大业物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1409, 'LCTJC', '54d35fd875676bd46ce033b5753f1657', '码头稽查管理员', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1413, 'HHHY', '54d35fd875676bd46ce033b5753f1657', '安徽省华海航运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1414, 'LFS', '54d35fd875676bd46ce033b5753f1657', '龙卷风车队', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1415, 'NJHRGJ', '54d35fd875676bd46ce033b5753f1657', '南京汉瑞国际货运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1416, 'NJCJ', '54d35fd875676bd46ce033b5753f1657', '南京创基国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1417, 'AHBJ', '54d35fd875676bd46ce033b5753f1657', '安徽保捷船务有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1418, 'GBSHA', '54d35fd875676bd46ce033b5753f1657', '上海高登物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1419, 'KNNJ', '54d35fd875676bd46ce033b5753f1657', '德讯货运代理有限公司南京分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1420, 'NJYJ', '54d35fd875676bd46ce033b5753f1657', '南京友佳国际货运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1421, 'NJCH', '54d35fd875676bd46ce033b5753f1657', '南京驰航国际货物运输代理有限公', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1422, 'JSSZ', '54d35fd875676bd46ce033b5753f1657', '江苏三桩国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1423, 'CTS-NKG', '54d35fd875676bd46ce033b5753f1657', '华贸国际货运有限公司南京分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1424, 'YIJIE', '54d35fd875676bd46ce033b5753f1657', '广州易捷国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1425, 'JSPC', '54d35fd875676bd46ce033b5753f1657', '江苏鹏程国际储运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1426, 'NJZXZX', '54d35fd875676bd46ce033b5753f1657', '南京众祥咨询服务有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1427, 'BFDF', '54d35fd875676bd46ce033b5753f1657', '北京百福东方国际物流有限责任公', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1428, 'HD', '54d35fd875676bd46ce033b5753f1657', '江苏省华鼎国际物流发展有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1429, 'YBNJ', '54d35fd875676bd46ce033b5753f1657', '永柏国际货运南京办事处', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1430, 'NJCJLOG', '54d35fd875676bd46ce033b5753f1657', '南京晨锦集装箱运输有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1431, 'AHGH', '54d35fd875676bd46ce033b5753f1657', '安徽国际货物运输公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1432, 'JSXD', '54d35fd875676bd46ce033b5753f1657', '江苏宣德国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1433, 'AHSA', '54d35fd875676bd46ce033b5753f1657', '安徽圣安国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1434, 'FY', '54d35fd875676bd46ce033b5753f1657', '上海富鹰货运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1435, 'HSNJ', '54d35fd875676bd46ce033b5753f1657', '上海环世捷运物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1436, 'HCBD', '54d35fd875676bd46ce033b5753f1657', '海程邦达国际货运代理公司江苏分', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1437, 'HJWL', '54d35fd875676bd46ce033b5753f1657', '江苏汉嘉国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1438, 'MSGLKT', '54d35fd875676bd46ce033b5753f1657', '民生格力空调', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1439, 'NJSTAR', '54d35fd875676bd46ce033b5753f1657', '南京星韵货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1440, 'RCN', '54d35fd875676bd46ce033b5753f1657', '俄罗斯国家铁路公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1443, 'NJCT-GLKT', '54d35fd875676bd46ce033b5753f1657', '南京长天国际物流-格力空调', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1445, 'WXXGS', '54d35fd875676bd46ce033b5753f1657', '无协议公司(商务代管）', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1446, 'SHWL-YZHQ', '54d35fd875676bd46ce033b5753f1657', '上化物流－仪征化纤', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1447, 'XZMJGG', '54d35fd875676bd46ce033b5753f1657', '徐州孟家沟港', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1448, 'CS', '54d35fd875676bd46ce033b5753f1657', '长盛', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1449, 'UTT', '54d35fd875676bd46ce033b5753f1657', '联合罐式集装箱运输有限公司边行', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1450, 'NJXPDZ', '54d35fd875676bd46ce033b5753f1657', '南京夏普电子有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1451, 'YAHU', '54d35fd875676bd46ce033b5753f1657', '其它(托管）', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1454, 'SXWL-GLKT', '54d35fd875676bd46ce033b5753f1657', '顺兴物流-格力空调', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1456, 'NUC', '54d35fd875676bd46ce033b5753f1657', '宁波联合集海', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1458, 'SNLA', '54d35fd875676bd46ce033b5753f1657', '上海箱运（夏普专用）', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1459, 'CJHY/GLKT', '54d35fd875676bd46ce033b5753f1657', '长江货运-格力空调', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1461, 'WYCJGCWL', '54d35fd875676bd46ce033b5753f1657', '外运长江工程项目物流事业部', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1463, 'CQCHGL', '54d35fd875676bd46ce033b5753f1657', '重庆长航格力空调', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1464, 'WGHY', '54d35fd875676bd46ce033b5753f1657', '重庆万州区万港航运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1465, 'CCSL', '54d35fd875676bd46ce033b5753f1657', '大连乾瀚国际物流上海分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1467, 'AHSXWL', '54d35fd875676bd46ce033b5753f1657', '安徽省顺兴物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1469, 'UASC', '54d35fd875676bd46ce033b5753f1657', '阿拉伯联合国家轮船公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1470, 'ZWYCJNJ', '54d35fd875676bd46ce033b5753f1657', '中国外运长江有限公司南京分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1471, '奥亿运公司', '54d35fd875676bd46ce033b5753f1657', '奥亿运公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1472, '博腾物流', '54d35fd875676bd46ce033b5753f1657', '博腾物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1473, '东方', '54d35fd875676bd46ce033b5753f1657', '东方', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1474, '二公司', '54d35fd875676bd46ce033b5753f1657', '二公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1475, '国亚', '54d35fd875676bd46ce033b5753f1657', '国亚', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1476, '恒瑞公司', '54d35fd875676bd46ce033b5753f1657', '恒瑞公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1477, '华诚物流', '54d35fd875676bd46ce033b5753f1657', '华诚物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1478, '集海', '54d35fd875676bd46ce033b5753f1657', '集海', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1479, '开泰', '54d35fd875676bd46ce033b5753f1657', '开泰', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1480, '利龙', '54d35fd875676bd46ce033b5753f1657', '利龙', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1481, '龙运', '54d35fd875676bd46ce033b5753f1657', '龙运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1482, '明乾物流', '54d35fd875676bd46ce033b5753f1657', '明乾物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1483, '浦港', '54d35fd875676bd46ce033b5753f1657', '浦港', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1484, '森伟物流', '54d35fd875676bd46ce033b5753f1657', '森伟物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1485, '申鹿', '54d35fd875676bd46ce033b5753f1657', '申鹿', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1486, '舜羽物流', '54d35fd875676bd46ce033b5753f1657', '舜羽物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1487, '拓越物流', '54d35fd875676bd46ce033b5753f1657', '拓越物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1488, '仙花物流', '54d35fd875676bd46ce033b5753f1657', '仙花物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1489, '鑫利', '54d35fd875676bd46ce033b5753f1657', '鑫利', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1490, '扬州京泽余', '54d35fd875676bd46ce033b5753f1657', '扬州京泽余', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1491, '择一物流', '54d35fd875676bd46ce033b5753f1657', '择一物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1492, '安和物流', '54d35fd875676bd46ce033b5753f1657', '安和物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1493, '安泰', '54d35fd875676bd46ce033b5753f1657', '安泰', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1494, '邦达', '54d35fd875676bd46ce033b5753f1657', '邦达', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1495, '宝顺物流', '54d35fd875676bd46ce033b5753f1657', '宝顺物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1496, '晨锦', '54d35fd875676bd46ce033b5753f1657', '晨锦', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1497, '大亚', '54d35fd875676bd46ce033b5753f1657', '大亚', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1498, '东瀚物流', '54d35fd875676bd46ce033b5753f1657', '东瀚物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1499, '东联', '54d35fd875676bd46ce033b5753f1657', '东联', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1500, '富仓', '54d35fd875676bd46ce033b5753f1657', '富仓', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1501, '高集', '54d35fd875676bd46ce033b5753f1657', '高集', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1502, '国亚货贷', '54d35fd875676bd46ce033b5753f1657', '国亚货贷', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1503, '瀚海物流', '54d35fd875676bd46ce033b5753f1657', '瀚海物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1504, '弘远物流', '54d35fd875676bd46ce033b5753f1657', '弘远物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1505, '华宝', '54d35fd875676bd46ce033b5753f1657', '华宝', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1506, '华富', '54d35fd875676bd46ce033b5753f1657', '华富', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1507, '环航物流', '54d35fd875676bd46ce033b5753f1657', '环航物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1508, '剑牌', '54d35fd875676bd46ce033b5753f1657', '剑牌', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1509, '久邦', '54d35fd875676bd46ce033b5753f1657', '久邦', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1510, '坤源', '54d35fd875676bd46ce033b5753f1657', '坤源', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1511, '利恒', '54d35fd875676bd46ce033b5753f1657', '利恒', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1512, '联合全程', '54d35fd875676bd46ce033b5753f1657', '联合全程', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1513, '联杰物流', '54d35fd875676bd46ce033b5753f1657', '联杰物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1514, '镁佳物流', '54d35fd875676bd46ce033b5753f1657', '镁佳物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1515, '明佳物流', '54d35fd875676bd46ce033b5753f1657', '明佳物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1516, '明顺物流', '54d35fd875676bd46ce033b5753f1657', '明顺物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1517, '南通友谊', '54d35fd875676bd46ce033b5753f1657', '南通友谊', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1518, '鹏瑞车队', '54d35fd875676bd46ce033b5753f1657', '鹏瑞车队', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1519, '千琥', '54d35fd875676bd46ce033b5753f1657', '千琥', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1520, '强仁', '54d35fd875676bd46ce033b5753f1657', '强仁', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1521, '沙鑫物流', '54d35fd875676bd46ce033b5753f1657', '沙鑫物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1522, '上海百华', '54d35fd875676bd46ce033b5753f1657', '上海百华', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1523, '水陆车队', '54d35fd875676bd46ce033b5753f1657', '水陆车队', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1524, '顺安物流', '54d35fd875676bd46ce033b5753f1657', '顺安物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1525, '天浦', '54d35fd875676bd46ce033b5753f1657', '天浦', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1526, '铁优', '54d35fd875676bd46ce033b5753f1657', '铁优', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1527, '纬泰联运', '54d35fd875676bd46ce033b5753f1657', '纬泰联运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1528, '沃帆物流', '54d35fd875676bd46ce033b5753f1657', '沃帆物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1529, '新港富宝', '54d35fd875676bd46ce033b5753f1657', '新港富宝', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1530, '新力', '54d35fd875676bd46ce033b5753f1657', '新力', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1531, '轩泽物流', '54d35fd875676bd46ce033b5753f1657', '轩泽物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1532, '迅捷物流', '54d35fd875676bd46ce033b5753f1657', '迅捷物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1533, '洋浦中惠', '54d35fd875676bd46ce033b5753f1657', '洋浦中惠', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1534, '优星', '54d35fd875676bd46ce033b5753f1657', '优星', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1535, '云扬物流', '54d35fd875676bd46ce033b5753f1657', '云扬物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1536, '振邦', '54d35fd875676bd46ce033b5753f1657', '振邦', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1537, '中外运', '54d35fd875676bd46ce033b5753f1657', '中外运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1538, '长天', '54d35fd875676bd46ce033b5753f1657', '长天', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1539, '豪旺国际', '54d35fd875676bd46ce033b5753f1657', '豪旺国际', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1540, '顺宇', '54d35fd875676bd46ce033b5753f1657', '顺宇', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1541, '云龙', '54d35fd875676bd46ce033b5753f1657', '云龙', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1542, '永盛', '54d35fd875676bd46ce033b5753f1657', '永盛', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1543, '太仓博洋行', '54d35fd875676bd46ce033b5753f1657', '太仓博洋行', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1544, '乾宁物流', '54d35fd875676bd46ce033b5753f1657', '乾宁物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1549, 'NTYZH', '54d35fd875676bd46ce033b5753f1657', '南通永正海船务有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1553, 'PKE', '54d35fd875676bd46ce033b5753f1657', '汎韩物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1565, 'SHHF', '54d35fd875676bd46ce033b5753f1657', '上海海富', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1569, 'SHSXWL', '54d35fd875676bd46ce033b5753f1657', '上海盛雄物流服务有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1585, 'TZ', '54d35fd875676bd46ce033b5753f1657', '上海柏辉船务有限公司南京分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1586, 'UASC', '54d35fd875676bd46ce033b5753f1657', '上海中外运阿联船舶代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1590, 'WHL', '54d35fd875676bd46ce033b5753f1657', '万海航运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1592, 'WXP', '54d35fd875676bd46ce033b5753f1657', '危险品', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1593, 'WYDC', '54d35fd875676bd46ce033b5753f1657', '外运定舱', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1595, 'XMYP', '54d35fd875676bd46ce033b5753f1657', '厦门元鹏船运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1596, 'XZMJGG', '54d35fd875676bd46ce033b5753f1657', '徐州孟家沟港', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1599, 'YZJHXX', '54d35fd875676bd46ce033b5753f1657', '扬州集海送箱厂新箱', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1606, 'ZJSDOS', '54d35fd875676bd46ce033b5753f1657', '南通中集特种运输设备铸造有限公', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1608, 'ZSHY', '54d35fd875676bd46ce033b5753f1657', '上海至善航运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1609, 'ZSMY', '54d35fd875676bd46ce033b5753f1657', '舟山明赢船务有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1611, 'ZYFY', '54d35fd875676bd46ce033b5753f1657', '中远泛亚', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1612, 'CFS-FM(LH)', '54d35fd875676bd46ce033b5753f1657', 'CFS-上海富弥贸易有限公司(硫磺)', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1613, 'SHXDYL', '54d35fd875676bd46ce033b5753f1657', '上海现代亚轮国际货运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1614, 'RQHY', '54d35fd875676bd46ce033b5753f1657', '瑞桥金德(北京)货运南京分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1615, 'YHWL', '54d35fd875676bd46ce033b5753f1657', '南京易和物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1616, 'GCL', '54d35fd875676bd46ce033b5753f1657', '大新华物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1617, 'RAFNKG', '54d35fd875676bd46ce033b5753f1657', '通诚物流(烟台)有限公司南京分', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1618, 'JSDQ', '54d35fd875676bd46ce033b5753f1657', '江苏东泉国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1619, 'SUMEC', '54d35fd875676bd46ce033b5753f1657', '上海苏美达国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1620, 'XSWHG', '54d35fd875676bd46ce033b5753f1657', '新生圩海关（海关罚没）', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1621, 'NBBXW', '54d35fd875676bd46ce033b5753f1657', '宁波宝信威国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1622, 'JSHDWL', '54d35fd875676bd46ce033b5753f1657', '江苏海德国际物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1623, 'SHWL-PTA', '54d35fd875676bd46ce033b5753f1657', '上化物流-PTA', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1624, 'NJPB', '54d35fd875676bd46ce033b5753f1657', '上海平邦国际货运南京分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1625, 'YSHDSH', '54d35fd875676bd46ce033b5753f1657', '上海银硕国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1626, 'JSHSHY', '54d35fd875676bd46ce033b5753f1657', '江苏恒生国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1627, 'NJPT', '54d35fd875676bd46ce033b5753f1657', '南京磐泰货运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1631, 'MY', '54d35fd875676bd46ce033b5753f1657', '舟山明赢', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1632, 'SUN', '54d35fd875676bd46ce033b5753f1657', '江苏外运内贸', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1633, 'SYMSNM', '54d35fd875676bd46ce033b5753f1657', '烟台海运内贸', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1634, 'XYWL', '54d35fd875676bd46ce033b5753f1657', '兴元物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1635, 'NJSHHY', '54d35fd875676bd46ce033b5753f1657', '南京晟昊国际货运代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1636, 'JSWYHTWL', '54d35fd875676bd46ce033b5753f1657', '江苏中外运合同物流事业部', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1637, 'STWL', '54d35fd875676bd46ce033b5753f1657', '上海上泰物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1638, 'NJXGDY', '54d35fd875676bd46ce033b5753f1657', '南京新港鼎元物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1641, 'NJHX', '54d35fd875676bd46ce033b5753f1657', '南京华新有色金属有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1642, 'DFHWWL', '54d35fd875676bd46ce033b5753f1657', '东方海外物流(中国)有限公司南京', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1643, 'SHYPK', '54d35fd875676bd46ce033b5753f1657', '上海依佩克南京分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1644, 'NJYLFLJK', '54d35fd875676bd46ce033b5753f1657', '南京耀乐废料进口', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1645, 'NJYLGJ', '54d35fd875676bd46ce033b5753f1657', '南京耀乐国际货物运输代理公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1646, 'ZHWL', '54d35fd875676bd46ce033b5753f1657', '江苏中海物流有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1647, 'QC', '54d35fd875676bd46ce033b5753f1657', '浅草', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1654, 'BD', '54d35fd875676bd46ce033b5753f1657', '南京邦达物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1655, 'NJZXWL', '54d35fd875676bd46ce033b5753f1657', '南京直效物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1657, 'YTHY', '54d35fd875676bd46ce033b5753f1657', '烟台海运', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1659, 'HSWL', '54d35fd875676bd46ce033b5753f1657', '和顺物流', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1661, 'HONGKANG', '54d35fd875676bd46ce033b5753f1657', '宏康报关公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1662, 'NJWDBG', '54d35fd875676bd46ce033b5753f1657', '南京外代报关行', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1663, 'JSWYHY', '54d35fd875676bd46ce033b5753f1657', '江苏中外运有限公司货运分公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1664, 'JIERUN', '54d35fd875676bd46ce033b5753f1657', '捷润船务', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1665, 'JSJH', '54d35fd875676bd46ce033b5753f1657', '江苏集海', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1666, 'PS', '54d35fd875676bd46ce033b5753f1657', '江苏泛星国际货运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1667, 'NJSY', '54d35fd875676bd46ce033b5753f1657', '南京苏亚', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1668, 'BAOHUA', '54d35fd875676bd46ce033b5753f1657', '江苏宝华仓储', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1669, 'SUTONG', '54d35fd875676bd46ce033b5753f1657', '苏通', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1670, 'SUYA1', '54d35fd875676bd46ce033b5753f1657', '苏亚1', '', 4, 3, 3, '', '', 'Y', '12345678', '2018-08-08', NULL, NULL, NULL),
(1671, 'JSCD', '54d35fd875676bd46ce033b5753f1657', '江苏中外运船务代理有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1672, 'JSSTBG', '54d35fd875676bd46ce033b5753f1657', '江苏苏通报关有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1673, 'JSJJYS', '54d35fd875676bd46ce033b5753f1657', '江苏金捷国际货物运输代理有限公', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1674, 'ZXGJ', '54d35fd875676bd46ce033b5753f1657', '中新国际运输服务有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1675, 'ZGLU', '54d35fd875676bd46ce033b5753f1657', '中谷新良', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1676, 'QSHHY', '54d35fd875676bd46ce033b5753f1657', '南昌市全顺航运有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1677, 'DLWD', '54d35fd875676bd46ce033b5753f1657', '德龙外代', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1680, 'JSQH', '54d35fd875676bd46ce033b5753f1657', '江苏祺海船务有限公司', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1681, 'DLJHT', '54d35fd875676bd46ce033b5753f1657', '德龙江海通', NULL, 0, 0, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
(1682, 'ZJNM', '54d35fd875676bd46ce033b5753f1657', '中集内贸', '', 1, 0, 0, '', '', 'Y', '', NULL, NULL, NULL, NULL),
(1683, 'TJNM', '54d35fd875676bd46ce033b5753f1657', '通集内贸', '', 2, 0, 0, '', '', 'Y', '', NULL, NULL, NULL, '{"id":"1683","photo":["1"]}');

-- --------------------------------------------------------

--
-- 表的结构 `tally_dd_cargo_damage_img`
--

CREATE TABLE IF NOT EXISTS `tally_dd_cargo_damage_img` (
  `id` int(20) unsigned NOT NULL,
  `level_id` int(20) unsigned NOT NULL COMMENT '关ID',
  `img` varchar(255) NOT NULL COMMENT '货残损照片',
  `level_num` int(20) NOT NULL COMMENT '关数'
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COMMENT='货残损照片表';

--
-- 转存表中的数据 `tally_dd_cargo_damage_img`
--

INSERT INTO `tally_dd_cargo_damage_img` (`id`, `level_id`, `img`, `level_num`) VALUES
(44, 876, '5968446323a3d214.jpg', 2),
(45, 878, '59685bf69d896772.jpg', 4),
(46, 880, '59685f82cfed2161.jpg', 1),
(47, 881, '59685fb674709678.jpg', 2),
(48, 885, '59686edca41b6127.jpg', 2),
(49, 886, '59688b9fd4843688.jpg', 1),
(50, 887, '59688c53e0612961.jpg', 1),
(53, 895, '598180fce9fa3470.jpg', 3),
(54, 896, '598180fd1bb35234.jpg', 2);

-- --------------------------------------------------------

--
-- 表的结构 `tally_dd_ctn_damage_after_img`
--

CREATE TABLE IF NOT EXISTS `tally_dd_ctn_damage_after_img` (
  `id` int(20) unsigned NOT NULL,
  `operation_id` int(11) NOT NULL COMMENT '作业ID',
  `img` varchar(255) NOT NULL COMMENT '箱残损图片'
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='作业中造成的箱残损照片表';

--
-- 转存表中的数据 `tally_dd_ctn_damage_after_img`
--

INSERT INTO `tally_dd_ctn_damage_after_img` (`id`, `operation_id`, `img`) VALUES
(16, 1015, '59682eb8ba864234.jpg'),
(17, 1052, '59688c7806ec2217.jpg'),
(18, 1068, '598180fd3c8d3420.jpg'),
(19, 1067, '5981838bcb5b0813.jpg'),
(20, 1083, '59a8b676274bc485.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `tally_dd_ctn_damage_img`
--

CREATE TABLE IF NOT EXISTS `tally_dd_ctn_damage_img` (
  `id` int(20) unsigned NOT NULL,
  `operation_id` int(11) unsigned NOT NULL COMMENT '作业ID',
  `img` varchar(255) NOT NULL COMMENT '箱残损图片'
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COMMENT='作业箱残损照片表';

--
-- 转存表中的数据 `tally_dd_ctn_damage_img`
--

INSERT INTO `tally_dd_ctn_damage_img` (`id`, `operation_id`, `img`) VALUES
(71, 1067, '59817f57466a6375.jpg'),
(70, 1052, '59688b9f3746e753.jpg'),
(69, 1032, '59685e8f3e331824.jpg'),
(72, 1068, '598180110b238837.jpg');

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
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tally_dd_instruction`
--

INSERT INTO `tally_dd_instruction` (`id`, `plan_id`, `department_id`, `date`, `status`, `is_must`) VALUES
(20, 31, 53, '2017-07-12', '1', 'N'),
(21, 32, 53, '2017-07-12', '1', 'Y'),
(22, 33, 53, '2017-07-12', '0', 'N'),
(23, 34, 53, '2017-07-28', '1', 'Y'),
(24, 35, 53, '2017-08-08', '0', 'N'),
(25, 36, 53, '2017-08-08', '0', 'N'),
(26, 37, 53, '2017-08-08', '0', 'N'),
(27, 38, 53, '2017-08-08', '0', 'N'),
(28, 39, 53, '2017-08-10', '0', 'N'),
(29, 40, 53, '2017-08-10', '0', 'N'),
(30, 41, 53, '2017-08-10', '1', 'Y'),
(31, 42, 53, '2017-08-11', '0', 'N'),
(32, 43, 53, '2017-08-29', '0', 'N'),
(33, 44, 53, '2017-08-29', '0', 'N');

-- --------------------------------------------------------

--
-- 表的结构 `tally_dd_level_cargo_img`
--

CREATE TABLE IF NOT EXISTS `tally_dd_level_cargo_img` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `level_id` int(11) NOT NULL COMMENT '关ID',
  `level_num` int(11) NOT NULL COMMENT '第几关（关序号）',
  `level_img` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '关照片'
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `tally_dd_level_cargo_img`
--

INSERT INTO `tally_dd_level_cargo_img` (`id`, `level_id`, `level_num`, `level_img`) VALUES
(7, 852, 1, '596734188ab31435.jpg'),
(8, 853, 2, '5967342a9b158126.jpg'),
(9, 854, 1, '59682e9b582b7599.jpg'),
(10, 855, 1, '59682f5e0bb1f329.jpg'),
(27, 872, 1, '59683ce18e735960.jpg'),
(29, 875, 1, '5968443f8c321610.jpg'),
(30, 876, 2, '596844632327e834.jpg'),
(31, 877, 3, '59684471965e8281.jpg'),
(32, 878, 4, '59685bf69d07f188.jpg'),
(33, 879, 1, '59685ec0c5916303.jpg'),
(34, 880, 1, '59685f82cf506365.jpg'),
(35, 881, 2, '59685fb673f5a227.jpg'),
(36, 884, 1, '59686edc6d897910.jpg'),
(37, 885, 2, '59686edca0c75901.jpg'),
(38, 886, 1, '59688b9fd3e7b597.jpg'),
(39, 887, 1, '59688c53dfd13238.jpg'),
(40, 892, 1, '59817f9a9073b943.jpg'),
(41, 893, 2, '59818010d077e130.jpg'),
(42, 894, 1, '598180fc9ece7719.jpg'),
(43, 895, 3, '598180fce9460467.jpg'),
(44, 896, 2, '598180fd1b2ec646.jpg'),
(46, 904, 1, '59a8b4315386b747.jpg'),
(47, 905, 1, '59ae4e03e825a756.jpg');

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
) ENGINE=MyISAM AUTO_INCREMENT=1089 DEFAULT CHARSET=utf8 COMMENT='门到门拆箱作业表';

--
-- 转存表中的数据 `tally_dd_operation`
--

INSERT INTO `tally_dd_operation` (`id`, `ctn_id`, `door_picture`, `seal_picture`, `damage_remark`, `true_sealno`, `cargo_picture`, `empty_picture`, `damage_after_remark`, `operator_id`, `begin_time`, `is_stop`, `tmp_sealno`, `step`, `examine_remark`, `operation_examine`) VALUES
(1015, 57, '59685e8f3d672908.jpg', '59685e8f3d672908.jpg', 'sad', '', '', '59682eb8ba013816.jpg', '1', 10, '2017-07-14 10:33:51', 'Y', NULL, '3', NULL, 2),
(1033, 59, '', '', '', '', '', '', '', 10, '2017-07-14 14:04:17', 'Y', NULL, '3', NULL, 1),
(1034, 64, '59685e8f3d672908.jpg', '59685e8f3d672908.jpg', '', '', NULL, NULL, '', 10, '2017-07-14 14:13:08', 'Y', NULL, '3', NULL, 1),
(1023, 58, '5968442db4984505.jpg', '5968442db4d67612.jpg', '', '7', '59688beef0a88988.jpg', '59688c7806757429.jpg', '', 10, '2017-07-14 12:10:21', 'Y', NULL, '3', NULL, 2),
(1032, 60, '59685e8f3d672908.jpg', '59685e8f3da9f786.jpg', '11', '2333', '', '', '', 10, '2017-07-14 14:02:55', 'Y', NULL, '3', NULL, 2),
(1035, 63, '', '', '', '', '', '', '', 10, '2017-07-14 14:13:52', 'Y', NULL, '3', NULL, 1),
(1051, 65, NULL, NULL, NULL, NULL, '59688b9f6f37a465.jpg', '', '', 8, '2017-07-14 17:10:48', 'Y', NULL, '3', NULL, 1),
(1052, 62, '5968442db4984505.jpg', '59685e8f3da9f786.jpg', '', '124', '59688beef0a88988.jpg', '59688c7806757429.jpg', '11', 8, '2017-07-14 17:15:12', 'Y', NULL, '3', NULL, 2),
(1068, 56, '598180110a6bf622.jpg', '598180110aa6a865.jpg', '/+*3', '654321/+-*', '598180fc21db0950.jpg', '598180fd3be5f254.jpg', '箱体残损', 8, '2017-08-02 15:32:33', 'N', NULL, '3', NULL, 2),
(1067, 61, '59817f574023b157.jpg', '59817f57459b4277.jpg', '1', '123456+-*/', '59817f7267869476.jpg', '5981838bcb0ca367.jpg', '1', 8, '2017-08-02 15:29:27', 'N', NULL, '3', NULL, 1),
(1088, 68, '59ae4dd8ed79b155.jpg', '59ae4dd8ede95950.jpg', '', '11', '59ae4debc8fda771.jpg', NULL, NULL, 8, '2017-09-05 15:10:16', 'N', NULL, '3', NULL, 1),
(1083, 55, '59a8b15817a9b242.jpg', '59a8b15822031622.jpg', '', 'Eedd', '59a8b1ef993e0843.jpg', '59a8b67624df9542.jpg', 'Dff', 8, '2017-09-01 09:01:12', 'N', NULL, '3', NULL, 1);

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
) ENGINE=MyISAM AUTO_INCREMENT=906 DEFAULT CHARSET=utf8 COMMENT='作业关表';

--
-- 转存表中的数据 `tally_dd_operation_level`
--

INSERT INTO `tally_dd_operation_level` (`id`, `blno`, `operation_id`, `level_num`, `num`, `damage_num`, `operator_id`, `createtime`) VALUES
(884, 'weqw', 1048, 1, 6, 0, 8, '2017-07-14 15:12:28'),
(885, 'weqw', 1048, 2, 5, 6, 8, '2017-07-14 15:12:28'),
(854, 'aaaaa', 1015, 1, 1, 0, 10, '2017-07-14 10:38:19'),
(875, 'weqw', 1023, 1, 9, 0, 10, '2017-07-14 12:10:39'),
(876, 'weqw', 1023, 2, 9, 7, 10, '2017-07-14 12:11:15'),
(877, 'weqw', 1023, 3, 5, 0, 10, '2017-07-14 12:11:29'),
(878, 'weqw', 1023, 4, 5, 0, 10, '2017-07-14 13:51:50'),
(879, 'weqw', 1032, 1, 1, 0, 10, '2017-07-14 14:03:44'),
(880, 'weqw', 1033, 1, 1, 0, 10, '2017-07-14 14:06:58'),
(881, 'weqw', 1033, 2, 333, 99, 10, '2017-07-14 14:07:50'),
(882, 'weqw', 1034, 1, 1, 0, 10, '2017-07-14 14:13:26'),
(883, 'SDASDA', 1035, 1, 1, 0, 10, '2017-07-14 14:14:01'),
(886, 'qeqwe', 1051, 1, 9311111, 931111111, 8, '2017-07-14 17:15:11'),
(887, 'weqw', 1052, 1, 7, 1, 8, '2017-07-14 17:18:11'),
(892, 'aaaaa', 1067, 1, 1, 0, 8, '2017-08-02 15:30:34'),
(893, 'bbbbb', 1067, 2, 2, 0, 8, '2017-08-02 15:32:32'),
(894, 'aaaaa', 1068, 1, 1, 0, 8, '2017-08-02 15:36:28'),
(895, 'ccccc', 1067, 3, 3, 1, 8, '2017-08-02 15:36:28'),
(896, 'bbbbb', 1068, 2, 2, 1, 8, '2017-08-02 15:36:29'),
(904, 'aaaaa', 1083, 1, 12, 0, 8, '2017-09-01 09:13:21'),
(905, 'sdf', 1088, 1, 25, 0, 8, '2017-09-05 15:10:59');

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
  `getplantime` timestamp NOT NULL COMMENT '接受指令时间'
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tally_dd_plan`
--

INSERT INTO `tally_dd_plan` (`id`, `business`, `orderid`, `orderdate`, `vslname`, `voyage`, `blno`, `applycode`, `applyname`, `paycode`, `payman`, `amount`, `paytype`, `cargoname`, `numbersofpackages`, `package`, `mark`, `rcvflag`, `lcl`, `consignee`, `unpackagingplace`, `operating_type`, `classes`, `undgno`, `contactuser`, `contact`, `note`, `transit`, `category`, `is_valid`, `getplantime`) VALUES
(31, 'dd', 'qwer', '20170712172812', '安华3', 'qwer', '', '0000', '南京中理', '', '', '0.00', '0', '', 0, NULL, NULL, '', '', '', '南京龙潭港804泊位', '0', '', NULL, '', '', '', 'CY', '2', 'N', '2017-07-12 09:28:12'),
(32, 'cfs', 'asdas', '20170712172832', '赣荣顺002', 'fgdfgdf', '', '0000', '南京中理', '', '', '0.00', '0', '', 0, NULL, NULL, '', '', '', '南京龙潭港806泊位', '0', '', NULL, '', '', '', 'CY', '2', 'N', '2017-07-12 09:28:32'),
(33, 'cfs', 'SCXS', '20170712173840', '船发', 'EFSDF', '', '0000', '南京中理', '', '', '0.00', '0', '', 0, NULL, NULL, '', '', '', '南京龙潭港804泊位', '0', '', NULL, '', '', '', 'CY', '2', 'N', '2017-07-12 09:38:40'),
(34, 'dd', '加会班聚环保局', '20170728134900', '安信集3', '看见看见', '', '0000', '南京中理', '', '', '0.00', '0', '', 0, NULL, NULL, '', '', '', '南京龙潭港803泊位', '0', '', NULL, '', '', '', 'CY', '2', 'N', '2017-07-28 05:49:00'),
(35, 'dd', '@#', '20170808093925', '安华1号', '2#￥', '', '0000', '南京中理', '', '', '0.00', '0', '', 0, NULL, NULL, '', '', '', '南京龙潭港801泊位', '0', '', NULL, '', '', '', 'CY', '2', 'N', '2017-08-08 01:39:25'),
(36, 'dd', '!@#$%^&amp;*()_+_^&amp;*(', '20170808141530', '安华3', '3', '', '0000', '南京中理', '', '', '0.00', '0', '', 0, NULL, NULL, '', '', '', '南京龙潭港804泊位', '0', '', NULL, '', '', '', 'CY', '2', 'N', '2017-08-08 06:15:30'),
(37, 'dd', '！@#￥%……&amp;*（）！@#￥%……&amp;', '20170808141705', '安华1号', '！@#￥%……&amp;', '', '！@#￥%……&amp;', '！@#￥%……&amp;', '', '', '0.00', '0', '', 0, NULL, NULL, '', '', '', '南京龙潭港801泊位', '0', '', NULL, '', '', '', 'CY', '2', 'N', '2017-08-08 06:17:05'),
(38, 'dd', '！@#￥%……&amp;*（）', '20170808142107', '安华1号', '！@#￥%……&amp;*（）', '', '456', '瑞安', '', '', '0.00', '0', '', 0, NULL, NULL, '', '', '', '南京龙潭港802泊位', '0', '', NULL, '', '', '', 'CY', '2', 'N', '2017-08-08 06:21:07'),
(39, 'dd', '2131321', '20170810132931', '丰瑞1', '231', '', 'dsa', '213', '', '', '0.00', '0', '', 0, NULL, NULL, '', '', '', '南京龙潭港801泊位', '0', '', NULL, '', '', '', 'CY', '2', 'N', '2017-08-10 05:29:31'),
(40, 'dd', '212', '20170810133004', '丰瑞1', '123', '', '问请问', '委屈翁群翁无群二群', '', '', '0.00', '0', '', 0, NULL, NULL, '', '', '', '南京龙潭港802泊位', '0', '', NULL, '', '', '', 'CY', '2', 'N', '2017-08-10 05:30:04'),
(41, 'dd', '1213', '20170810133029', '北海', '2', '', '!@#$%^', '2321312!@#$%^&amp;*', '', '', '0.00', '0', '', 0, NULL, NULL, '', '', '', '南京龙潭港804泊位', '0', '', NULL, '', '', '', 'CY', '2', 'N', '2017-08-10 05:30:29'),
(42, 'dd', 'a! &lt; +*0', '20170811134132', '安华3', 'a! &lt; +*0', '', 'a! &lt; +*0', 'a! &lt; +*0', '', '', '0.00', '0', '', 0, NULL, NULL, '', '', '', '南京龙潭港804泊位', '0', '', NULL, '', '', '', 'CY', '2', 'N', '2017-08-11 05:41:32'),
(43, 'dd', '@@#$', '20170829085708', '安华3', '#@!', '', '@@@@@', '@#@', '', '', '0.00', '0', '', 0, NULL, NULL, '', '', '', '南京龙潭港802泊位', '0', '', NULL, '', '', '@@@@@@@@@@@@@@@', 'CY', '2', 'N', '2017-08-29 00:57:08'),
(44, 'dd', '！@#￥%……&amp;*（）——', '20170829090954', '安华3', '！@#￥%……&amp;*（）——', '', '！@#￥%……&amp;*（）——', '！@#￥%……&amp;*（）——', '', '', '0.00', '0', '', 0, NULL, NULL, '', '', '', '南京龙潭港802泊位', '0', '', NULL, '', '', '', 'CY', '2', 'N', '2017-08-29 01:09:54');

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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `tally_dd_plan_cargo`
--

INSERT INTO `tally_dd_plan_cargo` (`id`, `plan_id`, `paycode`, `payman`, `blno`, `cargoname`, `numbersofpackages`, `package`, `mark`, `consignee`, `classes`, `undgno`, `contactuser`, `contact`, `last_operator`, `last_operationtime`) VALUES
(10, 32, 'DFWL', '达飞物流', 'aaaaa', '8', 5, '5', '5', '5', '5', '5', '5', '5', 7, '2017-07-12 17:28:57'),
(11, 32, 'GTW', '盖特威', 'bbbbb', '6', 65, '6', '6', '6', '56', '65', '6', '3', 7, '2017-07-12 17:29:13'),
(12, 32, 'HMGJ', '华贸国际', 'ccccc', 'werwe', 65, '65', '6', '65', '65', '54', '6', '65', 7, '2017-07-12 17:29:28'),
(13, 31, 'GTW', '盖特威', 'weqw', 'wq', 56, '5', '6', '65', '2', '6', '656', '565', 7, '2017-07-12 17:31:16'),
(14, 31, 'DEV', '开发船代', 'qeqwe', '6', 6, '6', '6', '6', '5', '55', '6', '66', 7, '2017-07-12 17:31:28'),
(15, 31, 'HSDCW', '恒顺达船务有限公司', 'SDASDA', '362', 65, '6', '165', '2', '66', '6', '61', '61', 7, '2017-07-12 17:31:43'),
(16, 35, 'HRHY', '南京恒瑞海运有限公司', '#@！#', '#@#@！#', 1, '#！@#', '#', '！@#！@#', '！@#', '@#', '！@#！@', '！@#', 21, '2017-08-08 09:40:41'),
(17, 38, 'JSLY(2)', '江苏省联运有限公司第二分公司.', '3333', '2', 2, '3', '1', '12', '2', '1', '2', '3', 21, '2017-08-10 13:17:23'),
(18, 41, 'NJKT', '南京开泰集装箱储运有限公司', '20', '1', 231, '313', '312', '3123', '213', '13', '1321', '12', 8, '2017-08-11 09:03:33'),
(19, 41, 'NJKT', '南京开泰集装箱储运有限公司', '21', '21', 21, '13', '213123', '213', '41', '3213', '123213', '321', 8, '2017-08-10 13:35:54'),
(20, 41, 'SYGJ(一)', '江苏苏亚国际货运有限公司1', '321', '131', 2313, '3', '131', '213', '1', '13', '2131', '132', 8, '2017-08-10 13:36:39'),
(21, 41, 'NJKT', '南京开泰集装箱储运有限公司', '2%￥？》 ...', '你好呀', 1, '1', 'dfsafdsafsa', '范德萨发生', '个人分工', '12', '对方认为', 'fdww', 8, '2017-08-11 11:07:45'),
(23, 42, 'NJKT', '南京开泰集装箱储运有限公司', 'NIHENCM', '衣服', 2756, '简单', '27852', '范德萨发生', '12', '12', '是的发生的故事对方认为', 'fdww', 8, '2017-08-11 15:58:31'),
(24, 41, 'GTW', '盖特威', 'sdf', 'df', 1, 'd', '@#', 'qw', '撒的发生的', 'we', '1', 'wer', 8, '2017-08-28 17:40:41'),
(25, 41, 'RYWL', '润扬物流', 'sda', 'ewr', 1, 'qw', 'qwe', 'qwe', 'qwe', 'we', 'qwe', 'qwe', 8, '2017-08-28 17:34:33'),
(26, 41, 'TEMP', '临时箱主', 'sad', 'as', 2, 'sd', 'asd', 'asd', '，是的', 'asd', 'asd', 'as', 8, '2017-08-28 17:41:20'),
(27, 44, 'GTW', '盖特威', 'dfs@#$%sdfs@#$%', 'sdfs@#$%', 5, 'sdfs@#$%', 'vsdfs@#$%', 'sdfs@#$%', '#$%', 'sdfs@#$%', 'sdfs@#$%', 'sdfs@#$%', 7, '2017-08-29 09:51:09'),
(28, 44, 'GTW', '盖特威', '3', 'df', 1, 'fsd', 'df', 'sdf', 'qweq', 'we', 'sdfs@#$%', 'eq', 7, '2017-08-29 09:53:29');

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
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tally_dd_plan_container`
--

INSERT INTO `tally_dd_plan_container` (`id`, `ctnno`, `ctnsize`, `ctntype`, `sealno`, `numbersofpackages`, `weight`, `volume`, `flflag`, `classes`, `undgno`, `plan_id`, `status`, `operator_id`) VALUES
(55, 'APZU3718520', '20', 'GP', 'SDASDg', 32, '233.00', '3232.00', 'F', '2', 'SDAS', 32, '2', 8),
(56, 'AXIU2195931', '20', 'TP', 'SDASD', 123, '23.00', '5.00', 'L', 'EQWE', 'EQWE', 32, '2', 8),
(57, 'CBHU4320724', '40', 'FR', 'KOAS', 8712, '789.00', '65.00', 'F', 'SDAS', 'DASD', 32, '2', 10),
(58, 'APZU3718520', '40', 'GP', 'SADASDA', 32, '233.00', '3232.00', 'F', 'EQWE', 'SDAS', 31, '2', 10),
(59, 'APZU3718520', '40', 'GP', 'SDASDg', 32, '233.00', '123.00', 'F', 'EQWE', 'SDAS', 31, '2', 10),
(60, 'CBHU4320724', '20', 'GP', 'SDASDg', 32, '233.00', '3232.00', 'L', 'EQWE', 'EQWE', 31, '2', 10),
(61, 'CBHU4320724', '20', 'sd', 'fdsf', 4534, '54.00', '54.00', 'F', '4', '5', 32, '2', 8),
(62, 'CBHU4320724', '20', 'TP', 'SDASDg', 32, '233.00', '3232.00', 'L', 'EQWE', 'EQWE', 31, '2', 8),
(63, 'CBHU4320724', '40', 'GP', 'SDASDg', 32, '23.00', '3232.00', 'F', 'EQWE', 'EQWE', 31, '2', 10),
(64, 'CBHU4320724', '20', 'sd', 'SADASDA', 123, '233.00', '3232.00', 'F', 'EQWE', 'EQWE', 31, '2', 10),
(65, 'AXIU2195931', '20', 'TP', 'SADASDA', 123, '233.00', '3232.00', 'F', 'EQWE', 'SDAS', 31, '2', 8),
(66, 'CBHU4320724', '40', 'TP', 'SADASDA', 4534, '233.00', '3232.00', 'F', '', '', 31, '0', NULL),
(67, 'BMOU5233096', '#', '#', '￥￥￥￥', 0, '1.00', '3.00', 'F', '342', '123￥%', 35, '0', NULL),
(68, 'APZU3718520', '23', 'gp', '1231', 31231, '3.00', '123.00', 'F', '213', '13', 41, '1', 8);

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
  `createtime` datetime NOT NULL COMMENT '创建时间'
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tally_dd_prove`
--

INSERT INTO `tally_dd_prove` (`id`, `ctn_id`, `ctn_no`, `ctn_type_code`, `ctn_master`, `ship_id`, `ship_name`, `vargo`, `total_ticket`, `total_package`, `damaged_quantity`, `level_num`, `flflag`, `loadingtype`, `location_id`, `location_name`, `empty_weight`, `cargo_weight`, `total_weight`, `dangerlevel`, `sealno`, `operator_id`, `operator_name`, `content`, `remark`, `consignee`, `createtime`) VALUES
(36, 57, 'CBHU4320724', '40FR', NULL, 700, '赣荣顺002', 'fgdfgdf', 1, 1, 0, 1, 'F', '0', 6, '南京龙潭港806泊位', 0.00, 0.00, 789.00, 'SDAS', 'KOAS', 10, '叶声兵', '{"bl_no":"","package":null,"mark":null,"cargo_unit":"1","damage_unit":"0"}', '', '', '2017-07-14 17:19:34'),
(37, 60, 'CBHU4320724', '20GP', NULL, 171, '安华3', 'qwer', 1, 1, 0, 1, 'L', '0', 4, '南京龙潭港804泊位', 0.00, 0.00, 233.00, 'EQWE', '2333', 10, '叶声兵', '{"bl_no":"","package":null,"mark":null,"cargo_unit":"1","damage_unit":"0"}', '', '', '2017-07-17 09:08:56'),
(38, 62, 'CBHU4320724', '20TP', NULL, 171, '安华3', 'qwer', 1, 7, 1, 1, 'L', '0', 4, '南京龙潭港804泊位', 0.00, 0.00, 233.00, 'EQWE', '124', 8, '陈业', '{"bl_no":"","package":null,"mark":null,"cargo_unit":"7","damage_unit":"1"}', '', '', '2017-07-17 09:11:45'),
(39, 58, 'APZU3718520', '40GP', NULL, 171, '安华3', 'qwer', 1, 28, 7, 4, 'F', '0', 4, '南京龙潭港804泊位', 0.00, 0.00, 233.00, 'EQWE', '7', 10, '叶声兵', '[{"blno":"weqw","package":"5","mark":"6","cargo_unit":"28","damage_unit":"7"}]', '', '', '2017-07-20 14:00:14'),
(40, 56, 'AXIU2195931', '20TP', NULL, 700, '赣荣顺002', 'fgdfgdf', 1, 3, 1, 1, 'L', '0', 6, '南京龙潭港806泊位', 0.00, 0.00, 23.00, 'EQWE', '654321/+-*', 8, '陈业', '[{"blno":"aaaaa","package":"5","mark":"5","cargo_unit":"1","damage_unit":"0"},{"blno":"bbbbb","package":"6","mark":"6","cargo_unit":"2","damage_unit":"1"}]', '', '', '2017-08-28 16:51:18');

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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `tally_department`
--

INSERT INTO `tally_department` (`id`, `department_code`, `department_name`, `pid`) VALUES
(47, 'LH01', '理货经营一部', 0),
(48, 'LH02', '理货经营二部', 0),
(49, 'LH03', '理货经营三部', 0),
(50, 'LH04', '理货经营四部', 0),
(51, 'QBZXZ', '起驳装箱组', 48),
(52, '835CKZ', '835仓库组', 48),
(53, 'MDMBZ', '门到门班组', 50),
(54, 'GWCK', '港外仓库', 50),
(55, 'QB', '七坝', 47);

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
) ENGINE=InnoDB AUTO_INCREMENT=212 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tally_dispatch`
--

INSERT INTO `tally_dispatch` (`id`, `chieftally`, `shift_id`, `instruction_id`, `business`, `dispatch_time`, `mark`) VALUES
(63, 7, 'QBZXZ201707011', 21, 'qbzx', '2017-07-12 06:32:03', '1'),
(64, 7, 'QBZXZ201707011', 16, 'cfs', '2017-07-12 08:13:19', '1'),
(66, 8, 'MDMBZ201707011', 21, 'dd', '2017-07-12 09:44:11', '1'),
(67, 8, 'MDMBZ201707011', 20, 'dd', '2017-07-14 02:54:14', '1'),
(68, 21, 'QBZXZ201707012', 22, 'qbzx', '2017-07-21 07:55:54', '1'),
(69, 21, 'QBZXZ201707012', 21, 'qbzx', '2017-07-25 05:43:11', '1'),
(70, 21, 'QBZXZ201707012', 23, 'qbzx', '2017-07-25 05:56:59', '1'),
(83, 7, 'QBZXZ201707231', 22, 'qbzx', '2017-07-25 08:42:10', '1'),
(84, 7, 'QBZXZ201707232', 22, 'qbzx', '2017-07-25 08:45:52', '1'),
(85, 21, 'QBZXZ201707241', 23, 'qbzx', '2017-07-26 01:31:55', '1'),
(86, 21, 'QBZXZ201707251', 23, 'qbzx', '2017-07-26 02:56:32', '1'),
(87, 21, 'QBZXZ201707251', 16, 'cfs', '2017-07-28 03:21:01', '1'),
(88, 21, 'QBZXZ201707251', 18, 'cfs', '2017-07-28 11:14:43', '1'),
(89, 21, 'QBZXZ201707251', 18, 'cfs', '2017-07-30 09:49:17', '1'),
(93, 8, 'MDMBZ201707021', 21, 'dd', '2017-07-30 11:08:02', '0'),
(95, 21, 'QBZXZ201707251', 16, 'cfs', '2017-07-31 02:56:03', '1'),
(193, 21, 'QBZXZ201707261', 18, 'cfs', '2017-08-02 04:06:43', '0'),
(194, 8, 'MDMBZ201707021', 23, 'dd', '2017-08-02 06:26:59', '0'),
(195, 21, 'QBZXZ201707261', 16, 'cfs', '2017-08-02 08:34:25', '0'),
(197, 8, 'MDMBZ201707021', 20, 'dd', '2017-08-03 09:10:07', '0'),
(200, 8, 'MDMBZ201707021', 30, 'dd', '2017-08-10 05:37:47', '0'),
(202, 8, 'MDMBZ201707021', 26, 'qbzx', '2017-08-10 07:07:48', '0'),
(204, 8, 'MDMBZ201707021', 21, 'cfs', '2017-08-14 06:20:40', '0'),
(210, 21, 'QBZXZ201707261', 22, 'qbzx', '2017-09-05 03:03:09', '0');

-- --------------------------------------------------------

--
-- 表的结构 `tally_dispatch_detail`
--

CREATE TABLE IF NOT EXISTS `tally_dispatch_detail` (
  `id` int(11) NOT NULL,
  `dispatch_id` int(11) NOT NULL COMMENT '派工ID',
  `clerk_id` int(11) DEFAULT NULL COMMENT '理货员ID',
  `dispatch_time` timestamp NULL DEFAULT NULL COMMENT '派工日期'
) ENGINE=InnoDB AUTO_INCREMENT=546 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tally_dispatch_detail`
--

INSERT INTO `tally_dispatch_detail` (`id`, `dispatch_id`, `clerk_id`, `dispatch_time`) VALUES
(89, 63, 5, '2017-07-12 06:32:03'),
(90, 63, 7, '2017-07-12 06:32:03'),
(91, 64, 5, '2017-07-12 08:13:19'),
(92, 64, 13, '2017-07-12 08:13:19'),
(97, 66, 8, '2017-07-14 02:43:11'),
(98, 66, 10, '2017-07-14 02:43:11'),
(99, 67, 8, '2017-07-14 02:54:14'),
(100, 67, 10, '2017-07-14 02:54:14'),
(107, 70, 21, '2017-07-25 05:56:59'),
(109, 69, 7, '2017-07-25 06:36:24'),
(110, 69, 21, '2017-07-25 06:36:24'),
(111, 68, 7, '2017-07-25 07:04:18'),
(112, 68, 21, '2017-07-25 07:04:18'),
(128, 83, 7, '2017-07-25 08:42:10'),
(129, 84, 7, '2017-07-25 08:45:52'),
(130, 85, 21, '2017-07-26 01:31:55'),
(131, 86, 21, '2017-07-26 02:56:32'),
(133, 87, 21, '2017-07-28 09:31:11'),
(134, 88, 21, '2017-07-28 11:14:43'),
(135, 89, 21, '2017-07-30 09:49:17'),
(142, 95, 21, '2017-07-31 02:56:03'),
(150, 93, 7, '2017-07-31 06:25:46'),
(151, 93, 8, '2017-07-31 06:25:46'),
(516, 193, 21, '2017-08-02 08:34:13'),
(517, 195, 21, '2017-08-02 08:34:25'),
(519, 197, 8, '2017-08-03 09:10:07'),
(532, 202, 8, '2017-08-10 07:08:02'),
(535, 204, 7, '2017-08-14 08:37:53'),
(536, 200, 8, '2017-09-01 07:08:47'),
(537, 194, 7, '2017-09-01 07:08:54'),
(538, 194, 8, '2017-09-01 07:08:54'),
(544, 210, 21, '2017-09-05 03:03:09');

-- --------------------------------------------------------

--
-- 表的结构 `tally_laborteam`
--

CREATE TABLE IF NOT EXISTS `tally_laborteam` (
  `id` int(10) NOT NULL,
  `labor_name` varchar(33) COLLATE utf8_bin NOT NULL COMMENT '劳务队名称',
  `creat_time` varchar(33) COLLATE utf8_bin DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `tally_laborteam`
--

INSERT INTO `tally_laborteam` (`id`, `labor_name`, `creat_time`) VALUES
(1, '劳务队1', '1494228637'),
(2, 'AG', '1494230214');

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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tally_location`
--

INSERT INTO `tally_location` (`id`, `pid`, `location_code`, `location_name`, `address`, `linkman`, `telephone`, `location_type`, `comment`, `operator`, `operationtime`) VALUES
(1, 0, '0001', '南京龙潭港801泊位', '', '', '', 1, NULL, NULL, NULL),
(2, 0, '0002', '南京龙潭港802泊位', '', '', '', 1, NULL, NULL, NULL),
(3, 0, '0003', '南京龙潭港803泊位', '', '', '', 1, NULL, NULL, NULL),
(4, 0, '0004', '南京龙潭港804泊位', '', '', '', 1, NULL, NULL, NULL),
(5, 0, '0005', '南京龙潭港805泊位', '', '', '', 1, NULL, NULL, NULL),
(6, 0, '0006', '南京龙潭港806泊位', '', '', '', 1, NULL, NULL, NULL),
(7, 0, '0007', '南京龙潭港807泊位', '', '', '', 1, NULL, NULL, NULL),
(8, 0, '0008', '南京龙潭港808泊位', '', '', '', 1, NULL, NULL, NULL),
(9, 0, '0009', '南京龙潭港809泊位', '', '', '', 1, NULL, NULL, NULL),
(10, 0, '0010', '南京龙潭港810泊位', '', '', '', 1, NULL, NULL, NULL),
(11, 0, '0011', '南京龙潭港811泊位', '', '', '', 1, NULL, NULL, NULL),
(12, 0, '0012', '南京龙潭港812泊位', '', '', '', 1, NULL, NULL, NULL),
(13, 0, '0013', '南京龙潭港813泊位', '', '', '', 1, NULL, NULL, NULL),
(14, 0, 'TY', '天宇作业区', '', '', '', 1, NULL, NULL, NULL),
(15, 0, 'CD', '场地', '', '', '', 1, NULL, NULL, NULL),
(16, NULL, 'ZDXM', '中电熊猫', NULL, NULL, NULL, 3, NULL, NULL, NULL),
(17, NULL, 'KL', '可隆', NULL, NULL, NULL, 3, NULL, NULL, NULL),
(18, NULL, 'SAGT', '孙安钢铁', NULL, NULL, NULL, 3, NULL, NULL, NULL),
(19, NULL, 'LGHX', 'LG化学', NULL, NULL, NULL, 3, NULL, NULL, NULL),
(20, NULL, 'BXJY', '博西家用', NULL, NULL, NULL, 3, NULL, NULL, NULL),
(21, NULL, 'SMT', '史密特', NULL, NULL, NULL, 3, NULL, NULL, NULL),
(22, NULL, 'FNKS', '菲尼克斯', NULL, NULL, NULL, 3, NULL, NULL, NULL),
(23, NULL, 'SLM', '赛莱默', NULL, NULL, NULL, 3, NULL, NULL, NULL),
(24, NULL, 'LJ', '兰精', NULL, NULL, NULL, 3, NULL, NULL, NULL),
(25, NULL, 'BSF', '巴斯夫', NULL, NULL, NULL, 3, NULL, NULL, NULL),
(26, NULL, 'HB', '汉佰', NULL, NULL, NULL, 3, NULL, NULL, NULL),
(27, NULL, 'DSD', '德司达', NULL, NULL, NULL, 3, NULL, NULL, NULL),
(28, NULL, 'FT', '福特', NULL, NULL, NULL, 3, NULL, NULL, NULL),
(29, NULL, 'KQHG', '空气化工', NULL, NULL, NULL, 3, NULL, NULL, NULL),
(30, NULL, 'GJBL', '弓箭玻璃', NULL, NULL, NULL, 3, NULL, NULL, NULL),
(31, NULL, 'JBL', '金佰利', NULL, NULL, NULL, 3, NULL, NULL, NULL),
(32, NULL, 'JH', '锦湖', NULL, NULL, NULL, 3, NULL, NULL, NULL),
(33, NULL, 'SM', '上美', NULL, NULL, NULL, 3, NULL, NULL, NULL),
(34, NULL, 'KLY', '可利亚', NULL, NULL, NULL, 3, NULL, NULL, NULL),
(35, NULL, 'AOSMS', 'AO史密斯 ', NULL, NULL, NULL, 3, NULL, NULL, NULL),
(36, NULL, 'YN', '扬农', NULL, NULL, NULL, 3, NULL, NULL, NULL),
(37, NULL, 'WGNY', '卫岗奶业', NULL, NULL, NULL, 3, NULL, NULL, NULL),
(38, NULL, 'HXXNY', '化学新能源', NULL, NULL, NULL, 3, NULL, NULL, NULL),
(39, NULL, 'YT', '溢泰', NULL, NULL, NULL, 3, NULL, NULL, NULL),
(40, NULL, 'LHDQ', '来亨电气', NULL, NULL, NULL, 3, NULL, NULL, NULL),
(41, NULL, 'HBL', '红宝丽', NULL, NULL, NULL, 3, NULL, NULL, NULL),
(42, NULL, 'HXLN', '海欣丽宁', NULL, NULL, NULL, 3, NULL, NULL, NULL),
(43, NULL, 'XX', '喜星 ', NULL, NULL, NULL, 3, NULL, NULL, NULL),
(44, NULL, 'GT', '古田', NULL, NULL, NULL, 3, NULL, NULL, NULL),
(45, NULL, 'SDLE', '仕达利恩', NULL, NULL, NULL, 3, NULL, NULL, NULL),
(46, 15, 'CFS', '仓库', '', '', '', 1, NULL, NULL, NULL),
(47, 0, 'DF', '东方库', '', '', '', 2, NULL, NULL, NULL),
(48, 0, 'QB', '七坝码头', '', '', '', 1, NULL, NULL, NULL),
(51, 0, '8351', '835库', '龙潭刚835仓库', '陈烨', '123456-999', 1, '阿斯蒂芬', NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `tally_port`
--

CREATE TABLE IF NOT EXISTS `tally_port` (
  `id` int(10) unsigned NOT NULL,
  `code` varchar(20) NOT NULL COMMENT '港口代码',
  `name` varchar(50) NOT NULL COMMENT '中文港口名',
  `name_en` varchar(50) DEFAULT NULL COMMENT '英文港口名'
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tally_port`
--

INSERT INTO `tally_port` (`id`, `code`, `name`, `name_en`) VALUES
(4, 'SECONDONE', '第二', 'secondone'),
(5, 'PPPP', '乒乒乓乓', 'pppp'),
(6, 'LTD', '鹿特丹', 'roterdam');

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
) ENGINE=InnoDB AUTO_INCREMENT=272 DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `tally_qbzx_empty_ctn_img`
--

INSERT INTO `tally_qbzx_empty_ctn_img` (`id`, `operation_id`, `empty_picture`) VALUES
(227, 525, '5965c9172188d619.jpg'),
(228, 526, '5965cdb199207313.jpg'),
(229, 527, '5965d151e5b92949.jpg'),
(231, 531, '596865bdbf81d188.jpg'),
(246, 555, '597ad9abb4b9d852.jpg'),
(264, 610, '59a66ea9a052e304.jpg'),
(266, 613, '59a7a128c8c79930.jpg'),
(270, 631, '59ae44ea6353a260.jpg'),
(271, 631, '59ae64318fd48349.jpg');

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
  `last_operationtime` datetime NOT NULL COMMENT '最后操作时间'
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `tally_qbzx_instruction`
--

INSERT INTO `tally_qbzx_instruction` (`id`, `plan_id`, `department_id`, `location_id`, `loadingtype`, `ordertime`, `status`, `last_operator`, `last_operationtime`) VALUES
(21, 21, 51, 2, '0', '2017-07-12', '0', 21, '2017-09-04 15:58:31'),
(22, 23, 51, 1, '0', '2017-07-21', '1', 21, '2017-09-05 11:03:09'),
(23, 23, 51, 1, '0', '2017-07-28', '0', 21, '2017-09-04 16:03:51'),
(25, 25, 53, 1, '0', '2017-08-10', '0', 8, '2017-08-10 15:09:49'),
(26, 21, 53, 2, '1', '2017-08-10', '1', 21, '2017-08-28 14:46:07');

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
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `tally_qbzx_instruction_ctn`
--

INSERT INTO `tally_qbzx_instruction_ctn` (`id`, `instruction_id`, `ctnno`, `ctn_type_code`, `ctn_master`, `status`, `operator_id`, `load`, `overweight`, `remark`) VALUES
(87, 21, 'AXIU2195931', '20GP', 3, '0', NULL, NULL, 'N', NULL),
(88, 21, 'CBHU4320724', '40HC', 3, '0', NULL, NULL, 'N', NULL),
(89, 21, 'AXIU2195931', '40RH', 2, '2', 7, NULL, 'N', NULL),
(90, 21, 'MSKU2951046', '3OQB', 16, '2', 5, NULL, 'N', NULL),
(91, 21, 'BMOU2852245', '20TK', 10, '2', 5, NULL, 'N', NULL),
(92, 21, 'AXIU2195931', '40OT', 5, '0', NULL, NULL, 'N', NULL),
(93, 21, 'AXIU2195931', '40GP', 15, '2', 5, NULL, 'N', NULL),
(94, 21, 'BMOU2852245', '40OT', 16, '0', NULL, NULL, 'N', NULL),
(95, 22, 'CXDU1057784', '20GP', 4, '1', 21, NULL, 'N', NULL),
(96, 22, 'ITGU1054273', '20GP', 4, '2', 21, NULL, 'N', NULL),
(97, 23, 'CBHU4135480', '20GP', 1, '0', NULL, NULL, 'N', NULL),
(98, 23, 'TCLU6823468', '40HC', 3, '0', NULL, NULL, 'N', NULL),
(99, 23, 'SEGU1025511', '20GP', 4, '0', NULL, NULL, 'N', NULL),
(100, 23, 'CSLU2389825', '40FR', 13, '0', NULL, NULL, 'N', NULL),
(101, 23, 'PONU0665418', '40RH', 2, '0', NULL, NULL, 'N', NULL),
(102, 23, 'CSLU1713441', '40HC', 2, '0', NULL, NULL, 'N', NULL),
(103, 23, 'TEMU2981190', '40HC', 2, '0', NULL, NULL, 'N', NULL),
(104, 23, 'POCU0445343', '40FR', 1, '0', NULL, NULL, 'N', NULL),
(105, 23, 'GESU3923454', '40OT', 4, '2', 21, NULL, 'N', NULL),
(106, 23, 'CBHU5737815', '40GP', 3, '2', 21, NULL, 'N', NULL),
(109, 26, 'BMOU2852245', '40FR', 7, '2', 8, NULL, 'N', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `tally_qbzx_level_cargo_img`
--

CREATE TABLE IF NOT EXISTS `tally_qbzx_level_cargo_img` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `level_id` int(11) DEFAULT NULL COMMENT '关ID',
  `level_num` int(11) DEFAULT NULL COMMENT '第几关（关序号）',
  `cargo_picture` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '货物照片'
) ENGINE=InnoDB AUTO_INCREMENT=232 DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `tally_qbzx_level_cargo_img`
--

INSERT INTO `tally_qbzx_level_cargo_img` (`id`, `level_id`, `level_num`, `cargo_picture`) VALUES
(107, 334, 1, '5965c94e6c9ae988.jpg'),
(108, 335, 2, '5965c96118e98415.jpg'),
(109, 336, 1, '5965cdc2515c3969.jpg'),
(110, 337, 2, '5965cdcdbea0b959.jpg'),
(111, 338, 3, '5965cdda0d449478.jpg'),
(112, 339, 1, '5965d187ae9e2237.jpg'),
(114, 341, 2, '5965d1b66a712536.jpg'),
(118, 345, 1, '596865bdedbc6420.jpg'),
(146, 373, 1, '597ad9cbbb49b685.jpg'),
(227, 438, 1, '59a66eb87eb78264.jpg'),
(228, 439, 1, '59a7a1abc911d306.jpg'),
(229, 439, 1, '59a7a1abc92c4162.jpg'),
(231, 441, 1, '59ae6877a3a53123.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `tally_qbzx_level_damage_img`
--

CREATE TABLE IF NOT EXISTS `tally_qbzx_level_damage_img` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `level_id` int(11) NOT NULL COMMENT '关ID',
  `level_num` int(11) NOT NULL COMMENT '第几关（关序号）',
  `damage_picture` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '关残损照片'
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `tally_qbzx_level_damage_img`
--

INSERT INTO `tally_qbzx_level_damage_img` (`id`, `level_id`, `level_num`, `damage_picture`) VALUES
(14, 334, 1, '5965c94e6d529931.jpg'),
(15, 334, 1, '5965c94e6d6bd880.jpg'),
(16, 339, 1, '5965d187af334132.jpg'),
(17, 373, 1, '597ad9cbbbd19971.jpg'),
(19, 439, 1, '59a7a1abc9afb943.jpg');

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
) ENGINE=InnoDB AUTO_INCREMENT=633 DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `tally_qbzx_operation`
--

INSERT INTO `tally_qbzx_operation` (`id`, `ctn_id`, `empty_weight`, `halfclose_door_picture`, `close_door_picture`, `tmp_sealno`, `sealno`, `seal_picture`, `cargo_weight`, `operator_id`, `begin_time`, `is_stop`, `is_reservation`, `step`, `per_no`, `laborteam_id`, `operation_examine`, `examine_remark`) VALUES
(525, 90, 5, '5965cd0fab14a350.jpg', '5965cd25ba2dd917.jpg', NULL, '5945', '5965cd51b2a6f486.jpg', 7, 5, '2017-07-12 15:00:06', 'N', 'N', '5', '3', NULL, 2, NULL),
(526, 91, 8, '5965cde18d433338.jpg', '5965cde9998b9176.jpg', NULL, '9976', '5965cdfaa9fee705.jpg', 6, 5, '2017-07-12 15:20:04', 'N', 'N', '5', '3', NULL, 2, NULL),
(527, 89, 3, '5965d1c70542e581.jpg', '5965d1d10a6ee771.jpg', NULL, '58', '5965d1e3b6465348.jpg', 6, 7, '2017-07-12 15:35:29', 'N', 'N', '5', '3', NULL, 1, NULL),
(531, 93, 3, '596865e0e362c801.jpg', '596865fbdf89d291.jpg', NULL, 'jdnd', '5968663655466422.jpg', 6, 5, '2017-07-14 14:31:45', 'N', 'N', '5', '3', NULL, 1, NULL),
(555, 106, 1, '597ad9d652cd2298.jpg', '597ad9e0f2a63486.jpg', NULL, '123456', '597ad9f1d148a771.jpg', 1, 21, '2017-07-28 14:27:49', 'N', 'N', '5', '3', NULL, 1, NULL),
(610, 105, 12, '59a66ebf3d3f0431.jpg', '59a6703fb2260832.jpg', NULL, 'Sdd', '59a671feca797678.jpg', 1, 21, '2017-08-30 15:51:54', 'N', 'N', '5', NULL, NULL, 1, NULL),
(613, 109, 123, '59a7a1ebebfa8415.jpg', '59a7a2b61af99360.jpg', NULL, '123456', '59a7a344376fe373.jpg', 23, 8, '2017-08-31 13:39:11', 'N', 'N', '5', NULL, NULL, 1, NULL),
(631, 96, 12, '59ae687f8100e338.jpg', '59ae688807935871.jpg', NULL, 'dhjxjxnxn', '59ae689729552770.jpg', 36, 21, '2017-09-05 14:06:50', 'N', 'N', '5', NULL, NULL, 1, NULL),
(632, 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, '2017-09-05 17:02:26', 'N', 'N', '0', NULL, NULL, 1, NULL);

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
  `createtime` datetime NOT NULL COMMENT '操作时间'
) ENGINE=InnoDB AUTO_INCREMENT=442 DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `tally_qbzx_operation_level`
--

INSERT INTO `tally_qbzx_operation_level` (`id`, `operation_id`, `level_num`, `cargo_number`, `cargo_picture`, `damage_num`, `damage_explain`, `billno`, `ship_id`, `location_id`, `car`, `comment`, `operator_id`, `createtime`) VALUES
(334, 525, 1, 6, NULL, 2, '', 'bbbbb', 15, 0, '', '', 5, '2017-07-12 15:01:34'),
(335, 525, 2, 6, NULL, 0, '', 'aaaaa', 1760, 0, '', '', 5, '2017-07-12 15:01:53'),
(336, 526, 1, 5, NULL, 0, '', 'ccccc', 1752, 0, '', '', 5, '2017-07-12 15:20:34'),
(337, 526, 2, 9, NULL, 0, '', 'ccccc', 1752, 0, '', '', 5, '2017-07-12 15:20:45'),
(338, 526, 3, 8, NULL, 0, '', 'ccccc', 1752, 0, '', '', 5, '2017-07-12 15:20:58'),
(339, 527, 1, 3, NULL, 2, '', 'aaaaa', 1760, 0, '', '', 7, '2017-07-12 15:36:39'),
(341, 527, 2, 3, NULL, 0, '', 'bbbbb', 15, 0, '', '', 7, '2017-07-12 15:37:26'),
(345, 531, 1, 6, NULL, 0, '', 'aaaaa', 1760, 0, '', '', 5, '2017-07-14 14:33:33'),
(373, 555, 1, 1, NULL, 1, '1', 'aaaaa', 1760, 0, '', '1', 21, '2017-07-28 14:29:31'),
(438, 610, 1, 26, NULL, 0, '', 'bl0001', 1748, 0, '', '', 21, '2017-08-30 15:52:24'),
(439, 613, 1, 12, NULL, 5, '', 'aaaaa', 1760, 0, '', '', 8, '2017-08-31 13:42:03'),
(441, 631, 1, 265, NULL, 0, '', 'bl0001', 1746, 0, '', '', 21, '2017-09-05 17:03:51');

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
  `last_operationtime` datetime NOT NULL COMMENT '最后操作时间'
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `tally_qbzx_plan`
--

INSERT INTO `tally_qbzx_plan` (`id`, `entrustno`, `entrust_company`, `location_id`, `ship_id`, `voyage`, `total_ctn`, `total_ticket`, `total_package`, `total_weight`, `cargo_agent_id`, `packing_require`, `entrust_time`, `last_operator`, `last_operationtime`) VALUES
(21, 'one', 10, 2, 171, 'qwer', 5, 34, 34, '56', 4, 'hello world~', '2017-07-21', 21, '2017-07-21 14:59:40'),
(23, '20170721001', 12, 2, 464, '0217002', 5, 3, 300, '5000', 2, '~!@#$%^&amp;*()_+=-`{}|\\][:&quot;'';&lt;&gt;?/.,\r\n啊啊啊啊啊啊啊啊\r\nooooooooooooooooooo\r\n噢噢噢噢噢噢噢噢噢噢噢噢噢噢噢噢哦哦哦\r\n呼哈呼哈\r\n这里要写好多好多字这里要写好多好多字这里要写好多好多字这里要写好多好多字\r\n这里要写好多好多字这里要写好多好多字这里要写好多好多字这里要写好多好多字这里要写好多好多字这里要写好多好多字这里要写好多好多字\r\n这里要写好多好多字这里要写好多好多字这里要写好多好多字\r\n这里要写好多好多字\r\n这里要写好多好多字这里要写好多好多字这里要写好多好多字这里要写好多好多字这里要写好多好多字\r\n这里要写好多好多字这里要写好多好多字这里要写好多好多字\r\n\r\n这里要写好多好多字这里要写好多好多字这里要写好多好多字这里要写好多好多字这里要写好多好多字\r\n;'',gas/.v,q]pwekrtg=g-23tqwepflas''\r\n没了', '2017-07-21', 21, '2017-07-21 15:32:14'),
(24, '！@#￥%……&amp;*（）', 4, 12, 1394, '@！￥@@', 1, 3, 4, '5', 11, 'Z!@#', '2017-08-08', 21, '2017-08-08 09:37:54'),
(25, '~!@#$%^&amp;', 4, 1, 291, '~!@#$&gt;&lt;', 3456, 35463, 22546, '4', 11, '你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢你好你是谁呢', '2017-08-10', 8, '2017-08-10 14:10:32');

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
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `tally_qbzx_plan_cargo`
--

INSERT INTO `tally_qbzx_plan_cargo` (`id`, `plan_id`, `billno`, `cargo_name`, `number`, `pack`, `mark`, `total_weight`, `dangerlevel`, `ship_id`, `location_id`, `port_id`) VALUES
(59, 21, 'aaaaa', 'qwer', 23, '6565', '6', '65', '6', '1760', '2', 4),
(60, 21, 'bbbbb', 'sdas', 56, 'w', '66565', '65', '6', '15', '3', 5),
(61, 21, 'ccccc', 'sad', 5, '5', '5', '2', '55', '1752', '15', 4),
(62, 23, 'bl0001', '什么粉', 101, 'BAGS', 'N/M', '1234', '0', '1746,1748', '15,46', 6),
(63, 23, 'bl0002', '~!@#$}|\\?/.,', 12, '''~!@#$%^', '222', '123', '0', '1736', '5', 4);

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
  `last_operationtime` datetime NOT NULL COMMENT '最后操作时间'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `tally_qbzx_plan_ctn`
--

INSERT INTO `tally_qbzx_plan_ctn` (`id`, `plan_id`, `ctn_type_code`, `quantity`, `ctn_master`, `flflag`, `last_operator`, `last_operationtime`) VALUES
(6, 21, '40RH', 3, 1, 'F', 7, '2017-07-17 09:01:16'),
(7, 21, '3OQB', 3, 4, 'L', 7, '2017-07-17 09:01:25');

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
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tally_qbzx_prove`
--

INSERT INTO `tally_qbzx_prove` (`id`, `ctn_id`, `ctnno`, `ctn_type_code`, `ctn_master`, `ship_id`, `ship_name`, `voyage`, `total_ticket`, `total_package`, `flflag`, `loadingtype`, `location_id`, `location_name`, `empty_weight`, `cargo_weight`, `total_weight`, `dangerlevel`, `sealno`, `level_num`, `damage_num`, `barge_ship_content`, `location_content`, `car_content`, `operator_id`, `operator_name`, `content`, `remark`, `consignee`, `createtime`) VALUES
(56, 90, 'MSKU2951046', '3OQB', '通集海运', 171, '安华3', 'qwer', 2, 12, 'L', '0', 2, '南京龙潭港802泊位', 5.00, 7.00, 12.00, '6,6,55', '5945', 2, 2, '[{"ship_id":"15","cargo_unit":"6","damage_unit":"2"},{"ship_id":"1760","cargo_unit":"6","damage_unit":"0"}]', 'null', '[{"car":null,"cargo_unit":"12","damage_unit":"2"}]', 5, '孙青', '[{"billno":"aaaaa","package":"6565","mark":"6","cargo_unit":"6","damage_unit":"0"},{"billno":"bbbbb","package":"w","mark":"66565","cargo_unit":"6","damage_unit":"2"}]', '', NULL, '2017-07-12 15:19:21'),
(57, 91, 'BMOU2852245', '20TK', 'OOCL', 171, '安华3', 'qwer', 1, 22, 'F', '0', 2, '南京龙潭港802泊位', 8.00, 6.00, 14.00, '6,6,55', '9976', 3, 0, '[{"ship_id":"1752","cargo_unit":"22","damage_unit":"0"}]', 'null', '[{"car":null,"cargo_unit":"22","damage_unit":"0"}]', 5, '孙青', '[{"billno":"ccccc","package":"5","mark":"5","cargo_unit":"22","damage_unit":"0"}]', '', NULL, '2017-07-12 15:45:47');

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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tally_rate`
--

INSERT INTO `tally_rate` (`id`, `code`, `name`, `discount`, `tax_rate`, `flag`, `first_amount`, `first_rate`, `second_amount`, `second_rate`, `third_amount`, `third_rate`, `fourth_amount`, `fourth_rate`, `fifth_amount`, `fifth_rate`) VALUES
(1, 'FLV001', '测试费率本1', 0.98, 0.02, 'Y', 10000.00, 0.95, 20000.00, 0.92, 30000.00, 0.9, 50000.00, 0.85, 95000.00, 0.8),
(2, 'FLV', '', 0, 0.02, 'N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'FLV002', '测试费率本2', 0.95, 0.05, 'Y', 20000.00, 0.9, 50000.00, 0.85, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'HHH00031', '测试费率本33', 0.92, 0.035, 'Y', 10000.00, 0.9, 20000.00, 0.88, 50000.00, 0.85, 90000.00, 0.8, 150000.00, 0.7),
(5, 'SHH18508', '12', 0.99, 0.999, 'Y', 112.00, 0.929, 112.00, 0.098, 112.00, 0.981, 112.00, 0.001, 112.00, 0.23),
(6, '11', '', 0, 0, 'Y', 112.00, 0, 112.00, 0, 112.00, 0, 1.00, 0, 1.00, 0),
(7, 'ASDFASD', '', 0, 0, 'Y', 0.00, 0, 0.00, 0, 0.00, 0, 0.00, 0, 0.00, 0),
(8, 'TEST1', 'test', 1, 0, 'Y', 10000.00, 0.9, 20000.00, 0.85, 30000.00, 0.8, 0.00, 0, 0.00, 0);

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
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tally_rate_detail`
--

INSERT INTO `tally_rate_detail` (`id`, `container_size`, `container_type`, `full_rate`, `mixed_rate`) VALUES
(1, '20', 'GP', '40.00', '30.00'),
(2, '20', 'HC', '50.00', '30.00'),
(3, '20', 'OT', '50.00', '30.00'),
(4, '20', 'FR', '50.00', '30.00'),
(5, '20', 'RF', '50.00', '30.00'),
(6, '20', 'TK', '50.00', '30.00'),
(7, '20', 'DG', '50.00', '30.00'),
(8, '40', 'GP', '80.00', '40.00'),
(9, '40', 'HC', '90.00', '40.00'),
(10, '40', 'OT', '100.00', '40.00'),
(11, '40', 'FR', '100.00', '40.00'),
(12, '40', 'RF', '100.00', '40.00'),
(13, '45', 'H', '100.00', '40.00'),
(14, '40', 'DG', '100.00', '40.00'),
(15, '30', 'QB', '3.00', '2.55'),
(16, '30', 'OT', '80.00', '30.00');

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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tally_replace_clerk_record`
--

INSERT INTO `tally_replace_clerk_record` (`id`, `ctn_id`, `operator_id`, `reason`, `replace_time`, `business`) VALUES
(2, 102, 6, 'vsf', '2016-08-18 08:27:37', 'qbzx'),
(3, 360, 6, 'gg', '2016-09-08 14:48:19', 'qbzx'),
(4, 4, 6, '1', '2016-12-01 10:22:57', 'qbzx'),
(5, 2, 6, '123', '2016-12-21 08:50:20', 'qbzx'),
(6, 6, 37, 'qqqq', '2016-12-27 12:24:22', 'qbzx'),
(7, 6, 37, 'qqqq', '2016-12-27 12:24:37', 'qbzx');

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tally_replace_tallymaster_record`
--

INSERT INTO `tally_replace_tallymaster_record` (`id`, `shift_id`, `operator_id`, `reason`, `replace_time`) VALUES
(2, 'GWCK201611081', 36, '222', '2016-11-08 14:05:06'),
(3, 'GWCK201611081', 36, '误操作，已恢复', '2016-11-08 14:05:37');

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

--
-- 转存表中的数据 `tally_shift`
--

INSERT INTO `tally_shift` (`shift_id`, `shift_master`, `department_id`, `classes`, `date`, `begin_time`, `end_time`, `mark`) VALUES
('MDMBZ201707011', 8, 53, '1', '2017-07-12', '2017-07-12 17:41:35', '2017-07-30 19:05:09', '1'),
('MDMBZ201707021', 8, 53, '1', '2017-07-30', '2017-07-30 19:05:53', NULL, '0'),
('QBZXZ201707011', 7, 51, '1', '2017-07-12', '2017-07-12 14:17:51', '2017-07-21 15:39:53', '1'),
('QBZXZ201707012', 21, 51, '2', '2017-07-21', '2017-07-21 15:40:38', '2017-07-25 15:07:07', '1'),
('QBZXZ201707231', 7, 51, '1', '2017-07-25', '2017-07-25 16:41:06', '2017-07-25 16:44:23', '1'),
('QBZXZ201707232', 7, 51, '2', '2017-07-25', '2017-07-25 16:45:40', '2017-07-25 16:48:58', '1'),
('QBZXZ201707241', 21, 51, '1', '2017-07-26', '2017-07-26 09:31:40', '2017-07-26 10:42:29', '1'),
('QBZXZ201707251', 21, 51, '1', '2017-07-26', '2017-07-26 10:56:17', '2017-07-31 10:57:19', '1'),
('QBZXZ201707261', 21, 51, '1', '2017-07-31', '2017-07-31 10:57:39', NULL, '0');

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `tally_shift_detail`
--

INSERT INTO `tally_shift_detail` (`id`, `exchanged_id`, `user_exchanged_id`, `exchanged_time`, `carryon_id`, `user_carryon_id`, `carryon_time`, `note`) VALUES
(26, 'QBZXZ201707011', 7, '2017-07-21 15:39:53', 'QBZXZ201707012', 21, '2017-07-21 15:40:53', '一切正常'),
(35, 'QBZXZ201707231', 7, '2017-07-25 16:44:23', 'QBZXZ201707232', 7, '2017-07-25 16:45:49', 'fgdfgdfg'),
(36, 'QBZXZ201707232', 7, '2017-07-25 16:48:58', 'QBZXZ201707241', 21, '2017-07-26 09:31:43', '没有箱子在作业中'),
(37, 'QBZXZ201707241', 21, '2017-07-26 10:42:29', 'QBZXZ201707251', 21, '2017-07-26 10:56:18', '呃呃呃'),
(38, 'MDMBZ201707011', 8, '2017-07-30 19:05:09', 'MDMBZ201707021', 8, '2017-07-30 19:05:56', '门到门'),
(39, 'QBZXZ201707251', 21, '2017-07-31 10:57:19', 'QBZXZ201707261', 21, '2017-07-31 10:57:41', '25');

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
) ENGINE=InnoDB AUTO_INCREMENT=1766 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tally_ship`
--

INSERT INTO `tally_ship` (`id`, `ship_code`, `ship_name`, `ship_english_name`, `ship_type`, `nationality`, `linkman`, `telephone`, `ship_route`, `regular_ship`, `warehouse_number`, `imo`, `agent_id`, `operator`, `operationtime`) VALUES
(1, 'XZJJ818', '湘张家界818', 'XZJJ818', 9, '', '', '', 3, 2, 0, '', 0, NULL, NULL),
(5, 'ZH016', '中航016', 'ZH016', 9, '', '', '', 3, 2, 0, '', 0, NULL, NULL),
(7, 'YT7368', '永泰7368', 'yt7368', 9, '', '', '', 3, 2, 0, '', 0, NULL, NULL),
(9, 'AQH9397', '安庆货9397', 'aqh9397', 9, '', '', '', 3, 2, 0, '', 0, NULL, NULL),
(10, 'BSSX', '保盛山星', 'BSSX', 9, '', '', '', 3, 2, 0, '', 0, NULL, NULL),
(13, 'SSYH0686', '苏顺运货0686', 'SSYH0686', 9, '', '', '', 3, 2, 0, '', 0, NULL, NULL),
(14, 'STYH0526', '苏通源货0526', 'STYH0526', 9, '', '', '', 3, 2, 0, '', 0, NULL, NULL),
(15, 'SHH10758', '苏淮货10758', 'SHH10758', 9, '', '', '', 3, 0, 0, '', 0, NULL, NULL),
(45, 'WYH1', '皖宇航1', 'WYH1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(46, 'TPY18', '太平洋18', 'TPY18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(47, 'XTJ6', '徐铜集6', 'XU TONG JI 6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(48, 'WYH6', '皖宇航6', 'WYH6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(49, 'WBBH3699', '皖蚌埠货3699', 'WBBH3699', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(50, 'TPY22', '太平洋22', 'TPY22', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(51, 'YD908', '远东908', 'YD908', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(52, 'XTJ68', '徐铜集68', 'XU TONG JI 68', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(53, 'XH9717', '徐货9717', 'XH9717', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(54, 'WYH8', '皖宇航8', 'WYH8', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(55, 'WNL0388', '皖南陵0388', 'WNL0388', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(56, 'JD', '集达', 'JIDA', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(57, 'WJZ1088', '武家嘴1088', 'WU JIA ZUI 1088', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(58, 'TPY3', '太平洋3', 'TPY3', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(59, 'YHJ1001', '渝航集1001', 'YHJ1001', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(60, 'YF', '育锋', 'YU FENG', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(61, 'XY7', '湘远7', 'XY7', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(62, 'XTJ8', '徐铜集8', 'XU TONG JI 8', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(63, 'XJ1', '新集1', 'XIN JI 1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(64, 'XHDJ0118', '湘衡东机0118', 'XHDJ0118', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(65, 'XAC', '兴安城', 'XAC', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(66, 'WYH9', '皖宇航9', 'WYH9', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(67, 'WXC0273', '皖宣城0273', 'WXC0273', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(68, 'WR19', '万润19', 'WR19', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(69, 'WJZ1166', '武家嘴1166', 'WU JIA ZUI 1166', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(70, 'WBBH3596', '皖蚌埠货3596', 'WANBENBUHUO3596', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(71, 'HZH888', '华正888', 'HZH888', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(72, 'HY958', '宏远958', 'HY958', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(73, 'CJZY', '长江之源', 'CJZY', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(74, 'TPY5', '太平洋5', 'TPY5', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(75, 'YJI15', '渝集15', 'YJ15', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(76, 'YHJ1003', '渝航集1003', 'YHJ1003', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(77, 'YH1', '远怀1', 'YH1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(78, 'YF116', '远丰116', 'YF116', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(79, 'XZH3', '湘正和3', 'XZH3', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(80, 'XY8', '湘远8', 'XY8', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(81, 'XY1', '鑫阳1', 'XINYANG1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(82, 'XTJ9', '徐铜集9', 'XU TONG JI 9', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(83, 'XT', '新通', 'XINTONG', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(84, 'XJY', '新锦钰', 'XINJINYU', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(85, 'XHJHXH', '新海集和谐号', 'XIN HAI JI HE XIE HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(86, 'XHHH1188', '湘怀化货1188', 'XHHH1188', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(87, 'XCSJ0450', '湘长沙机0450', 'XCSJ0450', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(88, 'XAT6188', '兴安太6188', 'XINGANTAI6188', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(89, 'WYY918', '皖远洋918', 'WAN YUAN YANG 918', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(90, 'WYS168', '皖永顺168', 'WYS168', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(91, 'WY8', '威远8', 'WEIYUAN8', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(92, 'WXC273', '皖宣城273', 'WXC273', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(93, 'WX6', '武祥6', 'WU XIANG 6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(94, 'WSF199', '皖顺风199', 'WSF199', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(95, 'WMS1322', '皖梅盛1322', 'WMS1322', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(96, 'WJZ16', '武家嘴16', 'WU JIA ZUI 16', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(97, 'WGTF18', '万港腾飞18', 'WGTF18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(98, 'JFBH', '集发渤海', 'JIFA BOHAI', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(99, 'JA7', '捷安7', 'JA7', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100, 'WHYH2418', '皖怀远货2418', 'WHYH2418', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(101, 'HYU', '恒裕', 'HENG YU', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(102, 'WJZ1023', '武家嘴1023', 'WU JIA ZUI 1023', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(103, 'HY8009', '汉阳8009', 'HY8009', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(104, 'HY5118', '宏远5118', 'HY5118', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(105, 'TY', '通远', 'TONGYUAN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(106, 'TPY6', '太平洋6', 'TPY6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(107, 'YJI8', '渝集8', 'YJ8', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(108, 'YJI16', '渝集16', 'YJ16', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(109, 'YJ28', '扬集28号', 'YJ28', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(110, 'YHNM', '烟海内贸', 'YHNM', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(111, 'YH809', '渝航809', 'YH809', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(112, 'YH1001', '宇航1001', 'YU HANG 1001', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(113, 'YGJ7', '渝港集7号', 'YGJ7', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(114, 'YF3', '永丰3', 'YF3', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(115, 'YCGY7', '宜昌国宇7', 'YCGY7', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(116, 'YAJ1', '扬澳集1', 'YAJ1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(117, 'XYH8', '信源和8', 'XYH8', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(118, 'XY88', '鑫阳88', 'XY88', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(119, 'XY18', '湘远18', 'XY18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(120, 'XY10', '湘远10', 'XY10', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(121, 'XW817', '兴旺817', 'XW817', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(122, 'XTJ98', '徐铜集98', 'XU TONG JI 98', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(123, 'XTJ168', '徐铜集168', 'XU TONG JI 168', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(124, 'XT1', '新通1', 'XINTONG1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(125, 'XS', '秀山', 'XS', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(126, 'XL', '向岭', 'XIANGLING', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(127, 'XHX97', '新鸿翔97', 'XHX97', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(128, 'XHJI9', '新海集9', 'XIN HAI JI 9 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(129, 'XHJ3', '新海集3', 'XIN HAI JI 3 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(130, 'XHJ09', '兴航集09', 'XHJ09', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(131, 'XDF6', '新东方6', 'XINDONGFANG 6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(132, 'XCSJ0451', '湘长沙机0451', 'XCSJ0451', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(133, 'XCHJ', '新长江', 'XCHJ', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(134, 'XB', '向滨', 'XIANGBIN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(135, 'WZH0278', '湾址货0278', 'WANZHIHUO0278', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(136, 'WYY98', '皖远洋98', 'WAN YUAN YANG 98', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(137, 'WYY58', '皖远洋58', 'WAN YUAN YANG 58', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(138, 'WYY1', '皖远洋1', 'WAN YUAN YANG 1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(139, 'YJL1', '扬集轮1', 'YJL1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(140, 'YJI939', '渝集939', 'YUJI939', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(141, 'WXYH2', '皖新玉海2号', 'WXYH2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(142, 'WXH', '伟翔号', 'WXH', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(143, 'WX9', '武祥9', 'WU XIANG 9', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(144, 'WX66', '武祥66', 'WU XIANG 66', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(145, 'WTDJ888', '皖通达集888', 'CCWTDJ888', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(146, 'WTD29', '皖通达29', 'WTD29', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(147, 'WNF78', '皖南方78号', 'WAN NAN FANG 78 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(148, 'WNF1', '皖南方1', 'WAN NAN FANG 1 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(149, 'WLZ188', '皖力洲188', 'WLZ188', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(150, 'WJZ2013', '武家嘴2013', 'WU JIA ZUI 2013', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(151, 'WJ1', '武集1', 'WJ1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(152, 'WGTF19', '万港腾飞19', 'WGTF19', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(153, 'TZ9', '通舟9', 'TONG ZHOU 9', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(154, 'CLJ3010', '重轮J3010', 'CLJ3010', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(155, 'JH186', '荆淮186', 'JH186', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(156, 'CLJ3008', '重轮J3008', 'CLJ3008', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(157, 'JA2', '捷安2', 'JA2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(158, 'JA1', '捷安1', 'JA1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(159, 'WHYJ8', '皖宏远集8', 'WHYJ8', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(160, 'WJ9', '武集9', 'WJ9', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(161, 'HYJ16', '昊运集16', 'HYJ16', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(162, 'HY9999', '华远9999', 'HY9999', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(163, 'CLJ3002', '重轮集3002', 'CLJ3002', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(164, 'WJZJ11', '武家嘴集11', 'WU JIA ZUI JI 11', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(165, 'HY68', '宏远68', 'HY68', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(166, 'WLONG39', '皖龙39', 'WL39', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(167, 'HY18', '宏远18', 'HY18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(168, 'TY006', '天益006', 'TY006', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(169, 'WLZJ2', '皖力洲集2', 'WLZJ2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(170, 'TPY8', '太平洋8', 'TPY8', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(171, 'AH3', '安华3', 'AH3', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(172, 'YJI818', '渝集818', 'YUJI818', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(173, 'YJI3', '渝集3', 'YJ3', 1, '', '', '', 1, 0, 0, '', 0, NULL, NULL),
(174, 'YJI17', '渝集17', 'YJ17', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(175, 'YJI10', '渝集10', 'YJ10', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(176, 'YJ3', '扬集3', 'YANGJI3', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(177, 'YJ102', '远江102', 'YJ102', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(178, 'YHSD', '永恒顺达', 'YONGHENGSHUNDA', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(179, 'YH978', '瑜航978', 'YH978', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(180, 'YH888', '宇航888', 'YU HANG 888', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(181, 'YH803', '渝航803', 'YH803', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(182, 'YH168', '宇航168', 'YU HANG 168', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(183, 'YGSH3', '阳光速航3', 'YGSH3', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(184, 'YGJ8', '渝港集8', 'YGJ8', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(185, 'YGJ17', '渝港集17', 'YGJ17', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(186, 'YFJ2058', '永丰集2058', 'YFJ2058', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(187, 'YD899', '渝东899', 'YUDONG899', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(188, 'YCHJ1', '渝长虹集1', 'YCHJ1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(189, 'YC', '永昌', 'YONGCHANG', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(190, 'YANGJI5', '扬集5', 'YANGJI5', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(191, 'XYUAN9', '湘远9', 'XIANGYUAN9', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(192, 'XYH9', '信源和9', 'XYH9', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(193, 'XY98', '鑫阳98', 'XY98', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(194, 'XY9', '鑫阳9', 'XINYANG9', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(195, 'XY6', '湘远6', 'XY6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(196, 'XY1H', '翔宇一号', 'XIANGYU1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(197, 'XY16', '湘远16号', 'XY16', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(198, 'XY11', '湘远11', 'XY11', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(199, 'XXYJ0318', '湘湘阴机0318', 'XXYH0318', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(200, 'XXTH0029', '湘湘潭货0029', 'XXTH0029', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(201, 'XW701', '兴文701', 'XW701', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(202, 'XW1', '湘伟1', 'XIANGWEI', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(203, 'ZWY106', '中外运106', 'ZHONG WAI YUN 106', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(204, 'XTJ18', '徐铜集18', 'XU TONG JI 18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(205, 'XTJ10', '徐铜集10', 'XU TONG JI 10', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(206, 'XT5', '喧腾5', 'XT5', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(207, 'XSY98', '湘水运98', 'XSY98', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(208, 'XS898', '鑫顺898', 'XS898', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(209, 'XNT72', '新南泰72', 'XINNANTAI72', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(210, 'XL866', '祥龙866', 'XL866', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(211, 'XINTJ1', '新通集1号', 'XINTJ1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(212, 'XINOU6', '新瓯6', 'XINOU6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(213, 'XHX6', '新华兴6', 'XHX6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(214, 'XHJTD', '新海集腾达', 'XIN HAI JI TENG DA', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(215, 'XHJ998', '新海集998', 'XIN HAI JI 998 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(216, 'XHJ6', '新海集6', 'XIN HAI JI 6 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(217, 'XHJ218', '新海集218', 'XIN HAI JI 218 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(218, 'XHJ1', '新海集1', 'XIN HAI JI 1 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(219, 'XH805', '新华805', 'XH805', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(220, 'XH', '喜航', 'XH', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(221, 'XD28', '星东28', 'XINGDONG28', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(222, 'XCSJ0498', '湘长沙机0498', 'XCSJ0498', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(223, 'XCSJ0070', '湘长沙机0070', 'XCSJ0070', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(224, 'XCSB062', '湘长沙驳062', 'XCSJ062', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(225, 'XCF717', '新长丰717', 'XCF717', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(226, 'XC', '向沧', 'XIANGCANG', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(227, 'ZH6', '中海6', 'ZH6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(228, 'WZH1856', '湾址货1856', 'WANZHIHUO1856', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(229, 'WYZ1', '皖永正1号', 'WYZ1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(230, 'ZH151', '中海151', 'ZH151', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(231, 'WYY889', '皖远洋889', 'WAN YUAN YANG 889', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(232, 'WYY777', '皖远洋777', 'WAN YUAN YANG 777', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(233, 'WYY2', '皖远洋2', 'WAN YUAN YANG 2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(234, 'ZC19', '众诚19', 'ZHONG CHENG 19', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(235, 'YY2', '永益2', 'YY2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(236, 'YT108', '永泰108', 'YONGTAI108', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(237, 'YY216', '永裕216', '永裕216', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(238, 'YJI999', '渝集999', 'YUJI999', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(239, 'WXYH8', '皖新玉海8号', 'WXYH8', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(240, 'YX6', '亚星6', 'YAXING6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(241, 'YT35', '远通35', 'YT35', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(242, 'WXYH', '皖新玉海', 'WANXINYUHAI', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(243, 'YJL16', '扬集轮16号', 'YJL16', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(244, 'YSJ01', '豫商集聚01', 'YSJ01', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(245, 'YQJ8', '耀戚集8', 'YQJ8', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(246, 'WX67', '武祥67', 'WU XIANG 67', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(247, 'WX16', '武祥16', 'WU XIANG 16', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(248, 'WWT168', '皖万通168', 'WAN WAN TONG 168', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(249, 'WTD99', '皖通达99', 'WAN TONG DA 99', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(250, 'WTD55', '皖通达55', 'WTD55', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(251, 'BA', '柏安', 'BAIAN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(252, 'WNF88', '皖南方88', 'WAN NAN FANG 88 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(253, 'WNF58', '皖南方58', 'WAN NAN FANG 58 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(254, 'WNF2', '皖南方2', 'WAN NAN FANG 2 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(255, 'WLZH899', '皖力洲899', 'WANLI ZHOU 899', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(256, 'WLZ588', '皖力洲588', 'WLZH588', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(257, 'WJZJ5', '武家嘴集5', 'WU JIA ZUI JI 5', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(258, 'WJZ51', '武家嘴51', 'WU JIA ZUI 51', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(259, 'WJZ1', '武家嘴1', 'WU JIA ZUI 1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(260, 'WJ8', '武集8', 'WUJI8', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(261, 'WHY8188', '皖宏远8188', 'WHY8188', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(262, 'WGTF21', '万港腾飞21', 'WGTF21', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(263, 'WEIJI6', '纬集6号', 'WEIJI6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(264, 'TZ99', '仲泰99', 'ZT99', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(265, 'CLJ3011', '重轮J3011', 'CLJ3001', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(266, 'JH008', '集海008', 'JI HAI 008', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(267, 'JC1', '杰成1', 'JIECHENG1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(268, 'JC', '集昌', 'JICHANG', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(269, 'JA9', '捷安9', 'JA9', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(270, 'JA8', '捷安8', 'JA8', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(271, 'WHCH', '武汉长虹', 'WHCH', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(272, 'WHH8228', '皖淮河8228', 'WHH8228', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(273, 'WHY166', '皖宏远166', 'WHY166', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(274, 'CLJ3007', '重轮J3007', 'CLJ3007', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(275, 'BH858', '宝航858', 'BAOHANG858', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(276, 'HZ9H', '华正9号', 'HUAZHENG9HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(277, 'HZ09', '华正09', 'HZ09', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(278, 'HYUN', '昊运', 'HAOYUN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(279, 'WJH1', '皖金航1', 'WJH1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(280, 'WJL8', '皖巨龙8', 'WJL8', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(281, 'HYDM', '航远杜茂', 'HYDM', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(282, 'TYING', '天鹰', 'EAGLE SKY', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(283, 'BH88', '宝航88', 'BH88', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(284, 'HY916', '宏远916', 'HY916', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(285, 'HY9', '宏远9', 'HONGYUAN9', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(286, 'HY818', '弘洋818', 'HONGYANG818', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(287, 'WJZJ2', '武家嘴集2', 'WU JIA ZUI JI 2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(288, 'CLJ3001', '重轮J3001', 'CLJ3001', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(289, 'WJZJ8', '武家嘴集8', 'WU JIA ZUI JI 8', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(290, 'HY518', '宏远518', 'HY518', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(291, 'BHW', '渤海湾', 'BOHAIWAN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(292, 'WLZH558', '皖力洲558', 'WLZH558', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(293, 'TY888', '泰源888', 'TY888', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(294, 'TY008', '天益008', 'TY008', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(295, 'TXQ', '同心泉', 'TXQ', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(296, 'HY118', '宏远118', 'HY118', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(297, 'HY099', '宏远099', 'HY099', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(298, 'TPY9', '太平洋9', 'TPY9', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(299, 'BJS', '宝杰胜', 'BJS', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(300, 'AH8', '安华8', 'AH8', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(301, 'YZJ8', '豫周集8', 'YZJ8', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(302, 'YJI819', '渝集819', 'YJ819', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(303, 'YJI7', '渝集7', 'YUJI7', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(304, 'YJI5', '渝集5号', 'YJ5', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(305, 'YJI2', '渝集2', 'YJ2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(306, 'YJI18', '渝集18', 'YJ18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(307, 'YJI13', '渝集13', 'YJ13', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(308, 'YJI11', '渝集11', 'YJ11', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(309, 'YJI1', '渝集1', 'YJ1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(310, 'YJ8', '扬集8', 'YAGNJI8', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(311, 'YJ20', '扬集20', 'YJ20', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(312, 'YJ16', '扬集16号', 'YANGJI16', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(313, 'YJ', '远景', 'JOSCO VIEW', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(314, 'YHUA6', '远6', 'YHUA6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(315, 'BG818', '镔港818', 'BG818', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(316, 'YH998', '宇豪998', 'YH998', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(317, 'YH906', '渝航906', 'YUHANG906', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(318, 'YH898', '宇航898', 'YU HANG 898', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(319, 'BW99', '宝旺99', 'BAOWANG99', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(320, 'YH805', '渝航805', 'YH805', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(321, 'YH6', '远怀6', 'YUANHUAI6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(322, 'YH18', '宇航18', 'YUHANG18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(323, 'CHJY0321', '长航集运0321', 'CHJY0321', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(324, 'YGSH6', '阳光速航6', 'YGSH6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(325, 'YGSH1', '阳光速航1', 'YGSH1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(326, 'YGJ9', '渝港集9', 'YGJ9', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(327, 'YGJ6', '渝港集6', 'YGJ6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(328, 'YGJ18', '渝港集18', 'YUGANGJI18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(329, 'YGJ16', '渝港集16', 'YGJ16', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(330, 'YGJ1', '渝港集1', 'YGJ1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(331, 'BG828', '镔港828', 'BG828', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(332, 'YD902', '远东902', 'YD902', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(333, 'YD809', '渝道809', 'YD809', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(334, 'YCHJ168', '豫长虹集168', 'YCHJ168', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(335, 'YCGY5', '宜昌国宇5', 'YCGY5', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(336, 'YCGY1', '宜昌国宇1', 'YICHANGGUOYU1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(337, 'CHJY0329', '长航集运0329', 'CHJY0329', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(338, 'YANGJI6', '扬集6', 'YANGJI6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(339, 'XZ806', '兴舟806', 'XINGZHOU806', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(340, 'XYYJ5369', '湘益阳机5369', 'XYYJ5369', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(341, 'XYSH1', '新洋山1', 'XINYANGS1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(342, 'XYJ8', '鑫阳集8', 'XYJ8', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(343, 'XY99', '祥运99', 'XY99', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(344, 'XY988', '鑫阳988', 'XINYANG988', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(345, 'CHJY0333', '长航集运0333', 'CHJY0333', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(346, 'XY96', '鑫阳96', 'XY96', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(347, 'CHJY0335', '长航集运0335', 'CHJY0335', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(348, 'BG866', '镔港866', 'BG866', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(349, 'CHJY8201', '长航集运8201', 'CHJY8201', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(350, 'XY5399', '湘远5399', 'XY5399', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(351, 'CHJY8202', '长航集运8202', 'CHJY8202', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(352, 'CF', '船发', 'CHUANFA', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(353, 'CHJY8281', '长航集运8281', 'CHJY8281', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(354, 'XY12', '湘远12', 'XIANG YUAN 12', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(355, 'CHJY8301', '长航集运8301', 'CHJY8301', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(356, 'XY', '轩洋', 'XUAN YANG', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(357, 'CHJY8302', '长航集运8302', 'CHJY8302', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(358, 'XXTH0082', '湘湘潭货0082', 'XXTH0082', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(359, 'CHJY8303', '长航集运8303', 'CHJY8303', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(360, 'XW702', '兴文702', 'XW702', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(361, 'CHJY8305', '长航集运8305', 'CHJY8305', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(362, 'XW2', '湘伟2号', 'XW2H', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(363, 'CH4', '长宏4', 'CH4', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(364, 'AXJ3', '安信集3', 'AXJ3', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(365, 'YZJ9', '豫周集9', 'YUZHOUJI9', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(366, 'XTJ2', '徐铜集2', 'XU TONG JI 2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(367, 'CH901', '重海901', 'CH901', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(368, 'XTJ111', '徐铜集111', 'XU TONG JI 111', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(369, 'XTJ1', '徐铜集1', 'XU TONG JI 1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(370, 'XTAI', '鑫泰', 'XINTAI', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(371, 'CH902', '重海902', 'CH902', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(372, 'BG888', '镔港888', 'BG888', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(373, 'XSY19', '湘水运19', 'XSHY19', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(374, 'XSHJ7', '徐顺集7', 'XUSHUNJI7', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(375, 'CHNH', '长海南湖', 'CHNH', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(376, 'XP', '兴平', 'XING PING', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(377, 'XLYSH', '兴隆永盛', 'XINLONGYONSHEN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(378, 'XL896', '祥龙896', 'XL896', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(379, 'ZXJJ', '泽鑫俊杰', 'ZEXINJUNJIE', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(380, 'ZWY108', '中外运108', 'ZHONG WAI YUN 108', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(381, 'XINOU8', '新瓯8', 'XINOU8', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(382, 'XINOU7', '新瓯7', 'XINOU7', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(383, 'XHX78', '新鸿翔78', 'XIN HONG XIANG 78', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(384, 'XHX69', '新鸿翔69', 'XHX69', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(385, 'XHX12', '新华兴12', 'XHX12', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(386, 'XHSJSL1', '湘汉寿集神龙1号', 'XHSJSL1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(387, 'XHJFJ', '新海集奋进', 'XHJFJ', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(388, 'XHJCHH', '新海集长虹', 'XHJCHH', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(389, 'XHJ9', '兴航集9', 'XHJ9', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(390, 'XHJ8', '新海集8', 'XIN HAI JI 8 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(391, 'ZWY12', '中外运12', 'ZHONG WAI YUN 12 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(392, 'XHJ219', '新海集219', 'XIN HAI JI 219 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(393, 'XHJ2', '新海集2', 'XIN HAI JI 2 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(394, 'XHJ19', '兴航集19', 'XHJ19', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(395, 'YZKH278', '豫周口货2788', 'YZKH2788', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(396, 'XH91', '新华91', 'XH91', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(397, 'ZWY101', '中外运101', 'ZHONG WAI YUN 101', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(398, 'XH1', '翔海1号', 'XH1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(399, 'XDF2', '新东方2', 'XIN DONG FANG 2 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(400, 'XDF1', '新东方1', 'XIN DONG FANG 1 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(401, 'XD22', '星东22', 'XINGDONG22', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(402, 'XD', '向丹', 'XIANG DAN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(403, 'ZHJ668', '中海集668', 'ZHJ668', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(404, 'XCSJ0416', '湘长沙机0416', 'XCSJ0416', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(405, 'ZHJ58', '洲航集58', 'ZHJ58', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(406, 'FF999', '富发999', 'FUFA999', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(407, 'XCF777', '新长丰777', 'XCF777', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(408, 'ZHJ', '中海集', 'ZHONG HAI JI', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(409, 'ZH988', '中海988', 'ZH988', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(410, 'ZHAI18', '中海18', 'ZHONG HAI 18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(411, 'FG805', '涪港805', 'FG805', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(412, 'FG806', '涪港806', 'FG806', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(413, 'ZH107', '中海107', 'ZHONG HAI 107', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(414, 'ZC1', '众诚1', 'ZHONG CHENG 1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(415, 'ZH108', '中海108', 'ZH108', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(416, 'ZH3', '自航3', 'ZH3', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(417, 'ZH19', '自航19', 'ZH19', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(418, 'ZH156', '中海156', 'ZH156', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(419, 'ZC10', '众诚10', 'ZHONG CHENG 10', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(420, 'ZH019', '中海019', 'ZHONG HAI 019', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(421, 'ZG9', '志钢9', 'ZG9', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(422, 'FG818', '涪港818', 'FG818', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(423, 'ZC16', '众诚16', 'ZHONG CHENG 16', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(424, 'ZC89', '众诚89', 'ZHONG CHENG 89', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(425, 'ZC5', '众诚5', 'ZHONG CHENG 5', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(426, 'ZC2', '众诚2', 'ZHONG CHENG 2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(427, 'CHY88', '淳源88', 'CHUNYUAN88', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(428, 'YYJ918', '远洋集918', 'YYJ918', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(429, 'YYQ', '永裕强', 'YYQ', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(430, 'YZ2', '永正2', 'YZ2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(431, 'YYJ2', '远洋集2', 'YYJ2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(432, 'YYJ3', '远洋集3', 'YY3', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(433, 'YY6666', '油源6666', 'YY6666', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(434, 'YY7', '永溢7', 'YY7', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(435, 'YT3', '远通3', 'YT3', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(436, 'YY06', '永裕06', '永裕06', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(437, 'YXCF', '阳羡昌发', 'YXCF', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(438, 'YX701', '渝叙701', 'YUXU701', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(439, 'YW', '易望', 'TRADE HOPE', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(440, 'YW9', '禹王9', 'YUWANG 9', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(441, 'WXYH1', '皖新玉海1', 'WANXINYUHAI1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(442, 'YT88', '宇通88', 'YUTON88', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(443, 'YOJ', '燕欧箭', 'YOJ', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(444, 'YT1', '永泰1', 'YONGTAI1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(445, 'CJ01', '重机01', 'CJ01', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(446, 'YSJ018', '豫商集018', 'YSJ018', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(447, 'CJ02', '重机02', 'CJ02', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(448, 'YSHX01', '豫胜祥01', 'YUSHENX01', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(449, 'YS', '营山', 'YINGSHAN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(450, 'WX7', '武祥7', 'WU XIANG 7', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(451, 'YJL2', '扬集轮2号', 'YJL2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(452, 'WX26', '武祥26', 'WU XIANG 26', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(453, 'YL', '远丽', 'JOSCO LILY', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(454, 'WWZH185', '皖湾址货1856', 'WWZH1856', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(455, 'CJ28', '川集28', 'CHUANJI28', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(456, 'WTDJ66', '皖通达集66', 'WTDJ66', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(457, 'CJ29', '川集29', 'CHUANJI29', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(458, 'WTD66', '皖通达66', 'CCWTD66', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(459, 'CJ30', '川集30', 'CHUANJI30', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(460, 'BH02', '宝航02', 'BH02', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(461, 'CJ33', '川集33', 'CHUANJI33', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(462, 'WNF99', '皖南方99', 'WAN NAN FANG 99 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(463, 'CJSH', '长江速航', 'CJSH', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(464, 'CHFY', '长虹飞越', 'CHANG HONG FEI YUE', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(465, 'CJWS', '长锦蔚山', 'CJWS', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(466, 'WNF38', '皖南方38', 'WAN NAN FANG 38 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(467, 'CJZHF', '长江之福', 'CJZHF', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(468, 'WLZH988', '皖力洲988', 'WANLIZHOU988', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(469, 'CJZS', '长江之盛', 'CHANGJIANGZHISHENG', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(470, 'WLZ688', '皖力洲688', 'WLZH688', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(471, 'WL369', '皖龙369', 'WL369', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(472, 'WJZJ6', '武家嘴集6', 'WU JIA ZUI JI 6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(473, 'WJZJ12', '武家嘴集12', 'WU JIA ZUI JI 12', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(474, 'WJZ52', '武家嘴52', 'WU JIA ZUI 52', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(475, 'WJZ1067', '武家嘴1067', 'WU JIA ZUI 1067', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(476, 'WJZ1007', '武家嘴1007', 'WU JIA ZUI 1007', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(477, 'WJH8', '皖江河8号', 'WJH8', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(478, 'WJ801', '武集801', 'WJ801', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(479, 'WHYH333', '皖怀远货3333', 'WHYH3333', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(480, 'WHY8989', '皖宏远8989', 'WHY8989', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(481, 'WHHW6', '武汉华威6', 'WHHW6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(482, 'WGTF22', '万港腾飞22', 'WGTF22', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(483, 'WG629', '万港629', 'WG629', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(484, 'WEIJI8#', '纬集8', 'WEIJI8#', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(485, 'WD19', '旺达19', 'WD19', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(486, 'WBBH0883', '皖蚌埠货0883', 'WAN BANG BU 0883', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(487, 'JH1002', '集海1002', 'JH1002', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(488, 'JH088', '荆淮088', 'JH088', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(489, 'JH028', '金海028', 'JH028', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(490, 'JH1003', '集海1003', 'JH1003', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(491, 'AJ818', '安吉818', 'AJ818', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(492, 'WDC1', '皖德春1', 'WDC1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(493, 'CLJ3015', '重轮集3015', 'CLJ3015', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(494, 'CLJ3009', '重轮集3009', 'CLJ3009', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(495, 'CLJ3016', '重轮集3016', 'CLJ3016', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(496, 'WG606', '万港606', 'WG606', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(497, 'CLJ3017', '重轮集3017', 'CLJ3017', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(498, 'WGTF10', '万港腾飞10', 'WGTF10', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(499, 'CLJ3018', '重轮机3018', 'CHONGLUNJI3018', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(500, 'CHJ026', '长虹集026', 'CHANG HONG JI 026 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(501, 'CLJ3019', '重轮集3019', 'CLJ3019', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(502, 'JA6', '捷安6', 'JIEAN6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(503, 'CLJ3020', '重轮集3020', 'CLJ3020', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(504, 'CHJ058', '长虹集058', 'CHANG HONG JI 058 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(505, 'CLJJ301', '重轮机J3011', 'CLJJ3011', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(506, 'JA18', '捷安18', 'JIEAN18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(507, 'CSBOX', '康世宝盒', 'CONTSHIP BOX', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(508, 'CHJ1', '长虹集1', 'CHANG HONG JI 1 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(509, 'CT1', '畅通1', 'CT1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(510, 'WHYH254', '皖怀远货2546', 'WHYH2546', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(511, 'CT10', '畅通10', 'CHANGTONG10', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(512, 'CHJ16', '长虹集16', 'CHANG HONG JI 16 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(513, 'CT2', '畅通2', 'CT2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(514, 'CLJ3006', '重轮集3006', 'CLJ3006', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(515, 'CT3', '畅通3', 'CT3', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(516, 'CHJ168', '长虹集168', 'CHANG HONG JI 168 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(517, 'CX', '晨星', 'CHENXING', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(518, 'HYJ601', '昊运集601', 'HYJ601', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(519, 'CX1868', '长兴1868', 'CX1868', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(520, 'CHJ18', '长虹集18', 'CHANG HONG JI 18 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(521, 'CX8', '晨星8', 'CX8', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(522, 'TYJ1', '通洋集1', 'TYJ1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(523, 'CX988', '长鑫988', 'CX988', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(524, 'CHJ188', '长虹集188', 'CHANG HONG JI 188 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(525, 'CX998', '长鑫998', 'CX998', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(526, 'BEIHAI', '北海', 'BEI HAI', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(527, 'CY169', '承运169', 'CY169', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(528, 'CHJ2', '长虹集2', 'CHANG HONG JI 2 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(529, 'CYB1', '长洋驳1', 'CHANG YANG BO 1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(530, 'WJZ57', '武家嘴57', 'WU JIA ZUI 57', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(531, 'CYB2', '长洋驳2', 'CHANG YANG BO 2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(532, 'CHJ258', '长虹集258', 'CHANG HONG JI 258 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(533, 'CYB4', '长洋驳4', 'CHANG YANG BO 4', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(534, 'HY8', '宏远8', 'HONGYUAN8', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(535, 'CYJ2H', '昌运集2号', 'CHANGYUNJI2HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(536, 'CHJ6', '长虹集6', 'CHANG HONG JI 6 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(537, 'HY5188', '宏远5188', 'HY5188', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(538, 'WL22', '皖龙22', 'WL22', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(539, 'DAYE18', '大业18', 'DAYE18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(540, 'CHJ689', '长虹集689', 'CHANG HONG JI 689 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(541, 'DH1', '帝豪1', 'DH1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(542, 'HY1818', '宏远1818', 'HY1818', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(543, 'DH1008', '帝毫1008', 'DH1008', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(544, 'CHJ7', '长虹集7', 'CHJ7', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(545, 'DH1018', '帝豪1018', 'DH1018', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(546, 'TY1', '通运1', 'TY1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(547, 'DH11', '帝豪11', 'DIHAO11', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(548, 'CHJ8', '长虹集8', 'CHANG HONG JI 8 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tally_ship` (`id`, `ship_code`, `ship_name`, `ship_english_name`, `ship_type`, `nationality`, `linkman`, `telephone`, `ship_route`, `regular_ship`, `warehouse_number`, `imo`, `agent_id`, `operator`, `operationtime`) VALUES
(549, 'DH13', '帝豪13', 'DH13', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(550, 'TXJ', '天祥集', '天祥集', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(551, 'DH2', '帝豪2', 'DH2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(552, 'CHJ818', '长虹集818', 'CHANG HONG JI 818 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(553, 'DH3', '帝豪3', 'DH3', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(554, 'TSHCHSH3', '唐山昌盛3', 'TSHCHSH3', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(555, 'DH6', '迪海6', 'DIHAI6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(556, 'CHJ819', '长虹集819', 'CHANG HONG JI 819 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(557, 'DH958', '帝豪958', 'DH958', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(558, 'BG808', '镔港808', 'BG808', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(559, 'DH968', '帝豪968', 'DIHAO968', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(560, 'CHJ88', '长虹集88', 'CHANG HONG JI 88 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(561, 'DH988', '帝豪988', 'DH988', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(562, 'YJI9', '渝集9', 'YUJI9', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(563, 'DHHX', '东瀚和谐', 'DONHANHEXIE', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(564, 'CHJ918', '长虹集918', 'CHJ918', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(565, 'DJ', '东江', 'DONGJIANG', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(566, 'YJI6', '渝集6', 'YUJI6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(567, 'DJ0118', '东机0118', 'DJ0118', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(568, 'YJI20', '渝集20', 'YJ20', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(569, 'DJ5', '德锦5', 'DJ5', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(570, 'YJI19', '渝集19', 'YJ19', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(571, 'DJ7', '德锦7', 'DE JIN 7', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(572, 'BQ', '柏青', 'BOQING', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(573, 'DJ8', '德锦8', 'DE JIN 8', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(574, 'YJI12', '渝集12', 'YUJI12', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(575, 'DL', '德林', 'DE LIN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(576, 'CHJI16', '长航集16', 'CHJI16', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(577, 'DP', '大平', 'DA PING', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(578, 'YJH6', '豫吉海6', 'YUJIHAI6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(579, 'DS', '东山', 'DONGSHAN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(580, 'YJ26', '扬集26', 'YANGJI26', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(581, 'DSHAN', '德山', 'DESHAN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(582, 'YJ2#', '扬集2', 'YANGJI2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(583, 'CHJY0316', '长航集运0316', 'CHJY0316', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(584, 'YJ1', '扬集1', 'YANGJI1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(585, 'DT2', '东唐2', 'DONGTANG2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(586, 'YISHENG', '易昇', 'YI SHENG', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(587, 'DT3', '东唐3', 'DONGTANG3', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(588, 'CHJY0317', '长航集运0317', 'CHJY0317', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(589, 'DT6', '东唐6', 'DT6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(590, 'AJ826', '安吉826', 'AJ826', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(591, 'DT8', '东唐8', 'DT8', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(592, 'CHJY0318', '长航集运0318', 'CHJY0318', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(593, 'DTJ021', '大通江021', 'DTJ021', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(594, 'YH905', '渝航905', 'YH905', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(595, 'DTJ022', '大通江022', 'DTJ022', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(596, 'CHJY0319', '长航集运0319', 'CHJY0319', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(597, 'YH808', '渝航808', 'YH808', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(598, 'YH807', '渝航807', 'YH807', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(599, 'CHJY0320', '长航集运0320', 'CHJY0320', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(600, 'YH666', '宇航666', 'YU HANG 666', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(601, 'DX18', '大新18', 'DA XIN 18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(602, 'YH588', '宇航588', 'YU HANG 588', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(603, 'DX19', '大新19', 'DA XIN 19', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(604, 'FR1', '丰瑞1', 'FENGRUI1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(605, 'DX2', '大新2', 'DA XIN 2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(606, 'BX6', '奔鑫6', 'BX6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(607, 'DX26', '大新26', 'DX26', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(608, 'CHJY0322', '长航集运0322', 'CHJY0322', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(609, 'FSH66', '风顺66', 'FENGSUN66', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(610, 'DX6', '大新6', 'DA XIN 6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(611, 'DX66', '大新66', 'DA XIN 66', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(612, 'CHJY0323', '长航集运0323', 'CHJY0323', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(613, 'DX7', '大新7', 'DA XIN7', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(614, 'YGJ3', '渝港集3', 'YGJ3', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(615, 'DX9', '大新9', 'DA XIN 9', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(616, 'CHJY0325', '长航集运0325', 'CHJY0325', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(617, 'DY', '德运', 'CONTSHIP DAY', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(618, 'YGJ1001', '渝港集1001', 'YGJ1001', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(619, 'DZ1', '东洲1', 'DONGZHOU1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(620, 'CHJY0326', '长航集运0326', 'CHJY0326', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(621, 'DZ9', '东洲9', 'DONGZHOU9', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(622, 'YD907', '远东907', 'YD907', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(623, 'EAGLE SKY', '易平', 'EAGLESKY', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(624, 'CHJY0327', '长航集运0327', 'CHJY0327', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(625, 'EP', '恩鹏', 'ENPENG', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(626, 'YCSJ6', '豫昌盛集6', 'YCSJ6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(627, 'EQJH015', '鄂潜江货0158', 'EQJH0158', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(628, 'CHJY0328', '长航集运0328', 'CHJY0328', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(629, 'EZ0198', '鄂洲0198', 'EZHOU0198', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(630, 'YCGY3', '宜昌国宇3', 'YCGY3', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(631, 'FT', '富泰', 'FU TAI', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(632, 'EZ158', '鄂洲158', 'EZHOU158', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(633, 'EZ159', '鄂洲159', 'EZHOU159', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(634, 'YANGXIA', '阳羡', 'YANGXIAN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(635, 'EZH0235', '鄂州货0235', 'EZH0235', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(636, 'CHJY0330', '长航集运0330', 'CHJY0330', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(637, 'EZH0368', '鄂州货0368', 'EZH0368', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(638, 'XZ', '先舟', 'XZ', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(639, 'EZH123', '鄂洲货123', 'EZH123', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(640, 'CHJY0331', '长航集运0331', 'CHJY0331', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(641, 'XYS1', '新洋山1号', 'XYS1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(642, 'XYJ988', '鑫阳集988', 'XYJ988', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(643, 'CHJY0332', '长航集运0332', 'CHJY0332', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(644, 'FX', '富鑫', 'FUXIN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(645, 'FX1', '飞雄1', 'FEI XIONG 1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(646, 'FX2', '飞雄2', 'FEI XIONG 2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(647, 'FX3', '飞雄3', 'FEI XIONG 3', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(648, 'FX88', '飞翔88', 'FX88', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(649, 'FXJ7', '飞雄集7', 'FEI XIONG JI 7', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(650, 'FY1', '富源1', 'FY1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(651, 'FY26', '枫叶26', 'FY26', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(652, 'FY88', '枫叶88', 'FENGYE88', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(653, 'FYANG1', '汾阳1', 'FENYANG1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(654, 'FYJY', '泛亚江阴', 'FYJY', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(655, 'FYTC', '泛亚太仓', 'FYTC', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(656, 'FYYS', '泛亚洋山', 'FYYS', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(657, 'GANYUAN31', '赣远31', 'GANYUAN31', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(658, 'GAOJI23', '高机2398', 'GAOJI2398', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(659, 'GC', '功成', 'GONGCHENG', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(660, 'GD1001', '国电1001', 'GD1001', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(661, 'GD518', '国电518', 'GUODIAN518', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(662, 'GD601', '国电601', 'GUODIAN601', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(663, 'GD602', '国电602', 'GUODIAN602', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(664, 'GD603', '国电603', 'GUODIAN603', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(665, 'GD605', '国电605', 'GD605', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(666, 'GFC1', '赣丰城1', 'GFC1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(667, 'GFCJ1', '赣丰城集1', 'GFCJ1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(668, 'GFCJ2', '赣丰城集2', 'GFCJ2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(669, 'GFCJ3', '赣丰城集3', 'GFCJ3', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(670, 'GFCJ5', '赣丰城集5', 'GFCJ5', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(671, 'GFCJ9', '赣丰城集9', 'GFCJ9', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(672, 'GJZQ', '国俊之全', 'GUOJUNZHIQUAN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(673, 'GL68', '国良68', 'GL68', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(674, 'GM', '国明', 'GUOMING', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(675, 'GNCH0688', '赣南昌货0688', 'GNCH0688', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(676, 'GNCH0789', '赣南昌货0789', 'GANNANCHANHUO0789', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(677, 'GNCH0818', '赣南昌货0818', 'GNCH0818', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(678, 'GNCH0889', '赣南昌货0889', 'GNCH0889', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(679, 'GNCH0916', '赣南昌货0916', 'GNCH0916', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(680, 'GNCH0968', '赣南昌货0968', 'GNCH0968', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(681, 'GNCH0976', '赣南昌货0976', 'GNCH0976', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(682, 'GNCH1018', '赣南昌货1018', 'GNCH1018', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(683, 'GNCH1019', '赣南昌货1019', 'GNCH1019', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(684, 'GNCH1057', '赣南昌货1057', 'GNCH1057', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(685, 'GNCH1076', '赣南昌货1076', 'GNCH1076', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(686, 'GNCH1089', '赣南昌货1089', 'GNCH1089', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(687, 'GNCH1168', '赣南昌货1168', 'GNCH1168', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(688, 'GNCH1291', '赣南昌货1291', 'GNCH1291', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(689, 'XTJ28', '徐铜集28', 'XU TONG JI 28', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(690, 'GP1', '国平1', 'GP1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(691, 'GP12', '国平12', 'GUOPING12', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(692, 'GP2', '国平2', 'GP2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(693, 'GP3', '国平3', 'GP3', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(694, 'GP4', '国平4', 'GP4', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(695, 'GP5', '国平5', 'GP5', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(696, 'GP6', '国平6', 'GP6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(697, 'GP7', '国平7', 'GP7', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(698, 'GP8', '国平8', 'GP8', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(699, 'GP9', '国平9', 'GP9', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(700, 'GRS002', '赣荣顺002', 'GRS002', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(701, 'GS1002', '港盛1002', 'GS1002', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(702, 'GS1011', '港盛1011', 'GSH1011', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(703, 'GS1013', '港盛1013', 'GS1013', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(704, 'GS1015', '港盛1015', 'GS1015', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(705, 'GS1016', '港盛1016', 'GS1016', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(706, 'GS804', '港盛804', 'GS804', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(707, 'GS809', '港盛809', 'GS809', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(708, 'GS810', '港盛810', 'GS810', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(709, 'GS9', '国盛9号', 'GUOSHENG9HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(710, 'GS906', '港盛906', 'GS906', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(711, 'GS907', '港盛907', 'GSH907', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(712, 'GSH1009', '港盛1009', 'GSH1009', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(713, 'GSH1010', '港盛1010', 'GSH1010', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(714, 'XLIAN', '向莲', 'XIANG LIAN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(715, 'ZYRY', '中艺润洋', 'ZHONGYIRUNYANG', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(716, 'ZYJD', '中艺吉达', 'ZYJD', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(717, 'ZYZT', '中艺泽泰', 'ZHONGYIZETAI', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(718, 'ZZ608', '浙舟608', 'ZHEZHOU608', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(719, 'ZYJH', '中艺吉海', 'ZHONYIJIHAI', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(720, 'ZYRJ', '中艺润江', 'ZHONG YI RUN JIANG', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(721, 'ZYJT', '中艺吉通', 'ZHONGYIJITONG', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(722, 'ZYJY1', '中艺集运1', 'ZHONG YI JI YUN 1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(723, 'ZY11', '中远11', 'ZYUAN11', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(724, 'ZY02', '中远02', 'ZHONG YUAN 02', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(725, 'GT2', '港通2号', 'GANGTONG2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(726, 'GUIY6', '贵远6', 'GY6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(727, 'ZY10', '中远10', 'ZY10', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(728, 'ZY05', '中远05', 'ZY05', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(729, 'ZY06', '中远06', 'ZHU06', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(730, 'ZY08', '中远08', 'ZY08', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(731, 'ZWYYS', '中外运洋山', 'ZWYYSH', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(732, 'ZWY11', '中外运11', 'ZHONG WAI YUN 11 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(733, 'ZX', '振兴', 'ZHENXIN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(734, 'ZX1', '钟兴1', 'ZX1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(735, 'ZWY17', '中外运17', 'ZHONG WAI YUN 17 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(736, 'ZWYCJ001', '中外运长江001', 'ZWYCJ001', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(737, 'ZWY2', '中外运2', 'ZHONG WAI YUN 2 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(738, 'GY17', '赣远17', 'GY17', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(739, 'GY18', '赣远18', 'GANYUAN18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(740, 'GY19', '赣远19', 'GY19', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(741, 'GY2', '赣远2', 'GY2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(742, 'GY20', '赣远20', 'GANYUAN20', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(743, 'ZWY15', '中外运15', 'ZHONG WAI YUN 15 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(744, 'XHJ216', '新海集216', 'XIN HAI JI 216 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(745, 'GY7', '赣远7', 'GY7', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(746, 'ZWY150', '中外运150', 'ZHONG WAI YUN 150', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(747, 'ZWY1', '中外运1', 'ZHONG WAI YUN 1 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(748, 'ZH86', '自航86', 'ZIHANG86', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(749, 'HAIX666', '海翔666', 'HAIX666', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(750, 'ZWY105', '中外运105', 'ZHONG WAI YUN 105', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(751, 'HAJ8', '华安吉8', 'HAJ8', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(752, 'HAJJ', '怀安江集', 'HUAIANJIANGJI', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(753, 'HANGLON', '航龙', 'HANGLONG', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(754, 'XH801', '新华801', 'XINHUA801', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(755, 'ZK19', '众凯19', 'ZK19', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(756, 'ZHT66', '仲泰66', 'ZHONTAI66', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(757, 'ZS1', '至善1', 'ZS1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(758, 'ZS2', '至善2', 'ZS2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(759, 'ZHT888', '忠泰888', 'ZHT888', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(760, 'ZJJJ1', '镇江锦集1', 'ZJJJ1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(761, 'ZHY03', '中远03', 'ZHONGYUAN03', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(762, 'ZJ01', '重集01', 'ZHONGJI01', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(763, 'HD8', '厚德8号', 'HD8', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(764, 'HDM1', '沪东明1号', 'HDM1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(765, 'ZHJ29', '中海集29', 'ZHJ29', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(766, 'XCSJ0449', '湘长沙机0449', 'XCSJ0449', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(767, 'FF666', '富发666', 'FF666', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(768, 'ZHJ6', '洲航集6', 'ZHJ6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(769, 'HF6', '华枫6', 'HF6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(770, 'HFYY', '弘帆远洋', 'HONGFANYUANYANG', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(771, 'HG888', '淮光888', 'HG888', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(772, 'ZH9', '洲航9', 'ZHOU HANG 9', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(773, 'ZHJ19', '洲航集19', 'ZHJ19', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(774, 'ZHJ1', '洲航集1', 'ZHJ1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(775, 'ZHH588', '中海588', 'ZHH588', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(776, 'HH2001', '航宏2001', 'HH2001', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(777, 'ZHH1588', '中海1588', 'ZH1588', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(778, 'ZHCF', '州海昌发', 'ZHCF', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(779, 'HH8', '华航8', 'HH8', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(780, 'HH8009', '汉华8009', 'HH8009', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(781, 'HH809', '航宏809', 'HANGHONG809', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(782, 'HH816', '华航816', 'HUAHANG816', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(783, 'HH9', '华航9', 'HH9', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(784, 'ZH699', '中海699', 'ZH699', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(785, 'ZH8', '洲航8', 'ZHOU HANG 8', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(786, 'ZH8188', '自航8188', 'ZH8188', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(787, 'FG809', '涪港809', 'FG809', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(788, 'ZH198', '中海198', 'ZH198', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(789, 'FG810', '涪港810', 'FG810', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(790, 'ZH30', '自航30', 'ZIHANG30', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(791, 'CHXH', '长海西湖', 'CHXH', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(792, 'HHJ', '华海集', 'HHJ', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(793, 'FG812', '涪港812', 'FG812', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(794, 'ZH16', '洲航16', 'ZHOU HANG 16', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(795, 'ZH1', '中宏1', 'ZHONGHONG1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(796, 'ZFXS', '中孚兴盛', 'ZHONGFUXINGSHENG', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(797, 'ZH099', '中海099', 'ZH099', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(798, 'ZH032', '中海032', 'ZHONG HAI 032', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(799, 'ZH006', '中海006', 'ZHONG HAI 006', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(800, 'ZH009', '中海009', 'ZHONG HAI 009', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(801, 'HJQ18', '惠金桥18号', 'HJQ18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(802, 'HKHX', '恒坤和谐', 'HENGKUNHEXIE', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(803, 'HL1', '海力1', 'HAILI1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(804, 'ZC69', '众诚69', 'ZHONG CHENG 69', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(805, 'ZFJB', '中孚进步', 'ZFJB', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(806, 'ZC9', '众诚9', 'ZHONG CHENG 9', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(807, 'CHY66', '淳源66', 'CHUNYUAN66', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(808, 'ZC6', '众诚6', 'ZHONG CHENG 6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(809, 'ZC3', '众诚3', 'ZHONG CHENG 3', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(810, 'ZC26', '众诚26', 'ZHONG CHENG 26', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(811, 'HL8', '恒隆8', 'HENG LONG 8', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(812, 'FG833', '涪港833', 'FG833', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(813, 'AY', '安裕', 'ANYU', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(814, 'AJ802', '安吉802', 'AJ802', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(815, 'YZ9', '永正9', 'YONG ZHENG 9 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(816, 'YZJ09', '豫周集09', 'YZJ09', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(817, 'YZ8', '永正8', 'YZ8', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(818, 'YZ6', '永正6', 'YONGZHENG6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(819, 'FG838', '涪港838', 'FG838', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(820, 'CHDH', '长海东湖', 'CHDH', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(821, 'YYJ6', '远洋集6', 'YYJ6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(822, 'HQ0188', '环球0188', 'HUANQIU0188', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(823, 'FG861', '涪港861', 'FG861', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(824, 'YYJ1', '远洋集1', 'YYJ1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(825, 'YYIN', '育银', 'YUYIN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(826, 'YY8', '永裕8', '永裕08', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(827, 'YY168', '益友168', 'YIYOU168', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(828, 'YX1', '远讯1', 'YUANXUN1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(829, 'YY10', '永裕10', '永裕10', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(830, 'YY09', '永裕09', '永裕09', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(831, 'CHYS1', '长航洋山1', 'CHYS1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(832, 'YXFF', '阳羡奋发', 'YXFF', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(833, 'YX9', '阳羡9', 'YANGXIAN9', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(834, 'YX702', '渝叙702', 'YUXU702', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(835, 'CHYS2', '长航洋山2', 'CHYS2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(836, 'YX', '易兴', 'YIXING', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(837, 'YWJ9', '耀威集9', 'YWJ9', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(838, 'YWEI', '易威', 'TRADE WORLDER', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(839, 'YUANXING', '远星', 'JOSCO STAR', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(840, 'YT5', '远通5', 'YT5', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(841, 'YTONG', '宇通', 'YUTONG', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(842, 'HR906', '航瑞906', 'HR906', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(843, 'FH16', '福海16', 'FH16', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(844, 'YSHXIN', '永顺鑫', 'YONSHUNXIN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(845, 'BG998', '镔港998', 'BG998', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(846, 'HS1', '华顺1', 'HUASHUN1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(847, 'HS1258', '汉升1258', 'HS1258', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(848, 'FH666', '福海666', 'FH666', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(849, 'YSX0002', '永盛鑫0002', 'YSX0002', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(850, 'YSJ03', '豫商集03', 'YSJ03', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(851, 'FH918', '福海918', 'FHI918', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(852, 'HS88', '华顺88', 'HS88', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(853, 'HSD98', '恒顺达98', 'HSD98', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(854, 'FH98', '福海98', 'FUHAI98', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(855, 'YSH118', '永盛118', 'YSH118', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(856, 'YSHH', '永顺航', 'YSHH', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(857, 'YS168', '永顺168', 'YS168', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(858, 'YS2001', '渝申2001', 'YS2001', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(859, 'YLJ8', '裕隆集8', 'YULONGJI8', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(860, 'YJS', '一江山', 'YJS', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(861, 'HUAJIN9', '华锦9', 'HUAJIN9', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(862, 'JSJ2', '江苏集2', 'JIANG SU JI 2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(863, 'YLJ6', '裕隆集6', 'YLJ6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(864, 'HUAYUN', '华运', 'HUAYUN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(865, 'HW19', '鸿旺19', 'HW19', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(866, 'HW818', '航皖818', 'HANGWAN818', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(867, 'HW898', '鸿旺898', 'HONGWANG898', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(868, 'HWJ18', '鸿旺集18', 'HWJ18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(869, 'HWJ19', '鸿旺集19', 'HWJ19', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(870, 'HWJ666', '鸿旺集666', 'HWJ666', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(871, 'HX11', '和谐11', 'HX11', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(872, 'HX169', '鸿星169', 'HX169', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(873, 'HX19', '和谐19号', 'HX19', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(874, 'HX2', '华祥2', 'HUA XIANG 2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(875, 'HX2001', '航旭2001', 'HX2001', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(876, 'HX26', '航旭26', 'HX26', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(877, 'HX27', '航旭27', 'HX27', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(878, 'HX28', '航旭28', 'HX28', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(879, 'HX288', '华鑫288', 'HX288', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(880, 'HX29', '航旭29', 'HANG XU 29', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(881, 'HX588', '华祥588', 'HUA XIANG 588', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(882, 'HX6037', '航旭6037', 'HX6037', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(883, 'HX6038', '航旭6038', 'HX6038', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(884, 'HX666', '华祥666', 'HX666', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(885, 'HX7', '和谐7号', 'HX7', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(886, 'HX802', '航旭802', 'HX802', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(887, 'HX803', '航旭803', 'HX803', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(888, 'HX805', '航旭805', 'HX805', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(889, 'HX818', '华鑫818', 'HX818', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(890, 'HX858', '华鑫858', 'HX858', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(891, 'HXH', '华鑫海', 'HXH', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(892, 'HY', '华远', 'HY', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(893, 'WLZJ1', '皖力洲集1', 'WLZHJ1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(894, 'WLZHJ588', '皖力洲集588', 'WLZHJ588', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(895, 'HY1188', '宏远1188', 'HY1188', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(896, 'HY16', '淮洋16', 'HUAIYUAN16', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(897, 'HY1689', '宏远1689', 'HY1689', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(898, 'WLZ998', '皖力洲998', 'WLZ998', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(899, 'WLZ158', '皖力洲158', 'WLZH158', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(900, 'WL5988', '皖龙5988', 'WL5988', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(901, 'WJZJ9', '武家嘴集9', 'WU JIA ZUI JI 9', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(902, 'WJZJ7', '武家嘴集7', 'WU JIA ZUI JI 7', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(903, 'WJZJ3', '武家嘴集3', 'WU JIA ZUI JI 3', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(904, 'WJZJ15', '武家嘴集15', 'WU JIA ZUI JI 15', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(905, 'WJZJ1', '武家嘴集1', 'WU JIA ZUI JI 1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(906, 'WJZ56', '武家嘴56', 'WU JIA ZUI 56', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(907, 'BH1322', '宝航1322', 'BH1322', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(908, 'WJZ1068', '武家嘴1068', 'WU JIA ZUI 1068', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(909, 'WJZ1022', '武家嘴1022', 'WU JIA ZUI 1022', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(910, 'WJZ1009', '武家嘴1009', 'WU JIA ZUI 1009', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(911, 'CLJ3005', '重轮集3005', 'CLJ3005', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(912, 'WJI8', '纬集8号', 'WEIJI8', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(913, 'WJH', '伟杰号', 'WEI JIE HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(914, 'WJ8168', '武集8168', 'WJ8168', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(915, 'WHYJ9', '皖宏远集9', 'WHYJ9', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(916, 'WHYJ19', '皖宏远集19', 'WHYJ19', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(917, 'WHYH252', '皖怀远货2528', 'WHYH2528', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(918, 'WHYH109', '皖怀远货1098', 'WHYH1098', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(919, 'WHY1668', '皖宏远1668', 'WHY1668', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(920, 'WHSD', '芜湖顺达', 'WUHUSHUNDA', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(921, 'WHCH1', '武汉长虹1', 'WUHANCHANGHONG1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(922, 'WH1215', '万海1215', 'WH1215', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(923, 'WGTF11', '万港腾飞11', 'WGTF11', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(924, 'WG768', '万港768', 'WG768', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(925, 'WFD01', '皖福达01', 'WFD01', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(926, 'WEIJI9H', '纬集9号', 'WEIJI9H', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(927, 'WDH01', '外代沪01', 'WAI DAI HU 01', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(928, 'WDC', '皖德春', 'WANDECHUN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(929, 'WBBH3599', '皖蚌埠货3599', 'WBBH3599', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(930, 'WBBH253', '皖蚌埠货2536', 'WBBH2536', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(931, 'TZ1', '通舟1', 'TZ1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(932, 'BH6', '宝航6', 'BH6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(933, 'JH1001', '集海1001', 'JH1001', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(934, 'JH099', '荆淮099', 'JH099', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(935, 'JH058', '集海058', 'JIHAI 058', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(936, 'JH1', '荆淮1', 'JH1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(937, 'CLJ3012', '重轮集3012', 'CLJ3012', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(938, 'JH009', '荆淮009', 'JH009', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(939, 'CHHYSH', '长海雨顺', 'CHHYSH', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(940, 'BAC69', '宝安城69', 'BACH69', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(941, 'JC6', '锦程6', 'JC6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(942, 'JH1006', '集海1006', 'JH1006', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(943, 'JH1007', '集海1007', 'JH1007', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(944, 'JH1012', '集海1012', 'JIHAI1012', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(945, 'JH1018', '集海轮1018', 'JIHAILUN1018', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(946, 'JH1098', '荆淮1098', 'JH1098', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(947, 'JH116', '集海116', 'JH116', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(948, 'JH18', '集海18', 'JH18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(949, 'JB1', '靖波1', 'JINGBO1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(950, 'JH189', '荆淮189', 'JH189', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(951, 'JH2', '荆淮2号', 'JH2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(952, 'JH208', '荆淮208', 'JINGHUAI208', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(953, 'JH3', '荆淮3号', 'JH3', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(954, 'JH5', '荆淮5号', 'JH5', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(955, 'JH5188', '荆淮5188', 'JH5188', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(956, 'JH6', '荆淮6号', 'JH6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(957, 'JH618', '荆淮618', 'JH618', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(958, 'JH6666', '荆淮6666', 'JH6666', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(959, 'JH8', '荆淮8', 'JH8', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(960, 'JH816', '江宏816', 'JH816', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(961, 'JH888', '荆淮888', 'JH888', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(962, 'JH9', '荆淮9', 'JH 9', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(963, 'JH958', '荆淮958', 'JH958', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(964, 'JH966', '荆淮966', 'JH966', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(965, 'JH98', '荆淮98', 'JH98', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(966, 'JH988', '荆淮988', 'JH988', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(967, 'JH99', '荆淮99', 'JH99', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(968, 'JHB1001', '集海驳1001', 'JIHAIBO1001', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(969, 'JHB1002', '集海驳1002', 'JIHAIBO1002', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(970, 'JHB1006', '集海驳1006', 'JIHAIBO1006', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(971, 'JHB1007', '集海驳1007', 'JIHAIBO1007', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(972, 'JHB1008', '集海驳1008', 'JIHAIBO1008', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(973, 'JHB1009', '集海驳1009', 'JIHAIBO1009', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(974, 'JHB1010', '集海驳1010', 'JIHAIBO1010', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(975, 'JHC', '集海春', 'JI HAI CHUN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(976, 'JHCHX', '集海长兴', 'JIHAICHANGXING', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(977, 'JHD', '集海达', 'JI HAI DA', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(978, 'JHFF', '集海奋发', 'JI HAI FEN FA', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(979, 'JHH', '集海华', 'JI HAI HUA', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(980, 'JHJAN', '集海江', '集海江', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(981, 'JHJIA', '集海佳', 'JI HAI JIA', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(982, 'JHL1007', '集海轮1007', 'JIHAILUN1007', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(983, 'JHR', '集海荣', 'JHRONG', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(984, 'JHRUN', '集海润', 'JIHAIRUN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(985, 'JHRY', '集海润扬', 'JI HAI RUN YANG', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(986, 'JHS', '集海顺', 'JIHAISHUN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(987, 'JHT', '集海通', 'JI HAI TONG', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(988, 'JHT16', '江海通16', 'JIANHAITON16', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(989, 'JHT18', '江海通18', 'JHT18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(990, 'JHT19', '江海通19', 'JIANG HAI TONG 19', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(991, 'JHT8', '江海通8', 'JHT8', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(992, 'JHTH', '集海通号', 'JHTH', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(993, 'JHTR', '集海天瑞', 'JHTR', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(994, 'JHX', '集海兴', 'JI HAI XING', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(995, 'JHXH', '江海新皓', 'JHXH', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(996, 'JHXIANG', '集海湘', 'JHXIANG', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(997, 'JHXIN', '集海鑫', 'JHXIN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(998, 'JHXIOU', '锦海秀', 'JHXIOU', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(999, 'JHY', '集海源', 'JIHAIYUAN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1000, 'JHYANG', '集海扬', 'JHYANG', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1001, 'JHYQ', '集海永强', 'JHYQ', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1002, 'JHYS', '嘉豪永胜', 'JIAHAOYONGSHENG', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1003, 'JHYU', '集海渝', 'JI HAI YU', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1004, 'JHYUN', '集海运', 'JI HAI YUN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1005, 'JHYX', '集海永祥', 'JIHAIYONGXIANG', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1006, 'JHYY', '集海永裕', 'JIHAIYONGYU', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1007, 'JHYY08', '集海永裕08', 'JIHAIYONGYU08', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1008, 'JHZ', '集海洲', 'JHZHOU', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1009, 'JHZC', '集海之程', 'JI HAI ZHI CHENG', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1010, 'JHZD', '江海之达', 'JIANG HAI ZHI DA', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1011, 'JHZH', '集海之惠', 'JI HAI ZHI HUI', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1012, 'JHZHY', '江海之悦', 'JIANGHAIZHIYUE', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1013, 'JHZJ', '集海之杰', 'JI HAI ZHI JIE', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1014, 'JHZK', '集海之鲲', 'JI HAI ZHI KUN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1015, 'JHZM', '集海之明', 'JIHAIZHIMING', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1016, 'JHZP', '集海之鹏', 'JI HAI ZHI PENG', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1017, 'JHZQ', '集海之泉', 'JI HAI ZHI QUAN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1018, 'JHZSHAN', '集海钟山', 'JI HAI ZHONG SHAN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1019, 'JHZSHENG', '集海之盛', 'JI HAI ZHI SHENG', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1020, 'JHZX', '集海之星', 'JI HAI ZHI XING', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1021, 'JHZXIU', '集海之绣', 'JI HAI ZHI XIU', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1022, 'JHZY', '集海之源', 'JI HAI ZHI YUAN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1023, 'JIHAISH', '集海申', '集海申', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1024, 'JIHAIXI', '集海祥', 'JIHAIXIANG', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1025, 'JINHAIJI', '锦海集', 'JIN HAI JI', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1026, 'JINSHAN', '金山', 'JINSHAN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1027, 'JISHUN', '集顺', 'JISHUN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1028, 'JIXING', '集兴', 'JIXING', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1029, 'JIYUN1', '集运1', 'JIYUN1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1030, 'JJ', '集锦', 'JIJIN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1031, 'JJ1', '锦集1', 'JINJI1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1032, 'JJ878', '金江878', '金江878', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1033, 'JJ888', '金江888', 'JJ888', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1034, 'JJY1201', '江集运1201', 'JJY1201', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1035, 'JJY1202', '江集运1202', 'JJY1202', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1036, 'JJY1203', '江集运1203', 'JJY1203', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1037, 'JJY1205', '江集运1205', 'JJY1205', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1038, 'JJY1206', '江集运1206', 'JJY1206', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1039, 'JJY1207', '江集运1207', 'JJY1207', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1040, 'JJY1208', '江集运1208', 'JJY1208', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1041, 'JJY1209', '江集运1209', 'JJY1209', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1042, 'JJY1210', '江集运1210', 'JJY1210', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1043, 'JJY1211', '江集运1211', 'JJY1211', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1044, 'JJY1212', '江集运1212', 'JJY1212', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1045, 'JJY1215', '江集运1215', 'JJY1215', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1046, 'JJY1216', '江集运1216', 'JJY1216', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1047, 'JJY1217', '江集运1217', 'JJY1217', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1048, 'JJY1218', '江集运1218', 'JJY1218', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1049, 'JJY1219', '江集运1219', 'JIANGJIYUN1219', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1050, 'JJY1220', '江集运1220', 'JJY1220', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1051, 'JJY1221', '江集运1221', 'JJY1221', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1052, 'JJY1222', '江集运1222', 'JJY1222', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1053, 'JJY1223', '江集运1223', 'JJY1223', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1054, 'JJY1225', '江集运1225', 'JJY1225', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1055, 'JJY1226', '江集运1226', 'JJY1226', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1056, 'JJY1227', '江集运1227', 'JJY1227', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1057, 'JJY1228', '江集运1228', 'JJY1228', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1058, 'JJY1229', '江集运1229', 'JJY1229', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1059, 'JJY1230', '江集运1230', 'JJY1230', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tally_ship` (`id`, `ship_code`, `ship_name`, `ship_english_name`, `ship_type`, `nationality`, `linkman`, `telephone`, `ship_route`, `regular_ship`, `warehouse_number`, `imo`, `agent_id`, `operator`, `operationtime`) VALUES
(1060, 'JJY1231', '江集运1231', 'JJY1231', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1061, 'JJY1232', '江集运1232', 'JJY1232', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1062, 'JJY1233', '江集运1233', 'JJY1233', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1063, 'JJY1235', '江集运1235', 'JJY1235', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1064, 'JJY1236', '江集运1236', 'JJY1236', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1065, 'JJY1237', '江集运1237', 'JJY1237', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1066, 'JJY1238', '江集运1238', 'JJY1238', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1067, 'JJY1239', '江集运1239', 'JJY1239', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1068, 'JJY1250', '江集运1250', 'JJY1250', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1069, 'JJY1251', '江集运1251', '江集运1251', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1070, 'JJY1252', '江集运1252', 'JJY1252', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1071, 'JJY1253', '江集运1253', 'JJY1253', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1072, 'JJY1255', '江集运1255', 'JJY1255', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1073, 'JJY1256', '江集运1256', 'JJY1256', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1074, 'JJY1257', '江集运1257', 'JJY1257', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1075, 'JJY1258', '江集运1258', 'JJY1258', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1076, 'JJY1259', '江集运1259', 'JJY1259', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1077, 'JJY1260', '江集运1260', 'JJY1260', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1078, 'JJY1261', '江集运1261', 'JJY1261', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1079, 'JJY1263', '江集运1263', 'JJY1263', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1080, 'JJY1265', '江集运1265', 'JIANG JI YUN 1265', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1081, 'JJY1266', '江集运1266', 'JIANG JI YUN 1266', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1082, 'JJY1270', '江集运1270', 'JJY1270', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1083, 'JJY1272', '江集运1272', 'JJY1272', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1084, 'JL902', '佳轮902', 'JL902', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1085, 'JL908', '江龙908', 'JL908', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1086, 'JL909', '佳轮909', 'JL909', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1087, 'JL999', '巨龙999', 'JULONG999', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1088, 'JMH', '金满湖', 'JIN MAN HU', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1089, 'JMJ', '金满江', 'JINMANJIANG', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1090, 'JNJ2058', '金牛集2058', 'JLJ2058', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1091, 'JP', '集平', 'JIPING', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1092, 'JP1', '江鹏1', 'JIANG PENG 1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1093, 'JP12', '江鹏12', 'JIANG PENG 12', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1094, 'JP18', '江鹏18', 'JIANG PENG 18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1095, 'JP3', '江鹏3', 'JIANG PENG 3', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1096, 'JP4', '江鹏4', 'JIANG PENG 4', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1097, 'JP5', '江鹏5', 'JIANG PENG 5', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1098, 'JP6', '江鹏6', 'JIANG PENG 6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1099, 'JP66', '江鹏66', 'JIANG PENG 66', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1100, 'JP7', '江鹏7', 'JIANG PENG 7', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1101, 'JP8', '江鹏8', 'JIANG PENG 8', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1102, 'JP9', '江鹏9', 'JIANG PENG 9', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1103, 'JQ', '集庆', 'JIQING', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1104, 'JR', '集荣', 'JIRONG', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1105, 'JS', '集盛', 'JISHENG', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1106, 'JS1', '军顺1', 'JUNSHUN1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1107, 'JS666', '荆山666', 'JINGSHAN666', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1108, 'JS870', '江苏870', 'JS870', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1109, 'JS888', '江苏（推）888', 'JS888', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1110, 'JS966', '荆山966', 'JS966', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1111, 'JS999', '荆山999', 'JS999', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1112, 'JSH', '金盛海', 'JINSHENGHAI', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1113, 'JSHE1', '建设1', 'JIANSHE1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1114, 'JSJ066', '江苏集066', 'JSJ066', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1115, 'JSJ088', '江苏集088', 'JSJ088', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1116, 'JSJ096', '江苏集096', 'JSJ096', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1117, 'JSJ098', '江苏集098', 'JSJ098', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1118, 'JSJ099', '江苏集099', 'JSJ099', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1119, 'JSJ1', '江苏集1', 'JIANG SU JI 1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1120, 'JSJ10', '江苏集10', 'JIANG SU JI 10', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1121, 'JSJ11', '江苏集11号', 'JIANG SU JI 11', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1122, 'JSJ118', '江苏集118', 'JSJ118', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1123, 'JSJ12', '江苏集12', 'JIANG SU JI 12', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1124, 'DT1', '东唐1', 'DONGTANG1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1125, 'JSJ3', '江苏集3', 'JIANG SU JI 3', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1126, 'JSJ4', '江苏集4', 'JIANG SU JI 4', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1127, 'JSJ5', '江苏集5', 'JIANG SU JI 5', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1128, 'JSJ6', '江苏集6', 'JIANG SU JI 6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1129, 'JSJ7', '江苏集7', 'JIANG SU JI 7', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1130, 'JSJ8', '江苏集8', 'JIANG SU JI 8', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1131, 'JSJ9', '江苏集9', 'JIANG SU JI 9', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1132, 'JT', '集泰', 'JT', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1133, 'JUNSHEN', '军胜1', 'JUNSHENG1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1134, 'JW', '集伟', 'JIWEI', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1135, 'JX', '集鑫', 'JX', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1136, 'JX16', '佳兴16', 'JIA XING 16', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1137, 'JX17', '佳兴17', 'JIA XING 17', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1138, 'JX18', '佳兴18', 'JIA XING 18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1139, 'JX2', '佳兴2', 'JIA XING 2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1140, 'JX22', '佳兴22', 'JIA XING 22', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1141, 'JX6', '佳兴6', 'JIA XING 6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1142, 'JX68', '佳兴68', 'JIA XING 68', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1143, 'JX69', '佳兴69', 'JIA XING 69', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1144, 'JX808', '金象808', 'JX808', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1145, 'JX809', '金象809', 'JINXIANG809', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1146, 'JX868', '金象868', 'JX868', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1147, 'JX9', '佳兴9', 'JIAXING9', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1148, 'JXIU2', '锦绣2号', 'JINXIU2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1149, 'JXJ', '集兴江', 'JXJ', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1150, 'JXX', '江夏星', 'JIANGXIAXING', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1151, 'JXYY', '吉祥永裕', 'JXYY', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1152, 'DX1', '大新1', 'DA XIN 1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1153, 'JY6', '锦钰6', 'JY6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1154, 'JY99', '锦钰99', 'JY99', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1155, 'JYD2', '金银达2', 'JYD2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1156, 'JZHX', '军正和谐', 'JZHX', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1157, 'KH166', '凯航166', 'KH166', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1158, 'DX16', '大新16', 'DAXING16', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1159, 'KT1', '凯通1', '凯通1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1160, 'KT18', '凯通18', 'KAITONG18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1161, 'KT19', '凯通19', 'KAITONG 19', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1162, 'KT6', '凯通6', 'KAI TONG 6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1163, 'KT69', '凯通69', 'KAI TONG 69', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1164, 'KT7', '凯通7', 'KAI TONG 7', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1165, 'KT88', '凯通88', 'KAI TONG 88', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1166, 'KT9', '凯通9', 'KAI TONG 9', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1167, 'KT99', '凯通99', 'KAI TONG 99', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1168, 'FS18', '丰顺18', 'FENGSHUN18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1169, 'KX819', '夔峡819', 'KUIXIA819', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1170, 'KX88', '凯旋88', 'KAI XUAN 88', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1171, 'KX938', '夔峡938', 'KX938', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1172, 'KY66', '开源66', 'KAIYUAN66', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1173, 'LAIYINH', '莱茵河.', 'LAIYINHE', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1174, 'LD1', '绿动1', 'LD1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1175, 'LD2', '绿动2', 'LD2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1176, 'LESHAN', '乐山', 'LESHAN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1177, 'LF', '鲁丰', 'LU FENG', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1178, 'LG18', '凌港18', 'LINGGANG18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1179, 'LH12', '联合12', 'LH12', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1180, 'LH30', '联合30', 'LIANHE30', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1181, 'LH50', '联合50', 'LIANHE50', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1182, 'LH52', '联合52', 'LH52', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1183, 'LHJ001', '林海集001', 'LIHAIJI001', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1184, 'LHWL2', '龙和物流2号', 'LHWL2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1185, 'LHWL3H', '龙和物流3号', 'LHWL3', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1186, 'YGJ5', '渝港集5', 'YGJ5', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1187, 'LJNH3683', '鲁济宁货3683', 'LJNH3683', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1188, 'LR9', '隆瑞9', 'LONGRUI9', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1189, 'LSH1001', '联顺1001', 'LSH1001', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1190, 'LSH916', '联顺916', 'LSH916', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1191, 'LSJ18', '溧水机18', 'LSJ18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1192, 'LTAHJ0106', '鲁泰安货集0106', 'LTAHJ0106', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1193, 'LZ516', '鲁枣516', 'LUZAO516', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1194, 'LZGH', '力洲国航', 'LZGH', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1195, 'LZGY', '力洲国运', 'LZGY', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1196, 'LZHH', '力洲辉煌', 'LZHH', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1197, 'MA', '民安', 'MINAN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1198, 'MB', '民本', 'MB', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1199, 'MC', '民淳', 'MC', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1200, 'MCHANG', '民畅', 'MINCHANG', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1201, 'MCHAO', '民超', 'MCHAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1202, 'MD5', '茂达5号', 'MD5', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1203, 'MF', '民风', 'MINFENG', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1204, 'MG', '民光', 'MG', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1205, 'MGE', '民歌', 'MINGE', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1206, 'MH', '民恒', 'MINHENG', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1207, 'MH853', '民货853', 'MINHUO853', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1208, 'MH855', '民货855', 'MINHUO855', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1209, 'MH856', '民货856', 'MINHUO856', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1210, 'MH858', '民货858', 'MINHUO858', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1211, 'MH860', '民货860', 'MINHUO860', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1212, 'MH864', '民货864', 'MINHUO864', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1213, 'MHJ168', '明航集168', 'MHJ168', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1214, 'MHONG', '民泓', 'MINHONG', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1215, 'MHUI', '民辉', 'MINHUI', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1216, 'MINCHUAN', '民川', 'MINCHUAN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1217, 'MINGSHAN', '民山', 'MSH', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1218, 'MINHAO', '民昊', 'MINHAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1219, 'MINJUE', '民觉', 'MINJUE', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1220, 'MINW', '民望', 'MINWANG', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1221, 'MINWUU', '民伍', 'MINWUU', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1222, 'MINZ', '民治', 'MINZHI', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1223, 'MINZHAN', '民展', 'MINZHAN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1224, 'MINZHU', '民主', 'MINZHU', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1225, 'MJ', '民吉', 'MINJI', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1226, 'MJ666', '铭佳666', 'MJ666', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1227, 'MJ889', '铭佳889', 'MJ889', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1228, 'MJ919', '铭佳919', 'MJ919', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1229, 'MJ988', '銘佳988', 'MJ988', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1230, 'MJ999', '铭佳999', 'MJ999', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1231, 'MJIA', '民嘉', 'MINJIA', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1232, 'MJIE', '民捷', 'MINJIE', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1233, 'MJING', '民晶', 'MINJING', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1234, 'MJUN', '民俊', 'MIN JUN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1235, 'MK', '民楷', 'MINKAI', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1236, 'ML', '民联', 'MINLIAN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1237, 'MLAI', '民来', 'MINLAI', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1238, 'MLE', '民乐', 'MINLE', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1239, 'MLI', '民立', 'MINLI', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1240, 'MLV', '民律', 'MINLV', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1241, 'MM', '民模', 'MINMO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1242, 'MP', '民朋', 'MINPENG', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1243, 'MQ', '民强', 'MINQIANG', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1244, 'MQING', '民庆', 'MINQING', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1245, 'MQUAN', '民权', 'MINQUAN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1246, 'MR', '民荣', 'MR', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1247, 'MREN', '民仁', 'MINREN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1248, 'MRH', '民荣号', 'MRH', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1249, 'MS', '民俗', 'MINSU', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1250, 'MS1302', '梅盛1302', 'MS1302', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1251, 'MS1322', '梅盛1322', 'MS1322', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1252, 'MS1612', '梅盛1612', 'MS1612', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1253, 'MS1911', '梅盛1911', 'MS1911', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1254, 'MSHAN', '名山', 'MS', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1255, 'MSNM', '民生内贸', 'MSNM', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1256, 'MT', '民通', 'MINGTONG', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1257, 'MTAI', '民泰', 'MINTAI', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1258, 'MW', '民万', 'MINWAN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1259, 'MWEI', '民伟', 'MINWEI', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1260, 'MWEN', '民文', 'MINWEN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1261, 'MWU', '民武', 'MINWU', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1262, 'MX', '民协', 'MINXIE', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1263, 'MXIANG', '民享', 'MINXIANG', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1264, 'MXIN', '民信', 'MINXIN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1265, 'MY', '民彝', 'MINYI', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1266, 'MY0801', '民意0801', 'MINYI0801', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1267, 'MY168', '民益168', 'MINYI168', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1268, 'MY39', '民益39', 'MINYI39', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1269, 'MYAO', '民耀', 'MINYAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1270, 'MYI39', '民意39', 'MINYI39', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1271, 'MYIN', '民殷', 'MINYIN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1272, 'MYOU', '民有', 'MINYOU', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1273, 'MYU', '民语', 'MINYU', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1274, 'MYUE', '民月', 'MYUE', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1275, 'MZ', '民众', 'MINZHONG', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1276, 'MZHOU', '民洲', '民洲', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1277, 'MZHU', '民族', 'MING ZHU', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1278, 'NF', '南方', 'NANFANG', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1279, 'NF2', '南方2', 'NANFANG2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1280, 'NFYJ', '南方跃进', 'NANFANGYUEJIN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1281, 'NG150011', '宁港150011', 'NG150011', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1282, 'NG15003', '宁港15003', 'NG15003', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1283, 'NG15004', '宁港15004', 'NG15004', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1284, 'NG15005', '宁港15005', 'NINGGANG15005', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1285, 'NG15006', '宁港15006', 'NG15006', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1286, 'NG15008', '宁港15008', 'NG15008', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1287, 'NG15012', '宁港15012', 'NG15012', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1288, 'NG15015', '宁港15015', 'NG15015', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1289, 'NG25003', '宁港25003', 'NG25003', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1290, 'NGB1002', '宁港驳1002', 'NGB1002', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1291, 'NGB1006', '宁港驳1006', 'NGB1006', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1292, 'NGB15005', '宁港驳15005', 'NGB15005', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1293, 'NGB15007', '宁港驳15007', 'NGB15007', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1294, 'NGB15008', '宁港驳15008', 'NGB15008', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1295, 'NGB15010', '宁港驳15010', 'NGB15010', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1296, 'NGB15011', '宁港驳15011', 'NGB15011', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1297, 'NGB15012', '宁港驳15012', 'NGB15012', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1298, 'NGB15015', '宁港驳15015', 'NGB15015', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1299, 'NGB15016', '宁港驳15016', 'NGB15016', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1300, 'NGB2500', '宁港25001', 'NGB25001', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1301, 'NGB3001', '宁港驳3001', 'NGB3001', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1302, 'NGB3002', '宁港驳3002', 'NGB3002', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1303, 'NGB3003', '港驳3003', 'NGB3003', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1304, 'NGB3004', '宁港驳3004', 'NGB3004', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1305, 'NGB3005', '宁港驳3005', 'NGB3005', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1306, 'NHJ', '宁海集', 'NHJ', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1307, 'NHJ1', '宁海集1', 'NING HAI JI 1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1308, 'NJZYJY1', '南京中艺集运1号', 'NAN JING ZHONG YI JI YUN 1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1309, 'NWJ083', '宁武机083', 'NING WU JI 083', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1310, 'NWJ111', '宁武机111', 'NING WU JI 111', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1311, 'NWJ162', '宁武机162', 'NING WU JI 162', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1312, 'NWJ181', '宁武机181', 'NING WU JI 181', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1313, 'PAAVA', '太仓海运香港', 'PAAVA', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1314, 'PAD88', '平安达88', 'PAD88', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1315, 'PH211', '浦海211', 'PUHAI211', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1316, 'PH212', '浦海212', 'PUHAI212', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1317, 'PH213', '浦海213', 'PUHAI213', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1318, 'PH215', '浦海215', 'PUHAI215', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1319, 'PH216', '浦海216', 'PUHAI216', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1320, 'PH217', '浦海217', 'PUHAI217', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1321, 'PH218', '浦海218', 'PUHAI218', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1322, 'PH219', '浦海219', 'PU HAI 219', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1323, 'PH226', '浦海226', 'PUHAI226', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1324, 'PH227', '浦海227', 'PUHAI227', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1325, 'PH228', '浦海228', 'PUHAI228', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1326, 'PH229', '浦海229', 'PUHAI229', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1327, 'PHJ1', '浦海集1', 'PHJ1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1328, 'PHJ2', '浦海集2', 'PHJ2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1329, 'PS', '屏山', 'PINGSHAN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1330, 'PSHAN', '彭山', 'PENGSHAN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1331, 'PX18', '鹏鑫18', 'PX18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1332, 'PYH88', '鄱阳湖88', 'PYH88', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1333, 'PZ', '鹏展', 'PENG ZHAN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1334, 'QC', '泉城', 'QUAN CHENG', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1335, 'GNCH1616', '赣南昌货1616', 'GNCH1616', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1336, 'QH1H', '启海1号', 'QIHAI1H', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1337, 'QH818', '亲河818', 'QINHE818', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1338, 'QH838', '亲河838', 'QINHE838', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1339, 'QJ0158', '潜江0158', 'QJ0158', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1340, 'QJ103', '泉集103', 'QJ103', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1341, 'QS999', '强盛999', 'QS999', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1342, 'QT', '启腾', 'QITENG', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1343, 'QT2', '乔泰2', 'QT2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1344, 'QT20H', '乔泰20号', 'QT20H', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1345, 'QT29', '乔泰29号', 'QIAOTAI29', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1346, 'QT3', '乔泰3', 'QIAOTAI3', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1347, 'QY888', '秦源888', 'QY888', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1348, 'RDHH', '润达航海', 'RUN DA HANG HAI', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1349, 'RDJ1', '润德集1', 'RDJ1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1350, 'RF1', '润丰1', 'RF1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1351, 'RF16', '润发16', 'RF16', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1352, 'RF168', '润发168', 'RF168', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1353, 'RF19', '润发19', 'RUN FA 19', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1354, 'RF2', '润发2', 'RF2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1355, 'RF3', '润发3号', 'RF3', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1356, 'RF5', '润发5号', 'RF5', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1357, 'RF66', '润发66', 'RF66', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1358, 'RF818', '润发818', 'RF818', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1359, 'RF9', '润发9号', 'RF9', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1360, 'RF99', '润发99', 'RF99', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1361, 'RFCQ', '润发长青', 'RUN FA CHANG QING', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1362, 'RFNM', '润丰内贸', 'RFNM', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1363, 'RFXY', '润发祥运', 'RUNFAXIANGYUN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1364, 'RJ005', '荣江005', 'RONG JIANG 005', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1365, 'RJ010', '荣江010', 'RONJIANG010', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1366, 'RJ011', '荣江011', 'RONGJIANG011', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1367, 'RJ013', '荣江013', 'RONJIANG013', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1368, 'RM', '荣茂', 'RONMAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1369, 'RQ1', '润青1', 'RUN QING 1 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1370, 'RS1', '融顺1', 'RSH1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1371, 'RXJ118', '润兴集118', 'RXJ118', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1372, 'RXJ169', '润兴集169', 'RXJ169', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1373, 'RXJ606', '润兴集606', 'RXJ606', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1374, 'RXJ666', '润兴集666', 'RXJ666', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1375, 'RXJ6699', '润兴集6699', 'RXJ6699', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1376, 'RXJ69', '润兴集69', 'RXJ69', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1377, 'RXJ9', '润兴集9', 'RXJ9', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1378, 'RXJ99', '润兴集99', 'RUNXINGJI99', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1379, 'RXJ999', '润兴集999', 'RUNXINGJI999', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1380, 'RY', '瑞缘', 'RY', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1381, 'RY1', '润扬1', 'RY1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1382, 'RY26', '润扬26', 'RY26', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1383, 'RY6', '润扬6', 'RY6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1384, 'RY99', '润扬99', 'RU99', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1385, 'RYJ6', '润扬集6', 'RYJ6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1386, 'GSH1012', '港盛1012', 'GS1012', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1387, 'GSH1015', ' 港盛1015', 'GSH1015', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1388, 'BG918', '镔港918', 'BG918', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1389, 'GSH805', '港盛805', 'GSH805', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1390, 'CHBH', '长海北湖', 'CHBH', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1391, 'GSH806', '港盛806', 'GSH806', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1392, 'AJ801', '安吉801', 'AJ801', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1393, 'GSH808', '港盛808', 'GSH808', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1394, 'AH1', '安华1号', 'AH1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1395, 'GSH811', '港盛811', 'GSH811', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1396, 'ZYRH', '中艺润海', 'ZHONG YI RUN HAI', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1397, 'GSH813', '港盛813', 'GSH813', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1398, 'ZYRT', '中艺润通', 'ZHONGYIRUNTONG', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1399, 'GSH820', '港盛820', 'GSH820', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1400, 'ZYRD', '中艺润达', 'ZYRD', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1401, 'GSH821', '港盛821', 'GSH821', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1402, 'ZYJY3', '中艺集运3', 'ZHONG YI JI YUN 3', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1403, 'GSH822', '港盛822', 'GSH822', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1404, 'ZY28', '中跃28', 'ZONGYUE28', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1405, 'GSH823', '港盛823', 'GSH823', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1406, 'ZY6', '知音6', 'ZHIYIN6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1407, 'SC', '舜城', 'SHUN CHENG', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1408, 'SC1', '顺成1号', 'SHUNCHENG1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1409, 'SC2!', '盛仓2号', 'SC2!', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1410, 'SC519', '顺成519', 'SC519', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1411, 'SC998', '顺成998号', 'SHUN CHENG 998', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1412, 'GUOYU1', '国渝1', 'GY', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1413, 'SCANG6', '盛仓6号', 'SCANG6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1414, 'GUOYU3', '国宇3', 'GUOYU3', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1415, 'GX8', '桂兴8', 'GX8', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1416, 'ZY1', '中远1', 'ZY1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1417, 'GX898', '国祥898', 'GUOXIANG898', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1418, 'ZY09', '中远09', 'ZY09', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1419, 'GX918', '国祥918', 'GX918', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1420, 'ZXJ1', '中兴集1', 'ZXJ1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1421, 'GY01', '国宇01', 'GUOYU', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1422, 'ZWY16', '中外运16', 'ZHONG WAI YUN 16 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1423, 'GY1', '赣远1', 'GY1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1424, 'ZX98', '振湘98', 'ZX98', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1425, 'GY10', '赣远10', 'GY10', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1426, 'ZX28', '振湘28', 'ZX28', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1427, 'GY11', '赣远11号', 'GY11', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1428, 'ZWYCHJ002', '中外运长江002', 'ZWYCJ002', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1429, 'GY12', '赣远12', 'GY12', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1430, 'ZWYCJ003', '中外运长江003', 'ZWYCJ003', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1431, 'GY16', '赣远16', 'GY16', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1432, 'ZWY3', '中外运3', 'ZHONG WAI YUN 3 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1433, 'SD', '顺达', 'SHUNDA', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1434, 'SD01', '盛达01', 'SHENG DA 01 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1435, 'SD02', '盛达02', 'SHENG DA 02 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1436, 'SD03', '盛达03', 'SHENG DA 03 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1437, 'SD09', '盛达09', 'SHENG DA 09 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1438, 'SD1', '盛达1', 'SD1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1439, 'SD19', '盛达19', 'SHENG DA 19 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1440, 'SD2', '盛达2', 'SD2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1441, 'SD6', '盛达06', 'SHENG DA 06 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1442, 'SD88', '盛达88', 'SHENG DA 88 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1443, 'GY21', '赣远21', 'GANYUAN21', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1444, 'ZWY152', '中外运152', 'ZHONG WAI YUN 152', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1445, 'GY23', '赣远23', 'GANYUAN23', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1446, 'SDHX', '盛达和旭', 'SDHX', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1447, 'SDHXIE', '顺达和谐', 'SDHXIE', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1448, 'SDJ', '顺达集', 'SDJ', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1449, 'GY9', '赣源9', 'GANYUAN9', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1450, 'ZWY151', '中外运151', 'ZHONG WAI YUN 151', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1451, 'BG968', '镔港968', 'BG968', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1452, 'ZWY103', '中外运103', 'ZHONG WAI YUN 103', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1453, 'HAHJ', '怀安海集', 'HUAI AN HAI JI', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1454, 'ZHJ999', '中海集999', 'ZHJ999', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1455, 'SF', '盛丰', 'SHENGFENG', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1456, 'SF199', '顺风199', 'SF199', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1457, 'HAJ06', '怀安集06', 'HAJ06', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1458, 'AXJ4', '安信集4号', 'AXJ4', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1459, 'SG66', '顺港66', 'SHUNGANG66', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1460, 'SG88', '顺港88', 'SHUNGANG88', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1461, 'SG9', '三港9号', 'SANGANG9', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1462, 'SG99', '顺港99', 'SHUNGANG99', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1463, 'SGB', '顺港保', 'SHUNGANGBAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1464, 'SGB15004', '石港驳15004', 'CCSHGB15004', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1465, 'HANGXU801', '航旭801', 'HANGXU801', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1466, 'ZWY102', '中外运102', 'ZHONG WAI YUN 102', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1467, 'HAOYUN6', '昊运6', 'HAOYUN6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1468, 'ZT9', '仲泰9', 'ZHONGTAI9', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1469, 'HAYSH', '怀安永顺', 'HUAIANYONGSHUN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1470, 'ZW', '振武', 'ZHENWU', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1471, 'SGFL', '十港分流', 'SGFL', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1472, 'HAYX', '怀安永祥', 'HUAI AN YONG XIANG', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1473, 'HAYY', '怀安永裕', 'HUAIANYONGYU', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1474, 'SGTY', '顺港通源', 'SGTY', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1475, 'HC2H', '海川2号', 'HC2H', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1476, 'ZJ02', '重集02', 'ZHONGJI02', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1477, 'HC3H', '海川3号', 'HC3H', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1478, 'SH1668', '顺航1668', 'SH1668', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1479, 'SH8', '顺航8号', 'SHUN HANG 8 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1480, 'HD3', '宏达3', 'HD3', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1481, 'HD4', '厚德4#', 'HD4', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1482, 'SHC1', '盛仓1号', 'SHENGCANG1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1483, 'SHC2', '盛仓2', 'SCANG2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1484, 'SHCH999', '顺城999', 'SHCH999', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1485, 'SHD006', '顺达006', 'SHD006', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1486, 'SHDHX', '盛达和谐', 'SHDHX', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1487, 'HDS', '华顶山', 'HDS', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1488, 'SHFZHY', '顺风致远', 'SHZHHY', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1489, 'HENGCHUN1', '恒春1', 'HENGCHUN1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1490, 'ZH88', '洲航88', 'ZHOU HANG 88', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1491, 'HF1006', '弘帆1006', 'HF1006', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1492, 'SHH181', '苏华航181', 'SHH181', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1493, 'HF18', '海福18', 'HAIFU18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1494, 'ZHJ66', '洲航集66', 'ZHJ66', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1495, 'SHH6688', '苏淮货6688', 'SHH6688', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1496, 'SHHJ1', '省航集1', 'SHHJ1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1497, 'SHJ1', '苏华集1号', 'SU HUA JI 1 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1498, 'SHJ2', '苏华集2', 'SHJ2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1499, 'SHJ5', '苏华集5', 'SHJ5', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1500, 'SHJ6', '申华集6', 'SHJ6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1501, 'HH009', '鸿海009', 'HH009', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1502, 'ZHH6', '中海6号', 'ZHONG HAI 06', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1503, 'HH1001', '浩航1001', 'HH1001', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1504, 'FG801', '涪港801', 'FG801', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1505, 'HH1003', '浩航1003', 'HH1003', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1506, 'ZHJ18', '中海集18', 'ZHJ18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1507, 'HH166', '和航166', 'HH166', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1508, 'FG802', '涪港802', 'FG802', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1509, 'SHUNGAN98', '顺港98', 'SHUNGANG98', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1510, 'SHUNGANG9', '顺港9', 'SHUNGANG9', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1511, 'HH2002', '航宏2002', 'HH2002', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1512, 'FG803', '涪港803', 'FG803', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1513, 'HH698', '华航698', 'HH698', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1514, 'SHZE3', '顺泽3', 'SHUNZE3', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1515, 'SHZE5', '顺泽5', 'SHZE5', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1516, 'SHZE6', '顺泽6', 'SZ6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1517, 'SHZH9', '申舟9', 'SHEN ZHOU 9', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1518, 'SHZHHX', '申舟和谐', 'SHENZHOUHEXIE', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1519, 'SJ118', '顺锦118', 'SHUN JIN 118', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1520, 'SJ128', '顺锦128', 'SHUN JIN 128', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1521, 'SJ156', '顺锦156', 'SHUN JIN 156', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1522, 'SJ188', '顺锦188', 'SHUN JIN 188', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1523, 'SJ198', '顺锦198', 'SHUN JIN 198', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1524, 'SJ6', '盛集6', 'SHENGJI6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1525, 'HH909', '航宏909', 'HH909', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1526, 'FG807', '涪港807', 'FG807', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1527, 'HH96', '淮海96', 'CCHUAIH96', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1528, 'FG808', '涪港808', 'FG808', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1529, 'HH968', '鸿海968', 'HH968', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1530, 'BG978', '镔港978', 'BINGANG 978', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1531, 'SJJY06', '顺江集运06', 'SJJY06', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1532, 'HH988', '鸿海988', 'HH988', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1533, 'HH989', '鸿海989', 'HH989', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1534, 'ZH58', '自航58', 'ZH58', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1535, 'SK1', '顺昆1', 'SUNKUN1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1536, 'HH99', '鸿海99', 'HH99', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1537, 'HH999', '鸿海999', 'HH999', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1538, 'SL1', '神龙1', 'SHENLONG1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1539, 'HHHY', '淮海鸿运', 'HHHY', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1540, 'FG811', '涪港811', 'FG811', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1541, 'SLI1', '三力1', 'SANLI1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1542, 'SM666', '三马666', 'SM666', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1543, 'SM888', '三马888', 'SM888', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1544, 'HHJ1', '淮海集1号', 'HHJ1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1545, 'HHJ6', '淮海集6', '淮海集6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1546, 'ZH18', '自航18', 'ZH18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1547, 'HHJY', '淮海集运', 'HHJY', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1548, 'FG813', '涪港813', 'FG813', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1549, 'HHSHH', '华航上海', 'HHSHH', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1550, 'ZH018', '中海018', 'ZHONGHAI018', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1551, 'HHXK666', '华航鑫科666', 'HUAHANGXINKE666', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1552, 'FG815', '涪港815', 'FG815', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1553, 'HHYD', '淮海亿达', 'HHYD', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1554, 'ZH08', '自航08', 'ZH08', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1555, 'HJ1301', '航集1301', 'HANGJI1301', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1556, 'FG816', '涪港816', 'FG816', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1557, 'HJQ1', '惠金桥1', 'HUIJINQIAO1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1558, 'ZH016', '中海016', 'ZHONGHAI016', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1559, 'SQ2', '上庆2', 'SQ2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1560, 'SQ3', '上庆3号', 'SHANGQING3', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1561, 'SQ6H', '上庆6号', 'SQ6H', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1562, 'SQ801', '三庆801', 'SQ801', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1563, 'SQ802', '三庆802', 'SQ802', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1564, 'SQ999', '盛强999', 'SQ999', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1565, 'HL16', '恒隆16', 'HENGLONG16', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1566, 'FG822', '涪港822', 'FG822', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1567, 'HL18', '恒隆18', 'HENG LONG 18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1568, 'FG823', '涪港823', 'FG823', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1569, 'HL2', '恒隆2', 'HENG LONG 2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tally_ship` (`id`, `ship_code`, `ship_name`, `ship_english_name`, `ship_type`, `nationality`, `linkman`, `telephone`, `ship_route`, `regular_ship`, `warehouse_number`, `imo`, `agent_id`, `operator`, `operationtime`) VALUES
(1570, 'ZC99', '众诚99', 'ZHONG CHENG 99', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1571, 'HL3', '海力3', 'HL3', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1572, 'FG831', '涪港831', 'FG831', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1573, 'HL518', '航龙518', 'HL518', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1574, 'ZC66', '众诚66', 'ZHONG CHENG 66', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1575, 'HL6', '恒隆6', 'HENG LONG 6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1576, 'FG832', '涪港832', 'FUGAN832', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1577, 'HL69', '恒隆69', 'HENG LONG 69', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1578, 'SS88', '生松88', 'SS88', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1579, 'SS9', '生松9', 'SS9', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1580, 'SS988', '生松988', 'SS988', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1581, 'HL816', '航龙816', 'HL816', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1582, 'SSD1', '盛仕达1号', 'SSD1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1583, 'HL9', '恒隆9', 'HENG LONG 9', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1584, 'FG835', '涪港835', 'FG835', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1585, 'HL908', '航力908', 'HL908', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1586, 'BG988', ' 镔港988', 'BG988', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1587, 'HL916', '航龙916', 'HL916', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1588, 'FG836', '涪港836', 'FG836', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1589, 'HLD', '葫芦岛', 'RESOLUTION', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1590, 'AH5', '安华5', 'AH5', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1591, 'HLDM', '恒隆杜茂', 'HENG LONG DU MAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1592, 'FG837', '涪港837', 'FG837', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1593, 'HLI2', '海力2', 'HAILI2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1594, 'YZ7', '永正7', 'YZ7', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1595, 'HLONG1', '恒隆1', 'HENG LONG 1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1596, 'SSYYJ98', '生松远洋集98', 'SSYYJ98', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1597, 'ST', '顺天', 'SHUNTIAN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1598, 'HN356', '淮南356', 'HN356', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1599, 'HQ018', '环球018', 'HUAN QIU 018', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1600, 'FG839', '涪港839', 'FG839', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1601, 'STJ1', '三通集1', 'STJ1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1602, 'STJ2', '三通集2', 'STJ2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1603, 'STJ6', '三通集6', 'STJ6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1604, 'HQ098', '环球098', 'HQ098', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1605, 'HQ158', '环球158', 'HQ158', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1606, 'SUNXL', '孙兴林.中远网络物流', 'SUNXINGLIN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1607, 'HQ180', '海桥180', 'HAIQIAO180', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1608, 'FG862', '涪港862', 'FG862', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1609, 'HQ188', '环球188', 'HUANQIU188', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1610, 'YY9999', '油源9999', 'YY9999', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1611, 'HQ268', '环球268', 'HQ268', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1612, 'FG890', '涪港890', 'FG890', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1613, 'HQ518', '环球518', 'HQ518', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1614, 'YY018', '永裕018', '永裕018', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1615, 'HQ698', '环球698', 'HQ698', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1616, 'FG891', '涪港891', 'FG891', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1617, 'HQ878', '环球878', 'HQ878', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1618, 'YY1', '永益1', 'YY1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1619, 'HQ888', '环球888', 'HQ888', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1620, 'FG892', '涪港892', 'FG892', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1621, 'HQ968', '环球968', 'HQ968', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1622, 'YY016', '永裕016', '永裕016', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1623, 'HR1', '恒瑞1', 'HR1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1624, 'FG893', '涪港893', 'FUGANG893', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1625, 'HR10', '恒瑞10', 'HENGRUI10', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1626, 'YX8', '阳羡8', 'YANGXIAN8', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1627, 'HR11', '恒瑞11', 'HR11', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1628, 'FG896', '涪港896', 'FG896', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1629, 'HR12', '恒瑞12', 'HR12', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1630, 'YX01', '渝叙01', 'YUXU01', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1631, 'HR15', '恒瑞15', 'HR15', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1632, 'FG898', '涪港898', 'FG898', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1633, 'HR16', '恒瑞16', 'HR16', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1634, 'YWJ8', '耀威集8', 'YWJ8', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1635, 'SXJ1', '苏徐集1', 'SXJ1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1636, 'HR2', '恒瑞2', 'HR2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1637, 'HR3', '恒瑞3', 'HENGRUI3', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1638, 'YUDONG809', '渝东809', 'YUDONG809', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1639, 'HR9', '恒瑞9', 'HR9', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1640, 'FH118', '福海118', 'FH118', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1641, 'SY2', '三洋2', 'SAN YANG 2 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1642, 'SYAJ1', '苏洋澳集1', 'SYAJ1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1643, 'SYAOJ1', '苏扬澳集1', 'SYAOJ1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1644, 'HRD1911', '恒润达1911', 'HRD1911', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1645, 'HRD58', '恒润达58', 'HRD58', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1646, 'YT', '永通', 'YT', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1647, 'HS006', '汉升006', 'HS006', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1648, 'FH169', '福海169', 'FH169', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1649, 'SYJ1', '苏运集1', 'SYJ1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1650, 'SYJ2', '苏运集2', 'SYUNJ2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1651, 'SYJ2#', '三洋集2', 'SYJ2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1652, 'SYJ3', '苏运集3', 'SYJ3', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1653, 'SYJI1', '三洋集1', 'SYJ1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1654, 'HS158', '汉升158', 'HS158', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1655, 'HS248', '汉升248', 'HS248', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1656, 'FH9', '福海9', 'FH9', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1657, 'HS8', '华顺8', 'HUASHUN8', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1658, 'YSJ2', '豫商集2', 'YSJ2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1659, 'HS808', '航顺808', 'HS808', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1660, 'SZ1', '順泽1', 'SZ1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1661, 'SZ16', '申舟16号', 'SHEN ZHOU 16 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1662, 'SZ2', '顺泽2', 'SZ2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1663, 'SZ77', '申舟77', 'SHEN ZHOU 77', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1664, 'SZ8', '順泽8', 'SZ8', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1665, 'SZ9', '顺泽9', 'SZ9', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1666, 'HSD99', '恒顺达99', 'HSD99', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1667, 'HSFZ', '华晟发展', 'HSFZ', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1668, 'CJ03', '重机03', 'CJ03', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1669, 'HT1', '恒通1', 'HENGTONG1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1670, 'YSHX', '永顺祥', 'YSHX', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1671, 'HT2', '恒通2', 'HENGTONG2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1672, 'YS988', '永盛988', 'YONGSHENG988', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1673, 'HT66', '恒通66', 'HT66', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1674, 'YS2002', '渝申2002', 'YS2002', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1675, 'HT99', '恒通99', 'HT99', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1676, 'CJ1', '昌集1', 'CJ1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1677, 'HUAIH18', '淮海18', 'HUAIH18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1678, 'SZHOU5', '申舟5号', 'SHEN ZHOU 5 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1679, 'SZHOU6', '申舟6号', 'SHEN ZHOU 6 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1680, 'SZHOU9', '申舟9号', 'SHEN ZHOU 9 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1681, 'HUANQIU', '环球18', 'HUANQIU18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1682, 'YMS1911', '豫梅盛1911', 'YMS1911', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1683, 'HUANYANG', '环洋', 'HUANYANG', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1684, 'CJ27', '川集27', 'CHUANJI27', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1685, 'TAJ0106', '泰安集0106', 'TAJ0106', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1686, 'TB66', '泰帮66', 'TB66', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1687, 'TB666', '泰邦666', 'TB666', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1688, 'TB9001', '通邦9001', 'TB9001', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1689, 'TB9002', '通邦9002', 'TB9002', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1690, 'TB9005', '通邦9005', 'TB9005', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1691, 'TB968', '泰邦968', 'TB968', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1692, 'TCH', '太仓河', 'TAI CANG HE', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1693, 'TCXJ218', '泰长鑫机218', 'TCXJ218', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1694, 'TD366', '通达366', 'TD366', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1695, 'TD601', '腾达601', 'TD601', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1696, 'TD602', '腾达602', 'TD602', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1697, 'TD608', '腾达608', 'TD608', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1698, 'TD609', '滕达609', 'TD609', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1699, 'TD610', '腾达610', 'TD610', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1700, 'TD806', '腾达806', 'TD806', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1701, 'TD808', '腾达808', 'TD808', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1702, 'TDQ', '同德泉', 'TONGDEQUAN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1703, 'TDQSH', '通达起顺', 'TDQSH', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1704, 'TDXC', '通达新成', 'TDXC', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1705, 'TDYH', '通达永恒', 'TDYH', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1706, 'TDYSH', '通达永顺', 'TONGDAYONGSHUN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1707, 'TF18', '腾飞18', 'TF18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1708, 'TF20', '腾飞20', 'TF20', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1709, 'TF22', '天福22', 'TF22', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1710, 'TH1', '天虹1', 'TH1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1711, 'TH828', '腾鸿828', 'TH828', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1712, 'TH858', '腾鸿858', 'TH858', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1713, 'THAI1', '天海1', 'THAI1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1714, 'THJ1', '通海集1', 'TONG HAI JI 1 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1715, 'THJ16', '通海集16', 'TONG HAI JI 16 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1716, 'THJ18', '通海集18', 'TONG HAI JI 18 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1717, 'THJ8', '通海集8', 'TONG HAI JI 8 HAO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1718, 'THZS', '通海钟山', 'TONG HAI ZHONG SHAN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1719, 'TJ', '沱江', 'PADMA', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1720, 'TJ1', '泰集1', 'TAIJI1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1721, 'TJ2', '通集2', 'TONGJI2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1722, 'TJI1', '通集1', 'TONGJI1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1723, 'TK819', '通凯819', 'TK819', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1724, 'TLJ1', '通陵集1', 'TLJ1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1725, 'TLJ8', '通陵集8', 'TLJ8', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1726, 'TLJ88', '通陵集88', 'TLJ88', 9, '', '', '', 1, 0, 0, '', 0, NULL, NULL),
(1727, 'TLJ89', '通陵集89', 'TLJ89', 9, '', '', '', 1, 0, 0, '', 0, NULL, NULL),
(1728, 'TM131', '天门131', 'TM131', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1729, 'TPY02', '太平洋2号', 'TPY02', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1730, 'TPY06', '太平洋06', 'TPY06', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1731, 'TPY07', '太平洋07', 'TPY07', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1732, 'TPY1', '太平洋1', 'TPY1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1733, 'TPY11', '太平洋11', 'TPY11', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1734, 'TPY12', '太平洋12', 'TPY12', 9, '', '', '', 1, 0, 0, '', 0, NULL, NULL),
(1735, 'MJ918', '明江918', 'MJ', 9, '', '', '', 3, 2, 0, '', 0, NULL, NULL),
(1736, 'BS0088', '宝胜0088', 'BS', 9, '', '', '', 1, 2, 0, '', 0, NULL, NULL),
(1737, 'DY1777', '东运1777', 'DONYUN', 9, '', '', '', 1, 2, 0, '', 0, NULL, NULL),
(1738, 'SDJH', '苏大金货8818', 'SDJH', 9, '', '', '', 1, 2, 0, '', 0, NULL, NULL),
(1739, 'SYXH0999', '苏源鑫货0999', 'SYXH', 9, '', '', '', 1, 2, 0, '', 0, NULL, NULL),
(1740, 'SHYH0888', '苏洪运货0888', 'MJ918', 9, '', '', '', 1, 2, 0, '', 0, NULL, NULL),
(1741, 'SHYH', '苏洪运货0888', 'SHYH', 9, '', '', '', 1, 2, 0, '', 0, NULL, NULL),
(1742, 'SYCH', '苏盐城货219128', 'SYCH', 9, '', '', '', 1, 2, 0, '', 0, NULL, NULL),
(1743, 'STYH1166', '苏通源货1166', 'STYH', 9, '', '', '', 1, 2, 0, '', 0, NULL, NULL),
(1744, 'SHH11113', '苏淮货11113', 'SHH', 9, '', '', '', 1, 2, 0, '', 0, NULL, NULL),
(1745, 'ZYH', '枞阳货10515', 'ZHONGYIRUNHAI', 9, '', '', '', 1, 0, 0, '', 0, NULL, NULL),
(1746, 'XD7788', '兴达7788', 'XD7788', 9, '', '', '', 1, 0, 0, '', 0, NULL, NULL),
(1747, 'SSYH', '苏顺运货9888', 'SSYH9888', 9, '', '', '', 1, 2, 0, '', 0, NULL, NULL),
(1748, 'DFYH668', '东方圆货668', 'DFYH668', 9, '', '', '', 1, 0, 0, '', 0, NULL, NULL),
(1749, 'SFYH', '苏方圆货668', 'SFYH668', 9, '', '', '', 1, 2, 0, '', 0, NULL, NULL),
(1750, 'WENJ1', '文锦1', 'WJ1', 9, '', '', '', 1, 2, 0, '', 0, NULL, NULL),
(1751, 'SSYH9686', '苏顺运货9686', 'SSYH9686', 9, '', '', '', 1, 0, 0, '', 0, NULL, NULL),
(1752, 'SHH18581', '苏淮货18581', 'SHH18581', 9, '', '', '', 1, 0, 0, '', 0, NULL, NULL),
(1753, 'HF817', '恒锋817', 'HF', 9, '', '', '', 1, 2, 0, '', 0, NULL, NULL),
(1754, 'SSHH1378', '苏泗洪货1378', 'SSHH', 9, '', '', '', 1, 2, 0, '', 0, NULL, NULL),
(1755, 'ZJNM', '中集内贸', 'ZJNM', 1, '', '', '', 1, 0, 0, '', 0, NULL, NULL),
(1756, 'JSKT', '江苏凯通', 'JSKT', 1, '', '', '', 1, 0, 0, '', 0, NULL, NULL),
(1757, 'JSZY', '江苏中艺', 'JSZY', 1, '', '', '', 1, 0, 0, '', 0, NULL, NULL),
(1758, 'TJNM', '通集内贸', 'TJNM', 1, '', '', '', 1, 0, 0, '', 0, NULL, NULL),
(1759, 'JF1189', '军福1189', 'JF1189', 9, '', '', '', 1, 2, 0, '', 0, NULL, NULL),
(1760, 'LZZH1262', '鲁枣庄货1262', 'LZZH', 9, '', '', '', 1, 2, 0, '', 0, NULL, NULL),
(1761, 'ZC', '众诚', 'ZC', 1, '', '', '', 3, 0, 0, '', 0, NULL, NULL),
(1762, 'SYH99318', '苏盐货99318', 'SYH', 9, '', '', '', 1, 0, 0, '', 0, NULL, NULL),
(1763, 'SXH7569', '苏徐货7569', 'SXH', 9, '', '', '', 1, 0, 0, '', 0, NULL, NULL),
(1764, 'SHH18508', '苏淮货18508', 'SHH', 9, '', '', '', 1, 2, 0, '', 0, NULL, NULL),
(1765, 'SHYH5168', '苏洪运货5168', 'SHYH5168', 9, '', '', '', 1, 0, 0, '', 0, NULL, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='用户表';

--
-- 转存表中的数据 `tally_user`
--

INSERT INTO `tally_user` (`uid`, `staffno`, `user_name`, `user_pwd`, `department_id`, `position`, `group_id`, `user_status`, `shift_id`, `last_logintime`, `operator`, `operationtime`) VALUES
(1, '1000', '郑德凯', '3db3bd0cfd6193886abc8ad2d239e869', '51', '理货员', '11', 'Y', NULL, '2016-11-22 11:32:25', NULL, '2016-11-21 19:33:51'),
(2, '1001', '欧飞', '3db3bd0cfd6193886abc8ad2d239e869', '51', '理货员', '11', 'Y', 'QBZXZ201707261', '2017-08-02 12:06:59', NULL, '2016-11-22 08:27:48'),
(3, '1002', '刘修超', '3db3bd0cfd6193886abc8ad2d239e869', '51', '理货员', '11', 'Y', NULL, '2017-05-10 15:46:05', NULL, '2016-11-17 19:18:53'),
(4, '1003', '李永忠', '3db3bd0cfd6193886abc8ad2d239e869', '51', '理货员', '11', 'Y', NULL, '2017-05-10 15:42:14', NULL, '2016-11-21 10:45:47'),
(5, '1004', '孙青', '3db3bd0cfd6193886abc8ad2d239e869', '51', '理货员', '11', 'Y', 'QBZXZ201707011', '2017-07-14 14:38:24', NULL, '2016-08-22 18:00:49'),
(6, '1005', '程康', '3db3bd0cfd6193886abc8ad2d239e869', '51', '理货长', '12', 'Y', NULL, '2017-07-28 15:51:21', NULL, '2016-11-22 08:15:22'),
(7, '1006', '朱宁', '3db3bd0cfd6193886abc8ad2d239e869', '51', '理货长', '12', 'Y', 'MDMBZ201707021', '2017-08-30 09:25:43', NULL, '2016-11-16 15:41:28'),
(8, '1008', '陈业', '3db3bd0cfd6193886abc8ad2d239e869', '51', '理货长', '12', 'Y', 'MDMBZ201707021', '2017-09-07 08:55:40', NULL, '2016-11-14 17:19:20'),
(9, '1009', '韩广云', '3db3bd0cfd6193886abc8ad2d239e869', '51', '理货员', '11', 'Y', NULL, '2016-12-07 13:57:03', NULL, '2016-11-11 08:11:45'),
(10, '1010', '叶声兵', '3db3bd0cfd6193886abc8ad2d239e869', '51', '理货员', '11', 'Y', 'MDMBZ201707011', '2017-07-25 14:01:37', NULL, '2016-10-17 10:00:30'),
(11, '1011', '李宗宝', '3db3bd0cfd6193886abc8ad2d239e869', '51', '理货员', '11', 'Y', NULL, '2016-11-19 21:05:56', NULL, '2016-11-18 15:07:55'),
(12, '1012', '曹金宏', '3db3bd0cfd6193886abc8ad2d239e869', '51', '理货员', '11', 'Y', NULL, '2017-05-09 08:52:37', NULL, '2016-11-21 14:50:37'),
(13, '1013', '董建国', '3db3bd0cfd6193886abc8ad2d239e869', '51', '理货员', '11', 'Y', 'QBZXZ201707011', '2017-07-12 17:16:46', NULL, '2016-11-20 08:55:59'),
(14, '2001', '吴斌', '3db3bd0cfd6193886abc8ad2d239e869', '50', '', '12', 'Y', NULL, '2017-05-09 15:39:35', '', NULL),
(15, '2002', '曹军', '3db3bd0cfd6193886abc8ad2d239e869', '50', '', '11', 'Y', NULL, '2016-11-23 10:36:48', NULL, '2016-10-27 11:04:37'),
(16, '2003', '徐波', '3db3bd0cfd6193886abc8ad2d239e869', '50', '', '11', 'Y', NULL, '2016-11-23 10:00:50', '', NULL),
(17, '2004', '徐兵', '3db3bd0cfd6193886abc8ad2d239e869', '50', '', '11', 'Y', NULL, '2016-11-23 10:45:51', '', NULL),
(18, '2005', '杨蓉华', '3db3bd0cfd6193886abc8ad2d239e869', '50', '', '12', 'Y', NULL, '2017-01-03 10:04:48', '18', '2016-10-26 14:27:04'),
(19, '1018', '姚曦', '3db3bd0cfd6193886abc8ad2d239e869', '48', '', '12', 'Y', NULL, '2017-07-21 16:16:32', NULL, '2016-11-21 14:08:51'),
(20, '3001', '张勇', '3db3bd0cfd6193886abc8ad2d239e869', '52', '', '12', 'Y', NULL, '2017-05-17 13:40:26', '20', '2016-11-08 10:21:54'),
(21, '9999', '测试专用', '3db3bd0cfd6193886abc8ad2d239e869', '47', '', '12', 'Y', 'QBZXZ201707261', '2017-09-07 08:44:54', '', NULL),
(22, '9998', '测试专用理货员', '3db3bd0cfd6193886abc8ad2d239e869', '47', '', '11', 'Y', NULL, '2016-11-17 17:37:10', NULL, '2016-11-09 17:01:47'),
(23, '4001', '易乐', '3db3bd0cfd6193886abc8ad2d239e869', '50', '', '12', 'Y', NULL, '2016-11-13 12:44:00', '', NULL),
(24, '4002', '王文海', '3db3bd0cfd6193886abc8ad2d239e869', '50', '', '11', 'Y', NULL, '2016-11-08 13:44:21', '', NULL),
(25, '3003', '李建平', '3db3bd0cfd6193886abc8ad2d239e869', '52', '', '12', 'Y', NULL, '2016-11-17 10:53:40', '25', '2016-11-08 10:13:56'),
(26, '3004', '陆璐', '3db3bd0cfd6193886abc8ad2d239e869', '52', '', '12', 'Y', 'QBZXZ201707261', '2017-08-01 21:11:36', '26', '2016-11-08 10:14:31'),
(27, '3005', '姜涛', '3db3bd0cfd6193886abc8ad2d239e869', '52', '', '12', 'Y', NULL, '2017-03-17 13:06:49', '27', '2016-11-08 10:15:59'),
(28, '3006', '陈远', '3db3bd0cfd6193886abc8ad2d239e869', '52', '', '11', 'Y', NULL, '2016-11-17 10:00:22', '28', '2016-11-08 10:16:34'),
(29, '2006', '周程', '3db3bd0cfd6193886abc8ad2d239e869', '48', '', '11', 'Y', NULL, NULL, '', NULL),
(30, '2007', '马继勇', '3db3bd0cfd6193886abc8ad2d239e869', '48', '', '11', 'Y', NULL, NULL, '', NULL),
(31, '2008', '李彦', '3db3bd0cfd6193886abc8ad2d239e869', '48', '', '11', 'Y', NULL, '2016-11-04 11:45:08', '', NULL),
(32, '4003', '王耀平', '3db3bd0cfd6193886abc8ad2d239e869', '50', '', '11', 'Y', NULL, NULL, '', NULL),
(33, '4004', '范晓敏', '3db3bd0cfd6193886abc8ad2d239e869', '50', '', '11', 'Y', NULL, NULL, '', NULL),
(34, '4005', '李文', '3db3bd0cfd6193886abc8ad2d239e869', '50', '', '11', 'Y', NULL, NULL, '', NULL),
(35, '4006', '周永强', '3db3bd0cfd6193886abc8ad2d239e869', '50', '', '11', 'Y', NULL, NULL, '', NULL),
(36, '9997', '测试部门长', '3db3bd0cfd6193886abc8ad2d239e869', '48', '', '13', 'Y', NULL, '2017-01-04 10:27:28', '', NULL),
(37, '3002', '胡菁', '3db3bd0cfd6193886abc8ad2d239e869', '52', '', '12', 'Y', NULL, '2017-06-15 13:47:16', 'admin', '2016-12-27 13:12:41'),
(38, '3007', '潘正东', '3db3bd0cfd6193886abc8ad2d239e869', '52', '', '11', 'Y', NULL, '2016-11-23 08:24:57', '38', '2016-11-08 10:17:07'),
(39, '3008', '叶红', '3db3bd0cfd6193886abc8ad2d239e869', '52', '', '11', 'Y', NULL, '2016-12-27 13:53:40', '39', '2016-11-08 10:17:40'),
(40, '3009', '刘伟', '3db3bd0cfd6193886abc8ad2d239e869', '52', '', '11', 'Y', NULL, '2016-11-16 09:34:30', '40', '2016-11-08 10:18:14'),
(41, '3010', '于秋杰', '3db3bd0cfd6193886abc8ad2d239e869', '52', '', '11', 'Y', NULL, '2016-11-16 14:16:45', '41', '2016-11-08 10:18:46'),
(42, '3011', '王论第', '3db3bd0cfd6193886abc8ad2d239e869', '52', '', '11', 'Y', NULL, '2016-11-21 10:37:44', '42', '2016-11-08 10:19:18'),
(43, '3012', '黄浩', '3db3bd0cfd6193886abc8ad2d239e869', '52', '', '11', 'Y', NULL, '2016-11-18 11:27:07', '43', '2016-11-08 10:19:50'),
(44, '3013', '柳春英', '3db3bd0cfd6193886abc8ad2d239e869', '52', '', '11', 'Y', NULL, '2016-11-21 10:38:14', '44', '2016-11-08 10:20:22'),
(45, '3014', '谢小娟', '3db3bd0cfd6193886abc8ad2d239e869', '52', '', '11', 'Y', NULL, '2016-12-28 14:27:20', '45', '2016-11-08 10:20:56'),
(46, '3015', '时彩艳', '3db3bd0cfd6193886abc8ad2d239e869', '52', '', '11', 'Y', NULL, '2016-11-23 13:08:04', '46', '2016-11-08 10:21:24'),
(47, '1015', '陈宝钱', '3db3bd0cfd6193886abc8ad2d239e869', '51', '理货员', '11', 'Y', NULL, '2017-03-22 14:46:12', NULL, '2016-11-18 15:28:39'),
(48, '8001', '业务部', '3db3bd0cfd6193886abc8ad2d239e869', '55', '', '12', 'N', NULL, '2016-11-15 15:40:13', NULL, '2016-11-15 11:42:38'),
(49, 'YGP', '罗勇', '3db3bd0cfd6193886abc8ad2d239e869', '47', '部门长', '13', 'Y', NULL, '2017-06-15 14:50:41', 'admin', '2017-06-02 11:15:07'),
(50, 'SL001', '示例用户1', '3db3bd0cfd6193886abc8ad2d239e869', '47', '理货员', '11', 'Y', NULL, NULL, 'admin', '2016-11-30 15:40:43'),
(51, 'SL002', '示例用户2', '3db3bd0cfd6193886abc8ad2d239e869', '48', '理货员', '12', 'Y', NULL, NULL, 'admin', '2016-11-30 15:40:43');

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
) ENGINE=MyISAM AUTO_INCREMENT=138 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tally_user_auth_rule`
--

INSERT INTO `tally_user_auth_rule` (`id`, `name`, `title`, `type`, `status`, `condition`, `pid`, `sort`, `create_time`) VALUES
(1, 'Index', '网站前台功能', 1, 1, '', 0, 0, '2016-11-25 14:50:12'),
(2, 'User', '用户中心', 1, 1, '', 1, 0, '2016-11-25 14:50:50'),
(3, 'User/login', '用户登录', 1, 1, '', 2, 0, '2016-11-25 14:51:10'),
(4, 'User/loginout', '退出登录', 1, 1, '', 2, 0, '2016-11-25 14:51:32'),
(5, 'User/personal', '个人信息', 1, 1, '', 2, 0, '2016-11-25 14:51:53'),
(6, 'User/changepwd', '修改密码', 1, 1, '', 2, 0, '2016-11-25 14:52:22'),
(7, 'QbzxPlan', '起驳装箱', 1, 1, '', 1, 0, '2016-11-25 14:53:16'),
(8, 'QbzxPlan/index', '预报计划管理', 1, 1, '', 7, 0, '2016-11-25 14:53:43'),
(9, 'QbzxPlan/add', '新增预报计划', 1, 1, '', 8, 0, '2016-11-25 14:53:58'),
(10, 'QbzxPlan/edit', '编辑预报计划', 1, 1, '', 8, 0, '2016-11-25 14:54:12'),
(11, 'QbzxPlan/del', '删除预报计划', 1, 1, '', 8, 0, '2016-11-25 14:54:31'),
(12, 'QbzxPlanCargo', '预报计划配货管理', 1, 1, '', 7, 0, '2016-11-25 14:55:03'),
(13, 'QbzxPlanCargo/add', '新增配货', 1, 1, '', 12, 0, '2016-11-25 14:55:19'),
(14, 'QbzxPlanCargo/edit', '编辑配货', 1, 1, '', 12, 0, '2016-11-25 14:55:38'),
(15, 'QbzxPlanCargo/del', '删除配货', 1, 1, '', 12, 0, '2016-11-25 14:55:53'),
(16, 'QbzxPlanCtn', '预报计划配箱管理', 1, 1, '', 7, 0, '2016-11-25 14:56:22'),
(17, 'QbzxPlanCtn/add', '新增配箱', 1, 1, '', 16, 0, '2016-11-25 14:56:43'),
(18, 'QbzxPlanCtn/edit', '编辑配箱', 1, 1, '', 16, 0, '2016-11-25 14:57:03'),
(19, 'QbzxPlanCtn/del', '删除配箱', 1, 1, '', 16, 0, '2016-11-25 14:57:16'),
(20, 'QbzxInstruction/index', '指令管理', 1, 1, '', 7, 0, '2016-11-25 15:08:31'),
(21, 'QbzxInstruction/add', '新增指令', 1, 1, '', 20, 0, '2016-11-25 15:08:59'),
(22, 'QbzxInstruction/edit', '编辑指令', 1, 1, '', 20, 0, '2016-11-25 15:10:34'),
(23, 'QbzxInstruction/del', '删除指令', 1, 1, '', 20, 0, '2016-11-25 15:10:56'),
(24, 'QbzxInstruction/listins', '查看预报计划下的指令列表', 1, 1, '', 20, 0, '2016-11-25 15:11:21'),
(25, 'QbzxInstructionCtn/index', '指令配箱管理', 1, 1, '', 7, 0, '2016-11-25 15:12:39'),
(26, 'QbzxInstructionCtn/add', '新增指令配箱', 1, 1, '', 25, 0, '2016-11-25 15:12:56'),
(27, 'QbzxInstructionCtn/edit', '编辑指令配箱', 1, 1, '', 25, 0, '2016-11-25 15:13:16'),
(28, 'QbzxInstructionCtn/del', '删除指令配箱', 1, 1, '', 25, 0, '2016-11-25 15:13:38'),
(29, 'QbzxDispatch', '派工管理', 1, 1, '', 7, 0, '2016-11-25 15:15:06'),
(30, 'QbzxDispatch/add', '新增派工', 1, 1, '', 29, 0, '2016-11-25 15:15:21'),
(31, 'QbzxDispatch/edit', '修改派工', 1, 1, '', 29, 0, '2016-11-25 15:16:04'),
(32, 'QbzxDispatch/cancel', '取消派工', 1, 1, '', 29, 0, '2016-11-25 15:16:24'),
(33, 'QbzxOperation/index', '作业管理', 1, 1, '', 7, 0, '2017-01-05 10:10:44'),
(34, 'QbzxOperation/replaceTallyClerk', '替换理货员', 1, 1, '', 33, 0, '2017-01-05 10:12:38'),
(35, 'QbzxOperation/editSealno', '修改铅封号', 1, 1, '', 33, 0, '2017-01-05 10:13:14'),
(36, 'QbzxOperation/editlevel', '修改关', 1, 1, '', 33, 0, '2017-01-05 10:13:52'),
(37, 'Search/index', '查询管理', 1, 1, '', 1, 0, '2017-01-05 10:15:16'),
(38, 'QbzxSearch', '起驳装箱查询管理', 1, 1, '', 37, 0, '2017-01-05 10:16:11'),
(39, 'QbzxSearch/RealTime', '实时作业查询', 1, 1, '', 38, 0, '2017-01-05 10:16:53'),
(40, 'QbzxSearch/RealTimeDetail', '实时作业详情', 1, 1, '', 39, 0, '2017-01-05 10:27:33'),
(41, 'QbzxSearch/OperationFinish', '完成作业查询', 1, 1, '', 38, 0, '2017-01-05 10:28:18'),
(42, 'QbzxSearch/OperationFinishDetail', '完成作业详情', 1, 1, '', 41, 0, '2017-01-05 10:28:51'),
(43, 'QbzxSearch/ProveByCtn', '分箱单证查询', 1, 1, '', 38, 0, '2017-01-05 10:29:37'),
(44, 'QbzxSearch/ProveByCtnMsg', '分箱单证详情', 1, 1, '', 43, 0, '2017-01-05 10:30:02'),
(45, 'QbzxSearch/ProveByTicket', '分票单证查询', 1, 1, '', 38, 0, '2017-01-05 10:31:15'),
(46, 'QbzxSearch/ProveByTicketMsg', '分票单证详情', 1, 1, '', 45, 0, '2017-01-05 10:31:36'),
(47, 'QbzxSearch/ProveByShip', '分驳船单证查询', 1, 1, '', 38, 0, '2017-01-05 10:32:00'),
(49, 'QbzxSearch/ProveByShipMsg', '分驳船单证详情', 1, 1, '', 47, 0, '2017-01-05 10:34:10'),
(50, 'DdInstruction', '门到门拆箱', 1, 1, '', 1, 0, '2017-01-05 10:35:11'),
(51, 'DdInstruction/index', '作业指令', 1, 1, '', 50, 0, '2017-01-05 10:36:37'),
(52, 'DdInstruction/view', '指令详情', 1, 1, '', 51, 0, '2017-01-05 10:38:16'),
(53, 'CfsInstruction', 'CFS装箱', 1, 1, '', 1, 0, '2017-01-05 14:14:22'),
(54, 'CfsInstruction/index', '作业指令管理', 1, 1, '', 53, 0, '2017-01-05 14:14:57'),
(55, 'CfsInstruction/add', '新增作业指令', 1, 1, '', 54, 0, '2017-01-05 14:15:28'),
(56, 'CfsInstruction/edit', '修改作业指令', 1, 1, '', 54, 0, '2017-01-05 14:15:47'),
(57, 'CfsInstruction/del_instruct', '删除作业指令', 1, 1, '', 54, 0, '2017-01-05 14:16:29'),
(58, 'CfsInstructionContainer/detail', '指令下配箱管理', 1, 1, '', 53, 0, '2017-01-05 14:19:49'),
(59, 'CfsInstructionContainer/add', '新增指令配箱', 1, 1, '', 58, 0, '2017-01-05 14:20:22'),
(60, 'CfsInstructionContainer/edit', '修改指令配箱', 1, 1, '', 58, 0, '2017-01-05 14:20:51'),
(61, 'CfsInstructionContainer/del', '删除指令下配箱', 1, 1, '', 58, 0, '2017-01-05 14:21:29'),
(62, 'CfsInstructionCargo', '指令下配货管理', 1, 1, '', 53, 0, '2017-01-05 14:23:57'),
(63, 'CfsInstructionCargo/add', '新增指令配货', 1, 1, '', 62, 0, '2017-01-05 14:24:28'),
(64, 'CfsInstructionCargo/edit', '修改指令配货', 1, 1, '', 62, 0, '2017-01-05 14:24:45'),
(65, 'CfsInstructionCargo/del', '删除指令配货', 1, 1, '', 62, 0, '2017-01-05 14:25:08'),
(66, 'CfsOperationContainer', '作业管理', 1, 1, '', 53, 0, '2017-01-05 14:25:48'),
(67, 'CfsOperationContainer/detail', '查看作业详情', 1, 1, '', 66, 0, '2017-01-05 14:26:08'),
(68, 'DdSearch', '门到门拆箱查询管理', 1, 1, '', 37, 0, '2017-01-05 14:27:19'),
(69, 'DdPlan/index', '预报计划列表', 1, 1, '', 125, 0, '2017-01-05 14:28:19'),
(70, 'DdPlan/edit', '编辑预报计划', 1, 1, '', 125, 0, '2017-01-05 14:29:10'),
(71, 'DdSearch/real_time', '实时作业查询', 1, 1, '', 68, 0, '2017-01-05 14:29:38'),
(72, 'DdSearch/realtimeDetail', '实时作业详情', 1, 1, '', 71, 0, '2017-01-05 14:30:30'),
(73, 'DdSearch/complete', '完成作业查询', 1, 1, '', 68, 0, '2017-01-05 14:31:16'),
(74, 'DdSearch/completeDetail', '完成作业详情', 1, 1, '', 73, 0, '2017-01-05 14:31:55'),
(75, 'DdSearch/documentByCtn', '分箱单证查询', 1, 1, '', 68, 0, '2017-01-05 14:33:20'),
(76, 'DdSearch/documentByCtnMsg', '分箱单证详情', 1, 1, '', 75, 0, '2017-01-05 14:33:51'),
(77, 'CfsSearch', 'CFS装箱查询管理', 1, 1, '', 37, 0, '2017-01-05 14:34:34'),
(78, 'CfsSearch/real_time', '实时作业查询', 1, 1, '', 77, 0, '2017-01-05 14:35:23'),
(79, 'CfsSearch/realtimeDetail', '实时作业详情', 1, 1, '', 78, 0, '2017-01-05 14:36:15'),
(80, 'CfsSearch/complete', '完成作业查询', 1, 1, '', 77, 0, '2017-01-05 14:36:47'),
(81, 'CfsSearch/completeDetail', '完成作业详情', 1, 1, '', 80, 0, '2017-01-05 14:37:07'),
(82, 'CfsSearch/documentByCtn', '分箱单证查询', 1, 1, '', 77, 0, '2017-01-05 14:37:33'),
(83, 'CfsSearch/documentByCtnMsg', '分箱单证详情', 1, 1, '', 82, 0, '2017-01-05 14:37:50'),
(84, 'CfsSearch/documentByTicket', '分票单证查询', 1, 1, '', 77, 0, '2017-01-05 14:38:07'),
(85, 'CfsSearch/documentByTicketMsg', '分票单证详情', 1, 1, '', 84, 0, '2017-01-05 14:38:23'),
(86, 'CfsDispatch', '派工管理', 1, 1, '', 53, 0, '2017-01-05 14:41:44'),
(87, 'CfsDispatch/add', '新增派工', 1, 1, '', 86, 0, '2017-01-05 14:42:00'),
(88, 'CfsDispatch/edit', '修改派工', 1, 1, '', 86, 0, '2017-01-05 14:42:15'),
(89, 'CfsDispatch/del', '取消派工', 1, 1, '', 86, 0, '2017-01-05 14:42:47'),
(90, 'DdDispatch', '派工管理', 1, 1, '', 50, 0, '2017-01-05 14:43:51'),
(91, 'DdDispatch/add', '新增派工', 1, 1, '', 90, 0, '2017-01-05 14:44:12'),
(92, 'DdDispatch/edit', '修改派工', 1, 1, '', 90, 0, '2017-01-05 14:44:39'),
(93, 'DdDispatch/cancel', '取消派工', 1, 1, '', 90, 0, '2017-01-05 14:45:14'),
(94, 'DdOperation', '作业管理', 1, 1, '', 50, 0, '2017-01-05 14:45:42'),
(95, 'DdOperation/index', '作业详情', 1, 1, '', 94, 0, '2017-01-05 14:46:06'),
(96, 'Work', '工班管理', 1, 1, '', 1, 0, '2017-01-16 09:37:01'),
(97, 'Work/signin', '签到', 1, 1, '', 96, 0, '2017-01-16 09:37:51'),
(98, 'Work/succeed', '接班', 1, 1, '', 96, 0, '2017-01-16 09:38:29'),
(99, 'Work/transfer', '交班', 1, 1, '', 96, 0, '2017-01-16 09:39:34'),
(100, 'Work/resume', '工班恢复', 1, 1, '', 96, 0, '2017-01-16 09:40:06'),
(101, 'Work/resumePro', '工班恢复操作', 1, 1, '', 96, 0, '2017-01-16 09:40:28'),
(102, 'Work/replaceMaster', '替换当班理货长', 1, 1, '', 96, 0, '2017-01-16 09:40:47'),
(103, 'Work/replaceMasterPro', '替换当班理货长操作', 1, 1, '', 96, 0, '2017-01-16 09:41:11'),
(104, 'ShipSchedule', '船期维护', 1, 1, '', 1, 0, '2017-01-16 09:41:56'),
(105, 'ShipSchedule/index', '获取船期列表', 1, 1, '', 104, 0, '2017-01-16 09:42:34'),
(106, 'ShipSchedule/add', '新增船期', 1, 1, '', 104, 0, '2017-01-16 09:42:58'),
(107, 'ShipSchedule/edit', '修改船期', 1, 1, '', 104, 0, '2017-01-16 09:43:22'),
(109, 'QbzxOperation/pack_img', '图片打包', 1, 1, '', 33, 0, '0000-00-00 00:00:00'),
(108, 'QbzxOperation/reviewed', '审核箱超重', 1, 1, '', 33, 0, '2017-05-16 02:10:11'),
(112, 'QbzxSearch/user_ctn', '统计理货员箱量', 1, 1, '', 38, 0, '2017-05-15 03:10:21'),
(113, 'QbzxSearch/pack_img', '完成作业批量打包照片', 1, 1, '', 38, 0, '2017-05-16 05:24:29'),
(114, 'QbzxOperation/operation_examine', 'qb完成作业详情审核通过', 1, 1, '', 33, 0, '2017-05-31 10:46:46'),
(115, 'QbzxOperation/operation_examine_no', 'qb完成作业详情审核不通过', 1, 1, '', 33, 0, '2017-05-31 17:32:49'),
(116, 'DdOperation/operation_examine', 'dd完成作业详情审核通过', 1, 1, '', 94, 0, '2017-06-01 14:17:02'),
(117, 'DdOperation/operation_examine_no', 'dd完成作业详情审核不通过', 1, 1, '', 94, 0, '2017-06-01 14:17:53'),
(118, 'CfsOperationContainer/operation_examine', 'cfs完成作业详情审核通过', 1, 1, '', 66, 0, '0000-00-00 00:00:00'),
(119, 'CfsOperationContainer/operation_examine_no', 'cfs完成作业详情审核不通过', 1, 1, '', 66, 0, '0000-00-00 00:00:00'),
(120, 'CfsInstruction/reviewed', 'cfs审核超重', 1, 1, '', 54, 0, '2017-06-02 00:00:00'),
(121, 'QbzxSearch/Temporaryclosure', '暂不施封查询', 1, 1, '', 38, 0, '2017-06-23 00:00:11'),
(122, 'QbzxSearch/TemporaryclosureDetail', '暂不施封作业详情', 1, 1, '', 121, 0, '2017-06-08 00:00:00'),
(123, 'QbzxSearch/RealTimeCount', '实时作业统计', 1, 1, '', 38, 0, '2017-06-09 00:00:00'),
(124, 'DdPlan/add', '新增预报计划', 1, 1, '', 125, 0, '2017-06-16 14:03:21'),
(125, 'DdPlan', '拆箱预报管理', 1, 1, '', 50, 0, '2017-06-19 10:39:05'),
(130, 'DdPlanCargo', '拆箱预报配货管理', 1, 1, '', 50, 0, '2017-06-19 11:05:57'),
(131, 'DdPlanCargo/add', '新增拆箱预报配货', 1, 1, '', 130, 0, '2017-06-19 11:06:53'),
(132, 'DdPlanCargo/edit', '编辑拆箱预报配货', 1, 1, '', 130, 0, '2017-06-19 16:06:47'),
(133, 'DdPlanCargo/del', '删除拆箱预报配货', 1, 1, '', 130, 0, '2017-06-19 16:33:06'),
(134, 'DdPlanContainer', '拆箱预报配箱管理', 1, 1, '', 50, 0, '2017-06-19 16:49:43'),
(135, 'DdPlanContainer/add', '新增拆箱预报配箱', 1, 1, '', 134, 0, '2017-06-19 16:50:01'),
(136, 'DdPlanContainer/edit', '编辑拆箱预报配箱', 1, 1, '', 134, 0, '2017-06-19 16:50:19'),
(137, 'DdPlanContainer/del', '删除拆箱预报配箱', 1, 1, '', 134, 0, '2017-06-19 16:50:34');

-- --------------------------------------------------------

--
-- 表的结构 `tally_user_group`
--

CREATE TABLE IF NOT EXISTS `tally_user_group` (
  `id` int(11) NOT NULL,
  `title` varchar(20) DEFAULT NULL,
  `rules` varchar(1000) DEFAULT NULL,
  `status` int(11) DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tally_user_group`
--

INSERT INTO `tally_user_group` (`id`, `title`, `rules`, `status`) VALUES
(11, '理货员', '1,2,3,4,5,6,24,37,38,39,40,41,42,43,44,45,46,47,49,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,51,52,94,95,66,67,97', 1),
(12, '理货长', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,109,114,115,37,38,39,40,41,42,43,44,45,46,47,49,112,113,121,122,123,68,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,50,51,52,90,91,92,93,94,95,116,117,125,69,70,124,130,131,132,133,134,135,136,137,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,118,119,86,87,88,89,96,97,98,99,104,105,106,107', 1),
(13, '部门长', '2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,108,109,114,115,37,38,39,40,41,42,43,44,45,46,47,49,112,113,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,50,51,52,90,91,92,93,94,95,116,117,53,54,55,56,57,120,58,59,60,61,62,63,64,65,66,67,118,119,86,87,88,89,96,97,98,99,100,101,102,103,104,105,106,107', 1),
(14, '业务员', NULL, 1),
(15, '费收员', NULL, 1),
(16, '业务部', NULL, 1),
(17, '公司领导', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,49,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,50,51,52,90,91,92,93,94,95,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,86,87,88,89,96,97,98,99,100,101,102,103,104,105,106,107', 1);

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
  MODIFY `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'auto_increment',AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `tally_admin_group`
--
ALTER TABLE `tally_admin_group`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tally_amend`
--
ALTER TABLE `tally_amend`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `tally_auth_rule`
--
ALTER TABLE `tally_auth_rule`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=83;
--
-- AUTO_INCREMENT for table `tally_cargo_agent`
--
ALTER TABLE `tally_cargo_agent`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `tally_cfs_cargo_damage_img`
--
ALTER TABLE `tally_cfs_cargo_damage_img`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `tally_cfs_ctn_empty_img`
--
ALTER TABLE `tally_cfs_ctn_empty_img`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '空箱id',AUTO_INCREMENT=108;
--
-- AUTO_INCREMENT for table `tally_cfs_ctn_overweight_reviewed`
--
ALTER TABLE `tally_cfs_ctn_overweight_reviewed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tally_cfs_instruction`
--
ALTER TABLE `tally_cfs_instruction`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `tally_cfs_instruction_cargo`
--
ALTER TABLE `tally_cfs_instruction_cargo`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `tally_cfs_instruction_ctn`
--
ALTER TABLE `tally_cfs_instruction_ctn`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT for table `tally_cfs_level_cargo_img`
--
ALTER TABLE `tally_cfs_level_cargo_img`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',AUTO_INCREMENT=78;
--
-- AUTO_INCREMENT for table `tally_cfs_operation`
--
ALTER TABLE `tally_cfs_operation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '作业id',AUTO_INCREMENT=178;
--
-- AUTO_INCREMENT for table `tally_cfs_operation_level`
--
ALTER TABLE `tally_cfs_operation_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=95;
--
-- AUTO_INCREMENT for table `tally_cfs_prove`
--
ALTER TABLE `tally_cfs_prove`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `tally_cfs_supplement_picture`
--
ALTER TABLE `tally_cfs_supplement_picture`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tally_container`
--
ALTER TABLE `tally_container`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '箱ID',AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tally_container_master`
--
ALTER TABLE `tally_container_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '箱主ID',AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `tally_customer`
--
ALTER TABLE `tally_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '客户ID',AUTO_INCREMENT=1684;
--
-- AUTO_INCREMENT for table `tally_dd_cargo_damage_img`
--
ALTER TABLE `tally_dd_cargo_damage_img`
  MODIFY `id` int(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=56;
--
-- AUTO_INCREMENT for table `tally_dd_ctn_damage_after_img`
--
ALTER TABLE `tally_dd_ctn_damage_after_img`
  MODIFY `id` int(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `tally_dd_ctn_damage_img`
--
ALTER TABLE `tally_dd_ctn_damage_img`
  MODIFY `id` int(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=73;
--
-- AUTO_INCREMENT for table `tally_dd_instruction`
--
ALTER TABLE `tally_dd_instruction`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `tally_dd_level_cargo_img`
--
ALTER TABLE `tally_dd_level_cargo_img`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT for table `tally_dd_operation`
--
ALTER TABLE `tally_dd_operation`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1089;
--
-- AUTO_INCREMENT for table `tally_dd_operation_level`
--
ALTER TABLE `tally_dd_operation_level`
  MODIFY `id` int(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=906;
--
-- AUTO_INCREMENT for table `tally_dd_plan`
--
ALTER TABLE `tally_dd_plan`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT for table `tally_dd_plan_cargo`
--
ALTER TABLE `tally_dd_plan_cargo`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `tally_dd_plan_container`
--
ALTER TABLE `tally_dd_plan_container`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',AUTO_INCREMENT=69;
--
-- AUTO_INCREMENT for table `tally_dd_prove`
--
ALTER TABLE `tally_dd_prove`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `tally_dd_supplement_picture`
--
ALTER TABLE `tally_dd_supplement_picture`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tally_department`
--
ALTER TABLE `tally_department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门ID',AUTO_INCREMENT=56;
--
-- AUTO_INCREMENT for table `tally_dispatch`
--
ALTER TABLE `tally_dispatch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=212;
--
-- AUTO_INCREMENT for table `tally_dispatch_detail`
--
ALTER TABLE `tally_dispatch_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=546;
--
-- AUTO_INCREMENT for table `tally_laborteam`
--
ALTER TABLE `tally_laborteam`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tally_location`
--
ALTER TABLE `tally_location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '作业地点ID',AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `tally_port`
--
ALTER TABLE `tally_port`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tally_qbzx_ctn_overweight_reviewed`
--
ALTER TABLE `tally_qbzx_ctn_overweight_reviewed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tally_qbzx_empty_ctn_img`
--
ALTER TABLE `tally_qbzx_empty_ctn_img`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '空箱照片ID',AUTO_INCREMENT=272;
--
-- AUTO_INCREMENT for table `tally_qbzx_instruction`
--
ALTER TABLE `tally_qbzx_instruction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '指令ID',AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `tally_qbzx_instruction_ctn`
--
ALTER TABLE `tally_qbzx_instruction_ctn`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',AUTO_INCREMENT=110;
--
-- AUTO_INCREMENT for table `tally_qbzx_level_cargo_img`
--
ALTER TABLE `tally_qbzx_level_cargo_img`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',AUTO_INCREMENT=232;
--
-- AUTO_INCREMENT for table `tally_qbzx_level_damage_img`
--
ALTER TABLE `tally_qbzx_level_damage_img`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `tally_qbzx_operation`
--
ALTER TABLE `tally_qbzx_operation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '作业ID',AUTO_INCREMENT=633;
--
-- AUTO_INCREMENT for table `tally_qbzx_operation_level`
--
ALTER TABLE `tally_qbzx_operation_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '关ID',AUTO_INCREMENT=442;
--
-- AUTO_INCREMENT for table `tally_qbzx_plan`
--
ALTER TABLE `tally_qbzx_plan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '预报计划ID',AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `tally_qbzx_plan_cargo`
--
ALTER TABLE `tally_qbzx_plan_cargo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '货物ID',AUTO_INCREMENT=64;
--
-- AUTO_INCREMENT for table `tally_qbzx_plan_ctn`
--
ALTER TABLE `tally_qbzx_plan_ctn`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '箱ID',AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tally_qbzx_prove`
--
ALTER TABLE `tally_qbzx_prove`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT for table `tally_qbzx_supplement_picture`
--
ALTER TABLE `tally_qbzx_supplement_picture`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tally_rate`
--
ALTER TABLE `tally_rate`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tally_rate_detail`
--
ALTER TABLE `tally_rate_detail`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `tally_replace_clerk_record`
--
ALTER TABLE `tally_replace_clerk_record`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tally_replace_tallymaster_record`
--
ALTER TABLE `tally_replace_tallymaster_record`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tally_shift_amendment_record`
--
ALTER TABLE `tally_shift_amendment_record`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tally_shift_detail`
--
ALTER TABLE `tally_shift_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `tally_ship`
--
ALTER TABLE `tally_ship`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '船舶ID',AUTO_INCREMENT=1766;
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
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `tally_user_auth_rule`
--
ALTER TABLE `tally_user_auth_rule`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=138;
--
-- AUTO_INCREMENT for table `tally_user_group`
--
ALTER TABLE `tally_user_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
