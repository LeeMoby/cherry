package com.moby.entiry;

import java.util.Date;

/**
 * Created by Moby on 16/8/3.
 */
public class AuditDevice {
    private Integer id;
    private String type;
    private Date datetime;
    private Integer userId;
    private String ipAddress;
    private String browser;
    private String os;
    private String content;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Date getDatetime() {
        return datetime;
    }

    public void setDatetime(Date datetime) {
        this.datetime = datetime;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getIpAddress() {
        return ipAddress;
    }

    public void setIpAddress(String ipAddress) {
        this.ipAddress = ipAddress;
    }

    public String getBrowser() {
        return browser;
    }

    public void setBrowser(String browser) {
        this.browser = browser;
    }

    public String getOs() {
        return os;
    }

    public void setOs(String os) {
        this.os = os;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "AuditDevice{" +
                "id=" + id +
                ", type='" + type + '\'' +
                ", datetime=" + datetime +
                ", userId=" + userId +
                ", ipAddress='" + ipAddress + '\'' +
                ", browser='" + browser + '\'' +
                ", os='" + os + '\'' +
                ", content='" + content + '\'' +
                '}';
    }
}
