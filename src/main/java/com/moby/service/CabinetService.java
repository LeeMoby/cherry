package com.moby.service;

import com.moby.entiry.Cabinet;

import java.util.List;

/**
 * Created by Moby on 16/6/27.
 */
public interface CabinetService {
    Cabinet getCabinetById(int CabinetID);

    List<Cabinet> findAllCabinet();

    List<Cabinet> findCabinetByName(String name);
}
