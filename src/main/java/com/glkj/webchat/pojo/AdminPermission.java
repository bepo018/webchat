package com.glkj.webchat.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;

/**
 * 权限操作许可类
 */
public class AdminPermission implements Serializable {
    private static final long serialVersionUID = 1224520908305198081L;
    private Integer id;
    private Integer pid;
    private Integer type;
    private String menuCode;
    private String menuName;
    private String href;
    private String icon;
    private String remarks;
    private String createUser;
    private Date createTime;
    private String modifiedUser;
    private Date modifiedTime;

    @Override
    public String toString() {
        return "AdminPermission{" +
                "id=" + id +
                ", pid=" + pid +
                ", type=" + type +
                ", menuCode='" + menuCode + '\'' +
                ", menuName='" + menuName + '\'' +
                ", href='" + href + '\'' +
                ", icon='" + icon + '\'' +
                ", remarks='" + remarks + '\'' +
                ", createUser='" + createUser + '\'' +
                ", createTime=" + createTime +
                ", modifiedUser='" + modifiedUser + '\'' +
                ", modifiedTime=" + modifiedTime +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        AdminPermission that = (AdminPermission) o;
        return Objects.equals(id, that.id) &&
                Objects.equals(pid, that.pid) &&
                Objects.equals(type, that.type) &&
                Objects.equals(menuCode, that.menuCode) &&
                Objects.equals(menuName, that.menuName) &&
                Objects.equals(href, that.href) &&
                Objects.equals(icon, that.icon) &&
                Objects.equals(remarks, that.remarks) &&
                Objects.equals(createUser, that.createUser) &&
                Objects.equals(createTime, that.createTime) &&
                Objects.equals(modifiedUser, that.modifiedUser) &&
                Objects.equals(modifiedTime, that.modifiedTime);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, pid, type, menuCode, menuName, href, icon, remarks, createUser, createTime, modifiedUser, modifiedTime);
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getMenuCode() {
        return menuCode;
    }

    public void setMenuCode(String menuCode) {
        this.menuCode = menuCode;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getCreateUser() {
        return createUser;
    }

    public void setCreateUser(String createUser) {
        this.createUser = createUser;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getModifiedUser() {
        return modifiedUser;
    }

    public void setModifiedUser(String modifiedUser) {
        this.modifiedUser = modifiedUser;
    }

    public Date getModifiedTime() {
        return modifiedTime;
    }

    public void setModifiedTime(Date modifiedTime) {
        this.modifiedTime = modifiedTime;
    }

    public AdminPermission() {
    }
}
