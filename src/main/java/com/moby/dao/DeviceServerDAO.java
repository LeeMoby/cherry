package com.moby.dao;

import com.moby.entiry.Device;
import com.moby.entiry.DeviceServer;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Moby on 16/8/1.
 */
public interface DeviceServerDAO extends DeviceDAO {
    DeviceServer getDeviceById(@Param("id") int deviceID);

    List<DeviceServer> findAllDevice();

    List<DeviceServer> findDeviceByDevice(DeviceServer device);

    int addDevice(DeviceServer device);

    int updateDevice(DeviceServer device);

    int delDevice(@Param("ids") List deviceIDs);
}
