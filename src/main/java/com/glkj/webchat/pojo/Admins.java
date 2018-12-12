package com.glkj.webchat.pojo;

import java.util.Date;
import java.util.Objects;

/**
 * 管理员类
 */
public class Admins {
    private Integer id;
    private String username;
    private String password;
    private Integer level;
    private String qq;
    private String weixin;
    private String phone;
    private String remarks;
    private String createUser;
    private Date createTime;
    private String modifiedUser;
    private Date modifiedTime;

    @Override
    public String toString() {
        return "Admins{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", level=" + level +
                ", qq='" + qq + '\'' +
                ", weixin='" + weixin + '\'' +
                ", phone='" + phone + '\'' +
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
        Admins admins = (Admins) o;
        return Objects.equals(id, admins.id) &&
                Objects.equals(username, admins.username) &&
                Objects.equals(password, admins.password) &&
                Objects.equals(level, admins.level) &&
                Objects.equals(qq, admins.qq) &&
                Objects.equals(weixin, admins.weixin) &&
                Objects.equals(phone, admins.phone) &&
                Objects.equals(remarks, admins.remarks) &&
                Objects.equals(createUser, admins.createUser) &&
                Objects.equals(createTime, admins.createTime) &&
                Objects.equals(modifiedUser, admins.modifiedUser) &&
                Objects.equals(modifiedTime, admins.modifiedTime);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, username, password, level, qq, weixin, phone, remarks, createUser, createTime, modifiedUser, modifiedTime);
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getWeixin() {
        return weixin;
    }

    public void setWeixin(String weixin) {
        this.weixin = weixin;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
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

    public Admins() {
    }


    public Admins(Integer id, String username, String password, Integer level, String qq, String weixin, String phone, String remarks, String createUser, Date createTime, String modifiedUser, Date modifiedTime) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.level = level;
        this.qq = qq;
        this.weixin = weixin;
        this.phone = phone;
        this.remarks = remarks;
        this.createUser = createUser;
        this.createTime = createTime;
        this.modifiedUser = modifiedUser;
        this.modifiedTime = modifiedTime;
    }
}
