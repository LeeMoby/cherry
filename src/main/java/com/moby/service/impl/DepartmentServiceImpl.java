package com.moby.service.impl;

import com.moby.dao.DepartmentDAO;
import com.moby.entiry.Department;
import com.moby.service.DepartmentService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Moby on 16/8/1.
 */
@Service
public class DepartmentServiceImpl implements DepartmentService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private DepartmentDAO departmentDAO;

    public Department getDepartmentById(int deptId) {
        return departmentDAO.getDepartmentById(deptId);
    }

    public List<Department> findAllDepartment() {
        return departmentDAO.findAllDepartment();
    }

    public List<Department> findDepartmentByParentId(int parentId) {
        return departmentDAO.findDepartmentByParentId(parentId);
    }

    public Department getParentDepartmentById(int deptId) {
        return departmentDAO.getParentDepartmentById(deptId);
    }
}
