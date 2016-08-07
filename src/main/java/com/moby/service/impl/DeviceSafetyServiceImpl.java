package com.moby.service.impl;

import com.moby.dao.AuditDeviceDAO;
import com.moby.dao.DeviceSafetyDAO;
import com.moby.entiry.AuditDevice;
import com.moby.entiry.AuthUser;
import com.moby.entiry.DeviceSafety;
import com.moby.service.DeviceSafetyService;
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
public class DeviceSafetyServiceImpl implements DeviceSafetyService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private DeviceSafetyDAO deviceSafetyDAO;

    @Autowired
    private AuditDeviceDAO auditDeviceDAO;

    public DeviceSafety getDeviceById(int deviceID) {
        return deviceSafetyDAO.getDeviceById(deviceID);
    }

    public List<DeviceSafety> findAllDevice() {
        return deviceSafetyDAO.findAllDevice();
    }

    public List<DeviceSafety> findDeviceByDevice(DeviceSafety device) {
        return deviceSafetyDAO.findDeviceByDevice(device);
    }

    @Transactional
    public int addDevcie(DeviceSafety device, AuthUser authUser) {
        StringBuffer auditContent = new StringBuffer();
        auditContent.append("设备名称:");
        auditContent.append(device.getName());
        auditContent.append(",序列号:");
        auditContent.append(device.getSerialNumber());
        saveAuditDevice("新增", auditContent.toString(), authUser);
        return deviceSafetyDAO.addDevice(device);
    }

    @Transactional
    public int updateDevice(DeviceSafety device, AuthUser authUser) {
        StringBuffer auditContent = new StringBuffer();
        auditContent.append("设备名称:");
        auditContent.append(device.getName());
        auditContent.append(",序列号:");
        auditContent.append(device.getSerialNumber());
        saveAuditDevice("更新", auditContent.toString(), authUser);
        return deviceSafetyDAO.updateDevice(device);
    }

    @Transactional
    public int delDevice(List deviceIDs, AuthUser authUser) {
        StringBuffer auditContent = new StringBuffer();
        for (int i = 0; i < deviceIDs.size(); i++){
            DeviceSafety device = this.getDeviceById(Integer.parseInt(deviceIDs.get(i).toString()));
            auditContent.append("设备名称:");
            auditContent.append(device.getName());
            auditContent.append(",序列号:");
            auditContent.append(device.getSerialNumber());
            auditContent.append("; ");
        }
        auditContent.deleteCharAt(auditContent.length() - 1);
        saveAuditDevice("删除", auditContent.toString(), authUser);
        return deviceSafetyDAO.delDevice(deviceIDs);
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
