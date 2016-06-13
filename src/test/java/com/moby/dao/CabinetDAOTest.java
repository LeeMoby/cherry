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
    public void getCabinetByID() throws Exception {
        long cabinetID = 1000L;
        Cabinet cabinet = cabinetDAO.getCabinetByID(cabinetID);
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
    public void findCabinetByRoomID() throws Exception {
        long roomID = 1000L;
        List<Cabinet> cabinets = cabinetDAO.findCabinetByRoomID(roomID);
        for (Cabinet cabinet : cabinets){
            System.out.println(cabinet.toString());
        }

    }

}