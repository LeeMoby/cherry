package com.moby.service;

import com.moby.entiry.Device;
import com.moby.entiry.DeviceType;

import java.util.List;

/**
 * Created by Moby on 16/6/13.
 */
public interface DeviceService {

    /**
     * 根据ID获取Device
     * @param deviceID
     * @return
     */
    Device getDeviceById(Long deviceID);

    /**
     * 获取全部Device
     * @return
     */
    List<Device> findAllDevice();

    /**
     * 根据多条件获取Device
     * @param device
     * @return
     */
    List<Device> findDeviceByDevice(Device device);

    /**
     * 新增Device
     * @param device
     * @return
     */
    int addDevcie(Device device);

    /**
     * 更新Device
     * @param device
     * @return
     */
    int updateDevice(Device device);

    /**
     * 根据ID删除Device
     * @param deviceID
     * @return
     */
    int delDevice(Long deviceID);

}
