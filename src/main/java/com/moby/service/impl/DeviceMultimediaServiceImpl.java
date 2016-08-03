package com.moby.service.impl;

import com.moby.dao.DeviceMultimediaDAO;
import com.moby.entiry.DeviceMultimedia;
import com.moby.service.DeviceMultimediaService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Moby on 16/8/3.
 */
@Service
public class DeviceMultimediaServiceImpl implements DeviceMultimediaService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private DeviceMultimediaDAO deviceMultimediaDAO;

    public DeviceMultimedia getDeviceById(int deviceID) {
        return deviceMultimediaDAO.getDeviceById(deviceID);
    }

    public List<DeviceMultimedia> findAllDevice() {
        return deviceMultimediaDAO.findAllDevice();
    }

    public List<DeviceMultimedia> findDeviceByDevice(DeviceMultimedia device) {
        return deviceMultimediaDAO.findDeviceByDevice(device);
    }

    @Transactional
    public int addDevcie(DeviceMultimedia device) {
        return 0;
    }

    @Transactional
    public int updateDevice(DeviceMultimedia device) {
        return 0;
    }

    @Transactional
    public int delDevice(List deviceIDs) {
        return 0;
    }

    public byte[] expAllDevice2Excel() throws Exception {
        return new byte[0];
    }
}
