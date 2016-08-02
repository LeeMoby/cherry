package com.moby.dao;

import com.moby.entiry.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static org.junit.Assert.*;

/**
 * Created by Moby on 16/6/13.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring/spring-dao.xml")
public class DeviceDAOTest {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Resource
    private DeviceDAO deviceDAO;

    @Resource
    private DeviceMultimediaDAO deviceMultimediaDAO;

    @Resource
    private DeviceNetworkDAO deviceNetworkDAO;

    @Resource
    private DeviceSafetyDAO deviceSafetyDAO;

    @Resource
    private DeviceOtherDAO deviceOtherDAO;

    @Resource
    private DeviceServerDAO deviceServerDAO;

    @Resource
    private DeviceStorageDAO deviceStorageDAO;

    @Test
    public void getDeviceById() throws Exception {
        int deviceId = 1001;
//        Device device = deviceMultimediaDAO.getDeviceById(deviceId);
//        Device device = deviceNetworkDAO.getDeviceById(deviceId);
//        Device device = deviceSafetyDAO.getDeviceById(deviceId);
//        Device device = deviceOtherDAO.getDeviceById(deviceId);
//        Device device = deviceServerDAO.getDeviceById(deviceId);
        Device device = deviceStorageDAO.getDeviceById(deviceId);
        logger.info("device: " + device);
    }

    @Test
    public void findAllDevice() throws Exception {
//        List list = deviceMultimediaDAO.findAllDevice();
//        List list = deviceNetworkDAO.findAllDevice();
//        List list = deviceSafetyDAO.findAllDevice();
//        List list = deviceOtherDAO.findAllDevice();
//        List list = deviceServerDAO.findAllDevice();
        List list = deviceStorageDAO.findAllDevice();
        for (int i = 0; i < list.size(); i++) {
            Device device = (Device) list.get(i);
            logger.info("device: " + device);
        }
    }

    @Test
    public void findDeviceByDevice() throws Exception {
        Device aDevice = new Device();
        aDevice.setName("test");
//        List list = deviceMultimediaDAO.findAllDevice();
//        List list = deviceNetworkDAO.findAllDevice();
//        List list = deviceSafetyDAO.findAllDevice();
//        List list = deviceOtherDAO.findAllDevice();
//        List list = deviceServerDAO.findAllDevice();
        List list = deviceStorageDAO.findAllDevice();
        for (int i = 0; i < list.size(); i++) {
            Device device = (Device)list.get(i);
            logger.info("device: " + device);
        }
    }

    @Test
    public void addDevice() throws Exception {
        Device newDevice = new Device();
        newDevice.setName("设备名称-test");
        int deviceTypeId = 1003; // 网络设备
        newDevice.setDeviceTypeId(deviceTypeId);
        newDevice.setCode("设备编号-test");
        newDevice.setCodeSgcc("国网编号-test");
        int roomId = 1001; // 12机房
        newDevice.setRoomId(roomId);
        int cabinetId = 1001; // 12AA机房
        newDevice.setCabinetId(cabinetId);
        newDevice.setCabinetPosition("机柜位置1-40U-test");
        newDevice.setManufacturer("供应商-test");
        newDevice.setBrand("品牌-test");
        newDevice.setSeries("系列-test");
        newDevice.setModel("型号-test");
        newDevice.setStatus("设备状态-test");
        newDevice.setUse("用途-test");
        newDevice.setUseDate(new Date());
        newDevice.setPurchaseMethod("采购方式-test");
        newDevice.setSerialNumber("序列号-test");
        newDevice.setManufactureDate(new Date());
        newDevice.setServiceExpiryDate(new Date());
        newDevice.setNetwork("所属网络-test");
        newDevice.setIpAddress("IP地址-test");
        int deptId = 1002; // 运检一室
        newDevice.setMgtDeptId(deptId);
        int empId = 1002; // 王磊
        newDevice.setMgtEmployeeId(empId);
        newDevice.setMgtPhone("联系电话-test");
        newDevice.setMaintenanceSupplier("维保单位-test");
        newDevice.setMaintenanceDateStart(new Date());
        newDevice.setMaintenanceDateEnd(new Date());

//        int result = deviceMultimediaDAO.addDevice(newDevice);
//        int result = deviceNetworkDAO.addDevice(newDevice);
//        int result = deviceSafetyDAO.addDevice(newDevice);
//        int result = deviceOtherDAO.addDevice(newDevice);
//        int result = deviceServerDAO.addDevice(newDevice);
        int result = deviceStorageDAO.addDevice(newDevice);


        if (result > 0) {
            Device aDevice = new Device();
            aDevice.setName("test");
//            List list = deviceMultimediaDAO.findDeviceByDevice(aDevice);
//            List list = deviceNetworkDAO.findDeviceByDevice(aDevice);
//            List list = deviceSafetyDAO.findDeviceByDevice(aDevice);
//            List list = deviceOtherDAO.findDeviceByDevice(aDevice);
//            List list = deviceServerDAO.findDeviceByDevice(aDevice);
            List list = deviceStorageDAO.findDeviceByDevice(aDevice);

            for (int i = 0; i < list.size(); i++){
                Device device = (Device) list.get(i);
                logger.info("device: " + device);
            }
        }

    }

    @Test
    public void updateDevice() throws Exception {
        Device aDevice = new Device();
        aDevice.setName("test");
//            List list = deviceMultimediaDAO.findDeviceByDevice(aDevice);
//            List list = deviceNetworkDAO.findDeviceByDevice(aDevice);
//            List list = deviceSafetyDAO.findDeviceByDevice(aDevice);
//            List list = deviceOtherDAO.findDeviceByDevice(aDevice);
//            List list = deviceServerDAO.findDeviceByDevice(aDevice);
        List list = deviceStorageDAO.findDeviceByDevice(aDevice);
        if (list.size() > 0){
            aDevice = (Device) list.get(0);
            aDevice.setName(aDevice.getName() + "-update");
            int deviceTypeId = 1003; // 网络设备
            aDevice.setDeviceTypeId(deviceTypeId);
            aDevice.setCode(aDevice.getCode() + "-update");
            aDevice.setCodeSgcc(aDevice.getCodeSgcc() + "-update");
            int roomId = 1001; // 12机房
            aDevice.setRoomId(roomId);
            int cabinetId = 1001; // 12AA机房
            aDevice.setCabinetId(cabinetId);
            aDevice.setCabinetPosition(aDevice.getCabinetPosition() + "-update");
            aDevice.setManufacturer(aDevice.getManufacturer() + "-update");
            aDevice.setBrand(aDevice.getBrand() + "-update");
            aDevice.setSeries(aDevice.getSeries() + "-update");
            aDevice.setModel(aDevice.getModel() + "-update");
            aDevice.setStatus(aDevice.getStatus() + "-update");
            aDevice.setUse(aDevice.getUse() + "-update");
            aDevice.setUseDate(new Date());
            aDevice.setPurchaseMethod(aDevice.getPurchaseMethod() + "-update");
            aDevice.setSerialNumber(aDevice.getSerialNumber() + "-update");
            aDevice.setManufactureDate(new Date());
            aDevice.setServiceExpiryDate(new Date());
            aDevice.setNetwork(aDevice.getNetwork() + "-update");
            aDevice.setIpAddress(aDevice.getIpAddress() + "-update");
            int deptId = 1002; // 运检一室
            aDevice.setMgtDeptId(deptId);
            int empId = 1002; // 王磊
            aDevice.setMgtEmployeeId(empId);
            aDevice.setMgtPhone(aDevice.getMgtPhone() + "-update");
            aDevice.setMaintenanceSupplier(aDevice.getMaintenanceSupplier() + "-update");
            aDevice.setMaintenanceDateStart(new Date());
            aDevice.setMaintenanceDateEnd(new Date());

//            int result = deviceMultimediaDAO.updateDevice(aDevice);
//            int result = deviceNetworkDAO.updateDevice(aDevice);
//            int result = deviceSafetyDAO.updateDevice(aDevice);
//            int result = deviceOtherDAO.updateDevice(aDevice);
//            int result = deviceServerDAO.updateDevice(aDevice);
            int result = deviceStorageDAO.updateDevice(aDevice);

            if (result > 0) {
//                logger.info("deviceNetwork: " + deviceMultimediaDAO.getDeviceById(aDevice.getId()));
//                logger.info("deviceNetwork: " + deviceNetworkDAO.getDeviceById(aDevice.getId()));
//                logger.info("deviceNetwork: " + deviceSafetyDAO.getDeviceById(aDevice.getId()));
//                logger.info("deviceNetwork: " + deviceOtherDAO.getDeviceById(aDevice.getId()));
//                logger.info("deviceNetwork: " + deviceServerDAO.getDeviceById(aDevice.getId()));
                logger.info("deviceNetwork: " + deviceStorageDAO.getDeviceById(aDevice.getId()));
            }
        }
    }

    @Test
    public void delDevice() throws Exception {
        List ids = new ArrayList();
        Device aDevice = new Device();
        aDevice.setName("test");
//            List list = deviceMultimediaDAO.findDeviceByDevice(aDevice);
//            List list = deviceNetworkDAO.findDeviceByDevice(aDevice);
//            List list = deviceSafetyDAO.findDeviceByDevice(aDevice);
//            List list = deviceOtherDAO.findDeviceByDevice(aDevice);
//            List list = deviceServerDAO.findDeviceByDevice(aDevice);
        List list = deviceStorageDAO.findDeviceByDevice(aDevice);
        for (int i = 0; i < list.size(); i++) {
            ids.add(((Device)list.get(i)).getId());
        }
        if (ids.size() > 0){
//            int result = deviceMultimediaDAO.delDevice(ids);
//            int result = deviceNetworkDAO.delDevice(ids);
//            int result = deviceSafetyDAO.delDevice(ids);
//            int result = deviceOtherDAO.delDevice(ids);
//            int result = deviceServerDAO.delDevice(ids);
            int result = deviceStorageDAO.delDevice(ids);
            logger.info("已删除" + result + "条记录");
        }
    }

}