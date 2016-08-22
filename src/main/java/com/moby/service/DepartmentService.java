package com.moby.service;

import com.moby.entiry.Department;

import java.util.List;
import java.util.Map;

/**
 * Created by Moby on 16/8/1.
 */
public interface DepartmentService {
    Department getDepartmentById(int deptId);

    List<Department> findAllDepartment();

    List<Department> findDepartmentByParentId(int parentId);

    Department getParentDepartmentById(int deptId);
}
