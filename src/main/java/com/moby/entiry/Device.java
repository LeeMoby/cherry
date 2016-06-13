package com.moby.entiry;

import java.util.Date;

/**
 * Created by Moby on 16/6/8.
 */
public class Device {
    private Long did;
    private String dname;
    private Long dtid;
    private String dno;
    private Long cid;
    private String dplace;
    private String dmodel;
    private String dcode;
    private String dip;
    private String dstatus;
    private Date useDate;
    private String psupplier;
    private String department;
    private String nettype;
    private String person;
    private String oid;
    private String defid;
    private String fid;
    private String projectid;
    private String originalValue;
    private String serialNumber;

    private DeviceType deviceType;
    private Cabinet cabinet;

    public String getDstatus() {
        return dstatus;
    }

    public void setDstatus(String dstatus) {
        this.dstatus = dstatus;
    }

    public Long getDid() {
        return did;
    }

    public void setDid(Long did) {
        this.did = did;
    }

    public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname;
    }

    public Long getDtid() {
        return dtid;
    }

    public void setDtid(Long dtid) {
        this.dtid = dtid;
    }

    public String getDno() {
        return dno;
    }

    public void setDno(String dno) {
        this.dno = dno;
    }

    public Long getCid() {
        return cid;
    }

    public void setCid(Long cid) {
        this.cid = cid;
    }

    public String getDplace() {
        return dplace;
    }

    public void setDplace(String dplace) {
        this.dplace = dplace;
    }

    public String getDmodel() {
        return dmodel;
    }

    public void setDmodel(String dmodel) {
        this.dmodel = dmodel;
    }

    public String getDcode() {
        return dcode;
    }

    public void setDcode(String dcode) {
        this.dcode = dcode;
    }

    public String getDip() {
        return dip;
    }

    public void setDip(String dip) {
        this.dip = dip;
    }

    public Date getUseDate() {
        return useDate;
    }

    public void setUseDate(Date useDate) {
        this.useDate = useDate;
    }

    public String getPsupplier() {
        return psupplier;
    }

    public void setPsupplier(String psupplier) {
        this.psupplier = psupplier;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getNettype() {
        return nettype;
    }

    public void setNettype(String nettype) {
        this.nettype = nettype;
    }

    public String getPerson() {
        return person;
    }

    public void setPerson(String person) {
        this.person = person;
    }

    public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid;
    }

    public String getDefid() {
        return defid;
    }

    public void setDefid(String defid) {
        this.defid = defid;
    }

    public String getFid() {
        return fid;
    }

    public void setFid(String fid) {
        this.fid = fid;
    }

    public String getProjectid() {
        return projectid;
    }

    public void setProjectid(String projectid) {
        this.projectid = projectid;
    }

    public String getOriginalValue() {
        return originalValue;
    }

    public void setOriginalValue(String originalValue) {
        this.originalValue = originalValue;
    }

    public String getSerialNumber() {
        return serialNumber;
    }

    public void setSerialNumber(String serialNumber) {
        this.serialNumber = serialNumber;
    }

    public DeviceType getDeviceType() {
        return deviceType;
    }

    public void setDeviceType(DeviceType deviceType) {
        this.deviceType = deviceType;
    }

    public Cabinet getCabinet() {
        return cabinet;
    }

    public void setCabinet(Cabinet cabinet) {
        this.cabinet = cabinet;
    }

    @Override
    public String toString() {
        return "Device{" +
                "did=" + did +
                ", dname='" + dname + '\'' +
                ", dtid=" + dtid +
                ", dno='" + dno + '\'' +
                ", cid=" + cid +
                ", dplace='" + dplace + '\'' +
                ", dmodel='" + dmodel + '\'' +
                ", dcode='" + dcode + '\'' +
                ", dip='" + dip + '\'' +
                ", dstatus='" + dstatus + '\'' +
                ", useDate=" + useDate +
                ", psupplier='" + psupplier + '\'' +
                ", department='" + department + '\'' +
                ", nettype='" + nettype + '\'' +
                ", person='" + person + '\'' +
                ", oid='" + oid + '\'' +
                ", defid='" + defid + '\'' +
                ", fid='" + fid + '\'' +
                ", projectid='" + projectid + '\'' +
                ", originalValue='" + originalValue + '\'' +
                ", serialNumber='" + serialNumber + '\'' +
                ", deviceType=" + deviceType +
                ", cabinet=" + cabinet +
                '}';
    }
}
