-- 数据库初始化脚本
CREATE database cherrydb;

-- 使用数据库
use cherrydb;

-- 创建库存表
CREATE TABLE `seckill` (
  `seckill_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '库存ID',
  `name` varchar(120) NOT NULL DEFAULT '' COMMENT '名称',
  `number` int(11) NOT NULL COMMENT '数量',
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '开始时间',
  `end_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '结束时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`seckill_id`),
  KEY `idx_start_time` (`start_time`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='库存表';


-- 初始化数据

INSERT INTO seckill(name, number,start_time,end_time)
VALUES
('1000元秒杀iPhone 6S Plus', 100, '2016-06-08 00:00:00', '2016-06-09 00:00:00'),
('800元秒杀iPad AIR 2', 200, '2016-06-08 00:00:00', '2016-06-09 00:00:00'),
('500元秒杀iPhone 6S', 300, '2016-06-08 00:00:00', '2016-06-09 00:00:00'),
('300元秒杀iPad MINI 2', 400, '2016-06-08 00:00:00', '2016-06-09 00:00:00'),
('100元秒杀Apple Watch', 500, '2016-06-08 00:00:00', '2016-06-09 00:00:00');

-- 成功明细
CREATE TABLE `success_killed` (
  `seckill_id` bigint(20) NOT NULL COMMENT '商品ID',
  `user_phone` bigint(20) NOT NULL COMMENT '用户信息',
  `state` tinyint(4) NOT NULL DEFAULT '-1' COMMENT '状态标示:-1=无效,0=成功,1=已付款,2=已发货,3=已收货',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`seckill_id`,`user_phone`),
  KEY `idx_create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='成功明细';




/**

 */


CREATE TABLE `tb_device_type` (
  `dtid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '设备类型ID,唯一标识',
  `dtno` varchar(128) DEFAULT NULL COMMENT '设备类型编号',
  `dtname` varchar(128) DEFAULT NULL COMMENT '设备类型名称',
  `sortno` int(11) NOT NULL DEFAULT '9999' COMMENT '排序',
  PRIMARY KEY (`dtid`),
  UNIQUE KEY `dtno` (`dtno`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8 COMMENT='设备类型表';

INSERT INTO tb_device_type (dtno, dtname)
    VALUES ('PCServer', 'PC服务器'),
      ('ESXi', '虚拟化平台服务器'),
      ('Power', '小型机'),
      ('SANSwitch', '光纤交换机'),
      ('NETSwitch', '网络交换机');

-- 机房信息表
CREATE TABLE `tb_room`(
  `rid` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '机房ID,唯一标识',
  `rno` VARCHAR(32) NULL COMMENT '机房编号',
  `rname` VARCHAR(32) NULL COMMENT '机房名称',
  PRIMARY KEY (rid),
  UNIQUE (rno)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='机房信息表';

INSERT INTO tb_room (rno, rname)
    VALUES ('21', '21机房'), ('22', '22机房'), ('12', '12机房'), ('13', '13机房');

-- 机柜信息表
CREATE TABLE `tb_cabinet`(
  `cid` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '机柜ID,唯一标识',
  `cno` VARCHAR(32) NULL COMMENT '机柜编号',
  `cname` VARCHAR(32) NULL COMMENT '机柜名称',
  `ctype` VARCHAR(32) NULL COMMENT '机柜类型',
  `rid` BIGINT(20) NULL COMMENT '所属机房ID',
  PRIMARY KEY (cid),
  KEY idx_cno(cno),
  KEY idx_cname(cname),
  FOREIGN KEY (rid) REFERENCES tb_room(rid)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='机柜信息表';

INSERT INTO tb_cabinet(cno, cname, ctype, rid)
    VALUES ('21AA', '21AA', '服务器机柜', 1000),
      ('21AB', '21AB', '服务器机柜', 1000),
      ('21AC', '21AC', '服务器机柜', 1000),
      ('21AD', '21AD', '服务器机柜', 1000),
      ('21AE', '21AE', '服务器机柜', 1000),
      ('21AF', '21AF', '服务器机柜', 1000),
      ('21AG', '21AG', '服务器机柜', 1000),
      ('21AH', '21AH', '服务器机柜', 1000),
      ('21AI', '21AI', '服务器机柜', 1000),
      ('21AJ', '21AJ', '服务器机柜', 1000),
      ('21AK', '21AK', '服务器机柜', 1000),
      ('21AL', '21AL', '服务器机柜', 1000),
      ('21AM', '21AM', '服务器机柜', 1000),
      ('21BA', '21BA', '服务器机柜', 1000),
      ('21BB', '21BB', '服务器机柜', 1000),
      ('21BC', '21BC', '服务器机柜', 1000),
      ('21BD', '21BD', '服务器机柜', 1000),
      ('21BE', '21BE', '服务器机柜', 1000),
      ('22BA', '22BA', '服务器机柜', 1001),
      ('22BB', '21BF', '服务器机柜', 1001),
      ('22BC', '21BF', '服务器机柜', 1001),
      ('22BD', '21BF', '服务器机柜', 1001),
      ('22BE', '21BF', '服务器机柜', 1001),
      ('22BF', '22BF', '服务器机柜', 1001),
      ('22BG', '22BG', '服务器机柜', 1001),
      ('22CA', '22CA', '服务器机柜', 1001),
      ('22CB', '22CB', '服务器机柜', 1001),
      ('22CC', '22CC', '服务器机柜', 1001),
      ('22CD', '22CD', '服务器机柜', 1001),
      ('22CE', '22CE', '服务器机柜', 1001),
      ('22CF', '22CF', '服务器机柜', 1001),
      ('22CG', '22CG', '服务器机柜', 1001)
      ;

-- 故障信息表
/*
CREATE TABLE `tb_fault`(
  `fid` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '故障ID,唯一标识',
  `fname` VARCHAR(128) NULL COMMENT '故障名称',
  `start_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '故障发现时间',
  `end_time` TIMESTAMP NULL COMMENT '故障处理时间',
  `person` VARCHAR(32) NULL COMMENT '操作人'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='故障信息表';
*/


-- 设备信息表
CREATE TABLE `tb_device` (
  `did` BIGINT(20)  NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `dname` varchar(128) DEFAULT NULL COMMENT '设备名称',
  `dtid` BIGINT(20) DEFAULT NULL COMMENT '外键，设备类型ID，deviceTypeID',
  `dno` varchar(128) DEFAULT NULL COMMENT '设备编号',
  `cid` BIGINT(20) DEFAULT NULL COMMENT '外键，所在机柜ID，cabinetID',
  `dplace` varchar(128) DEFAULT NULL COMMENT '存放位置，机柜内U数或描述',
  `dmodel` varchar(128) DEFAULT NULL COMMENT '设备型号',
  `dcode` varchar(128) DEFAULT NULL COMMENT '资产编码',
  `dip` varchar(128) DEFAULT NULL COMMENT '设备网络IP',
  `dstatus` varchar(128) DEFAULT NULL COMMENT '设备状态',
  `usedate` date DEFAULT NULL COMMENT '投运日期',
  `psupplier` varchar(128) DEFAULT NULL COMMENT '供应商，purchaseSupplierID',
  `department` varchar(128) DEFAULT NULL COMMENT '运维部门',
  `nettype` varchar(128) DEFAULT NULL COMMENT '网络分类，netType',
  `person` varchar(128) DEFAULT NULL COMMENT '责任人',
  `oid` varchar(128) DEFAULT NULL COMMENT '外键，检修ID，overhaulID',
  `defid` varchar(128) DEFAULT NULL COMMENT '外键，隐患ID，defectID',
  `fid` varchar(128) DEFAULT NULL COMMENT '外键，故障ID，faultID',
  `projectid` varchar(128) DEFAULT NULL COMMENT '所属项目ID，projectID',
  `originalvalue` varchar(128) DEFAULT NULL COMMENT '资产原值',
  `serialnumber` varchar(128) DEFAULT NULL COMMENT '序列号',
  PRIMARY KEY (did),
  KEY idx_dname (dname),
  KEY idx_dno (dno),
  FOREIGN KEY (dtid) REFERENCES tb_device_type(dtid),
  FOREIGN KEY (cid) REFERENCES tb_cabinet(cid)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='设备信息表';


INSERT INTO tb_device (dname, dtid, dno, cid, dplace, dmodel, dcode, dip, dstatus, usedate, psupplier, department, nettype, person, oid, defid, fid, projectid, originalvalue, serialnumber)
VALUES
  ('监控区-资源池-ESXi-01', 1001, 'XR-21BB-JKQ-ESXi-01', 1014, '3U-12U', 'ProLiant BL460c G7', 'XR-JKQ-ESXi-01', '10.200.52.21', '在用', '2010-12-31', '南瑞集团', '运检一室', '内网', '雷大洋', NULL, NULL, NULL, NULL, NULL, 'CNG049TQGC'),
  ('监控区-资源池-ESXi-02', 1001, 'XR-21BB-JKQ-ESXi-02', 1014, '3U-12U', 'ProLiant BL460c G7', 'XR-JKQ-ESXi-02', '10.200.52.23', '在用', '2010-12-31', '南瑞集团', '运检一室', '内网', '雷大洋', NULL, NULL, NULL, NULL, NULL, 'CNG049TQGN'),
  ('监控区-资源池-ESXi-03', 1001, 'XR-21BB-JKQ-ESXi-03', 1014, '3U-12U', 'ProLiant BL460c G7', 'XR-JKQ-ESXi-03', '10.200.52.24', '在用', '2010-12-31', '南瑞集团', '运检一室', '内网', '雷大洋', NULL, NULL, NULL, NULL, NULL, 'CNG049TQGN'),
  ('监控区-资源池-ESXi-04', 1001, 'XR-21BC-JKQ-ESXi-04', 1015, '3U-6U', 'System x3850 X5', 'XR-JKQ-ESXi-04', '10.200.52.33', '在用', '2010-12-31', '南瑞集团', '运检一室', '内网', '雷大洋', NULL, NULL, NULL, NULL, NULL, '99B5980'),
  ('监控区-资源池-ESXi-05', 1001, 'XR-21BC-JKQ-ESXi-05', 1015, '18U-21U', 'System x3850 X5', 'XR-JKQ-ESXi-05', '10.200.52.51', '在用', '2010-12-31', '南瑞集团', '运检一室', '内网', '雷大洋', NULL, NULL, NULL, NULL, NULL, '06K3908');
