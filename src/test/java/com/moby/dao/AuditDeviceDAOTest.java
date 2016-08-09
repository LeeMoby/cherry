package com.moby.dao;

import com.moby.entiry.AuditDevice;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static org.junit.Assert.*;

/**
 * Created by Moby on 16/8/3.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class AuditDeviceDAOTest {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    @Resource
    private AuditDeviceDAO auditDeviceDAO;

    @Test
    public void getAuditDevice() throws Exception {
//        int id = 1;
//        AuditDevice auditDevice = auditDeviceDAO.getAuditDevice(id);
//        logger.info("auditDevice: " + auditDevice.toString());
    }

    @Test
    public void findAuditDeviceByDatetime() throws Exception {
//        Date start = sdf.parse("2015-05-08 00:00:00");
//        Date end = sdf.parse("2017-08-08 00:00:00");
//        List<AuditDevice> list = auditDeviceDAO.findAuditDeviceByDatetime(start, end);
//        for (AuditDevice auditDevice : list) {
//            logger.info("auditDevice: " + auditDevice);
//        }
    }

    @Test
    public void addAuditDevice() throws Exception {
//        AuditDevice newAuditDevice = new AuditDevice();
//        newAuditDevice.setType("新增");
//        newAuditDevice.setDatetime(new Date());
//        newAuditDevice.setUserId(1001);
//        newAuditDevice.setIpAddress("0.0.0.0");
//        newAuditDevice.setBrowser("safari");
//        newAuditDevice.setOs("macOS");
//        newAuditDevice.setContent("test设备名称:" + "ESXi主机1" + "、" + "ESXi主机2" + "; 设备序列号:" + "ABCDEFG" + "、" + "HIJKLMN");
//        int result = auditDeviceDAO.addAuditDevice(newAuditDevice);
//        if (result > 0) {
//            logger.info("新增" + result + "条设备变动审计记录。");
//        }
    }

    @Test
    public void delAuditDevice() throws Exception {
//        List ids = new ArrayList();
//        Date start = sdf.parse("2015-05-08 00:00:00");
//        Date end = sdf.parse("2016-08-08 00:00:00");
//        List<AuditDevice> list = auditDeviceDAO.findAuditDeviceByDatetime(start, end);
//        for (AuditDevice auditDevice : list){
//            ids.add(auditDevice.getId());
//        }
//        if (ids.size() > 0){
//            int result = auditDeviceDAO.delAuditDevice(ids);
//            if (result > 0){
//                logger.info("删除" + result + "条设备变动审计记录。");
//            }
//        }
    }

    @Test
    public void delAuditDeviceByDatetime() throws Exception {
//        Date start = sdf.parse("2015-05-08 00:00:00");
//        Date end = sdf.parse("2016-08-08 00:00:00");
//        int result = auditDeviceDAO.delAuditDeviceByDatetime(start, end);
//        if (result > 0) {
//            logger.info("删除" + result + "条设备变动审计记录。");
//        }
    }

}