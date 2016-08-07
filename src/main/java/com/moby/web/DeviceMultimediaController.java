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
        model.addAttribute("activeTab", "multimedia");

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
    public String addDevice(Model model) {
        List<DeviceType> deviceTypeList = deviceTypeService.findAllDeviceType();
        model.addAttribute("deviceTypeList", deviceTypeList);
        return "device/device_add";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String saveDevice(Model model, Device device) {
        DeviceMultimedia deviceMultimedia = (DeviceMultimedia) device;

        int result = deviceMultimediaService.addDevcie(deviceMultimedia, this.getLoginUser());
        if (result == 1) {
            model.addAttribute("result", "已添加1条记录!");
        }
        return "redirect:/device/home";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public String deleteDevice(Model model, @RequestParam(value = "deviceIDs[]") Long[] deviceIDs) {
        List deviceIDList = new ArrayList();
        for(Long deviceID : deviceIDs){
            deviceIDList.add(deviceID);
        }
        int result = deviceMultimediaService.delDevice(deviceIDList, this.getLoginUser());

        return "" + result;
    }

    @RequestMapping(value = "/exportExcel4All", method = RequestMethod.GET)
    public void expAllDevice2Excel(HttpServletRequest request,
                             HttpServletResponse response) throws Exception {
        try {
            byte[] bytes = deviceMultimediaService.expAllDevice2Excel();
            response.setContentType("application/x-msdownload");
            response.setContentLength(bytes.length);
            response.setHeader("Content-Disposition", "attachment;filename="
                    + java.net.URLEncoder.encode("设备台账.xls", "UTF-8"));
            response.getOutputStream().write(bytes);
        } catch (Exception ex) {

        }
    }

    private AuthUser getLoginUser(){
        AuthUser authUser = new AuthUser();
        authUser.setId(1001);
        authUser.setLastLoginDatetime(new Date());
        authUser.setLastIpAddress("10.200.230.1");
        authUser.setLastBrowser("Chrome");
        authUser.setLastOs("Windows 7");
        return authUser;
    }


}
