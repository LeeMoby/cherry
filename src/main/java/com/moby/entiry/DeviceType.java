package com.moby.entiry;

/**
 * Created by Moby on 16/6/8.
 */
public class DeviceType {
    private long dtid;
    private String dtno;
    private String dtname;
    private String sortno;

    public long getDtid() {
        return dtid;
    }

    public void setDtid(long dtid) {
        this.dtid = dtid;
    }

    public String getDtno() {
        return dtno;
    }

    public void setDtno(String dtno) {
        this.dtno = dtno;
    }

    public String getDtname() {
        return dtname;
    }

    public void setDtname(String dtname) {
        this.dtname = dtname;
    }

    public String getSortno() {
        return sortno;
    }

    public void setSortno(String sortno) {
        this.sortno = sortno;
    }

    @Override
    public String toString() {
        return "DeviceType{" +
                "dtid=" + dtid +
                ", dtno='" + dtno + '\'' +
                ", dtname='" + dtname + '\'' +
                ", sortno='" + sortno + '\'' +
                '}';
    }
}
