# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.12)
# Database: yjys
# Generation Time: 2016-08-13 13:42:59 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table audit_device
# ------------------------------------------------------------

DROP TABLE IF EXISTS `audit_device`;

CREATE TABLE `audit_device` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL COMMENT '操作类型，新增、删除、修改',
  `datetime` datetime DEFAULT NULL COMMENT '生成时间',
  `user_id` int(11) unsigned DEFAULT NULL COMMENT '操作人',
  `ip_address` varchar(45) DEFAULT NULL COMMENT 'IP地址',
  `browser` varchar(45) DEFAULT NULL COMMENT '浏览器信息',
  `os` varchar(45) DEFAULT NULL COMMENT '操作系统信息',
  `content` text COMMENT '审计内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `audit_device` WRITE;
/*!40000 ALTER TABLE `audit_device` DISABLE KEYS */;

INSERT INTO `audit_device` (`id`, `type`, `datetime`, `user_id`, `ip_address`, `browser`, `os`, `content`)
VALUES
  (3,'update','2016-08-09 00:00:00',1001,'3.3.3.3','FireFox','Windows 10','salfjlsadjflasjd;lfjasldjf;ljsad;lf'),
  (19,'新增','2016-08-08 15:23:26',1001,'10.200.230.1','Chrome','Windows 7','设备名称:设备名称1,序列号:序列号1'),
  (20,'新增','2016-08-08 15:30:06',1001,'10.200.230.1','Chrome','Windows 7','设备名称:设备名称2,序列号:序列号2'),
  (21,'删除','2016-08-08 15:43:49',1001,'10.200.230.1','Chrome','Windows 7','设备名称:设备名称1,序列号:序列号1;'),
  (22,'删除','2016-08-08 15:45:13',1001,'10.200.230.1','Chrome','Windows 7','设备名称:设备名称2,序列号:序列号2;'),
  (23,'删除','2016-08-08 15:46:29',1001,'10.200.230.1','Chrome','Windows 7','设备名称:设备名称-test,序列号:序列号-test;'),
  (24,'新增','2016-08-08 15:48:40',1001,'10.200.230.1','Chrome','Windows 7','设备名称:设备名称2,序列号:序列号2'),
  (25,'删除','2016-08-08 15:49:24',1001,'10.200.230.1','Chrome','Windows 7','设备名称:设备名称2,序列号:序列号2;'),
  (26,'新增','2016-08-08 16:57:37',1001,'10.200.230.1','Chrome','Windows 7','设备名称:,序列号:'),
  (27,'删除','2016-08-08 16:57:45',1001,'10.200.230.1','Chrome','Windows 7','设备名称:,序列号:;'),
  (28,'新增','2016-08-08 16:59:46',1001,'10.200.230.1','Chrome','Windows 7','设备名称:设备名称1,序列号:序列号1'),
  (29,'新增','2016-08-08 17:00:02',1001,'10.200.230.1','Chrome','Windows 7','设备名称:,序列号:'),
  (30,'删除','2016-08-08 17:00:14',1001,'10.200.230.1','Chrome','Windows 7','设备名称:,序列号:;'),
  (31,'新增','2016-08-09 08:01:06',1001,'0.0.0.0','safari','macOS','test设备名称:ESXi主机1、ESXi主机2; 设备序列号:ABCDEFG、HIJKLMN'),
  (32,'更新','2016-08-09 08:01:08',1001,'10.200.230.2','Chrome','Windows 7','设备名称:设备名称-test-update,序列号:序列号-test-update'),
  (33,'删除','2016-08-09 08:01:08',1001,'10.200.230.3','Chrome','Windows 7','设备名称:设备名称-test-update,序列号:序列号-test-update;'),
  (34,'新增','2016-08-09 08:01:08',1001,'10.200.230.1','Chrome','Windows 7','设备名称:设备名称-test,序列号:序列号-test'),
  (35,'新增','2016-08-09 08:01:23',1001,'0.0.0.0','safari','macOS','test设备名称:ESXi主机1、ESXi主机2; 设备序列号:ABCDEFG、HIJKLMN'),
  (36,'更新','2016-08-09 08:01:26',1001,'10.200.230.2','Chrome','Windows 7','设备名称:设备名称-test-update,序列号:序列号-test-update'),
  (37,'删除','2016-08-09 08:01:26',1001,'10.200.230.3','Chrome','Windows 7','设备名称:设备名称-test-update,序列号:序列号-test-update;'),
  (38,'新增','2016-08-09 08:01:26',1001,'10.200.230.1','Chrome','Windows 7','设备名称:设备名称-test,序列号:序列号-test'),
  (39,'新增','2016-08-09 08:10:45',1001,'0.0.0.0','safari','macOS','test设备名称:ESXi主机1、ESXi主机2; 设备序列号:ABCDEFG、HIJKLMN'),
  (40,'更新','2016-08-09 08:10:46',1001,'10.200.230.2','Chrome','Windows 7','设备名称:设备名称-test-update,序列号:序列号-test-update'),
  (41,'删除','2016-08-09 08:10:46',1001,'10.200.230.3','Chrome','Windows 7','设备名称:设备名称-test-update,序列号:序列号-test-update;'),
  (42,'新增','2016-08-09 08:10:46',1001,'10.200.230.1','Chrome','Windows 7','设备名称:设备名称-test,序列号:序列号-test'),
  (43,'更新','2016-08-09 08:11:55',1001,'10.200.230.2','Chrome','Windows 7','设备名称:设备名称-test-update,序列号:序列号-test-update'),
  (44,'删除','2016-08-09 08:11:55',1001,'10.200.230.3','Chrome','Windows 7','设备名称:设备名称-test-update,序列号:序列号-test-update;'),
  (45,'新增','2016-08-09 08:11:55',1001,'10.200.230.1','Chrome','Windows 7','设备名称:设备名称-test,序列号:序列号-test'),
  (46,'更新','2016-08-09 08:14:55',1001,'10.200.230.2','Chrome','Windows 7','设备名称:设备名称-test-update,序列号:序列号-test-update'),
  (47,'删除','2016-08-09 08:14:55',1001,'10.200.230.3','Chrome','Windows 7','设备名称:设备名称-test-update,序列号:序列号-test-update;'),
  (48,'新增','2016-08-09 08:14:55',1001,'10.200.230.1','Chrome','Windows 7','设备名称:设备名称-test,序列号:序列号-test'),
  (49,'更新','2016-08-09 08:19:58',1001,'10.200.230.2','Chrome','Windows 7','设备名称:设备名称-test-update,序列号:序列号-test-update'),
  (50,'删除','2016-08-09 08:19:58',1001,'10.200.230.3','Chrome','Windows 7','设备名称:设备名称-test-update,序列号:序列号-test-update;'),
  (51,'新增','2016-08-09 08:19:58',1001,'10.200.230.1','Chrome','Windows 7','设备名称:设备名称-test,序列号:序列号-test'),
  (52,'更新','2016-08-09 08:20:56',1001,'10.200.230.2','Chrome','Windows 7','设备名称:设备名称-test-update,序列号:序列号-test-update'),
  (53,'删除','2016-08-09 08:20:56',1001,'10.200.230.3','Chrome','Windows 7','设备名称:设备名称-test-update,序列号:序列号-test-update;'),
  (54,'新增','2016-08-09 08:20:56',1001,'10.200.230.1','Chrome','Windows 7','设备名称:设备名称-test,序列号:序列号-test'),
  (55,'更新','2016-08-09 08:22:21',1001,'10.200.230.2','Chrome','Windows 7','设备名称:设备名称-test-update,序列号:序列号-test-update'),
  (56,'删除','2016-08-09 08:22:21',1001,'10.200.230.3','Chrome','Windows 7','设备名称:设备名称-test-update,序列号:序列号-test-update;'),
  (57,'新增','2016-08-09 08:22:21',1001,'10.200.230.1','Chrome','Windows 7','设备名称:设备名称-test,序列号:序列号-test'),
  (58,'更新','2016-08-09 08:22:56',1001,'10.200.230.2','Chrome','Windows 7','设备名称:设备名称-test-update,序列号:序列号-test-update'),
  (59,'删除','2016-08-09 08:22:56',1001,'10.200.230.3','Chrome','Windows 7','设备名称:设备名称-test-update,序列号:序列号-test-update;'),
  (60,'新增','2016-08-09 08:22:56',1001,'10.200.230.1','Chrome','Windows 7','设备名称:设备名称-test,序列号:序列号-test'),
  (61,'更新','2016-08-09 10:32:49',1001,'10.200.230.2','Chrome','Windows 7','设备名称:设备名称-test-update,序列号:序列号-test-update'),
  (62,'删除','2016-08-09 10:32:49',1001,'10.200.230.3','Chrome','Windows 7','设备名称:设备名称-test-update,序列号:序列号-test-update;'),
  (63,'新增','2016-08-09 10:32:49',1001,'10.200.230.1','Chrome','Windows 7','设备名称:设备名称-test,序列号:序列号-test'),
  (64,'更新','2016-08-09 11:00:31',1001,'10.200.230.2','Chrome','Windows 7','设备名称:设备名称-test-update,序列号:序列号-test-update'),
  (65,'删除','2016-08-09 11:00:31',1001,'10.200.230.3','Chrome','Windows 7','设备名称:设备名称-test-update,序列号:序列号-test-update;'),
  (66,'新增','2016-08-09 11:00:31',1001,'10.200.230.1','Chrome','Windows 7','设备名称:设备名称-test,序列号:序列号-test'),
  (67,'更新','2016-08-09 15:43:49',1001,'10.200.230.2','Chrome','Windows 7','设备名称:设备名称-test-update,序列号:序列号-test-update'),
  (68,'删除','2016-08-09 15:43:49',1001,'10.200.230.3','Chrome','Windows 7','设备名称:设备名称-test-update,序列号:序列号-test-update;'),
  (69,'新增','2016-08-09 15:43:49',1001,'10.200.230.1','Chrome','Windows 7','设备名称:设备名称-test,序列号:序列号-test'),
  (70,'更新','2016-08-09 16:50:35',1001,'10.200.230.2','Chrome','Windows 7','设备名称:设备名称-test-update,序列号:序列号-test-update'),
  (71,'删除','2016-08-09 16:50:35',1001,'10.200.230.3','Chrome','Windows 7','设备名称:设备名称-test-update,序列号:序列号-test-update;'),
  (72,'新增','2016-08-09 16:50:35',1001,'10.200.230.1','Chrome','Windows 7','设备名称:设备名称-test,序列号:序列号-test');

