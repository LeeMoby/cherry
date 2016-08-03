package com.moby.entiry;

import java.util.Date;

/**
 * Created by Moby on 16/8/3.
 */
public class AuthUser {
    private Integer id;
    private String name;
    private String loginName;
    private String password;
    private Date lastLoginDatetime;
    private String lastIpAddress;
    private String lastBrowser;
    private String lastOs;
    private String employeeId;

    private Employee employee;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getLastLoginDatetime() {
        return lastLoginDatetime;
    }

    public void setLastLoginDatetime(Date lastLoginDatetime) {
        this.lastLoginDatetime = lastLoginDatetime;
    }

    public String getLastIpAddress() {
        return lastIpAddress;
    }

    public void setLastIpAddress(String lastIpAddress) {
        this.lastIpAddress = lastIpAddress;
    }

    public String getLastBrowser() {
        return lastBrowser;
    }

    public void setLastBrowser(String lastBrowser) {
        this.lastBrowser = lastBrowser;
    }

    public String getLastOs() {
        return lastOs;
    }

    public void setLastOs(String lastOs) {
        this.lastOs = lastOs;
    }

    public String getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(String employeeId) {
        this.employeeId = employeeId;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    @Override
    public String toString() {
        return "AuthUser{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", loginName='" + loginName + '\'' +
                ", password='" + password + '\'' +
                ", lastLoginDatetime=" + lastLoginDatetime +
                ", lastIpAddress='" + lastIpAddress + '\'' +
                ", lastBrowser='" + lastBrowser + '\'' +
                ", lastOs='" + lastOs + '\'' +
                ", employeeId='" + employeeId + '\'' +
                ", employee=" + employee +
                '}';
    }
}
