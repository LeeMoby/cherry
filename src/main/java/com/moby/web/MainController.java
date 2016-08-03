package com.moby.web;

import com.moby.entiry.Device;
import com.moby.service.DeviceService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * Created by Moby on 16/6/12.
 */
@Controller
@RequestMapping("/cherry")
public class MainController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private DeviceService deviceService;

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String home(Model model) {
//        List<Device> list = deviceService.findAllDevice();
//        model.addAttribute("list", list);
        return "home";
    }
}
