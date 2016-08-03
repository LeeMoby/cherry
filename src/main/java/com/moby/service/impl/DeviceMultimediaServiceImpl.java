package com.moby.service.impl;

import com.moby.dao.AuditDeviceDAO;
import com.moby.dao.DeviceMultimediaDAO;
import com.moby.entiry.AuditDevice;
import com.moby.entiry.AuthUser;
import com.moby.entiry.DeviceMultimedia;
import com.moby.service.DeviceMultimediaService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * Created by Moby on 16/8/3.
 */
@Service
public class DeviceMultimediaServiceImpl implements DeviceMultimediaService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private DeviceMultimediaDAO deviceMultimediaDAO;

    @Autowired
    private AuditDeviceDAO auditDeviceDAO;

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
    public int addDevcie(DeviceMultimedia device, AuthUser authUser) {
        StringBuffer auditContent = new StringBuffer();
        auditContent.append("设备名称:");
        auditContent.append(device.getName());
        auditContent.append(",序列号:");
        auditContent.append(device.getSerialNumber());
        saveAuditDevice("新增", auditContent.toString(), authUser);
        return deviceMultimediaDAO.addDevice(device);
    }

    @Transactional
    public int updateDevice(DeviceMultimedia device, AuthUser authUser) {
        StringBuffer auditContent = new StringBuffer();
        auditContent.append("设备名称:");
        auditContent.append(device.getName());
        auditContent.append(",序列号:");
        auditContent.append(device.getSerialNumber());
        saveAuditDevice("更新", auditContent.toString(), authUser);
        return deviceMultimediaDAO.updateDevice(device);
    }

    @Transactional
    public int delDevice(List deviceIDs, AuthUser authUser) {
        StringBuffer auditContent = new StringBuffer();
        for (int i = 0; i < deviceIDs.size(); i++){
            DeviceMultimedia device = this.getDeviceById(Integer.parseInt(deviceIDs.get(i).toString()));
            auditContent.append("设备名称:");
            auditContent.append(device.getName());
            auditContent.append(",序列号:");
            auditContent.append(device.getSerialNumber());
            auditContent.append("; ");
        }
        auditContent.deleteCharAt(auditContent.length() - 1);
        saveAuditDevice("删除", auditContent.toString(), authUser);
        return deviceMultimediaDAO.delDevice(deviceIDs);
    }

    public byte[] expAllDevice2Excel() throws Exception {
        return new byte[0];
    }

    /**
     * 设备操作审计
     * @param type
     * @param authUser
     * @return
     */
    private int saveAuditDevice(String type, String content, AuthUser authUser){
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
