package com.moby.web;

import com.moby.entiry.*;
import com.moby.service.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
    public String saveDevice(Model model, DeviceNetwork deviceNetwork) {
        List<Cabinet> cabinetList = cabinetService.findCabinetByName(deviceNetwork.getCabinet().getName());
        if (cabinetList != null && cabinetList.size() > 0) {
            deviceNetwork.setCabinetId(cabinetList.get(0).getId());
        }
        int result = deviceNetworkService.addDevcie(deviceNetwork, this.getLoginUser());
        if (result == 1) {
            model.addAttribute("result", "已添加1条记录!");
        }
        return "redirect:/device/network/list";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public String deleteDevice(Model model, @RequestParam(value = "deviceIDs[]") Long[] deviceIDs) {
        List deviceIDList = new ArrayList();
        for (Long deviceID : deviceIDs) {
            deviceIDList.add(deviceID);
        }
        int result = deviceNetworkService.delDevice(deviceIDList, this.getLoginUser());

        return "" + result;
    }

    @RequestMapping(value = "/export", method = RequestMethod.GET)
    public void expAllDevice2Excel(HttpServletRequest request,
                                   HttpServletResponse response) throws Exception {
        try {
            byte[] bytes = deviceNetworkService.expAllDevice2Excel();
            response.setContentType("application/x-msdownload");
            response.setContentLength(bytes.length);
            response.setHeader("Content-Disposition", "attachment;filename="
                    + java.net.URLEncoder.encode("网络设备台账.xls", "UTF-8"));
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

    private AuthUser getLoginUser() {
        AuthUser authUser = new AuthUser();
        authUser.setId(1001);
        authUser.setLastLoginDatetime(new Date());
        authUser.setLastIpAddress("10.200.230.1");
        authUser.setLastBrowser("Chrome");
        authUser.setLastOs("Windows 7");
        return authUser;
    }

    @RequestMapping(value = "/import", method = RequestMethod.GET)
    public String importDevice(Model model) {
        return "device/device_import";
    }

}
