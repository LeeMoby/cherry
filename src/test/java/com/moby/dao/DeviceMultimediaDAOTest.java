package com.moby.dao;

import com.moby.entiry.DeviceMultimedia;
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
 * Created by Moby on 16/8/2.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class DeviceMultimediaDAOTest {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Resource
    private DeviceMultimediaDAO deviceMultimediaDAO;

    @Test
    public void getDeviceById() throws Exception {
        int deviceId = 1001;
        DeviceMultimedia deviceMultimedia = deviceMultimediaDAO.getDeviceById(deviceId);
        logger.info("deviceMultimedia: " + deviceMultimedia);
    }

    @Test
    public void findAllDevice() throws Exception {
        List<DeviceMultimedia> deviceMultimediaList = deviceMultimediaDAO.findAllDevice();
        for (DeviceMultimedia deviceMultimedia : deviceMultimediaList) {
            logger.info("deviceMultimedia: " + deviceMultimedia);
        }
    }

    @Test
    public void findDeviceByDevice() throws Exception {
        DeviceMultimedia aDeviceMultimedia = new DeviceMultimedia();
//        aDeviceMultimedia.setId(1001);
        aDeviceMultimedia.setName("te");
        List<DeviceMultimedia> deviceMultimediaList = deviceMultimediaDAO.findDeviceByDevice(aDeviceMultimedia);
        for (DeviceMultimedia deviceMultimedia : deviceMultimediaList) {
            logger.info("deviceMultimedia: " + deviceMultimedia);
        }
    }

    @Test
    public void addDevice() throws Exception {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        DeviceMultimedia aDeviceMultimedia = new DeviceMultimedia();
        aDeviceMultimedia.setName("设备名称-test");
        int deviceTypeId = 1005; // 音视频、多媒体
        aDeviceMultimedia.setDeviceTypeId(deviceTypeId);
        aDeviceMultimedia.setCode("设备编号-test");
        aDeviceMultimedia.setCodeSgcc("国网编号-test");
        int roomId = 1001; // 12机房
        aDeviceMultimedia.setRoomId(roomId);
        int cabinetId = 1001; // 12AA机房
        aDeviceMultimedia.setCabinetId(cabinetId);
        aDeviceMultimedia.setCabinetPosition("机柜位置1-40U-test");
        aDeviceMultimedia.setManufacturer("供应商-test");
        aDeviceMultimedia.setBrand("品牌-test");
        aDeviceMultimedia.setSeries("系列-test");
        aDeviceMultimedia.setModel("型号-test");
        aDeviceMultimedia.setStatus("设备状态-test");
        aDeviceMultimedia.setUse("用途-test");
        aDeviceMultimedia.setUseDate(new Date());
        aDeviceMultimedia.setPurchaseMethod("采购方式-test");
        aDeviceMultimedia.setSerialNumber("序列号-test");
        aDeviceMultimedia.setManufactureDate(new Date());
        aDeviceMultimedia.setServiceExpiryDate(new Date());
        aDeviceMultimedia.setNetwork("所属网络-test");
        aDeviceMultimedia.setIpAddress("IP地址-test");
        int deptId = 1002; // 运检一室
        aDeviceMultimedia.setMgtDeptId(deptId);
        int empId = 1001; // 肖莎
        aDeviceMultimedia.setMgtEmployeeId(empId);
        aDeviceMultimedia.setMgtPhone("联系电话-test");
        aDeviceMultimedia.setMaintenanceSupplier("维保单位-test");
        aDeviceMultimedia.setMaintenanceDateStart(new Date());
        aDeviceMultimedia.setMaintenanceDateEnd(new Date());

        int result = deviceMultimediaDAO.addDevice(aDeviceMultimedia);

        if (result > 0) {
            DeviceMultimedia newDeviceMultimedia = new DeviceMultimedia();
            newDeviceMultimedia.setName("test");
            List<DeviceMultimedia> deviceMultimediaList = deviceMultimediaDAO.findDeviceByDevice(newDeviceMultimedia);
            for (DeviceMultimedia arg : deviceMultimediaList) {
                logger.info("deviceMultimedia: " + arg);
            }
        }

    }
    @Test
    public void updateDevice() throws Exception{
        DeviceMultimedia newDeviceMultimedia = new DeviceMultimedia();
        newDeviceMultimedia.setName("test");
        List<DeviceMultimedia> deviceMultimediaList = deviceMultimediaDAO.findDeviceByDevice(newDeviceMultimedia);
        if (deviceMultimediaList.size() > 0){
            DeviceMultimedia aDeviceMultimedia = deviceMultimediaList.get(0);
            aDeviceMultimedia.setName(aDeviceMultimedia.getName() + "-update");
            int deviceTypeId = 1005; // 音视频、多媒体
            aDeviceMultimedia.setDeviceTypeId(deviceTypeId);
            aDeviceMultimedia.setCode(aDeviceMultimedia.getCode() + "-update");
            aDeviceMultimedia.setCodeSgcc(aDeviceMultimedia.getCodeSgcc() + "-update");
            int roomId = 1001; // 12机房
            aDeviceMultimedia.setRoomId(roomId);
            int cabinetId = 1001; // 12AA机房
            aDeviceMultimedia.setCabinetId(cabinetId);
            aDeviceMultimedia.setCabinetPosition(aDeviceMultimedia.getCabinetPosition() + "-update");
            aDeviceMultimedia.setManufacturer(aDeviceMultimedia.getManufacturer() + "-update");
            aDeviceMultimedia.setBrand(aDeviceMultimedia.getBrand() + "-update");
            aDeviceMultimedia.setSeries(aDeviceMultimedia.getSeries() + "-update");
            aDeviceMultimedia.setModel(aDeviceMultimedia.getModel() + "-update");
            aDeviceMultimedia.setStatus(aDeviceMultimedia.getStatus() + "-update");
            aDeviceMultimedia.setUse(aDeviceMultimedia.getUse() + "-update");
            aDeviceMultimedia.setUseDate(new Date());
            aDeviceMultimedia.setPurchaseMethod(aDeviceMultimedia.getPurchaseMethod() + "-update");
            aDeviceMultimedia.setSerialNumber(aDeviceMultimedia.getSerialNumber() + "-update");
            aDeviceMultimedia.setManufactureDate(new Date());
            aDeviceMultimedia.setServiceExpiryDate(new Date());
            aDeviceMultimedia.setNetwork(aDeviceMultimedia.getNetwork() + "-update");
            aDeviceMultimedia.setIpAddress(aDeviceMultimedia.getIpAddress() + "-update");
            int deptId = 1002; // 运检一室
            aDeviceMultimedia.setMgtDeptId(deptId);
            int empId = 1001; // 肖莎
            aDeviceMultimedia.setMgtEmployeeId(empId);
            aDeviceMultimedia.setMgtPhone(aDeviceMultimedia.getMgtPhone() + "-update");
            aDeviceMultimedia.setMaintenanceSupplier(aDeviceMultimedia.getMaintenanceSupplier() + "-update");
            aDeviceMultimedia.setMaintenanceDateStart(new Date());
            aDeviceMultimedia.setMaintenanceDateEnd(new Date());

            int result = deviceMultimediaDAO.updateDevice(aDeviceMultimedia);
            if (result > 0){
                logger.info("deviceMultimedia: " + deviceMultimediaDAO.getDeviceById(aDeviceMultimedia.getId()));
            }
        }

    }

    @Test
    public void delDevice() throws Exception{
        List ids = new ArrayList();
        DeviceMultimedia newDeviceMultimedia = new DeviceMultimedia();
        newDeviceMultimedia.setName("test");
        List<DeviceMultimedia> deviceMultimediaList = deviceMultimediaDAO.findDeviceByDevice(newDeviceMultimedia);
        for (DeviceMultimedia deviceMultimedia : deviceMultimediaList){
            ids.add(deviceMultimedia.getId());
        }
        if (ids.size() > 0) {
            int result = deviceMultimediaDAO.delDevice(ids);
            logger.info("已删除" + result + "条记录");
        }
    }


}