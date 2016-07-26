package com.moby.dao;

import com.moby.entiry.Device;
import org.junit.Test;
import org.junit.runner.RunWith;
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
    @Resource
    private DeviceDAO deviceDAO;
    @Test
    public void getDeviceByID() throws Exception {
        long deviceId = 1000L;
        Device device = deviceDAO.getDeviceByID(deviceId);
        System.out.println(device.toString());
    }

    @Test
    public void findAllDevice() throws Exception {
        List<Device> list = deviceDAO.findAllDevice();
        for (Device device : list){
            System.out.println(device.toString());
        }
    }

    @Test
    public void findDeviceByDevice() throws Exception {
        //Device deviceParam = deviceDAO.getDeviceByID(1000L);
        Device deviceParam = new Device();
        deviceParam.setCid(1014L);
        List<Device>  list = deviceDAO.findDeviceByDevice(deviceParam);
        for (Device device : list){
            System.out.println(device.toString());
        }
    }

    @Test
    public void addDevice() throws Exception {
//        Device deviceParam = new Device();
//        deviceParam.setDname("设备名称");
//        deviceParam.setDtid(1002L);
//        deviceParam.setDno("设备编号");
//        deviceParam.setCid(1012L);
//        deviceParam.setDplace("机柜内位置(U数)");
//        deviceParam.setDmodel("设备型号");
//        deviceParam.setDcode("资产编码");
//        deviceParam.setDip("设备IP地址");
//        deviceParam.setDstatus("设备状态");
//        deviceParam.setUseDate(new Date());
//        deviceParam.setPsupplier("供应商名称");
//        deviceParam.setDepartment("运维单位");
//        deviceParam.setNettype("网络类型");
//        deviceParam.setPerson("责任人");
//        deviceParam.setOid("OID");
//        deviceParam.setDefid("DEFID");
//        deviceParam.setFid("FID");
//        deviceParam.setProjectid("项目ID");
//        deviceParam.setOriginalValue("资产原值");
//        deviceParam.setSerialNumber("序列号");
//        int count = deviceDAO.addDevice(deviceParam);
//        System.out.println("新增" + count + "条记录");
//        this.findAllDevice();

    }

    @Test
    public void updateDevice() throws Exception {
//        Device device = deviceDAO.getDeviceByID(1005L);
//        device.setDname("设备名称" + "111");
//        device.setDtid(1003L);
//        device.setDno("设备编号" + "111");
//        device.setCid(1013L);
//        device.setDplace("机柜内位置(U数)" + "111");
//        device.setDmodel("设备型号" + "111");
//        device.setDcode("资产编码" + "111");
//        device.setDip("设备IP地址" + "111");
//        device.setDstatus("设备状态" + "111");
//        device.setUseDate(new Date());
//        device.setPsupplier("供应商名称" + "111");
//        device.setDepartment("运维单位" + "111");
//        device.setNettype("网络类型" + "111");
//        device.setPerson("责任人" + "111");
//        device.setOid("OID" + "111");
//        device.setDefid("DEFID" + "111");
//        device.setFid("FID" + "111");
//        device.setProjectid("项目ID" + "111");
//        device.setOriginalValue("资产原值" + "111");
//        device.setSerialNumber("序列号" + "111");
//        int count = deviceDAO.updateDevice(device);
//        System.out.println("更新" + count + "条记录");
//        this.findAllDevice();
    }

    @Test
    public void delDevice() throws Exception {
//        List deviceIDs = new ArrayList();
//        deviceIDs.add("1006");
//        deviceIDs.add("1007");
//        int count = deviceDAO.delDevice(deviceIDs);
//        System.out.println("删除" + count + "条记录");
//        this.findAllDevice();
    }

}