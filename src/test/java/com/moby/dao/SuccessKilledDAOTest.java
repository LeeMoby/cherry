package com.moby.dao;

import com.moby.entiry.SuccessKilled;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import static org.junit.Assert.*;

/**
 * Created by Moby on 16/6/7.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class SuccessKilledDAOTest {
    //注入DAO实现类
    @Resource
    private SuccessKilledDAO successKilledDAO;

    @Test
    public void insertSuccessKilled() throws Exception {
        long id = 1001L;
        long phone = 15002954967L;
        int insertCount = successKilledDAO.insertSuccessKilled(id, phone);
        System.out.println("insertCount=" + insertCount);
    }

    @Test
    public void queryByIdWithSeckill() throws Exception {
        long id = 1001L;
        long phone = 15002954967L;
        SuccessKilled successKilled = successKilledDAO.queryByIdWithSeckill(id, phone);
        System.out.println(successKilled);
        System.out.println(successKilled.getSeckill());

    }

}