/*!40000 ALTER TABLE `audit_device` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table auth_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户组';



# Dump of table auth_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) unsigned NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `login_name` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `last_login_datetime` datetime DEFAULT NULL,
  `last_ip_address` varchar(45) DEFAULT NULL,
  `last_browser` varchar(45) DEFAULT NULL,
  `last_os` varchar(45) DEFAULT NULL,
  `employee_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;

INSERT INTO `auth_user` (`id`, `name`, `login_name`, `password`, `last_login_datetime`, `last_ip_address`, `last_browser`, `last_os`, `employee_id`)
VALUES
  (1001,'root','root','123456','2016-08-09 16:50:33','10.200.230.93','safari','macOS',NULL);

/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table auth_user_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user_group`;

CREATE TABLE `auth_user_group` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table basedata_cabinet
# ------------------------------------------------------------

DROP TABLE IF EXISTS `basedata_cabinet`;

CREATE TABLE `basedata_cabinet` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL COMMENT '机柜名称，例：22AA、13AB',
  `type` varchar(45) DEFAULT NULL COMMENT '机柜类型，例如：服务器机柜、网络机柜、控制台机柜、存储机柜等',
  `room_id` int(11) unsigned DEFAULT NULL COMMENT '机柜所在房间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机柜';

LOCK TABLES `basedata_cabinet` WRITE;
/*!40000 ALTER TABLE `basedata_cabinet` DISABLE KEYS */;

