package com.moby.service;

import com.moby.entiry.DeviceType;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.*;

/**
 * Created by Moby on 16/6/15.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml", "classpath:spring/spring-service.xml"})
public class DeviceTypeServiceTest {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private DeviceTypeService deviceTypeService;
    @Test
    public void getDeviceTypeByID() throws Exception {

    }

    @Test
    public void findAllDeviceType() throws Exception {
        List<DeviceType> list = deviceTypeService.findAllDeviceType();
        for (DeviceType deviceType : list){
            logger.info("deviceType={}", deviceType);
        }
    }

}