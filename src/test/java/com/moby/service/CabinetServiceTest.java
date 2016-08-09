package com.moby.service;

import com.moby.entiry.Cabinet;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

import static org.junit.Assert.*;

/**
 * Created by Moby on 16/6/27.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml", "classpath:spring/spring-service.xml"})
public class CabinetServiceTest {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Resource
    private CabinetService cabinetService;

    @Test
    public void getCabinetByID() throws Exception {

    }

    @Test
    public void findAllCabinet() throws Exception {
        List<Cabinet> cabinetList = cabinetService.findAllCabinet();
        for (Cabinet cabinet : cabinetList) {
            logger.info("cabinet:" + cabinet);
        }
    }

}