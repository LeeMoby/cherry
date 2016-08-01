package com.moby.dao;

import com.moby.entiry.Employee;

import java.util.List;

/**
 * Created by Moby on 16/8/1.
 */
public interface EmployeeDAO {
    /**
     * 根据id获取Employee
     * @param employeeId
     * @return
     */
    Employee getEmployeeById(int employeeId);

    /**
     * 获取所有Employee
     * @return
     */
    List<Employee> findAllEmployee();

    /**
     * 根据部门ID获取Employee
     * @param deptId
     * @return
     */
    List<Employee> findEmployeeByDeptId(int deptId);
}
