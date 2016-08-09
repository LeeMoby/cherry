package com.moby.service;

import com.moby.dao.DepartmentDAO;
import com.moby.entiry.Department;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

import static org.junit.Assert.*;

/**
 * Created by Moby on 16/8/1.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml", "classpath:spring/spring-service.xml"})
public class DepartmentServiceTest {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Resource
    private DepartmentService departmentService;

    @Test
    public void getDepartmentById() throws Exception {
        int deptId = 1001;
        Department department = departmentService.getDepartmentById(deptId);
        logger.info("department: " + department);
    }

    @Test
    public void findAllDepartment() throws Exception {
        List<Department> departmentList = departmentService.findAllDepartment();
        for (Department department : departmentList) {
            logger.info("department: " + department);
        }
    }

    @Test
    public void findDepartmentByParentId() throws Exception {
        int pDeptId = 1001;
        List<Department> departmentList = departmentService.findDepartmentByParentId(pDeptId);
        for (Department department : departmentList) {
            logger.info("department: " + department);
        }
    }

    @Test
    public void getParentDepartmentById() throws Exception {
        int deptId = 1001;
        Department department = departmentService.getParentDepartmentById(deptId);
        logger.info("department: " + department);
    }

}