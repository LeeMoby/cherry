package com.moby.service.impl;

import com.moby.dao.AuditDeviceDAO;
import com.moby.dao.DeviceServerDAO;
import com.moby.entiry.*;
import com.moby.service.DeviceServerService;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.ss.util.CellRangeAddressList;
import org.jdom2.Attribute;
import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.JDOMException;
import org.jdom2.input.SAXBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Moby on 16/8/3.
 */
@Service
public class DeviceServerServiceImpl implements DeviceServerService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    private SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-DD");
    @Autowired
    private DeviceServerDAO devicServerDAO;

    @Autowired
    private AuditDeviceDAO auditDeviceDAO;

    public DeviceServer getDeviceById(int deviceID) {
        return devicServerDAO.getDeviceById(deviceID);
    }

    public List<DeviceServer> findAllDevice() {
        return devicServerDAO.findAllDevice();
    }

    public List<DeviceServer> findDeviceByDevice(DeviceServer device) {
        return devicServerDAO.findDeviceByDevice(device);
    }

    @Transactional
    public int addDevcie(DeviceServer device, AuthUser authUser) {
        StringBuffer auditContent = new StringBuffer();
        auditContent.append("设备名称:");
        auditContent.append(device.getName());
        auditContent.append(",序列号:");
        auditContent.append(device.getSerialNumber());
        saveAuditDevice("新增", auditContent.toString(), authUser);
        return devicServerDAO.addDevice(device);
    }

    @Transactional
    public int updateDevice(DeviceServer device, AuthUser authUser) {
        StringBuffer auditContent = new StringBuffer();
        auditContent.append("设备名称:");
        auditContent.append(device.getName());
        auditContent.append(",序列号:");
        auditContent.append(device.getSerialNumber());
        saveAuditDevice("更新", auditContent.toString(), authUser);
        return devicServerDAO.updateDevice(device);
    }

    @Transactional
    public int delDevice(List deviceIDs, AuthUser authUser) {
        StringBuffer auditContent = new StringBuffer();
        for (int i = 0; i < deviceIDs.size(); i++) {
            DeviceServer device = this.getDeviceById(Integer.parseInt(deviceIDs.get(i).toString()));
            auditContent.append("设备名称:");
            auditContent.append(device.getName());
            auditContent.append(",序列号:");
            auditContent.append(device.getSerialNumber());
            auditContent.append("; ");
        }
        auditContent.deleteCharAt(auditContent.length() - 1);
        saveAuditDevice("删除", auditContent.toString(), authUser);
        return devicServerDAO.delDevice(deviceIDs);
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

        List<DeviceServer> devices = devicServerDAO.findAllDevice();
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


    /**
     * 解析XML导入模板,生成EXCEL文件
     */
    public void parseImportExcelTemplate() {
        String templateFilePath = ""; // TODO: 16/8/11
        File file = new File(templateFilePath);
        SAXBuilder builder = new SAXBuilder();
        try {
            //解析xml文件
            Document parse = builder.build(file);
            //创建Excle文件
            HSSFWorkbook wb = new HSSFWorkbook();
            //创建sheet
            HSSFSheet sheet = wb.createSheet("设备信息");
            // 获取xml根节点
            Element root = parse.getRootElement();
            // 获取模板名称
            String templateName = root.getAttribute("name").getValue();

            int rownum = 0;
            int column = 0;
            // 设置列宽
            Element colgroup = root.getChild("colgroup");
            setColumnWidth(sheet, colgroup);
            // 设置标题
            Element title = root.getChild("title");
            List<Element> trs = title.getChildren("tr");
            for (int i = 0; i < trs.size(); i++) {
                Element tr = trs.get(i);
                List<Element> tds = tr.getChildren("td");
                HSSFRow row = sheet.createRow(rownum);
                HSSFCellStyle cellStyle = wb.createCellStyle();
                cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);

                for (column = 0; column < tds.size(); column++) {
                    Element td = tds.get(column);
                    HSSFCell cell = row.createCell(column);
                    Attribute rowSpan = td.getAttribute("rowspan");
                    Attribute colSpan = td.getAttribute("colspan");
                    Attribute value = td.getAttribute("value");
                    if (value != null) {
                        String val = value.getValue();
                        cell.setCellValue(val);
                        int rspan = rowSpan.getIntValue() - 1;
                        int cspan = colSpan.getIntValue() - 1;

                        //设置字体
                        HSSFFont font = wb.createFont();
                        font.setFontName("仿宋_GB2312");
                        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
//                        font.setFontHeight((short) 12);
                        font.setFontHeightInPoints((short) 12);
                        cellStyle.setFont(font);
                        cell.setCellStyle(cellStyle);
                        //合并单元格居中
                        sheet.addMergedRegion(new CellRangeAddress(rspan, rspan, 0, cspan));

                    }
                }
                rownum++;
            }
            // 设置表头
            Element thead = root.getChild("thead");
            trs = thead.getChildren("tr");
            for (int i = 0; i < trs.size(); i++) {
                Element tr = trs.get(i);
                HSSFRow row = sheet.createRow(rownum);
                List<Element> ths = tr.getChildren("td");
                for (column = 0; column < ths.size(); column++) {
                    Element td = ths.get(column);
                    Attribute valueAttr = thead.getAttribute("value");
                    HSSFCell cell = row.createCell(column);
                    if (valueAttr != null) {
                        String value = valueAttr.getValue();
                        cell.setCellValue(value);

                    }
                }
                rownum++;
            }
            // 设置数据区域样式
            Element tbody = root.getChild("tbody");
            Element tr = tbody.getChild("tr");
            int repeat = tbody.getAttribute("repeat").getIntValue();
            List<Element> tds = tr.getChildren("td");
            for (int i = 0; i < repeat; i++) {
                HSSFRow row = sheet.createRow(rownum);
                for (column = 0; column < tds.size(); column++) {
                    Element td = tds.get(column);
                    HSSFCell cell = row.createCell(column);
                    setCellType(wb, cell, td);
                }
                rownum++;
            }

            // 生成Excel导入模板
            File tempFile = new File("");
            tempFile.delete();
            tempFile.createNewFile();
            FileOutputStream stream = FileUtils.openOutputStream(tempFile);
            wb.write(stream);
            stream.close();

        } catch (JDOMException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 设置单元格样式
     *
     * @param wb
     * @param cell
     * @param td
     */
    private void setCellType(HSSFWorkbook wb, HSSFCell cell, Element td) {
        Attribute typeAttr = td.getAttribute("type");
        String type = typeAttr.getValue();
        HSSFDataFormat format = wb.createDataFormat();
        HSSFCellStyle cellStyle = wb.createCellStyle();
        if ("NUMBERIC".equalsIgnoreCase(type)) {
            cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
            Attribute formatAttr = td.getAttribute("formate");
            String formatValue = formatAttr.getValue();
            formatValue = StringUtils.isNotBlank(formatValue) ? formatValue : "#,#";
            cellStyle.setDataFormat(format.getFormat(formatValue));
        } else if ("STRING".equalsIgnoreCase(type)) {
            cell.setCellValue("");
            cell.setCellType(HSSFCell.CELL_TYPE_STRING);
            cellStyle.setDataFormat(format.getFormat("@"));
        } else if ("DATE".equalsIgnoreCase(type)) {
            cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
            cellStyle.setDataFormat(format.getFormat("yyyy-mm-dd"));
        } else if ("ENUM".equalsIgnoreCase(type)) {
            CellRangeAddressList regions = new CellRangeAddressList(cell.getRowIndex(), cell.getRowIndex(), cell.getColumnIndex(), cell.getColumnIndex());
            Attribute enumAttr = td.getAttribute("format");
            String enumString = enumAttr.getValue();
            // 加载下拉列表的值
            DVConstraint constraint = DVConstraint.createExplicitListConstraint(enumString.split(","));
            // 数据有效性对象
            HSSFDataValidation dataValidation = new HSSFDataValidation(regions, constraint);
            wb.getSheetAt(0).addValidationData(dataValidation);
        }
        cell.setCellStyle(cellStyle);
    }

    /**
     * 设置Excel列宽
     *
     * @param sheet
     * @param colgroup
     */
    private void setColumnWidth(HSSFSheet sheet, Element colgroup) {
        List<Element> cols = colgroup.getChildren();
        for (int i = 0; i < cols.size(); i++) {
            Element col = cols.get(i);
            Attribute width = col.getAttribute("width");
            String unit = width.getValue().replaceAll("[0-9,\\.]", "");
            String value = width.getValue().replaceAll(unit, "");
            int v = 0;
            if (StringUtils.isBlank(unit) || "px".endsWith(unit)) {
                v = Math.round(Float.parseFloat(value) * 37F);
            } else if ("em".endsWith(unit)) {
                v = Math.round(Float.parseFloat(value) * 267.5F);
            }
            sheet.setColumnWidth(i, v);
        }
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
