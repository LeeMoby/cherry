package com.moby.service;

import com.moby.entiry.Cabinet;

import java.util.List;

/**
 * Created by Moby on 16/6/27.
 */
public interface CabinetService {
    Cabinet getCabinetByID(Long CabinetID);

    List<Cabinet> findAllCabinet();
}
