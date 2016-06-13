package com.moby.service;

import com.moby.dto.Exposer;
import com.moby.dto.SeckillExecution;
import com.moby.entiry.Seckill;
import com.moby.exception.RepeatKillException;
import com.moby.exception.SeckillException;

import java.util.List;

/**
 * 业务接口:站在用户角度设计接口
 * 1.方法定义粒度
 * 2.参数简洁
 * 3.返回类型友好
 */
public interface SeckillService {
    /**
     * 查询所有记录
     *
     * @return
     */
    List<Seckill> getSeckillList();

    /**
     * 查询单个记录
     *
     * @param seckillId
     * @return
     */
    Seckill getById(long seckillId);

    /**
     * 秒杀开启时输出秒杀接口的地址
     * 否则输出系统时间和秒杀时间
     *
     * @param seckillId
     * @return
     */
    Exposer exportSeckillUrl(long seckillId);

    /**
     * 执行秒杀操作
     * @param seckillId
     * @param userPhone
     * @param md5
     * @return
     * @throws SeckillException
     * @throws RepeatKillException
     * @throws SeckillException
     */
    SeckillExecution executeSeckill(long seckillId, long userPhone, String md5)
            throws SeckillException, RepeatKillException, SeckillException;
}
