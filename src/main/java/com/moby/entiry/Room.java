package com.moby.entiry;

/**
 * Created by Moby on 16/6/8.
 */
public class Room {
    private long rid;
    private String rno;
    private String rname;

    public long getRid() {
        return rid;
    }

    public void setRid(long rid) {
        this.rid = rid;
    }

    public String getRno() {
        return rno;
    }

    public void setRno(String rno) {
        this.rno = rno;
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname;
    }

    @Override
    public String toString() {
        return "Room{" +
                "rid=" + rid +
                ", rno='" + rno + '\'' +
                ", rname='" + rname + '\'' +
                '}';
    }
}
