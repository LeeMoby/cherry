package com.moby.dao;

import com.moby.entiry.Room;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import java.util.List;

import static org.junit.Assert.*;

/**
 * Created by Moby on 16/6/8.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class RoomDAOTest {
    @Resource
    private RoomDAO roomDAO;

    @Test
    public void getRoomById() throws Exception {
        int roomID = 1001;
        Room room = roomDAO.getRoomById(roomID);
        System.out.println(room.toString());
    }

    @Test
    public void findAllRoom() throws Exception {
        List<Room> rooms = roomDAO.findAllRoom();
        for (Room room : rooms){
            System.out.println(room.toString());
        }
    }

}