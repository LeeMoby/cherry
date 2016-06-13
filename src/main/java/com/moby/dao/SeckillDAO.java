package com.moby.dao;

import com.moby.entiry.Seckill;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * Created by Moby on 16/6/7.
 */
public interface SeckillDAO {
    /**
     * 减库存
     *
     * @param seckillId
     * @param killTime
     * @return 如果影响行数大于1, 表示更新的记录行数
     */
    int reduceNumber(@Param("seckillId") long seckillId,@Param("killTime") Date killTime);

    /**
     * 根据ID查询秒杀对象
     *
     * @param seckillId
     * @return
     */
    Seckill queryById(long seckillId);

    /**
     * 根据偏移量查询商品列表
     *
     * @param offset
     * @param limit
     * @return
     */
    List<Seckill> queryAll(@Param("offset") int offset, @Param("limit") int limit);


}
