package com.moby.web;

import com.moby.entiry.*;
import com.moby.service.*;
import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.RequestContext;

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
@RequestMapping("/device/multimedia")
public class DeviceMultimediaController {
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
        model.addAttribute("activeTab", "音视频");

        return "device/home";
    }

    @RequestMapping(value = "/{deviceID}/detail", method = RequestMethod.GET)
    public String deviceDetail(@PathVariable("deviceID") Integer deviceID, Model model) {
        if (deviceID == null) {
            return "redirect:/device/home";
        }
        Device device = deviceMultimediaService.getDeviceById(deviceID);
        if (device == null) {
            return "redirect:/device/home";
        }
        model.addAttribute("device", device);
        return "device/device_detail";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addDevice(Model model, HttpServletRequest request) {
        List<DeviceType> deviceTypeList = deviceTypeService.findAllDeviceType();
        List<Room> roomList = roomService.findAllRoom();
        List<Department> departmentList = departmentService.findAllDepartment();
        List<Employee> employeeList = employeeService.findAllEmployee();
        model.addAttribute("deviceTypeList", deviceTypeList);
        model.addAttribute("roomList", roomList);
        model.addAttribute("departmentList", departmentList);
        model.addAttribute("employeeList", employeeList);
        model.addAttribute("activeTab", "音视频");
        return "device/device_add";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String saveDevice(Model model, DeviceMultimedia deviceMultimedia, HttpServletRequest request) {
        List<Cabinet> cabinetList = cabinetService.findCabinetByName(deviceMultimedia.getCabinet().getName());
        if (cabinetList != null && cabinetList.size() > 0) {
            deviceMultimedia.setCabinetId(cabinetList.get(0).getId());
        }
        int result = deviceMultimediaService.addDevcie(deviceMultimedia, this.getLoginUser(request));
        if (result == 1) {
            model.addAttribute("result", "已添加1条记录!");
        }
        return "redirect:/device/multimedia/list";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public String deleteDevice(Model model, @RequestParam(value = "deviceIDs[]") Long[] deviceIDs, HttpServletRequest request) {
        List deviceIDList = new ArrayList();
        for (Long deviceID : deviceIDs) {
            deviceIDList.add(deviceID);
        }
        int result = deviceMultimediaService.delDevice(deviceIDList, this.getLoginUser(request));

        return "" + result;
    }

    @RequestMapping(value = "/export", method = RequestMethod.GET)
    public void expAllDevice2Excel(HttpServletRequest request,
                                   HttpServletResponse response) throws Exception {
        try {
            String fileName = "音视频设备台账.xls";
            byte[] bytes = deviceMultimediaService.expAllDevice2Excel();
            response.setContentType("application/x-msdownload");
            response.setContentLength(bytes.length);
            response.setHeader("Content-Disposition", "attachment;filename="
                    + new String(fileName.getBytes("gbk"), "iso-8859-1"));
            response.getOutputStream().write(bytes);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    @RequestMapping(value = "/query", method = RequestMethod.POST)
    public String findDeviceByDevice(Model model, DeviceMultimedia deviceMultimedia) {
        List<DeviceMultimedia> deviceMultimediaList = deviceMultimediaService.findDeviceByDevice(deviceMultimedia);
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
        model.addAttribute("deviceMultimedia", deviceMultimedia);
        model.addAttribute("roomList", roomList);
        model.addAttribute("activeTab", "音视频");

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

    @RequestMapping(value = "/import", method = RequestMethod.GET)
    public String importDevice(Model model) {
        return "device/device_import";
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
