package com.moby.service.impl;

import com.moby.dao.DeviceDAO;
import com.moby.entiry.Device;
import com.moby.service.DeviceService;
import org.apache.poi.hssf.usermodel.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.ByteArrayOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Moby on 16/6/13.
 */
@Service
public class DeviceServiceImpl implements DeviceService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    private SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-DD");

    @Autowired
    private DeviceDAO deviceDAO;

    public Device getDeviceById(int deviceID) {
        return deviceDAO.getDeviceById(deviceID);
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

    public int delDevice(List deviceIDs) {
        return deviceDAO.delDevice(deviceIDs);
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
        heads.add("编号");
        heads.add("名称");
        heads.add("位置");
        heads.add("责任人");
        heads.add("投运日期");
        heads.add("所属网络");
        heads.add("设备型号");
        heads.add("资产编码");
        heads.add("IP地址");
        heads.add("设备状态");
        heads.add("序列号");
        HSSFCell cell = null;
        for (int i = 0; i < heads.size(); i++){
            cell = row.createCell(i);
            cell.setCellValue(heads.get(i));
            cell.setCellStyle(headStyle);
        }

        List<Device> devices = deviceDAO.findAllDevice();
        Device device = null;
        for (int i = 0; i < devices.size(); i++){
            row = sheet.createRow(i + 1);
            device = devices.get(i);
            int j = 0;
            insertCell(row, j++, device.getCode());
            insertCell(row, j++, device.getName());
            insertCell(row, j++, device.getCabinet().getName() + " " + device.getCabinetPosition());
            insertCell(row, j++, device.getEmployee().getName());
            insertCell(row, j++, sdf.format(device.getUseDate()));
            insertCell(row, j++, device.getNetwork());
            insertCell(row, j++, device.getBrand() + " " + device.getSeries() + " " + device.getModel());
            insertCell(row, j++, device.getCodeSgcc());
            insertCell(row, j++, device.getIpAddress());
            insertCell(row, j++, device.getStatus());
            insertCell(row, j++, device.getSerialNumber());

        }
        wb.write(out);
        return out.toByteArray();
    }

    private void insertCell(HSSFRow row, int i, Object object){
        if(object == null){
            row.createCell(i).setCellValue("");
        }else{
            row.createCell(i).setCellValue(object.toString());
        }

    }

}

