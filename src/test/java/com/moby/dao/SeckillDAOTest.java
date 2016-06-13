package com.moby.dao;

import com.moby.entiry.Seckill;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import java.util.Date;
import java.util.List;

import static org.junit.Assert.*;

/**
 * 配置spring和junit整合,junit启东时加载springIOC容器
 * Spring-test,junit
 */
@RunWith(SpringJUnit4ClassRunner.class)
//告诉junit spring配置文件
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class SeckillDAOTest {
    //注入DAO实现类
    @Resource
    private SeckillDAO seckillDAO;

    @Test
    public void testQueryById() throws Exception {
        long id = 1000;
        Seckill seckill = seckillDAO.queryById(id);
        System.out.println(seckill.getName());
        System.out.println(seckill.toString());
    }

    @Test
    public void testQueryAll() throws Exception {
        List<Seckill> seckills = seckillDAO.queryAll(0, 100);
        for(Seckill seckill:seckills){
            System.out.println(seckill);
        }

    }

    @Test
    public void testReduceNumber() throws Exception {
        Date killTime = new Date();
        int updateCount = seckillDAO.reduceNumber(1000L, killTime);
        System.out.println("updateCount:" + updateCount);
    }

}