package com.moby.web;

import com.moby.dto.WorkItemDTO;
import com.moby.entiry.Employee;
import com.moby.service.EmployeeService;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by Moby on 16/8/24.
 */
@Controller
@RequestMapping("/document")
public class DocumentController {
    private SimpleDateFormat sdf_cn = new SimpleDateFormat("yyyy年MM月dd日");
    private SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");


    @Autowired
    private EmployeeService employeeService;

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String documentHome(Model model) {
        String nowDate = sdf.format(new Date());
        model.addAttribute("nowDate", nowDate);
        model.addAttribute("activeTab", "index");
        return "document/home";
    }

    @RequestMapping(value = "/export", method = RequestMethod.POST)
    public void exportDocument(Model model, HttpServletResponse response) throws IOException {

        String title = "网络安全及支撑系统组工作日报";
        String sheetName = "支撑系统";
        String workItemDate = sdf_cn.format(new Date());
        String employeeName = "刘钊";
        String fileName = "日报-" + sdf.format(new Date()) + "-" + employeeName + ".xls";
        ByteArrayOutputStream out = new ByteArrayOutputStream();

        List<Employee> teamEmpList = employeeService.findAllEmployee();
        StringBuilder teamEmployees = new StringBuilder();
        for (Employee employee : teamEmpList) {
            teamEmployees.append(employee.getName());
            teamEmployees.append("、");
        }
        teamEmployees.delete(teamEmployees.length() - 1, teamEmployees.length());
        String[] todayTHead = new String[]{"序号", "工作内容详述", "完成情况", "配合人员"};
        String[] tomorrowTHead = new String[]{"序号", "工作计划内容", "计划进度", "配合人员"};
        List<WorkItemDTO> workItemList = new ArrayList<WorkItemDTO>();
        List<WorkItemDTO> workItemPlanList = new ArrayList<WorkItemDTO>();
        for (int i = 0; i < 3; i++) {
            WorkItemDTO workItemDTO = new WorkItemDTO();
            workItemDTO.setId(1000 + i);
            workItemDTO.setLevel("个人");
            workItemDTO.setContent("今日第" + (i + 1) + "项工作完成情况描述");
            workItemDTO.setDate(new Date());
            workItemDTO.setProgress((20 * (i + 2)) + "%");
            workItemDTO.setTeamEmployee(teamEmpList);
            workItemList.add(workItemDTO);

            workItemDTO.setContent("明日第" + (i + 1) + "项工作计划情况描述");
            workItemPlanList.add(workItemDTO);

        }

        HSSFWorkbook wb = new HSSFWorkbook();
        HSSFSheet sheet = wb.createSheet(sheetName);
        int rowNumber = 0;
        // 1.定义标题行样式
        // 1.1 定义标题样式
        HSSFCellStyle csTitle = wb.createCellStyle();
        csTitle.setVerticalAlignment(CellStyle.VERTICAL_CENTER); // 垂直居中
        csTitle.setAlignment(CellStyle.ALIGN_CENTER); // 水平居中
        // 1.1.1 定义字体样式
        Font fontTitle = wb.createFont();
        fontTitle.setBoldweight(Font.BOLDWEIGHT_BOLD);    // 加粗
        fontTitle.setFontHeightInPoints((short) 20); // 字号
        csTitle.setFont(fontTitle);



        // 1.2 定义信息样式
        // 1.2.1 定义字体样式
        Font fontInfo = wb.createFont();
        fontInfo.setBoldweight(Font.BOLDWEIGHT_NORMAL);    // 加粗
        fontInfo.setFontHeightInPoints((short) 12); // 字号
        // 1.2.2 定义信息样式
        HSSFCellStyle csInfoLeft = wb.createCellStyle();
        csInfoLeft.setVerticalAlignment(CellStyle.VERTICAL_CENTER); // 垂直居中
        csInfoLeft.setAlignment(CellStyle.ALIGN_LEFT); // 水平居中
        csInfoLeft.setFont(fontInfo);
        // 1.2.3 定义信息样式
        HSSFCellStyle csInfoRight = wb.createCellStyle();
        csInfoRight.setVerticalAlignment(CellStyle.VERTICAL_CENTER); // 垂直居中
        csInfoRight.setAlignment(CellStyle.ALIGN_RIGHT); // 水平居中
        csInfoRight.setFont(fontInfo);
        // 2 定义内容行样式
        // 2.1 定义表头样式
        HSSFCellStyle csTHead = wb.createCellStyle();
        csTHead.setVerticalAlignment(CellStyle.VERTICAL_CENTER); // 垂直居中
        csTHead.setAlignment(CellStyle.ALIGN_CENTER); // 水平居中
        Font fontTHead = wb.createFont();
        fontTHead.setBoldweight(Font.BOLDWEIGHT_BOLD); ;    // 加粗
        fontTHead.setFontHeightInPoints((short) 14); // 字号
        csTHead.setFont(fontTHead);

        // 2.2.1 定义居中内容样式
        HSSFCellStyle csTBodyCenter = wb.createCellStyle();
        csTBodyCenter.setVerticalAlignment(CellStyle.VERTICAL_CENTER); // 垂直居中
        csTBodyCenter.setAlignment(CellStyle.ALIGN_CENTER); // 水平居中
        Font fontTbody = wb.createFont();
        fontTbody.setBoldweight(Font.BOLDWEIGHT_NORMAL);    // 加粗
        fontTbody.setFontHeightInPoints((short) 12); // 字号
        csTBodyCenter.setFont(fontTbody);

        // 2.2.2 定义居中内容样式
        HSSFCellStyle csTBodyLeft = wb.createCellStyle();
        csTBodyLeft.setVerticalAlignment(CellStyle.VERTICAL_CENTER); // 垂直居中
        csTBodyLeft.setAlignment(CellStyle.ALIGN_LEFT); // 水平居中
        Font fontTBodyLeft = wb.createFont();
        fontTBodyLeft.setBoldweight(Font.BOLDWEIGHT_NORMAL);    // 加粗
        fontTBodyLeft.setFontHeightInPoints((short) 12); // 字号
        csTBodyLeft.setFont(fontTBodyLeft);

        // 2.3 定义居左内容样式

        // 3 生成标题行
        // 3.1 定义合并单元格
        CellRangeAddress cellRA = new CellRangeAddress(0, 0, 0, 3);
        sheet.addMergedRegion(cellRA);
        // 3.2 创建标题行
        HSSFRow rowTitle = sheet.createRow(rowNumber);
        rowNumber++;
        HSSFCell cellTitle = rowTitle.createCell(0);
        cellTitle.setCellStyle(csTitle);
        cellTitle.setCellValue(title);

        // 3.3 创建信息行
        HSSFRow rowInfo = sheet.createRow(rowNumber);
        rowNumber++;
        // 3.3.1 创建日期title
        HSSFCell cellDateHead = rowInfo.createCell(0);
        cellDateHead.setCellStyle(csInfoRight);
        cellDateHead.setCellValue("日期:");
        // 3.3.2 创建日期content
        HSSFCell cellDateBody = rowInfo.createCell(1);
        cellDateBody.setCellStyle(csInfoLeft);
        cellDateBody.setCellValue(workItemDate);
        // 3.3.3 创建人员title
        HSSFCell cellEmpHead = rowInfo.createCell(2);
        cellEmpHead.setCellStyle(csInfoRight);
        cellEmpHead.setCellValue("汇报人:");
        // 3.3.4 创建人员content
        HSSFCell cellEmpBody = rowInfo.createCell(3);
        cellEmpBody.setCellStyle(csInfoLeft);
        cellEmpBody.setCellValue(employeeName);
        // 4 生成内容行
        // 4.1 创建表头行
        HSSFRow rowTodayTHead = sheet.createRow(rowNumber);
        rowNumber++;
        for (int i = 0; i < todayTHead.length; i++) {
            HSSFCell cell = rowTodayTHead.createCell(i);
            cell.setCellStyle(csTHead);
            cell.setCellValue(todayTHead[i]);
        }
        // 4.2 创建内容行
        int todayItemNumber = 0;
        for (WorkItemDTO workItemDTO : workItemList) {
            HSSFRow row = sheet.createRow(rowNumber);
            rowNumber++;
            HSSFCell cell0 = row.createCell(0);
            cell0.setCellStyle(csTBodyCenter);
            cell0.setCellValue("" + (todayItemNumber + 1));

            HSSFCell cell1 = row.createCell(1);
            cell1.setCellStyle(csTBodyLeft);
            cell1.setCellValue(workItemDTO.getContent());

            HSSFCell cell2 = row.createCell(2);
            cell2.setCellStyle(csTBodyCenter);
            cell2.setCellValue(workItemDTO.getProgress());

            HSSFCell cell3 = row.createCell(3);
            cell3.setCellStyle(csTBodyLeft);
            cell3.setCellValue(teamEmployees.toString());

            todayItemNumber++;
        }

        // 4.3 创建表头行
        HSSFRow rowTomorrowTHead = sheet.createRow(rowNumber);
        rowNumber++;
        for (int i = 0; i < tomorrowTHead.length; i++) {
            HSSFCell cell = rowTomorrowTHead.createCell(i);
            cell.setCellStyle(csTHead);
            cell.setCellValue(tomorrowTHead[i]);
        }
        // 4.4 创建内容行
        int tomorrowItemNumber = 0;
        for (WorkItemDTO workItemDTO : workItemPlanList) {
            HSSFRow row = sheet.createRow(rowNumber);
            rowNumber++;
            HSSFCell cell0 = row.createCell(0);
            cell0.setCellStyle(csTBodyCenter);
            cell0.setCellValue("" + (tomorrowItemNumber+1));

            HSSFCell cell1 = row.createCell(1);
            cell1.setCellStyle(csTBodyLeft);
            cell1.setCellValue(workItemDTO.getContent());

            HSSFCell cell2 = row.createCell(2);
            cell2.setCellStyle(csTBodyCenter);
            cell2.setCellValue(workItemDTO.getProgress());

            HSSFCell cell3 = row.createCell(3);
            cell3.setCellStyle(csTBodyLeft);
            cell3.setCellValue(teamEmployees.toString());

            tomorrowItemNumber++;
        }

        sheet.setColumnWidth(0, 8 * 256);
        sheet.setColumnWidth(1, 80 * 256);
        sheet.setColumnWidth(2, 20 * 256);
        sheet.setColumnWidth(3, 30 * 256);
        wb.write(out);
        byte[] bytes = out.toByteArray();
        response.setContentType("application/x-msdownload");
        response.setContentLength(bytes.length);
        response.setHeader("Content-Disposition", "attachment;filename="
                + new String(fileName.getBytes("gbk"), "iso-8859-1"));
        response.getOutputStream().write(bytes);
    }
}
