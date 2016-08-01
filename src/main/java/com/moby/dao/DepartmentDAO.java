package com.moby.dao;

import com.moby.entiry.Department;

import java.util.List;

/**
 * Created by Moby on 16/8/1.
 */
public interface DepartmentDAO {
    /**
     * 根据ID获取Department
     * @param deptId
     * @return
     */
    Department getDepartmentById(int deptId);

    /**
     * 获取所有Department
     * @return
     */
    List<Department> findAllDepartment();

    /**
     * 根据父部门ID获取下级Department
     * @param parentId
     * @return
     */
    List<Department> findDepartmentByParentId(int parentId);

    /**
     * 根据部门ID获取父Department
     * @param deptId
     * @return
     */
    Department getParentDepartmentById(int deptId);
}
