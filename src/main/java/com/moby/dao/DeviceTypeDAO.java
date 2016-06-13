package com.moby.dao;

import com.moby.entiry.DeviceType;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Moby on 16/6/8.
 */
public interface DeviceTypeDAO {
    /**
     * 根据ID获取DeviceType
     * @param deviceTypeID
     * @return
     */
    DeviceType getDeviceTypeByID(@Param("deviceTypeID") long deviceTypeID);

    /**
     * 获取所有DeviceType
     * @return
     */
    List<DeviceType> findAllDeviceType();

}
