package com.moby.web;

import com.moby.service.DeviceOtherService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

/**
 * Created by Moby on 16/8/8.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml", "classpath:spring/spring-web.xml"})
public class DeviceOtherControllerTest {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private DeviceOtherService deviceOtherService;

    @Test
    public void deviceHome() throws Exception {

    }

    @Test
    public void deviceDetail() throws Exception {

    }

    @Test
    public void addDevice() throws Exception {

    }

    @Test
    public void saveDevice() throws Exception {

    }

    @Test
    public void deleteDevice() throws Exception {

    }

    @Test
    public void expAllDevice2Excel() throws Exception {

    }

    @Test
    public void findDeviceByDevice() throws Exception {

    }

}