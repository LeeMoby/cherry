package com.moby.service.impl;

import com.moby.dao.AuditDeviceDAO;
import com.moby.dao.DeviceMultimediaDAO;
import com.moby.entiry.AuditDevice;
import com.moby.entiry.AuthUser;
import com.moby.entiry.Device;
import com.moby.entiry.DeviceMultimedia;
import com.moby.service.DeviceMultimediaService;
import org.apache.poi.hssf.usermodel.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.ByteArrayOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Moby on 16/8/3.
 */
@Service
public class DeviceMultimediaServiceImpl implements DeviceMultimediaService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    private SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-DD");

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
        for (int i = 0; i < deviceIDs.size(); i++) {
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
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        HSSFWorkbook wb = new HSSFWorkbook();
        HSSFSheet sheet = wb.createSheet("设备台账");
        HSSFRow row = sheet.createRow(0);
        HSSFCellStyle headStyle = wb.createCellStyle();
        headStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        headStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);

        List<String> heads = new ArrayList<String>();
        heads.add("类型");
        heads.add("名称");
        heads.add("编号");
        heads.add("国网编号");
        heads.add("机房");
        heads.add("机柜");
        heads.add("机架号");
        heads.add("制造商");
        heads.add("品牌");
        heads.add("系列");
        heads.add("型号");
        heads.add("设备状态");
        heads.add("用途");
        heads.add("投运日期");
        heads.add("采购方式");
        heads.add("序列号");
        heads.add("出厂日期");
        heads.add("售后服务到期时间");
        heads.add("所属网络");
        heads.add("IP地址");
        heads.add("设备管理部门");
        heads.add("运维责任人");
        heads.add("运维联系电话");
        heads.add("维保厂商");
        heads.add("维保开始日期");
        heads.add("维保结束日期");

        HSSFCell cell = null;
        for (int i = 0; i < heads.size(); i++) {
            cell = row.createCell(i);
            cell.setCellValue(heads.get(i));
            cell.setCellStyle(headStyle);
        }

        List<DeviceMultimedia> devices = deviceMultimediaDAO.findAllDevice();
        Device device;
        for (int i = 0; i < devices.size(); i++) {
            row = sheet.createRow(i + 1);
            device = devices.get(i);
            int j = 0;
            insertCell(wb, row, j++, device.getDeviceType() != null ? device.getDeviceType().getName() : "");
            insertCell(wb, row, j++, device.getName());
            insertCell(wb, row, j++, device.getCode());
            insertCell(wb, row, j++, device.getCodeSgcc());
            insertCell(wb, row, j++, device.getRoom() != null ? device.getRoom().getName() : "");
            insertCell(wb, row, j++, device.getCabinet() != null ? device.getCabinet().getName() : "");
            insertCell(wb, row, j++, device.getCabinetPosition());
            insertCell(wb, row, j++, device.getManufacturer());
            insertCell(wb, row, j++, device.getBrand());
            insertCell(wb, row, j++, device.getSeries());
            insertCell(wb, row, j++, device.getModel());
            insertCell(wb, row, j++, device.getStatus());
            insertCell(wb, row, j++, device.getUse());
            insertCell(wb, row, j++, device.getUseDate() != null ? sdf.format(device.getUseDate()) : "");
            insertCell(wb, row, j++, device.getPurchaseMethod());
            insertCell(wb, row, j++, device.getSerialNumber());
            insertCell(wb, row, j++, device.getManufactureDate() != null ? sdf.format(device.getManufactureDate()) : "");
            insertCell(wb, row, j++, device.getServiceExpiryDate() != null ? sdf.format(device.getServiceExpiryDate()) : "");
            insertCell(wb, row, j++, device.getNetwork());
            insertCell(wb, row, j++, device.getIpAddress());
            insertCell(wb, row, j++, device.getDepartment() != null ? device.getDepartment().getName() : "");
            insertCell(wb, row, j++, device.getEmployee() != null ? device.getEmployee().getName() : "");
            insertCell(wb, row, j++, device.getMgtPhone());
            insertCell(wb, row, j++, device.getMaintenanceSupplier());
            insertCell(wb, row, j++, device.getMaintenanceDateStart() != null ? sdf.format(device.getMaintenanceDateStart()) : "");
            insertCell(wb, row, j++, device.getMaintenanceDateEnd() != null ? sdf.format(device.getMaintenanceDateEnd()) : "");

        }
        for (int i = 0; i < heads.size(); i++) {
            sheet.autoSizeColumn((short) i);
        }
        wb.write(out);
        return out.toByteArray();
    }

    /**
     * 设备操作审计
     *
     * @param type
     * @param authUser
     * @return
     */
    private int saveAuditDevice(String type, String content, AuthUser authUser) {
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

    private void insertCell(HSSFWorkbook wb, HSSFRow row, int i, Object object) {
        HSSFCell cell = row.createCell(i);
        cell.setCellStyle(this.getCellStyle(wb));
        if (object == null) {
            cell.setCellValue("");
        } else {
            cell.setCellValue(object.toString());
        }

    }

    private HSSFCellStyle getCellStyle(HSSFWorkbook wb) {
        HSSFCellStyle cellStyle = wb.createCellStyle();
        cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);

        return cellStyle;
    }
}