INSERT INTO `basedata_cabinet` (`id`, `name`, `type`, `room_id`)
VALUES
  (1001,'12AA','服务器机柜',1001),
  (1002,'12AB','服务器机柜',1001),
  (1003,'12AC','服务器机柜',1001),
  (1004,'12AD','服务器机柜',1001),
  (1005,'12AE','服务器机柜',1001),
  (1006,'12AF','服务器机柜',1001),
  (1007,'12AG','服务器机柜',1001),
  (1008,'12AH','服务器机柜',1001),
  (1009,'12AI','服务器机柜',1001),
  (1010,'12BA','服务器机柜',1001),
  (1011,'12BB','服务器机柜',1001),
  (1012,'12BC','服务器机柜',1001),
  (1013,'12BD','服务器机柜',1001),
  (1014,'12BE','服务器机柜',1001),
  (1015,'12BF','服务器机柜',1001),
  (1016,'12BG','服务器机柜',1001),
  (1017,'12BH','服务器机柜',1001),
  (1018,'12CA','服务器机柜',1001),
  (1019,'12CB','服务器机柜',1001),
  (1020,'12CC','服务器机柜',1001),
  (1021,'12CD','服务器机柜',1001),
  (1022,'12CE','服务器机柜',1001),
  (1023,'12CF','服务器机柜',1001),
  (1024,'12CG','服务器机柜',1001),
  (1025,'12CH','服务器机柜',1001),
  (1026,'13AA','服务器机柜',1002),
  (1027,'13AB','服务器机柜',1002),
  (1028,'13AC','服务器机柜',1002),
  (1029,'13AD','服务器机柜',1002),
  (1030,'13AE','服务器机柜',1002),
  (1031,'13AF','服务器机柜',1002),
  (1032,'13AG','服务器机柜',1002),
  (1033,'13AH','服务器机柜',1002),
  (1034,'13BA','服务器机柜',1002),
  (1035,'13BB','服务器机柜',1002),
  (1036,'13BC','服务器机柜',1002),
  (1037,'13BD','服务器机柜',1002),
  (1038,'13BE','服务器机柜',1002),
  (1039,'13BF','服务器机柜',1002),
  (1040,'13BG','服务器机柜',1002),
  (1041,'13BH','服务器机柜',1002),
  (1042,'13CA','服务器机柜',1002),
  (1043,'13CB','服务器机柜',1002),
  (1044,'13CC','服务器机柜',1002),
  (1045,'13CD','服务器机柜',1002),
  (1046,'13CE','服务器机柜',1002),
  (1047,'13CF','服务器机柜',1002),
  (1048,'13CG','服务器机柜',1002),
  (1049,'13CH','服务器机柜',1002),
  (1050,'21AA','服务器机柜',1003),
  (1051,'21AB','服务器机柜',1003),
  (1052,'21AC','服务器机柜',1003),
  (1053,'21AD','服务器机柜',1003),
  (1054,'21AE','服务器机柜',1003),
  (1055,'21AF','服务器机柜',1003),
  (1056,'21AG','服务器机柜',1003),
  (1057,'21AH','服务器机柜',1003),
  (1058,'21AI','服务器机柜',1003),
  (1059,'21AJ','服务器机柜',1003),
  (1060,'21AK','服务器机柜',1003),
  (1061,'21AL','服务器机柜',1003),
  (1062,'21AM','服务器机柜',1003),
  (1063,'21BA','服务器机柜',1003),
  (1064,'21BB','服务器机柜',1003),
  (1065,'21BC','服务器机柜',1003),
  (1066,'21BD','服务器机柜',1003),
  (1067,'21BE','服务器机柜',1003),
  (1068,'21BF','服务器机柜',1003),
  (1069,'21BG','服务器机柜',1003),
  (1070,'21BH','服务器机柜',1003),
  (1071,'21BI','服务器机柜',1003),
  (1072,'21BJ','服务器机柜',1003),
  (1073,'21BK','服务器机柜',1003),
  (1074,'21BL','服务器机柜',1003),
  (1075,'21BM','服务器机柜',1003),
  (1076,'21BN','服务器机柜',1003),
  (1077,'21BO','服务器机柜',1003),
  (1078,'21BP','服务器机柜',1003),
  (1079,'21CA','服务器机柜',1003),
  (1080,'21CB','服务器机柜',1003),
  (1081,'21CC','服务器机柜',1003),
  (1082,'21CD','服务器机柜',1003),
  (1083,'21CE','服务器机柜',1003),
  (1084,'21CF','服务器机柜',1003),
  (1085,'21CG','服务器机柜',1003),
  (1086,'21CH','服务器机柜',1003),
  (1087,'21CI','服务器机柜',1003),
  (1088,'21CJ','服务器机柜',1003),
  (1089,'21CK','服务器机柜',1003),
  (1090,'21CL','服务器机柜',1003),
  (1091,'21CM','服务器机柜',1003),
  (1092,'21CN','服务器机柜',1003),
  (1093,'21DA','服务器机柜',1003),
  (1094,'21DB','服务器机柜',1003),
  (1095,'21DC','服务器机柜',1003),
  (1096,'21DD','服务器机柜',1003),
  (1097,'21DE','服务器机柜',1003),
  (1098,'21DF','服务器机柜',1003),
  (1099,'21DG','服务器机柜',1003),
  (1100,'21DH','服务器机柜',1003),
  (1101,'21DI','服务器机柜',1003),
  (1102,'21DJ','服务器机柜',1003),
  (1103,'21DK','服务器机柜',1003),
  (1104,'21DL','服务器机柜',1003),
  (1105,'21DM','服务器机柜',1003),
  (1106,'21DN','服务器机柜',1003),
  (1107,'21DO','服务器机柜',1003),
  (1108,'21DP','服务器机柜',1003),
  (1109,'21EA','服务器机柜',1003),
  (1110,'21EB','服务器机柜',1003),
  (1111,'21EC','服务器机柜',1003),
  (1112,'21ED','服务器机柜',1003),
  (1113,'21EE','服务器机柜',1003),
  (1114,'21EF','服务器机柜',1003),
  (1115,'21EG','服务器机柜',1003),
  (1116,'21EH','服务器机柜',1003),
  (1117,'21EI','服务器机柜',1003),
  (1118,'21EJ','服务器机柜',1003),
  (1119,'21EK','服务器机柜',1003),
  (1120,'21EL','服务器机柜',1003),
  (1121,'21EM','服务器机柜',1003),
  (1122,'21EN','服务器机柜',1003),
  (1123,'21EO','服务器机柜',1003),
  (1124,'21EP','服务器机柜',1003),
  (1125,'21FG','服务器机柜',1003),
  (1126,'21FH','服务器机柜',1003),
  (1127,'21GF','服务器机柜',1003),
  (1128,'21GG','服务器机柜',1003),
  (1129,'21GH','服务器机柜',1003),
  (1130,'21GI','服务器机柜',1003),
  (1131,'21HF','服务器机柜',1003),
  (1132,'21HG','服务器机柜',1003),
  (1133,'21HH','服务器机柜',1003),
  (1134,'21HI','服务器机柜',1003),
  (1135,'22AA','服务器机柜',1004),
  (1136,'22AB','服务器机柜',1004),
  (1137,'22AC','服务器机柜',1004),
  (1138,'22AD','服务器机柜',1004),
  (1139,'22AE','服务器机柜',1004),
  (1140,'22AF','服务器机柜',1004),
  (1141,'22AG','服务器机柜',1004),
  (1142,'22AH','服务器机柜',1004),
  (1143,'22AI','服务器机柜',1004),
  (1144,'22AJ','服务器机柜',1004),
  (1145,'22AK','服务器机柜',1004),
  (1146,'22AL','服务器机柜',1004),
  (1147,'22BA','服务器机柜',1004),
  (1148,'22BB','服务器机柜',1004),
  (1149,'22BC','服务器机柜',1004),
  (1150,'22BD','服务器机柜',1004),
  (1151,'22BE','服务器机柜',1004),
  (1152,'22BF','服务器机柜',1004),
  (1153,'22BG','服务器机柜',1004),
  (1154,'22BH','服务器机柜',1004),
  (1155,'22BI','服务器机柜',1004),
  (1156,'22BJ','服务器机柜',1004),
  (1157,'22BK','服务器机柜',1004),
  (1158,'22BL','服务器机柜',1004),
  (1159,'22BM','服务器机柜',1004),
  (1160,'22BN','服务器机柜',1004),
  (1161,'22BO','服务器机柜',1004),
  (1162,'22BP','服务器机柜',1004),
  (1163,'22CA','服务器机柜',1004),
  (1164,'22CB','服务器机柜',1004),
  (1165,'22CC','服务器机柜',1004),
  (1166,'22CD','服务器机柜',1004),
  (1167,'22CE','服务器机柜',1004),
  (1168,'22CF','服务器机柜',1004),
  (1169,'22CG','服务器机柜',1004),
  (1170,'22CH','服务器机柜',1004),
  (1171,'22CI','服务器机柜',1004),
  (1172,'22CJ','服务器机柜',1004),
  (1173,'22CK','服务器机柜',1004),
  (1174,'22CL','服务器机柜',1004),
  (1175,'22CM','服务器机柜',1004),
  (1176,'22CN','服务器机柜',1004),
  (1177,'22DA','服务器机柜',1004),
  (1178,'22DB','服务器机柜',1004),
  (1179,'22DC','服务器机柜',1004),
  (1180,'22DD','服务器机柜',1004),
  (1181,'22DE','服务器机柜',1004),
  (1182,'22DF','服务器机柜',1004),
  (1183,'22DG','服务器机柜',1004),
  (1184,'22DH','服务器机柜',1004),
  (1185,'22DI','服务器机柜',1004),
  (1186,'22DJ','服务器机柜',1004),
  (1187,'22DK','服务器机柜',1004),
  (1188,'22DL','服务器机柜',1004),
  (1189,'22DM','服务器机柜',1004),
  (1190,'22DN','服务器机柜',1004),
  (1191,'22DO','服务器机柜',1004),
  (1192,'22DP','服务器机柜',1004);

