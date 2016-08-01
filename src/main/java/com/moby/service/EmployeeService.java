package com.moby.service;

import com.moby.entiry.Employee;

import java.util.List;

/**
 * Created by Moby on 16/8/1.
 */
public interface EmployeeService {
    Employee getEmployeeById(int employeeId);

    List<Employee> findAllEmployee();

    List<Employee> findEmployeeByDeptId(int deptId);
}
