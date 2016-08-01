package com.moby.service.impl;

import com.moby.dao.DeviceTypeDAO;
import com.moby.entiry.DeviceType;
import com.moby.service.DeviceTypeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Moby on 16/6/13.
 */
@Service
public class DeviceTypeServiceImpl implements DeviceTypeService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private DeviceTypeDAO deviceTypeDAO;

    public DeviceType getDeviceTypeById(int deviceTypeID) {
        return deviceTypeDAO.getDeviceTypeById(deviceTypeID);
    }

    public List<DeviceType> findAllDeviceType() {
        return deviceTypeDAO.findAllDeviceType();
    }
}
