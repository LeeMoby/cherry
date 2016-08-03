package com.moby.dao;

import com.moby.entiry.AuthUser;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import java.util.Date;

import static org.junit.Assert.*;

/**
 * Created by Moby on 16/8/3.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class AuthUserDAOTest {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Resource
    private AuthUserDAO authUserDAO;

    @Test
    public void getAuthUserById() throws Exception {
        int id = 1001;
        AuthUser authUser = authUserDAO.getAuthUserById(id);
        logger.info("authUser: " + authUser);
    }

    @Test
    public void saveAuthUserLoginRecord() throws Exception {
        int id = 1001;
        AuthUser authUser = authUserDAO.getAuthUserById(id);
        authUser.setLastLoginDatetime(new Date());
        authUser.setLastIpAddress("10.200.230.93");
        authUser.setLastBrowser("safari");
        authUser.setLastOs("macOS");
        int result = authUserDAO.saveAuthUserLoginRecord(authUser);
        if (result > 0) {
            logger.info("已保存。");
        }
    }

}