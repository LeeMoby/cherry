package com.moby.service;

import com.moby.entiry.Device;
import com.moby.entiry.DeviceType;

import java.util.List;

/**
 * Created by Moby on 16/6/13.
 */
public interface DeviceTypeService {

    /**
     * 根据ID获取DeviceType
     * @param deviceTypeID
     * @return
     */
    DeviceType getDeviceTypeByID(Long deviceTypeID);

    /**
     * 获取所有DeviceType
     * @return
     */
    List<DeviceType> findAllDeviceType();

}
