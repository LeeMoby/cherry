package com.moby.service.impl;

import com.moby.dao.CabinetDAO;
import com.moby.entiry.Cabinet;
import com.moby.service.CabinetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Moby on 16/6/27.
 */
@Service
public class CabinetServiceImpl implements CabinetService {
    @Autowired
    private CabinetDAO cabinetDAO;

    public Cabinet getCabinetByID(Long CabinetID) {
        return cabinetDAO.getCabinetByID(CabinetID);
    }

    public List<Cabinet> findAllCabinet() {
        return cabinetDAO.findAllCabinet();
    }
}
