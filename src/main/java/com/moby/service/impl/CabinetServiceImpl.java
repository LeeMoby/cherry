package com.moby.service.impl;

import com.moby.dao.CabinetDAO;
import com.moby.entiry.Cabinet;
import com.moby.service.CabinetService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Moby on 16/6/27.
 */
@Service
public class CabinetServiceImpl implements CabinetService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private CabinetDAO cabinetDAO;

    public Cabinet getCabinetById(int CabinetID) {
        return cabinetDAO.getCabinetById(CabinetID);
    }

    public List<Cabinet> findAllCabinet() {
        return cabinetDAO.findAllCabinet();
    }
}
