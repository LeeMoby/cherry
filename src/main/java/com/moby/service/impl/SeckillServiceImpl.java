package com.moby.service.impl;

import com.moby.dao.SeckillDAO;
import com.moby.dao.SuccessKilledDAO;
import com.moby.dto.Exposer;
import com.moby.dto.SeckillExecution;
import com.moby.entiry.Seckill;
import com.moby.entiry.SuccessKilled;
import com.moby.enums.SeckillStatEnum;
import com.moby.exception.RepeatKillException;
import com.moby.exception.SeckillCloseException;
import com.moby.exception.SeckillException;
import com.moby.service.SeckillService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.DigestUtils;

import java.util.Date;
import java.util.List;

/**
 * Created by Moby on 16/6/8.
 *
 */
// @Component @Service @DAO @Controller
@Service
public class SeckillServiceImpl implements SeckillService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    //注入Service依赖 @Autowired @Resource @Inject
    @Autowired
    private SeckillDAO seckillDAO;

    @Autowired
    private SuccessKilledDAO successKilledDAO;
    //md5盐值字符串,用户混淆MD5
    private final String slat = "h;9ki,*tux@xpiYpvmgp#Mf6sSeJ5uTo";

    public List<Seckill> getSeckillList() {
        return seckillDAO.queryAll(0, 4);
    }

    public Seckill getById(long seckillId) {
        return seckillDAO.queryById(seckillId);
    }

    public Exposer exportSeckillUrl(long seckillId) {
        Seckill seckill = seckillDAO.queryById(seckillId);
        if (seckill == null) {
            return new Exposer(false, seckillId);
        }
        Date startTime = seckill.getStartTime();
        Date endTime = seckill.getEndTime();
        // 系统当前时间
        Date nowTime = new Date();
        if (nowTime.getTime() < startTime.getTime() || nowTime.getTime() > endTime.getTime()) {
            return new Exposer(false, seckillId, nowTime.getTime(), startTime.getTime(), endTime.getTime());
        }
        // 转化特定字符串,不可逆
        String md5 = this.getMD5(seckillId);
        return new Exposer(true, seckillId, md5);
    }

    @Transactional
    /**
     * 使用注解控制事务的优点:
     * 1.开发团队达成一致约定,明确标注事务方法的编程风格
     * 2.保证事务方法的执行时间尽可能短,不要穿插其它的网络操作,RPC/HTTP请求或者剥离到事务方法外部
     * 3.不是所有的方法都需要事务,如只有一条修改操作,只读操作不需要事务控制
     */
    public SeckillExecution executeSeckill(long seckillId, long userPhone, String md5) throws SeckillException, RepeatKillException, SeckillException {
        if (md5 == null || !md5.equals(this.getMD5(seckillId))) {
            throw new SeckillException("秒杀数据被重写");
        }
        try {
            // 执行秒杀业务逻辑:减库存,记录购买行为
            Date nowDate = new Date();
            int updateCount = seckillDAO.reduceNumber(seckillId, nowDate);
            if (updateCount <= 0) {
                //没有更新到记录
                throw new SeckillCloseException("秒杀结束");
            } else {
                //记录购买行为
                int insertCount = successKilledDAO.insertSuccessKilled(seckillId, userPhone);
                if (insertCount <= 0) {
                    //重复秒杀
                    throw new RepeatKillException("重复秒杀");
                } else {
                    //秒杀成功
                    SuccessKilled successKilled = successKilledDAO.queryByIdWithSeckill(seckillId, userPhone);
                    return new SeckillExecution(seckillId, SeckillStatEnum.SUCCESS, successKilled);
                }
            }
        } catch (SeckillCloseException e) {
            throw e;
        } catch (RepeatKillException e) {
            throw e;
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            // 编译期异常转化为运行期异常
            throw new SeckillException("内部错误" + e.getMessage());
        }
    }

    private String getMD5(long seckillId) {
        String base = seckillId + "/" + slat;
        String md5 = DigestUtils.md5DigestAsHex(base.getBytes());
        return md5;
    }
}
