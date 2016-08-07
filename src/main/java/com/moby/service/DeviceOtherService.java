package com.moby.service;


import com.moby.entiry.AuthUser;
import com.moby.entiry.DeviceNetwork;
import com.moby.entiry.DeviceOther;

import java.util.List;

/**
 * Created by Moby on 16/6/13.
 */
public interface DeviceOtherService {

    /**
     * 根据ID获取Device
     * @param deviceID
     * @return
     */
    DeviceOther getDeviceById(int deviceID);

    /**
     * 获取全部Device
     * @return
     */
    List<DeviceOther> findAllDevice();

    /**
     * 根据多条件获取Device
     * @param device
     * @return
     */
    List<DeviceOther> findDeviceByDevice(DeviceOther device);

    /**
     * 新增Device
     * @param device
     * @return
     */
    int addDevcie(DeviceOther device, AuthUser authUser);

    /**
     * 更新Device
     * @param device
     * @return
     */
    int updateDevice(DeviceOther device, AuthUser authUser);

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
