package com.moby.web;

import com.moby.entiry.Device;
import com.moby.entiry.DeviceType;
import com.moby.entiry.Room;
import com.moby.service.DeviceService;
import com.moby.service.DeviceTypeService;
import com.moby.service.RoomService;
import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Moby on 16/6/12.
 */
@Controller
@RequestMapping("/device")
public class DeviceController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private DeviceService deviceService;

    @Autowired
    private DeviceTypeService deviceTypeService;

    @Autowired
    private RoomService roomService;

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String deviceHome(Model model) {
        List<Device> list = deviceService.findAllDevice();
        List<DeviceType> deviceTypeList = deviceTypeService.findAllDeviceType();
        List<Room> roomList = roomService.findAllRoom();

        model.addAttribute("list", list);
        model.addAttribute("deviceTypeList", deviceTypeList);
        model.addAttribute("roomList", roomList);

        return "device/home";
    }

    @RequestMapping(value = "/{deviceID}/detail", method = RequestMethod.GET)
    public String deviceDetail(@PathVariable("deviceID") Long deviceID, Model model) {
        if (deviceID == null) {
            return "redirect:/device/home";
        }
        Device device = deviceService.getDeviceById(deviceID);
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
        int result = deviceService.addDevcie(device);
        if (result == 1) {
            model.addAttribute("已添加1条记录!");
        }
        return "redirect:/device/home";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String deleteDevice(Model model, @RequestParam(value = "deviceIDs[]") Long[] deviceIDs) {
        List deviceIDList = new ArrayList();
        for(Long deviceID : deviceIDs){
            deviceIDList.add(deviceID);
        }
        int result = deviceService.delDevice(deviceIDList);
        if (result >= 1) {
            model.addAttribute("已删除" + result + "条记录!");
        }
        return "redirect:/device/home";
    }

    @RequestMapping(value = "/exportExcel4All", method = RequestMethod.GET)
    public void expExcel4All(HttpServletRequest request,
                             HttpServletResponse response) throws Exception {
        try {
            byte[] bytes = deviceService.expExcel4All();
            response.setContentType("application/x-msdownload");
            response.setContentLength(bytes.length);
            response.setHeader("Content-Disposition", "attachment;filename="
                    + java.net.URLEncoder.encode("设备台账.xls", "UTF-8"));
            response.getOutputStream().write(bytes);
        } catch (Exception ex) {

        }
    }


}
