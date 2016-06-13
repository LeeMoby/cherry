package com.moby.entiry;

/**
 * Created by Moby on 16/6/8.
 */
public class Cabinet {
    private long cid;
    private String cno;
    private String cname;
    private String ctype;
    private long rid;
    private Room room;

    public long getCid() {
        return cid;
    }

    public void setCid(long cid) {
        this.cid = cid;
    }

    public String getCno() {
        return cno;
    }

    public void setCno(String cno) {
        this.cno = cno;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getCtype() {
        return ctype;
    }

    public void setCtype(String ctype) {
        this.ctype = ctype;
    }

    public long getRid() {
        return rid;
    }

    public void setRid(long rid) {
        this.rid = rid;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    @Override
    public String toString() {
        return "Cabinet{" +
                "cid=" + cid +
                ", cno='" + cno + '\'' +
                ", cname='" + cname + '\'' +
                ", ctype='" + ctype + '\'' +
                ", rid=" + rid +
                ", room=" + room +
                '}';
    }
}