/*!40000 ALTER TABLE `basedata_cabinet` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table basedata_department
# ------------------------------------------------------------

DROP TABLE IF EXISTS `basedata_department`;

CREATE TABLE `basedata_department` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL COMMENT '部门名称',
  `name_abbr` varchar(45) DEFAULT NULL COMMENT '部门简称',
  `code` varchar(45) DEFAULT NULL COMMENT '部门编码',
  `parent_id` int(11) DEFAULT '0' COMMENT '父部门ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `basedata_department` WRITE;
/*!40000 ALTER TABLE `basedata_department` DISABLE KEYS */;

INSERT INTO `basedata_department` (`id`, `name`, `name_abbr`, `code`, `parent_id`)
VALUES
  (1001,'国家电网公司西安信息灾备中心','西安灾备','XAZB',0),
  (1002,'运检一室','运检一室','YJYS',1001),
  (1003,'运检二室','运检二室','YJES',1001);

/*!40000 ALTER TABLE `basedata_department` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table basedata_device_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `basedata_device_type`;

CREATE TABLE `basedata_device_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '设备类型标识',
  `name` varchar(45) DEFAULT NULL COMMENT '设备类型名称',
  `name_abbr` varchar(45) DEFAULT NULL COMMENT '设备类型名称简写',
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上级ID，如果为0则为根级别',
  `order_number` int(11) unsigned DEFAULT '999999' COMMENT '排序编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备类型';

LOCK TABLES `basedata_device_type` WRITE;
/*!40000 ALTER TABLE `basedata_device_type` DISABLE KEYS */;

INSERT INTO `basedata_device_type` (`id`, `name`, `name_abbr`, `parent_id`, `order_number`)
VALUES
  (1001,'服务器设备','服务器',0,1),
  (1002,'存储设备','存储',0,2),
  (1003,'网络设备','网络',0,3),
  (1004,'安全设备','安全',0,4),
  (1005,'音视频设备','音视频',0,5),
  (1006,'其他设备','其他',0,6);

/*!40000 ALTER TABLE `basedata_device_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table basedata_employee
# ------------------------------------------------------------

DROP TABLE IF EXISTS `basedata_employee`;

CREATE TABLE `basedata_employee` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL COMMENT '员工姓名',
  `code` varchar(45) DEFAULT NULL COMMENT '员工编号',
  `department_id` int(11) DEFAULT NULL COMMENT '所在部门ID',
  `phone` varchar(45) DEFAULT NULL COMMENT '办公电话',
  `cellphone` varchar(45) DEFAULT NULL COMMENT '个人手机',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `basedata_employee` WRITE;
/*!40000 ALTER TABLE `basedata_employee` DISABLE KEYS */;

INSERT INTO `basedata_employee` (`id`, `name`, `code`, `department_id`, `phone`, `cellphone`)
VALUES
  (1001,'肖莎',NULL,1002,NULL,NULL),
  (1002,'王磊',NULL,1002,NULL,NULL),
  (1003,'雷大洋',NULL,1002,NULL,NULL),
  (1004,'李丽莉',NULL,1002,NULL,NULL);

