package com.moby.service;

import com.moby.entiry.Room;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.*;

/**
 * Created by Moby on 16/6/16.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml", "classpath:spring/spring-service.xml"})
public class RoomServiceTest {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private RoomService roomService;
    @Test
    public void getRoomByID() throws Exception {

    }

    @Test
    public void findAllRoom() throws Exception {
        List<Room> list = roomService.findAllRoom();
        for (Room room : list){
            logger.info("room={}", room);
        }
    }

}