package com.moby.dao;

import com.moby.entiry.Device;
import com.moby.entiry.DeviceSafety;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Moby on 16/8/1.
 */
public interface DeviceSafetyDAO extends DeviceDAO {
    DeviceSafety getDeviceById(@Param("id") int deviceID);

    List<DeviceSafety> findAllDevice();

    List<DeviceSafety> findDeviceByDevice(DeviceSafety device);

    int addDevice(DeviceSafety device);

    int updateDevice(DeviceSafety device);

    int delDevice(@Param("ids") List deviceIDs);
}
