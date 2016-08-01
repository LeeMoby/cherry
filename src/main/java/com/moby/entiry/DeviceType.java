package com.moby.entiry;

/**
 * Created by Moby on 16/6/8.
 */
public class DeviceType {
    private int id;
    private String name;
    private String nameAbbr;
    private String parentId;
    private String orderNumber;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNameAbbr() {
        return nameAbbr;
    }

    public void setNameAbbr(String nameAbbr) {
        this.nameAbbr = nameAbbr;
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }

    @Override
    public String toString() {
        return "DeviceType{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", nameAbbr='" + nameAbbr + '\'' +
                ", parentId='" + parentId + '\'' +
                ", orderNumber='" + orderNumber + '\'' +
                '}';
    }
}
