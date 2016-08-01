package com.moby.dao;

import com.moby.entiry.Cabinet;
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
public class CabinetDAOTest {
    @Resource
    private CabinetDAO cabinetDAO;
    @Test
    public void getCabinetById() throws Exception {
        int cabinetID = 1001;
        Cabinet cabinet = cabinetDAO.getCabinetById(cabinetID);
        System.out.println(cabinet.toString());
    }

    @Test
    public void findAllCabinet() throws Exception {
        List<Cabinet> cabinets = cabinetDAO.findAllCabinet();
        for (Cabinet cabinet : cabinets){
            System.out.println(cabinet.toString());
        }

    }

    @Test
    public void findCabinetByRoomId() throws Exception {
        int roomID = 1001;
        List<Cabinet> cabinets = cabinetDAO.findCabinetByRoomId(roomID);
        for (Cabinet cabinet : cabinets){
            System.out.println(cabinet.toString());
        }

    }

}