/*!40000 ALTER TABLE `basedata_employee` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table basedata_room
# ------------------------------------------------------------

DROP TABLE IF EXISTS `basedata_room`;

CREATE TABLE `basedata_room` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL COMMENT '房间名称',
  `number` varchar(45) DEFAULT NULL COMMENT '房间号',
  `place` varchar(45) DEFAULT NULL COMMENT '房间位置，描述房间所在位置：灾备主楼三楼；临建楼二楼',
  `type` varchar(45) DEFAULT NULL COMMENT '房间类型，例如：网络机房、数据机房、电商机房、暗室、弱电间、竖井、办公室、库房等',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机房/ 房间';

LOCK TABLES `basedata_room` WRITE;
/*!40000 ALTER TABLE `basedata_room` DISABLE KEYS */;

INSERT INTO `basedata_room` (`id`, `name`, `number`, `place`, `type`)
VALUES
  (1001,'12机房','12','灾备大楼一楼','网络机房'),
  (1002,'13机房','13','灾备大楼一楼','网络机房'),
  (1003,'21机房','21','灾备大楼二楼','信息机房'),
  (1004,'22机房','22','灾备大楼二楼','信息机房');

/*!40000 ALTER TABLE `basedata_room` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table device_multimedia
# ------------------------------------------------------------

DROP TABLE IF EXISTS `device_multimedia`;

CREATE TABLE `device_multimedia` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL COMMENT '设备名称',
  `device_type_id` int(11) unsigned DEFAULT NULL COMMENT '设备类型',
  `code` varchar(45) DEFAULT NULL COMMENT '设备编号',
  `code_sgcc` varchar(45) DEFAULT NULL COMMENT '国网编号',
  `room_id` int(10) unsigned DEFAULT NULL COMMENT '所在房间',
  `cabinet_id` int(10) unsigned DEFAULT NULL COMMENT '所在机柜',
  `cabinet_position` varchar(45) DEFAULT NULL COMMENT '机柜位置，例如：4U-7U、全柜',
  `manufacturer` varchar(45) DEFAULT NULL COMMENT '制造商',
  `brand` varchar(45) DEFAULT NULL COMMENT '品牌',
  `series` varchar(45) DEFAULT NULL COMMENT '系列',
  `model` varchar(45) DEFAULT NULL COMMENT '型号',
  `status` varchar(45) DEFAULT NULL COMMENT '设备状态，例如：在运、停运、在建、未使用',
  `use` varchar(45) DEFAULT NULL COMMENT '用途',
  `use_date` date DEFAULT NULL COMMENT '投运日期，例：2015-01-01',
  `purchase_method` varchar(45) DEFAULT NULL COMMENT '采购方式',
  `serial_number` varchar(45) DEFAULT NULL COMMENT '序列号',
  `manufacture_date` date DEFAULT NULL COMMENT '出厂日期',
  `service_expiry_date` date DEFAULT NULL COMMENT '售后服务到期时间',
  `network` varchar(45) DEFAULT NULL COMMENT '所属网络',
  `ip_address` varchar(45) DEFAULT NULL COMMENT 'IP地址',
  `mgt_dept_id` int(11) unsigned DEFAULT NULL COMMENT '设备管理部门',
  `mgt_employee_id` int(11) unsigned DEFAULT NULL COMMENT '运维责任人',
  `mgt_phone` varchar(45) DEFAULT NULL COMMENT '运维联系电话',
  `maintenance_supplier` varchar(45) DEFAULT '' COMMENT '维保厂商',
  `maintenance_date_start` date DEFAULT NULL COMMENT '维保开始日期',
  `maintenance_date_end` date DEFAULT NULL COMMENT '维保结束日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='多媒体设备';

LOCK TABLES `device_multimedia` WRITE;
/*!40000 ALTER TABLE `device_multimedia` DISABLE KEYS */;

INSERT INTO `device_multimedia` (`id`, `name`, `device_type_id`, `code`, `code_sgcc`, `room_id`, `cabinet_id`, `cabinet_position`, `manufacturer`, `brand`, `series`, `model`, `status`, `use`, `use_date`, `purchase_method`, `serial_number`, `manufacture_date`, `service_expiry_date`, `network`, `ip_address`, `mgt_dept_id`, `mgt_employee_id`, `mgt_phone`, `maintenance_supplier`, `maintenance_date_start`, `maintenance_date_end`)
VALUES
  (1001,'中控主机',1005,'YSP-48',NULL,NULL,NULL,NULL,NULL,'SMARTISYS','','MC IPSC2',NULL,NULL,'2011-04-10',NULL,'F56456455',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'无',NULL,NULL),
  (1016,'设备名称2',1005,'设备编号2','国网编号2',1001,NULL,'1U-3U','制造商2','品牌2','系列2','型号2','设备状态2','设备用途2','2016-08-01','采购方式2','序列号2','2016-05-01','2017-05-01','所属网络2','10.10.10.2',1002,1002,'18812345678','运维厂商2','2016-01-01','2016-12-31'),
  (1019,'设备名称1',1005,'设备编号1','国网编号1',1003,1053,'3U-8U','制造商1','品牌1','系列1','型号1','设备状态1','设备用途1','2016-05-01','采购方式1','序列号1','2016-07-01','2017-07-01','所属网络1','10.10.10.1',1002,1002,'18812345678','运维厂商1','2016-01-01','2016-12-31'),
  (1046,'设备名称-test',1005,'设备编号-test','国网编号-test',1001,1001,'机柜位置1-40U-test','供应商-test','品牌-test','系列-test','型号-test','设备状态-test','用途-test','2016-08-09','采购方式-test','序列号-test','2016-08-09','2016-08-09','所属网络-test','IP地址-test',1002,1002,'联系电话-test','维保单位-test','2016-08-09','2016-08-09');

