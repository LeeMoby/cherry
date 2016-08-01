package com.moby.dao;

import com.moby.entiry.Department;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import java.util.List;

import static org.junit.Assert.*;

/**
 * Created by Moby on 16/8/1.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class DepartmentDAOTest {
    @Resource
    private DepartmentDAO departmentDAO;

    @Test
    public void getDepartmentById() throws Exception {
        int deptId = 1002;
        Department department = departmentDAO.getDepartmentById(deptId);
        if (null != department)
            System.out.println(department.toString());
    }

    @Test
    public void findAllDepartment() throws Exception {
        List<Department> departmentList = departmentDAO.findAllDepartment();
        for (Department department : departmentList) {
            System.out.println(department.toString());
        }
    }

    @Test
    public void findDepartmentByParentId() throws Exception {
        int pDeptId = 1001;
        List<Department> departmentList = departmentDAO.findDepartmentByParentId(pDeptId);
        for (Department department : departmentList) {
            System.out.println(department.toString());
        }

    }

    @Test
    public void getParentDepartmentById() throws Exception {
        int deptId = 1001;
        Department department = departmentDAO.getParentDepartmentById(deptId);
        if (null != department)
            System.out.println(department.toString());
    }

}