package com.moby.dao;

import com.moby.entiry.Device;
import com.moby.entiry.DeviceStorage;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Moby on 16/8/1.
 */
public interface DeviceStorageDAO extends DeviceDAO {
    DeviceStorage getDeviceById(@Param("id") int deviceID);

    List<DeviceStorage> findAllDevice();

    List<DeviceStorage> findDeviceByDevice(DeviceStorage device);

    int addDevice(DeviceStorage device);

    int updateDevice(DeviceStorage device);

    int delDevice(@Param("ids") List deviceIDs);
}
