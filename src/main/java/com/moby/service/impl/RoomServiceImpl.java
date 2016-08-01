package com.moby.service.impl;

import com.moby.dao.RoomDAO;
import com.moby.entiry.Room;
import com.moby.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Moby on 16/6/16.
 */
@Service
public class RoomServiceImpl implements RoomService {
    @Autowired
    private RoomDAO roomDAO;

    public Room getRoomById(int roomID) {
        return roomDAO.getRoomById(roomID);
    }

    public List<Room> findAllRoom() {
        return roomDAO.findAllRoom();
    }
}
