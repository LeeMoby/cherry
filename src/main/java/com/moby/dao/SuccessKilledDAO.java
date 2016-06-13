package com.moby.dao;

import com.moby.entiry.SuccessKilled;
import org.apache.ibatis.annotations.Param;

/**
 * Created by Moby on 16/6/7.
 */
public interface SuccessKilledDAO {
    /**
     * 插入购买明细,可过滤重复
     * @param seckillId
     * @param userPhone
     * @return 插入的行数
     */
    int insertSuccessKilled(@Param("seckillId") long seckillId,@Param("userPhone") long userPhone);

    /**
     * 根据ID查询SuccessKilled并携带秒杀产品对象实体
     * @param seckillId
     * @return
     */
    SuccessKilled queryByIdWithSeckill(@Param("seckillId") long seckillId,@Param("userPhone") long userPhone);
}
