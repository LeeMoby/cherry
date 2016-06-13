package com.moby.service;


import com.moby.dto.Exposer;
import com.moby.dto.SeckillExecution;
import com.moby.entiry.Seckill;
import com.moby.exception.RepeatKillException;
import com.moby.exception.SeckillCloseException;
import com.moby.exception.SeckillException;
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
 * Created by Moby on 16/6/8.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml", "classpath:spring/spring-service.xml"})
public class SeckillServiceTest {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private SeckillService seckillService;

    @Test
    public void getSeckillList() throws Exception {
        List<Seckill> seckills = seckillService.getSeckillList();
        logger.info("seckills={}", seckills);
    }

    @Test
    public void getById() throws Exception {
        long seckillId = 1000L;
        Seckill seckill = seckillService.getById(seckillId);
        logger.info("seckill={}", seckill);
    }

    /**
     * 集成测试代码完整逻辑,可重复执行
     * @throws Exception
     */
    @Test
    public void testSeckillLogic() throws Exception{
        long seckillId = 1001L;
        Exposer exposer = seckillService.exportSeckillUrl(seckillId);
        if (exposer.isExposed()){
            logger.info("exposer={}", exposer);
            long phone = 18702954967L;
            String md5 = exposer.getMd5();
            try
            {
                SeckillExecution seckillExecution = seckillService.executeSeckill(seckillId, phone, md5);
                logger.info("seckillExecution={}", seckillExecution);
            }catch (RepeatKillException e){
                logger.error(e.getMessage());
            }catch (SeckillCloseException e){
                logger.error(e.getMessage());
            }
        }else {
            // 秒杀未开启
            logger.warn("exposer={}", exposer);
        }

    }

}