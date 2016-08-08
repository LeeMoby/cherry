package com.moby.web;

import com.moby.entiry.Cabinet;
import com.moby.service.CabinetService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by Moby on 16/7/3.
 */
@Controller
@RequestMapping("/basedata/cabinet")
public class CabinetController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private CabinetService cabinetService;

    @RequestMapping(value = "/list", method = RequestMethod.GET, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public List<Cabinet> findAllCabinet(){
        List<Cabinet> cabinets = cabinetService.findAllCabinet();
        return cabinets;
    }

    @RequestMapping(value = "/search", method = RequestMethod.GET, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public List<Cabinet> findCabinetByName(@RequestParam(value = "cabinetName")String name){
        List<Cabinet> cabinets = cabinetService.findCabinetByName(name);
        return cabinets;
    }
}
