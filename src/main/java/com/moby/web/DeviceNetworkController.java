package com.moby.web;

import com.moby.entiry.*;
import com.moby.service.*;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Sheet;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.*;

/**
 * Created by Moby on 16/6/12.
 */
@Controller
@RequestMapping("/device/network")
public class DeviceNetworkController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private DeviceMultimediaService deviceMultimediaService;
    @Autowired
    private DeviceNetworkService deviceNetworkService;
    @Autowired
    private DeviceOtherService deviceOtherService;
    @Autowired
    private DeviceSafetyService deviceSafetyService;
    @Autowired
    private DeviceServerService deviceServerService;
    @Autowired
    private DeviceStorageService deviceStorageService;

    @Autowired
    private DeviceTypeService deviceTypeService;

    @Autowired
    private RoomService roomService;
    @Autowired
    private DepartmentService departmentService;
    @Autowired
    private EmployeeService employeeService;
    @Autowired
    private CabinetService cabinetService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String deviceHome(Model model) {
        List<DeviceMultimedia> deviceMultimediaList = deviceMultimediaService.findAllDevice();
        List<DeviceNetwork> deviceNetworkList = deviceNetworkService.findAllDevice();
        List<DeviceOther> deviceOtherList = deviceOtherService.findAllDevice();
        List<DeviceSafety> deviceSafetyList = deviceSafetyService.findAllDevice();
        List<DeviceServer> deviceServerList = deviceServerService.findAllDevice();
        List<DeviceStorage> deviceStorageList = deviceStorageService.findAllDevice();
        List<Room> roomList = roomService.findAllRoom();

        model.addAttribute("deviceMultimediaList", deviceMultimediaList);
        model.addAttribute("deviceNetworkList", deviceNetworkList);
        model.addAttribute("deviceOtherList", deviceOtherList);
        model.addAttribute("deviceSafetyList", deviceSafetyList);
        model.addAttribute("deviceServerList", deviceServerList);
        model.addAttribute("deviceStorageList", deviceStorageList);
        model.addAttribute("roomList", roomList);
        model.addAttribute("activeTab", "网络");

        return "device/home";
    }

    @RequestMapping(value = "/{deviceID}/detail", method = RequestMethod.GET)
    public String deviceDetail(@PathVariable("deviceID") Integer deviceID, Model model) {
        if (deviceID == null) {
            return "redirect:/device/home";
        }
        Device device = deviceNetworkService.getDeviceById(deviceID);
        if (device == null) {
            return "redirect:/device/home";
        }
        model.addAttribute("device", device);
        return "device/device_detail";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addDevice(Model model) {
        List<DeviceType> deviceTypeList = deviceTypeService.findAllDeviceType();
        List<Room> roomList = roomService.findAllRoom();
        List<Department> departmentList = departmentService.findAllDepartment();
        List<Employee> employeeList = employeeService.findAllEmployee();
        model.addAttribute("deviceTypeList", deviceTypeList);
        model.addAttribute("roomList", roomList);
        model.addAttribute("departmentList", departmentList);
        model.addAttribute("employeeList", employeeList);
        model.addAttribute("activeTab", "网络");
        return "device/device_add";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String saveDevice(Model model, DeviceNetwork deviceNetwork, HttpServletRequest request) {
        List<Cabinet> cabinetList = cabinetService.findCabinetByName(deviceNetwork.getCabinet().getName());
        if (cabinetList != null && cabinetList.size() > 0) {
            deviceNetwork.setCabinetId(cabinetList.get(0).getId());
        }
        int result = deviceNetworkService.addDevcie(deviceNetwork, this.getLoginUser(request));
        if (result == 1) {
            model.addAttribute("result", "已添加1条记录!");
        }
        return "redirect:/device/network/list";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public String deleteDevice(Model model, @RequestParam(value = "deviceIDs[]") Long[] deviceIDs, HttpServletRequest request) {
        List deviceIDList = new ArrayList();
        for (Long deviceID : deviceIDs) {
            deviceIDList.add(deviceID);
        }
        int result = deviceNetworkService.delDevice(deviceIDList, this.getLoginUser(request));

        return "" + result;
    }

    @RequestMapping(value = "/export", method = RequestMethod.GET)
    public void expAllDevice2Excel(HttpServletRequest request,
                                   HttpServletResponse response) throws Exception {
        try {
            String fileName = "网络设备台账.xls";
            byte[] bytes = deviceNetworkService.expAllDevice2Excel();
            response.setContentType("application/x-msdownload");
            response.setContentLength(bytes.length);
            response.setHeader("Content-Disposition", "attachment;filename="
                    + new String(fileName.getBytes("gbk"),"iso-8859-1"));
            response.getOutputStream().write(bytes);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    @RequestMapping(value = "/query", method = RequestMethod.POST)
    public String findDeviceByDevice(Model model, DeviceNetwork deviceNetwork) {
        List<DeviceNetwork> deviceNetworkList = deviceNetworkService.findDeviceByDevice(deviceNetwork);
        List<DeviceMultimedia> deviceMultimediaList = deviceMultimediaService.findAllDevice();
        List<DeviceOther> deviceOtherList = deviceOtherService.findAllDevice();
        List<DeviceSafety> deviceSafetyList = deviceSafetyService.findAllDevice();
        List<DeviceServer> deviceServerList = deviceServerService.findAllDevice();
        List<DeviceStorage> deviceStorageList = deviceStorageService.findAllDevice();
        List<Room> roomList = roomService.findAllRoom();

        model.addAttribute("deviceMultimediaList", deviceMultimediaList);
        model.addAttribute("deviceNetworkList", deviceNetworkList);
        model.addAttribute("deviceOtherList", deviceOtherList);
        model.addAttribute("deviceSafetyList", deviceSafetyList);
        model.addAttribute("deviceServerList", deviceServerList);
        model.addAttribute("deviceStorageList", deviceStorageList);
        model.addAttribute("deviceNetwork", deviceNetwork);
        model.addAttribute("roomList", roomList);
        model.addAttribute("activeTab", "网络");

        return "device/home";
    }

    private AuthUser getLoginUser(HttpServletRequest request) {
        AuthUser authUser = new AuthUser();
        authUser.setId(1001);
        authUser.setLastLoginDatetime(new Date());
        authUser.setLastIpAddress(request.getRemoteAddr());
        authUser.setLastBrowser(request.getHeader("User-Agent"));
        authUser.setLastOs(request.getRemoteHost());
        return authUser;
    }

    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> uploadImportDevice(Model model, HttpServletRequest request, @RequestParam("inputFile") MultipartFile file) {
        String fileSavePath = "/upload";
        FileOutputStream out = null;
        File newFile = null;
        Map<String, Object> map = new HashMap<String, Object>();

        try {
            if (!file.isEmpty()) {
                // 获取文件字数据
                byte[] bytes = file.getBytes();
                // 获取文件保存目录
                newFile = new File(request.getSession().getServletContext().getRealPath(fileSavePath));
                // 如果目录不存在则创建
                if (!newFile.exists()) {
                    newFile.mkdirs();
                }
                out = new FileOutputStream(newFile + "/" + file.getName());
                // 以字节流写到文件
                out.write(bytes);
                map.put("result", "success");
                // 获取设备类型列表
                List<DeviceType> deviceTypeList = deviceTypeService.findAllDeviceType();
                Map<String, Integer> deviceTypeMap = new HashMap<String, Integer>();
                for (DeviceType deviceType : deviceTypeList){
                    deviceTypeMap.put(deviceType.getName(), deviceType.getId());
                }
                // 获取机房列表
                List<Room> roomList = roomService.findAllRoom();
                Map<String, Integer> roomMap = new HashMap<String, Integer>();
                for (Room room : roomList) {
                    roomMap.put(room.getNumber(), room.getId());
                }

                // 获取机柜列表
                List<Cabinet> cabinetList = cabinetService.findAllCabinet();
                Map<String, Integer> cabinetMap = new HashMap<String, Integer>();
                for (Cabinet cabinet : cabinetList) {
                    cabinetMap.put(cabinet.getName(), cabinet.getId());
                }

                // 获取部门列表
                List<Department> deptList = departmentService.findAllDepartment();
                Map<String, Integer> deptMap = new HashMap<String, Integer>();
                for (Department dept : deptList) {
                    deptMap.put(dept.getName(), dept.getId());
                }

                // 获取员工列表
                List<Employee> empList = employeeService.findAllEmployee();
                Map<String, Integer> empMap = new HashMap<String, Integer>();
                for (Employee emp : empList){
                    empMap.put(emp.getName(), emp.getId());
                }

                // 设置数据格式
                DataFormatter dataFormatter = new DataFormatter(Locale.SIMPLIFIED_CHINESE);

                // 新增记录数
                int successRow = 0;
                int failureRow = 0;

                // 解析Excel文件,执行导入
                HSSFWorkbook wb = new HSSFWorkbook(file.getInputStream());
                Iterator<Sheet> sheetIterator = wb.sheetIterator();
                while (sheetIterator.hasNext()) {
                    HSSFSheet sheet = (HSSFSheet) sheetIterator.next();
                    int lastRowNum = sheet.getLastRowNum();
                    for (int i = 2; i <= lastRowNum; i++) {
                        HSSFRow row = sheet.getRow(i);
                        DeviceNetwork device = new DeviceNetwork();
                        HSSFCell cell;
                        int j = 0;

                        cell = row.getCell(j);
                        device.setDeviceTypeId(deviceTypeMap.get(dataFormatter.formatCellValue(cell)));
                        j++;

                        cell = row.getCell(j);
                        device.setName(dataFormatter.formatCellValue(cell));
                        j++;

                        cell = row.getCell(j);
                        device.setCode(dataFormatter.formatCellValue(cell));
                        j++;

                        cell = row.getCell(j);
                        device.setCodeSgcc(dataFormatter.formatCellValue(cell));
                        j++;

                        cell = row.getCell(j);
                        device.setRoomId(roomMap.get(dataFormatter.formatCellValue(cell)));
                        j++;

                        cell = row.getCell(j);
                        device.setCabinetId(cabinetMap.get(dataFormatter.formatCellValue(cell)));
                        j++;

                        cell = row.getCell(j);
                        device.setCabinetPosition(dataFormatter.formatCellValue(cell));
                        j++;

                        cell = row.getCell(j);
                        device.setManufacturer(dataFormatter.formatCellValue(cell));
                        j++;

                        cell = row.getCell(j);
                        device.setBrand(dataFormatter.formatCellValue(cell));
                        j++;

                        cell = row.getCell(j);
                        device.setSeries(dataFormatter.formatCellValue(cell));
                        j++;

                        cell = row.getCell(j);
                        device.setModel(dataFormatter.formatCellValue(cell));
                        j++;

                        cell = row.getCell(j);
                        device.setStatus(dataFormatter.formatCellValue(cell));
                        j++;

                        cell = row.getCell(j);
                        device.setUse(dataFormatter.formatCellValue(cell));
                        j++;

                        cell = row.getCell(j);
                        device.setUseDate(cell.getDateCellValue());
                        j++;

                        cell = row.getCell(j);
                        device.setPurchaseMethod(dataFormatter.formatCellValue(cell));
                        j++;

                        cell = row.getCell(j);
                        device.setSerialNumber(dataFormatter.formatCellValue(cell));
                        j++;

                        cell = row.getCell(j);
                        device.setManufactureDate(cell.getDateCellValue());
                        j++;

                        cell = row.getCell(j);
                        device.setServiceExpiryDate(cell.getDateCellValue());
                        j++;

                        cell = row.getCell(j);
                        device.setNetwork(dataFormatter.formatCellValue(cell));
                        j++;

                        cell = row.getCell(j);
                        device.setIpAddress(dataFormatter.formatCellValue(cell));
                        j++;

                        cell = row.getCell(j);
                        device.setMgtDeptId(deptMap.get(dataFormatter.formatCellValue(cell)));
                        j++;

                        cell = row.getCell(j);
                        device.setMgtEmployeeId(empMap.get(dataFormatter.formatCellValue(cell)));
                        j++;

                        cell = row.getCell(j);
                        device.setMgtPhone(dataFormatter.formatCellValue(cell));
                        j++;

                        cell = row.getCell(j);

                        device.setMaintenanceSupplier(dataFormatter.formatCellValue(cell));
                        j++;

                        cell = row.getCell(j);
                        device.setMaintenanceDateStart(cell.getDateCellValue());
                        j++;

                        cell = row.getCell(j);
                        device.setMaintenanceDateEnd(cell.getDateCellValue());
                        j++;

                        try {
                            successRow += deviceNetworkService.addDevcie(device, this.getLoginUser(request));
                        }catch (Exception ex){
                            failureRow++;
                        }

                    }

                }
                map.put("successRow", successRow);
                map.put("failureRow", failureRow);
            } else {
                map.put("result", "failure");
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (out != null) {
                    out.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }


        return map;
    }

}
