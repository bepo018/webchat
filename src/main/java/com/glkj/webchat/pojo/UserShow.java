package com.glkj.webchat.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;

/**
 * 注册会员没有归属的
 */
public class UserShow implements Serializable {

    private String userid;
    private Integer level;
    private String qq;
    private String weixin;
    private String phone;
    private String invitation;
    private String remarks;
    private Date createTime;
    private String createUser;

    public UserShow() {
    }

    public UserShow(String userid, Integer level, String qq, String weixin, String phone, String invitation, String remarks, Date createTime, String createUser) {
        this.userid = userid;
        this.level = level;
        this.qq = qq;
        this.weixin = weixin;
        this.phone = phone;
        this.invitation = invitation;
        this.remarks = remarks;
        this.createTime = createTime;
        this.createUser = createUser;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
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

    public String getInvitation() {
        return invitation;
    }

    public void setInvitation(String invitation) {
        this.invitation = invitation;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getCreateUser() {
        return createUser;
    }

    public void setCreateUser(String createUser) {
        this.createUser = createUser;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        UserShow userShow = (UserShow) o;
        return Objects.equals(userid, userShow.userid) &&
                Objects.equals(level, userShow.level) &&
                Objects.equals(qq, userShow.qq) &&
                Objects.equals(weixin, userShow.weixin) &&
                Objects.equals(phone, userShow.phone) &&
                Objects.equals(invitation, userShow.invitation) &&
                Objects.equals(remarks, userShow.remarks) &&
                Objects.equals(createTime, userShow.createTime) &&
                Objects.equals(createUser, userShow.createUser);
    }

    @Override
    public int hashCode() {
        return Objects.hash(userid, level, qq, weixin, phone, invitation, remarks, createTime, createUser);
    }

    @Override
    public String toString() {
        return "UserShow{" +
                "userid='" + userid + '\'' +
                ", level=" + level +
                ", qq='" + qq + '\'' +
                ", weixin='" + weixin + '\'' +
                ", phone='" + phone + '\'' +
                ", invitation='" + invitation + '\'' +
                ", remarks='" + remarks + '\'' +
                ", createTime=" + createTime +
                ", createUser='" + createUser + '\'' +
                '}';
    }
}

