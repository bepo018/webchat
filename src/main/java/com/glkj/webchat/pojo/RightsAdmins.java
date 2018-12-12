package com.glkj.webchat.pojo;

import java.util.Date;
import java.util.Objects;

/**
 * 管理员与角色权限管理类
 */
public class RightsAdmins {
    private Integer id;
    private Integer adminID;
    private Integer roleID;
    private String create_user;
    private Date create_time;
    private String modified_user;
    private Date modified_time;



    public RightsAdmins() {
    }


    @Override
    public String toString() {
        return "RightsAdmins{" +
                "id=" + id +
                ", adminID=" + adminID +
                ", roleID=" + roleID +
                ", create_user='" + create_user + '\'' +
                ", create_time=" + create_time +
                ", modified_user='" + modified_user + '\'' +
                ", modified_time=" + modified_time +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        RightsAdmins that = (RightsAdmins) o;
        return Objects.equals(id, that.id) &&
                Objects.equals(adminID, that.adminID) &&
                Objects.equals(roleID, that.roleID) &&
                Objects.equals(create_user, that.create_user) &&
                Objects.equals(create_time, that.create_time) &&
                Objects.equals(modified_user, that.modified_user) &&
                Objects.equals(modified_time, that.modified_time);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, adminID, roleID, create_user, create_time, modified_user, modified_time);
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getAdminID() {
        return adminID;
    }

    public void setAdminID(Integer adminID) {
        this.adminID = adminID;
    }

    public Integer getRoleID() {
        return roleID;
    }

    public void setRoleID(Integer roleID) {
        this.roleID = roleID;
    }

    public String getCreate_user() {
        return create_user;
    }

    public void setCreate_user(String create_user) {
        this.create_user = create_user;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public String getModified_user() {
        return modified_user;
    }

    public void setModified_user(String modified_user) {
        this.modified_user = modified_user;
    }

    public Date getModified_time() {
        return modified_time;
    }

    public void setModified_time(Date modified_time) {
        this.modified_time = modified_time;
    }
}
