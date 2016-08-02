package com.moby.dao;

import com.moby.entiry.Device;
import com.moby.entiry.DeviceNetwork;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Moby on 16/8/1.
 */
public interface DeviceNetworkDAO extends DeviceDAO {
    DeviceNetwork getDeviceById(@Param("id") int deviceID);

    List<DeviceNetwork> findAllDevice();

    List<DeviceNetwork> findDeviceByDevice(DeviceNetwork device);

    int addDevice(DeviceNetwork device);

    int updateDevice(DeviceNetwork device);

    int delDevice(@Param("ids") List deviceIDs);
}
