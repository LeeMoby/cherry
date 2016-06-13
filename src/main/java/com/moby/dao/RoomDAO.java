package com.moby.dao;

import com.moby.entiry.Room;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Moby on 16/6/8.
 */
public interface RoomDAO {
    /**
     * 根据ID获取Room
     * @return
     */
    Room getRoomByID(@Param("roomID") long roomID);

    /**
     * 获取所有Room
     * @return
     */
    List<Room> findAllRoom();
}
