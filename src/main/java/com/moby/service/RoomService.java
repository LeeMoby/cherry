package com.moby.service;

import com.moby.entiry.Room;

import java.util.List;

/**
 * Created by Moby on 16/6/16.
 */
public interface RoomService {

    Room getRoomById(int roomID);

    List<Room> findAllRoom();
}
