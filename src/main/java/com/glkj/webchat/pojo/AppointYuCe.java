package com.glkj.webchat.pojo;

import java.io.Serializable;

public class AppointYuCe implements Serializable {

    private Integer id;
    private Integer lottId;
    private String gid;
    private String special;

    @Override
    public String toString() {
        return "AppointYuCe{" +
                "id=" + id +
                ", lottId=" + lottId +
                ", gid='" + gid + '\'' +
                ", special='" + special + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getLottId() {
        return lottId;
    }

    public void setLottId(Integer lottId) {
        this.lottId = lottId;
    }

    public String getGid() {
        return gid;
    }

    public void setGid(String gid) {
        this.gid = gid;
    }

    public String getSpecial() {
        return special;
    }

    public void setSpecial(String special) {
        this.special = special;
    }
}
