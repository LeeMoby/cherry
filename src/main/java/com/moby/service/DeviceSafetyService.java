package com.moby.service;


import com.moby.entiry.AuthUser;
import com.moby.entiry.DeviceOther;
import com.moby.entiry.DeviceSafety;

import java.util.List;

/**
 * Created by Moby on 16/6/13.
 */
public interface DeviceSafetyService {

    /**
     * 根据ID获取Device
     * @param deviceID
     * @return
     */
    DeviceSafety getDeviceById(int deviceID);

    /**
     * 获取全部Device
     * @return
     */
    List<DeviceSafety> findAllDevice();

    /**
     * 根据多条件获取Device
     * @param device
     * @return
     */
    List<DeviceSafety> findDeviceByDevice(DeviceSafety device);

    /**
     * 新增Device
     * @param device
     * @return
     */
    int addDevcie(DeviceSafety device, AuthUser authUser);

    /**
     * 更新Device
     * @param device
     * @return
     */
    int updateDevice(DeviceSafety device, AuthUser authUser);

    /**
     * 根据ID删除Device,多个用英文逗号分隔
     * @param deviceIDs
     * @return
     */
    int delDevice(List deviceIDs, AuthUser authUser);

    /**
     * 导出全部设备,Excel格式
     * @return
     */
    byte[] expAllDevice2Excel() throws Exception;

}
