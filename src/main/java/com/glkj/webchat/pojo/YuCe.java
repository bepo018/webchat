package com.glkj.webchat.pojo;

import java.io.Serializable;

public class YuCe implements Serializable {

    private Integer id;
    private Integer lottId;
    private String gid;
    private String champNum;
    private String first;
    private String second;
    private String third;
    private String forth;
    private String fifth;
    private String sixth;
    private String seventh;
    private String eighth;
    private String ninth;
    private String tenth;

    @Override
    public String toString() {
        return "YuCe{" +
                "id=" + id +
                ", lottId='" + lottId + '\'' +
                ", gid='" + gid + '\'' +
                ", champNum='" + champNum + '\'' +
                ", first='" + first + '\'' +
                ", second='" + second + '\'' +
                ", third='" + third + '\'' +
                ", forth='" + forth + '\'' +
                ", fifth='" + fifth + '\'' +
                ", sixth='" + sixth + '\'' +
                ", seventh='" + seventh + '\'' +
                ", eighth='" + eighth + '\'' +
                ", ninth='" + ninth + '\'' +
                ", tenth='" + tenth + '\'' +
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

    public String getChampNum() {
        return champNum;
    }

    public void setChampNum(String champNum) {
        this.champNum = champNum;
    }

    public String getFirst() {
        return first;
    }

    public void setFirst(String first) {
        this.first = first;
    }

    public String getSecond() {
        return second;
    }

    public void setSecond(String second) {
        this.second = second;
    }

    public String getThird() {
        return third;
    }

    public void setThird(String third) {
        this.third = third;
    }

    public String getForth() {
        return forth;
    }

    public void setForth(String forth) {
        this.forth = forth;
    }

    public String getFifth() {
        return fifth;
    }

    public void setFifth(String fifth) {
        this.fifth = fifth;
    }

    public String getSixth() {
        return sixth;
    }

    public void setSixth(String sixth) {
        this.sixth = sixth;
    }

    public String getSeventh() {
        return seventh;
    }

    public void setSeventh(String seventh) {
        this.seventh = seventh;
    }

    public String getEighth() {
        return eighth;
    }

    public void setEighth(String eighth) {
        this.eighth = eighth;
    }

    public String getNinth() {
        return ninth;
    }

    public void setNineth(String ninth) {
        this.ninth = ninth;
    }

    public String getTenth() {
        return tenth;
    }

    public void setTenth(String tenth) {
        this.tenth = tenth;
    }

}
