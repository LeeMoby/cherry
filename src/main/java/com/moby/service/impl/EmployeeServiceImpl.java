package com.moby.service.impl;

import com.moby.dao.EmployeeDAO;
import com.moby.entiry.Employee;
import com.moby.service.EmployeeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Moby on 16/8/1.
 */
@Service
public class EmployeeServiceImpl implements EmployeeService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private EmployeeDAO employeeDAO;

    public Employee getEmployeeById(int employeeId) {
        return employeeDAO.getEmployeeById(employeeId);
    }

    public List<Employee> findAllEmployee() {
        return employeeDAO.findAllEmployee();
    }

    public List<Employee> findEmployeeByDeptId(int deptId) {
        return employeeDAO.findEmployeeByDeptId(deptId);
    }
}
