package com.moby.dao;

import com.moby.entiry.AuditDevice;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * Created by Moby on 16/8/3.
 */
public interface AuditDeviceDAO {

    AuditDevice getAuditDevice(int id);
    /**
     * 根据时间范围获取审计信息AuditDevice
     * @param start
     * @param end
     * @return
     */
    List<AuditDevice> findAuditDeviceByDatetime(@Param("start") Date start, @Param("end") Date end);

    /**
     * 增加审计信息
     * @param auditDevice
     * @return
     */
    int addAuditDevice(AuditDevice auditDevice);

    /**
     * 删除审计信息
     * @param ids
     * @return
     */
    int delAuditDevice(@Param("ids") List ids);

    /**
     * 删除审计信息
     * @param start
     * @param end
     * @return
     */
    int delAuditDeviceByDatetime(@Param("start") Date start, @Param("end") Date end);
}
