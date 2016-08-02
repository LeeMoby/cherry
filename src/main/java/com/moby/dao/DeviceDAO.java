package com.moby.dao;

import com.moby.entiry.Device;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Moby on 16/6/8.
 */
public interface DeviceDAO {
    /**
     * 根据ID获取Device
     * @param deviceID
     * @return
     */
    Device getDeviceById(@Param("id") int deviceID);

    /**
     * 获取所有Device
     * @return
     */
    List findAllDevice();

    /**
     * 根据device多条件获取device
     * @param device
     * @return
     */
    List<Device> findDeviceByDevice(Device device);

    /**
     * 新增device
     * @param device
     * @return
     */
    int addDevice(Device device);

    /**
     * 修改device
     * @param device
     * @return
     */
    int updateDevice(Device device);

    /**
     * 删除device
     * @param deviceIDs
     * @return
     */
    int delDevice(@Param("ids") List deviceIDs);
}
