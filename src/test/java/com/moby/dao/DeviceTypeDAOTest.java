package com.moby.dao;

import com.moby.entiry.DeviceType;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import java.util.List;

import static org.junit.Assert.*;

/**
 * Created by Moby on 16/6/8.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class DeviceTypeDAOTest {

    @Resource
    private DeviceTypeDAO deviceTypeDAO;

    @Test
    public void testGetDeviceTypeByID() throws Exception {
        int deviceTypeID = 1001;
        DeviceType deviceType = deviceTypeDAO.getDeviceTypeById(deviceTypeID);
        System.out.println(deviceType.toString());
    }

    @Test
    public void testFindAllDeviceType() throws Exception {
        List<DeviceType> deviceTypes = deviceTypeDAO.findAllDeviceType();
        for (DeviceType deviceType : deviceTypes) {
            System.out.println(deviceType.toString());
        }
    }

}