/*!40000 ALTER TABLE `device_multimedia` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table device_network
# ------------------------------------------------------------

DROP TABLE IF EXISTS `device_network`;

CREATE TABLE `device_network` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL COMMENT '设备名称',
  `device_type_id` int(11) unsigned DEFAULT NULL COMMENT '设备类型',
  `code` varchar(45) DEFAULT NULL COMMENT '设备编号',
  `code_sgcc` varchar(45) DEFAULT NULL COMMENT '国网编号',
  `room_id` int(11) unsigned DEFAULT NULL COMMENT '所在房间',
  `cabinet_id` int(11) unsigned DEFAULT NULL COMMENT '所在机柜',
  `cabinet_position` varchar(45) DEFAULT NULL COMMENT '机柜位置，例如：4U-7U、全柜',
  `manufacturer` varchar(45) DEFAULT NULL COMMENT '制造商',
  `brand` varchar(45) DEFAULT NULL COMMENT '品牌',
  `series` varchar(45) DEFAULT NULL COMMENT '系列',
  `model` varchar(45) DEFAULT NULL COMMENT '型号',
  `status` varchar(45) DEFAULT NULL COMMENT '设备状态，例如：在运、停运、在建、未使用',
  `use` varchar(45) DEFAULT NULL COMMENT '用途',
  `use_date` date DEFAULT NULL COMMENT '投运日期，例：2015-01-01',
  `purchase_method` varchar(45) DEFAULT NULL COMMENT '采购方式',
  `serial_number` varchar(45) DEFAULT NULL COMMENT '序列号',
  `manufacture_date` date DEFAULT NULL COMMENT '出厂日期',
  `service_expiry_date` date DEFAULT NULL COMMENT '售后服务到期时间',
  `network` varchar(45) DEFAULT NULL COMMENT '所属网络',
  `ip_address` varchar(45) DEFAULT NULL COMMENT 'IP地址',
  `mgt_dept_id` int(11) unsigned DEFAULT NULL COMMENT '设备管理部门，例：灾备一室',
  `mgt_employee_id` int(11) unsigned DEFAULT NULL COMMENT '运维责任人',
  `mgt_phone` varchar(45) DEFAULT NULL COMMENT '运维联系电话',
  `maintenance_supplier` varchar(45) DEFAULT NULL COMMENT '维保厂商',
  `maintenance_date_start` date DEFAULT NULL COMMENT '维保开始日期',
  `maintenance_date_end` date DEFAULT NULL COMMENT '维保结束日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='网络设备';

LOCK TABLES `device_network` WRITE;
/*!40000 ALTER TABLE `device_network` DISABLE KEYS */;

INSERT INTO `device_network` (`id`, `name`, `device_type_id`, `code`, `code_sgcc`, `room_id`, `cabinet_id`, `cabinet_position`, `manufacturer`, `brand`, `series`, `model`, `status`, `use`, `use_date`, `purchase_method`, `serial_number`, `manufacture_date`, `service_expiry_date`, `network`, `ip_address`, `mgt_dept_id`, `mgt_employee_id`, `mgt_phone`, `maintenance_supplier`, `maintenance_date_start`, `maintenance_date_end`)
VALUES
  (1001,'内网核心交换机1',1003,NULL,NULL,1001,1013,'3-24U','华三','H3C','S12508','H3C S12508','在运','内网核心交换机1','2010-12-30','国网集采','210231AOHHN133000265','2010-12-01','2013-12-31','12数据机房','10.200.51.22',1002,1002,'18066615812','北京宇电科技集团有限公司',NULL,NULL),
  (1002,'内网核心交换机2',1003,NULL,NULL,1001,1031,'2-24U','华三','H3C','S12508','H3C S12508','在运','内网核心交换机2','2010-12-30','国网集采','210231AOHHN133000258','2010-12-01','2013-12-31','13数据机房','10.200.51.22',1002,1002,'18066615812','北京宇电科技集团有限公司',NULL,NULL),
  (1015,'设备名称-test',1003,'设备编号-test','国网编号-test',1001,1001,'机柜位置1-40U-test','供应商-test','品牌-test','系列-test','型号-test','设备状态-test','用途-test','2016-08-09','采购方式-test','序列号-test','2016-08-09','2016-08-09','所属网络-test','IP地址-test',1002,1002,'联系电话-test','维保单位-test','2016-08-09','2016-08-09');

/*!40000 ALTER TABLE `device_network` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table device_other
# ------------------------------------------------------------

DROP TABLE IF EXISTS `device_other`;

CREATE TABLE `device_other` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL COMMENT '设备名称',
  `device_type_id` int(11) unsigned DEFAULT NULL COMMENT '设备类型',
  `code` varchar(45) DEFAULT NULL COMMENT '设备编号',
  `code_sgcc` varchar(45) DEFAULT NULL COMMENT '国网编号',
  `room_id` int(11) unsigned DEFAULT NULL COMMENT '所在房间',
  `cabinet_id` int(11) unsigned DEFAULT NULL COMMENT '所在机柜',
  `cabinet_position` varchar(45) DEFAULT NULL COMMENT '机柜位置，例如：4U-7U、全柜',
  `manufacturer` varchar(45) DEFAULT NULL COMMENT '制造商',
  `brand` varchar(45) DEFAULT NULL COMMENT '品牌',
  `series` varchar(45) DEFAULT NULL COMMENT '系列',
  `model` varchar(45) DEFAULT NULL COMMENT '型号',
  `status` varchar(45) DEFAULT NULL COMMENT '设备状态，例如：在运、停运、在建、未使用',
  `use` varchar(45) DEFAULT NULL COMMENT '用途',
  `use_date` date DEFAULT NULL COMMENT '投运日期，例：2015-01-01',
  `purchase_method` varchar(45) DEFAULT NULL COMMENT '采购方式',
  `serial_number` varchar(45) DEFAULT NULL COMMENT '序列号',
  `manufacture_date` date DEFAULT NULL COMMENT '出厂日期',
  `service_expiry_date` date DEFAULT NULL COMMENT '售后服务到期时间',
  `network` varchar(45) DEFAULT NULL COMMENT '所属网络',
  `ip_address` varchar(45) DEFAULT NULL COMMENT 'IP地址',
  `mgt_dept_id` int(11) unsigned DEFAULT NULL COMMENT '设备管理部门，例：灾备一室',
  `mgt_employee_id` int(11) unsigned DEFAULT NULL COMMENT '运维责任人',
  `mgt_phone` varchar(45) DEFAULT NULL COMMENT '运维联系电话',
  `maintenance_supplier` varchar(45) DEFAULT NULL COMMENT '维保厂商',
  `maintenance_date_start` date DEFAULT NULL COMMENT '维保开始日期',
  `maintenance_date_end` date DEFAULT NULL COMMENT '维保结束日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='其他设备';

LOCK TABLES `device_other` WRITE;
/*!40000 ALTER TABLE `device_other` DISABLE KEYS */;

