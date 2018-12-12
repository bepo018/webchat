package com.glkj.webchat.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;

/**
 * 创建该类对象至少给 name,photo,hot,roomAddress,createTime,createUser
 */
public class LiveInfo implements Serializable {
    private Integer id;
    private String name;
    private String photo;
    private Integer hot;
    private String roomAddress;
    private Date createTime;
    private String createUser;
    private Date modifiedTime;
    private String modifiedUser;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public Integer getHot() {
        return hot;
    }

    public void setHot(Integer hot) {
        this.hot = hot;
    }

    public String getRoomAddress() {
        return roomAddress;
    }

    public void setRoomAddress(String roomAddress) {
        this.roomAddress = roomAddress;
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

    public Date getModifiedTime() {
        return modifiedTime;
    }

    public void setModifiedTime(Date modifiedTime) {
        this.modifiedTime = modifiedTime;
    }

    public String getModifiedUser() {
        return modifiedUser;
    }

    public void setModifiedUser(String modifiedUser) {
        this.modifiedUser = modifiedUser;
    }

    @Override
    public String toString() {
        return "LiveInfo{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", photo='" + photo + '\'' +
                ", hot=" + hot +
                ", roomAddress='" + roomAddress + '\'' +
                ", createTime=" + createTime +
                ", createUser='" + createUser + '\'' +
                ", modifiedTime=" + modifiedTime +
                ", modifiedUser='" + modifiedUser + '\'' +
                '}';
    }

}

