package com.moby.dao;

import com.moby.entiry.Employee;
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
public class EmployeeDAOTest {
    @Resource
    private EmployeeDAO employeeDAO;

    @Test
    public void getEmployeeById() throws Exception {
        int empId = 1001;
        Employee employee = employeeDAO.getEmployeeById(empId);
        System.out.println(employee.toString());
    }

    @Test
    public void findAllEmployee() throws Exception {
        List<Employee> employeeList = employeeDAO.findAllEmployee();
        for (Employee employee : employeeList) {
            System.out.println(employee.toString());
        }
    }

    @Test
    public void findEmployeeByDeptId() throws Exception {
        int deptId = 1002;
        List<Employee> employeeList = employeeDAO.findEmployeeByDeptId(deptId);
        for (Employee employee : employeeList) {
            System.out.println(employee.toString());
        }
    }

}