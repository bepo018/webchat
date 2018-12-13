package com.glkj.webchat.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;

/**
 * 权限角色类
 */
public class AdminRole implements Serializable {
    private static final long serialVersionUID = -3846065683597442256L;
    private Integer id;
    private String type;
    private String roleName;
    private Integer roleCode;
    private Integer status;
    private Date createTime;
    private Date modifiedTime;
    private String createUser;
    private String modifiedUser;


    @Override
    public String toString() {
        return "AdminRole{" +
                "id=" + id +
                ", type='" + type + '\'' +
                ", roleName='" + roleName + '\'' +
                ", roleCode=" + roleCode +
                ", status=" + status +
                ", createTime=" + createTime +
                ", modifiedTime=" + modifiedTime +
                ", createUser='" + createUser + '\'' +
                ", modifiedUser='" + modifiedUser + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        AdminRole adminRole = (AdminRole) o;
        return Objects.equals(id, adminRole.id) &&
                Objects.equals(type, adminRole.type) &&
                Objects.equals(roleName, adminRole.roleName) &&
                Objects.equals(roleCode, adminRole.roleCode) &&
                Objects.equals(status, adminRole.status) &&
                Objects.equals(createTime, adminRole.createTime) &&
                Objects.equals(modifiedTime, adminRole.modifiedTime) &&
                Objects.equals(createUser, adminRole.createUser) &&
                Objects.equals(modifiedUser, adminRole.modifiedUser);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, type, roleName, roleCode, status, createTime, modifiedTime, createUser, modifiedUser);
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

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

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public Integer getRoleCode() {
        return roleCode;
    }

    public void setRoleCode(Integer roleCode) {
        this.roleCode = roleCode;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getModifiedTime() {
        return modifiedTime;
    }

    public void setModifiedTime(Date modifiedTime) {
        this.modifiedTime = modifiedTime;
    }

    public String getCreateUser() {
        return createUser;
    }

    public void setCreateUser(String createUser) {
        this.createUser = createUser;
    }

    public String getModifiedUser() {
        return modifiedUser;
    }

    public void setModifiedUser(String modifiedUser) {
        this.modifiedUser = modifiedUser;
    }

    public AdminRole() {
    }
}
