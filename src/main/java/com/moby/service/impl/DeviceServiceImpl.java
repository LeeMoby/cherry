package com.moby.service.impl;

import com.moby.dao.DeviceDAO;
import com.moby.entiry.Device;
import com.moby.service.DeviceService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Moby on 16/6/13.
 */
@Service
public class DeviceServiceImpl implements DeviceService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private DeviceDAO deviceDAO;

    public Device getDeviceById(Long deviceID) {
        return deviceDAO.getDeviceByID(deviceID);
    }

    public List<Device> findAllDevice() {
        return deviceDAO.findAllDevice();
    }

    public List<Device> findDeviceByDevice(Device device) {
        return deviceDAO.findDeviceByDevice(device);
    }

    public int addDevcie(Device device) {
        return deviceDAO.addDevice(device);
    }

    public int updateDevice(Device device) {
        return deviceDAO.updateDevice(device);
    }

    public int delDevice(Long deviceID) {
        return deviceDAO.delDevice(deviceID);
    }
}
