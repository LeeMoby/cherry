package com.moby.dao;

import com.moby.entiry.Device;
import com.moby.entiry.DeviceOther;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Moby on 16/8/1.
 */
public interface DeviceOtherDAO extends DeviceDAO {
    DeviceOther getDeviceById(@Param("id") int deviceID);

    List<DeviceOther> findAllDevice();

    List<DeviceOther> findDeviceByDevice(DeviceOther device);

    int addDevice(DeviceOther device);

    int updateDevice(DeviceOther device);

    int delDevice(@Param("ids") List deviceIDs);
}
