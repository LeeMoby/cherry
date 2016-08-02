package com.moby.dao;



import com.moby.entiry.DeviceMultimedia;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Moby on 16/8/1.
 */
public interface DeviceMultimediaDAO extends DeviceDAO {
    DeviceMultimedia getDeviceById(@Param("id") int deviceID);

    List<DeviceMultimedia> findAllDevice();

    List<DeviceMultimedia> findDeviceByDevice(DeviceMultimedia device);

    int addDevice(DeviceMultimedia device);

    int updateDevice(DeviceMultimedia device);

    int delDevice(@Param("ids") List deviceIDs);
}
