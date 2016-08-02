package com.moby.dao;

import com.moby.entiry.DeviceNetwork;
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
 * Created by Moby on 16/8/2.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class DeviceNetworkDAOTest {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Resource
    private DeviceNetworkDAO deviceNetworkDAO;

    @Test
    public void getDeviceById() throws Exception {
        int id = 1001;
        DeviceNetwork deviceNetwork = deviceNetworkDAO.getDeviceById(id);
        logger.info("deviceNetwork: " + deviceNetwork);
    }

    @Test
    public void findAllDevice() throws Exception {
        List<DeviceNetwork> deviceNetworkList = deviceNetworkDAO.findAllDevice();
        for (DeviceNetwork deviceNetwork : deviceNetworkList){
            logger.info("deviceNetwork: " + deviceNetwork);
        }
    }

    @Test
    public void findDeviceByDevice() throws Exception {
        DeviceNetwork aDeviceNetwork = new DeviceNetwork();
        aDeviceNetwork.setName("交换机");
        List<DeviceNetwork> deviceNetworkList = deviceNetworkDAO.findDeviceByDevice(aDeviceNetwork);
        for (DeviceNetwork deviceNetwork : deviceNetworkList){
            logger.info("deviceNetwork: " + deviceNetwork);
        }
    }

    @Test
    public void addDevice() throws Exception {
        DeviceNetwork newDeviceNetwork = new DeviceNetwork();
        newDeviceNetwork.setName("设备名称-test");
        int deviceTypeId = 1003; // 网络设备
        newDeviceNetwork.setDeviceTypeId(deviceTypeId);
        newDeviceNetwork.setCode("设备编号-test");
        newDeviceNetwork.setCodeSgcc("国网编号-test");
        int roomId = 1001; // 12机房
        newDeviceNetwork.setRoomId(roomId);
        int cabinetId = 1001; // 12AA机房
        newDeviceNetwork.setCabinetId(cabinetId);
        newDeviceNetwork.setCabinetPosition("机柜位置1-40U-test");
        newDeviceNetwork.setManufacturer("供应商-test");
        newDeviceNetwork.setBrand("品牌-test");
        newDeviceNetwork.setSeries("系列-test");
        newDeviceNetwork.setModel("型号-test");
        newDeviceNetwork.setStatus("设备状态-test");
        newDeviceNetwork.setUse("用途-test");
        newDeviceNetwork.setUseDate(new Date());
        newDeviceNetwork.setPurchaseMethod("采购方式-test");
        newDeviceNetwork.setSerialNumber("序列号-test");
        newDeviceNetwork.setManufactureDate(new Date());
        newDeviceNetwork.setServiceExpiryDate(new Date());
        newDeviceNetwork.setNetwork("所属网络-test");
        newDeviceNetwork.setIpAddress("IP地址-test");
        int deptId = 1002; // 运检一室
        newDeviceNetwork.setMgtDeptId(deptId);
        int empId = 1002; // 王磊
        newDeviceNetwork.setMgtEmployeeId(empId);
        newDeviceNetwork.setMgtPhone("联系电话-test");
        newDeviceNetwork.setMaintenanceSupplier("维保单位-test");
        newDeviceNetwork.setMaintenanceDateStart(new Date());
        newDeviceNetwork.setMaintenanceDateEnd(new Date());

        int result = deviceNetworkDAO.addDevice(newDeviceNetwork);

        if (result > 0) {
            DeviceNetwork aDeviceNetwork = new DeviceNetwork();
            aDeviceNetwork.setName("test");
            List<DeviceNetwork> deviceNetworkList = deviceNetworkDAO.findDeviceByDevice(aDeviceNetwork);
            for (DeviceNetwork deviceNetwork : deviceNetworkList){
                logger.info("deviceNetwork: " + deviceNetwork);
            }
        }
    }

    @Test
    public void updateDevice() throws Exception {
        DeviceNetwork aDeviceNetwork = new DeviceNetwork();
        aDeviceNetwork.setName("test");
        List<DeviceNetwork> deviceNetworkList = deviceNetworkDAO.findDeviceByDevice(aDeviceNetwork);
        if (deviceNetworkList.size() > 0){
            aDeviceNetwork = deviceNetworkList.get(0);
            aDeviceNetwork.setName(aDeviceNetwork.getName() + "-update");
            int deviceTypeId = 1003; // 网络设备
            aDeviceNetwork.setDeviceTypeId(deviceTypeId);
            aDeviceNetwork.setCode(aDeviceNetwork.getCode() + "-update");
            aDeviceNetwork.setCodeSgcc(aDeviceNetwork.getCodeSgcc() + "-update");
            int roomId = 1001; // 12机房
            aDeviceNetwork.setRoomId(roomId);
            int cabinetId = 1001; // 12AA机房
            aDeviceNetwork.setCabinetId(cabinetId);
            aDeviceNetwork.setCabinetPosition(aDeviceNetwork.getCabinetPosition() + "-update");
            aDeviceNetwork.setManufacturer(aDeviceNetwork.getManufacturer() + "-update");
            aDeviceNetwork.setBrand(aDeviceNetwork.getBrand() + "-update");
            aDeviceNetwork.setSeries(aDeviceNetwork.getSeries() + "-update");
            aDeviceNetwork.setModel(aDeviceNetwork.getModel() + "-update");
            aDeviceNetwork.setStatus(aDeviceNetwork.getStatus() + "-update");
            aDeviceNetwork.setUse(aDeviceNetwork.getUse() + "-update");
            aDeviceNetwork.setUseDate(new Date());
            aDeviceNetwork.setPurchaseMethod(aDeviceNetwork.getPurchaseMethod() + "-update");
            aDeviceNetwork.setSerialNumber(aDeviceNetwork.getSerialNumber() + "-update");
            aDeviceNetwork.setManufactureDate(new Date());
            aDeviceNetwork.setServiceExpiryDate(new Date());
            aDeviceNetwork.setNetwork(aDeviceNetwork.getNetwork() + "-update");
            aDeviceNetwork.setIpAddress(aDeviceNetwork.getIpAddress() + "-update");
            int deptId = 1002; // 运检一室
            aDeviceNetwork.setMgtDeptId(deptId);
            int empId = 1002; // 王磊
            aDeviceNetwork.setMgtEmployeeId(empId);
            aDeviceNetwork.setMgtPhone(aDeviceNetwork.getMgtPhone() + "-update");
            aDeviceNetwork.setMaintenanceSupplier(aDeviceNetwork.getMaintenanceSupplier() + "-update");
            aDeviceNetwork.setMaintenanceDateStart(new Date());
            aDeviceNetwork.setMaintenanceDateEnd(new Date());

            int result = deviceNetworkDAO.updateDevice(aDeviceNetwork);

            if (result > 0) {
                logger.info("deviceNetwork: " + deviceNetworkDAO.getDeviceById(aDeviceNetwork.getId()));
            }
        }
    }

    @Test
    public void delDevice() throws Exception {
        List ids = new ArrayList();
        DeviceNetwork aDeviceNetwork = new DeviceNetwork();
        aDeviceNetwork.setName("test");
        List<DeviceNetwork> deviceNetworkList = deviceNetworkDAO.findDeviceByDevice(aDeviceNetwork);
        for (DeviceNetwork deviceNetwork : deviceNetworkList) {
            ids.add(deviceNetwork.getId());
        }
        if (ids.size() > 0){
            int result = deviceNetworkDAO.delDevice(ids);
            logger.info("已删除" + result + "条记录");
        }

    }

}