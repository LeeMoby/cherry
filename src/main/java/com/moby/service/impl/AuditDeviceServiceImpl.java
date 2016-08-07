package com.moby.service.impl;

import com.moby.dao.AuditDeviceDAO;
import com.moby.entiry.AuditDevice;
import com.moby.entiry.AuthUser;
import com.moby.service.AuditDeviceService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * Created by Moby on 16/8/7.
 */
@Service
public class AuditDeviceServiceImpl implements AuditDeviceService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private AuditDeviceDAO auditDeviceDAO;

    public int saveAuditDevice(String type, String content, AuthUser authUser) {
        AuditDevice auditDevice = new AuditDevice();
        auditDevice.setType(type);
        auditDevice.setDatetime(new Date());
        auditDevice.setUserId(authUser.getId());
        auditDevice.setIpAddress(authUser.getLastIpAddress());
        auditDevice.setBrowser(authUser.getLastBrowser());
        auditDevice.setOs(authUser.getLastOs());
        auditDevice.setContent(content);

        return auditDeviceDAO.addAuditDevice(auditDevice);
    }
}