INSERT INTO `device_other` (`id`, `name`, `device_type_id`, `code`, `code_sgcc`, `room_id`, `cabinet_id`, `cabinet_position`, `manufacturer`, `brand`, `series`, `model`, `status`, `use`, `use_date`, `purchase_method`, `serial_number`, `manufacture_date`, `service_expiry_date`, `network`, `ip_address`, `mgt_dept_id`, `mgt_employee_id`, `mgt_phone`, `maintenance_supplier`, `maintenance_date_start`, `maintenance_date_end`)
VALUES
  (1001,'xr-12AD-con-ntpzz1',1006,NULL,NULL,1001,1004,'34-35U','其他','其他','其他','其他','在运','NTP主时钟','2013-06-01','国网集采购',NULL,NULL,NULL,NULL,NULL,1002,1002,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `device_other` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table device_safety
# ------------------------------------------------------------

DROP TABLE IF EXISTS `device_safety`;

CREATE TABLE `device_safety` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL COMMENT '设备名称',
  `device_type_id` int(11) unsigned DEFAULT NULL COMMENT '设备类型',
  `code` varchar(45) DEFAULT NULL COMMENT '设备编号',
  `code_sgcc` varchar(45) DEFAULT NULL COMMENT '国网编号',
  `room_id` int(11) unsigned DEFAULT NULL COMMENT '所在房间',
  `cabinet_id` int(11) unsigned DEFAULT NULL COMMENT '所在机柜',
  `cabinet_position` varchar(45) DEFAULT NULL COMMENT '机柜位置，例如：4U-7U、全柜',
  `manufacturer` varchar(45) DEFAULT NULL COMMENT '制造商',
  `brand` varchar(45) DEFAULT NULL COMMENT '品牌',
  `series` varchar(45) DEFAULT NULL COMMENT '系列',
  `model` varchar(45) DEFAULT NULL COMMENT '型号',
  `status` varchar(45) DEFAULT NULL COMMENT '设备状态，例如：在运、停运、在建、未使用',
  `use` varchar(45) DEFAULT NULL COMMENT '用途',
  `use_date` date DEFAULT NULL COMMENT '投运日期，例：2015-01-01',
  `purchase_method` varchar(45) DEFAULT NULL COMMENT '采购方式',
  `serial_number` varchar(45) DEFAULT NULL COMMENT '序列号',
  `manufacture_date` date DEFAULT NULL COMMENT '出厂日期',
  `service_expiry_date` date DEFAULT NULL COMMENT '售后服务到期时间',
  `network` varchar(45) DEFAULT NULL COMMENT '所属网络',
  `ip_address` varchar(45) DEFAULT NULL COMMENT 'IP地址',
  `mgt_dept_id` int(11) unsigned DEFAULT NULL COMMENT '设备管理部门，例：灾备一室',
  `mgt_employee_id` int(11) unsigned DEFAULT NULL COMMENT '运维责任人',
  `mgt_phone` varchar(45) DEFAULT NULL COMMENT '运维联系电话',
  `maintenance_supplier` varchar(45) DEFAULT NULL COMMENT '维保厂商',
  `maintenance_date_start` date DEFAULT NULL COMMENT '维保开始日期',
  `maintenance_date_end` date DEFAULT NULL COMMENT '维保结束日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='安全设备';

LOCK TABLES `device_safety` WRITE;
/*!40000 ALTER TABLE `device_safety` DISABLE KEYS */;

INSERT INTO `device_safety` (`id`, `name`, `device_type_id`, `code`, `code_sgcc`, `room_id`, `cabinet_id`, `cabinet_position`, `manufacturer`, `brand`, `series`, `model`, `status`, `use`, `use_date`, `purchase_method`, `serial_number`, `manufacture_date`, `service_expiry_date`, `network`, `ip_address`, `mgt_dept_id`, `mgt_employee_id`, `mgt_phone`, `maintenance_supplier`, `maintenance_date_start`, `maintenance_date_end`)
VALUES
  (1001,'内网出口防火墙1',1004,NULL,'XR-FHQ-01',1002,1044,NULL,'华为赛门铁克科技有限公司','华为',NULL,'USG9100','在运','带内管理区','2011-03-10','国网集采','210305G021Z0AB000010','2010-09-10','2016-12-31','带内管理区','10.200.51.20',1002,1002,'18066615812','西安交大捷普网络科技有限公司','2016-01-01','2016-12-31');

/*!40000 ALTER TABLE `device_safety` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table device_server
# ------------------------------------------------------------

DROP TABLE IF EXISTS `device_server`;

CREATE TABLE `device_server` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL COMMENT '设备名称',
  `device_type_id` int(11) unsigned DEFAULT NULL COMMENT '设备类型',
  `code` varchar(45) DEFAULT NULL COMMENT '设备编号',
  `code_sgcc` varchar(45) DEFAULT NULL COMMENT '国网编号',
  `room_id` int(11) unsigned DEFAULT NULL COMMENT '所在房间',
  `cabinet_id` int(11) unsigned DEFAULT NULL COMMENT '所在机柜',
  `cabinet_position` varchar(45) DEFAULT NULL COMMENT '机柜位置，例如：4U-7U、全柜',
  `manufacturer` varchar(45) DEFAULT NULL COMMENT '制造商',
  `brand` varchar(45) DEFAULT NULL COMMENT '品牌',
  `series` varchar(45) DEFAULT NULL COMMENT '系列',
  `model` varchar(45) DEFAULT NULL COMMENT '型号',
  `status` varchar(45) DEFAULT NULL COMMENT '设备状态，例如：在运、停运、在建、未使用',
  `use` varchar(45) DEFAULT NULL COMMENT '用途',
  `use_date` date DEFAULT NULL COMMENT '投运日期，例：2015-01-01',
  `purchase_method` varchar(45) DEFAULT NULL COMMENT '采购方式',
  `serial_number` varchar(45) DEFAULT NULL COMMENT '序列号',
  `manufacture_date` date DEFAULT NULL COMMENT '出厂日期',
  `service_expiry_date` date DEFAULT NULL COMMENT '售后服务到期时间',
  `network` varchar(45) DEFAULT NULL COMMENT '所属网络',
  `ip_address` varchar(45) DEFAULT NULL COMMENT 'IP地址',
  `mgt_dept_id` int(11) unsigned DEFAULT NULL COMMENT '设备管理部门，例：灾备一室',
  `mgt_employee_id` int(11) unsigned DEFAULT NULL COMMENT '运维责任人',
  `mgt_phone` varchar(45) DEFAULT NULL COMMENT '运维联系电话',
  `maintenance_supplier` varchar(45) DEFAULT NULL COMMENT '维保厂商',
  `maintenance_date_start` date DEFAULT NULL COMMENT '维保开始日期',
  `maintenance_date_end` date DEFAULT NULL COMMENT '维保结束日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='服务器设备';

LOCK TABLES `device_server` WRITE;
/*!40000 ALTER TABLE `device_server` DISABLE KEYS */;

INSERT INTO `device_server` (`id`, `name`, `device_type_id`, `code`, `code_sgcc`, `room_id`, `cabinet_id`, `cabinet_position`, `manufacturer`, `brand`, `series`, `model`, `status`, `use`, `use_date`, `purchase_method`, `serial_number`, `manufacture_date`, `service_expiry_date`, `network`, `ip_address`, `mgt_dept_id`, `mgt_employee_id`, `mgt_phone`, `maintenance_supplier`, `maintenance_date_start`, `maintenance_date_end`)
VALUES
  (1001,'接管区-小型机-01',1001,NULL,NULL,1004,1152,NULL,'国际商业机器公司','IBM','p780','IBM,9179-MHD','在运','新疆、宁夏数据库应用接管','2011-03-10','国网集采','06098BT','2010-09-10','2016-12-31','接管区','10.200.102.180',1002,1001,'18629436504','北京银信长远科技股份有限公司',NULL,NULL),
  (1002,'接管区-小型机-02',1001,NULL,NULL,1004,1152,NULL,'国际商业机器公司','IBM','p780','IBM,9179-MHD','在运','新疆、宁夏数据库应用接管','2011-03-10','国网集采','06098FT','2010-09-10','2016-12-31','接管区','10.200.102.180',1002,1001,'18629436504','北京银信长远科技股份有限公司',NULL,NULL);

/*!40000 ALTER TABLE `device_server` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table device_storage
# ------------------------------------------------------------

DROP TABLE IF EXISTS `device_storage`;

CREATE TABLE `device_storage` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL COMMENT '设备名称',
  `device_type_id` int(11) unsigned DEFAULT NULL COMMENT '设备类型',
  `code` varchar(45) DEFAULT NULL COMMENT '设备编号',
  `code_sgcc` varchar(45) DEFAULT NULL COMMENT '国网编号',
  `room_id` int(11) unsigned DEFAULT NULL COMMENT '所在房间',
  `cabinet_id` int(11) unsigned DEFAULT NULL COMMENT '所在机柜',
  `cabinet_position` varchar(45) DEFAULT NULL COMMENT '机柜位置，例如：4U-7U、全柜',
  `manufacturer` varchar(45) DEFAULT NULL COMMENT '制造商',
  `brand` varchar(45) DEFAULT NULL COMMENT '品牌',
  `series` varchar(45) DEFAULT NULL COMMENT '系列',
  `model` varchar(45) DEFAULT NULL COMMENT '型号',
  `status` varchar(45) DEFAULT NULL COMMENT '设备状态，例如：在运、停运、在建、未使用',
  `use` varchar(45) DEFAULT NULL COMMENT '用途',
  `use_date` date DEFAULT NULL COMMENT '投运日期，例：2015-01-01',
  `purchase_method` varchar(45) DEFAULT NULL COMMENT '采购方式',
  `serial_number` varchar(45) DEFAULT NULL COMMENT '序列号',
  `manufacture_date` date DEFAULT NULL COMMENT '出厂日期',
  `service_expiry_date` date DEFAULT NULL COMMENT '售后服务到期时间',
  `network` varchar(45) DEFAULT NULL COMMENT '所属网络',
  `ip_address` varchar(45) DEFAULT NULL COMMENT 'IP地址',
  `mgt_dept_id` int(11) unsigned DEFAULT NULL COMMENT '设备管理部门，例：灾备一室',
  `mgt_employee_id` int(11) unsigned DEFAULT NULL COMMENT '运维责任人',
  `mgt_phone` varchar(45) DEFAULT NULL COMMENT '运维联系电话',
  `maintenance_supplier` varchar(45) DEFAULT NULL COMMENT '维保厂商',
  `maintenance_date_start` date DEFAULT NULL COMMENT '维保开始日期',
  `maintenance_date_end` date DEFAULT NULL COMMENT '维保结束日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='存储设备';

LOCK TABLES `device_storage` WRITE;
/*!40000 ALTER TABLE `device_storage` DISABLE KEYS */;

INSERT INTO `device_storage` (`id`, `name`, `device_type_id`, `code`, `code_sgcc`, `room_id`, `cabinet_id`, `cabinet_position`, `manufacturer`, `brand`, `series`, `model`, `status`, `use`, `use_date`, `purchase_method`, `serial_number`, `manufacture_date`, `service_expiry_date`, `network`, `ip_address`, `mgt_dept_id`, `mgt_employee_id`, `mgt_phone`, `maintenance_supplier`, `maintenance_date_start`, `maintenance_date_end`)
VALUES
  (1001,'xr-mvir-hpxp2401',1002,'','xr-mvir-hpxp2401',1003,NULL,NULL,'中国惠普有限公司','HP','XP24000','XP24000','在运','数据级灾备','2011-01-01','国网集采','JPHC038002',NULL,'2014-01-01','内网','10.200.52.5',1002,1004,'81003228',NULL,NULL,NULL),
  (1002,'xr-mvir-hpxp7',1002,'','xr-mvir-hpxp7',1003,NULL,NULL,'中国惠普有限公司','HP','XP7','XP7','在运','数据级灾备','2016-05-01','国网集采','USHA056695',NULL,'2018-07-12','内网','10.200.52.7',1002,1004,'81003228',NULL,NULL,NULL),
  (1015,'设备名称-test',1003,'设备编号-test','国网编号-test',1001,1001,'机柜位置1-40U-test','供应商-test','品牌-test','系列-test','型号-test','设备状态-test','用途-test','2016-08-09','采购方式-test','序列号-test','2016-08-09','2016-08-09','所属网络-test','IP地址-test',1002,1002,'联系电话-test','维保单位-test','2016-08-09','2016-08-09');

/*!40000 ALTER TABLE `device_storage` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
