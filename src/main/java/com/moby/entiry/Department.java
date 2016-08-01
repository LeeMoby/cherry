package com.moby.entiry;

/**
 * Created by Moby on 16/8/1.
 */
public class Department {
    private int id;
    private String name;
    private String nameAbbr;
    private String code;
    private int parentId;

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

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public int getParentId() {
        return parentId;
    }

    public void setParentId(int parentId) {
        this.parentId = parentId;
    }

    @Override
    public String toString() {
        return "Department{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", nameAbbr='" + nameAbbr + '\'' +
                ", code='" + code + '\'' +
                ", parentId=" + parentId +
                '}';
    }
}
