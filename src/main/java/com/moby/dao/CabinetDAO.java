package com.moby.dao;

import com.moby.entiry.Cabinet;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Moby on 16/6/8.
 */
public interface CabinetDAO {
    /**
     * 根据ID获取Cabinet
     * @param cabinetID
     * @return
     */
    Cabinet getCabinetById(@Param("id") int cabinetID);

    /**
     * 获取所有Cabinet
     * @return
     */
    List<Cabinet> findAllCabinet();

    /**
     * 根据RoomID获取Cabinet
     * @param roomID
     * @return
     */
    List<Cabinet> findCabinetByRoomId(@Param("room_id") int roomID);
}
