package com.moby.dto;

import com.moby.entiry.Employee;

import java.util.Date;
import java.util.List;

/**
 * Created by Moby on 16/8/24.
 */
public class WorkItemDTO {
    private Integer id;
    private String level;
    private String content;
    private String progress;
    private Date date;
    private List<Employee> teamEmployee;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getProgress() {
        return progress;
    }

    public void setProgress(String progress) {
        this.progress = progress;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public List<Employee> getTeamEmployee() {
        return teamEmployee;
    }

    public void setTeamEmployee(List<Employee> teamEmployee) {
        this.teamEmployee = teamEmployee;
    }

    @Override
    public String toString() {
        return "WorkItemDTO{" +
                "id=" + id +
                ", level='" + level + '\'' +
                ", content='" + content + '\'' +
                ", progress='" + progress + '\'' +
                ", date=" + date +
                ", teamEmployee=" + teamEmployee +
                '}';
    }
}
