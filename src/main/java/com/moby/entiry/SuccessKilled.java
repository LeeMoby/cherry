package com.moby.entiry;

import java.util.Date;

/**
 * Created by Moby on 16/6/7.
 */
public class SuccessKilled {
    private long seckillId;
    private long usePhone;
    private short state;
    private Date createTime;

    private Seckill seckill;

    public long getSeckillId() {
        return seckillId;
    }

    public void setSeckillId(long seckillId) {
        this.seckillId = seckillId;
    }

    public long getUsePhone() {
        return usePhone;
    }

    public void setUsePhone(long usePhone) {
        this.usePhone = usePhone;
    }

    public short getState() {
        return state;
    }

    public void setState(short state) {
        this.state = state;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Seckill getSeckill() {
        return seckill;
    }

    public void setSeckill(Seckill seckill) {
        this.seckill = seckill;
    }

    @Override
    public String toString() {
        return "SuccessKilled{" +
                "seckillId=" + seckillId +
                ", usePhone=" + usePhone +
                ", state=" + state +
                ", createTime=" + createTime +
                '}';
    }
}
