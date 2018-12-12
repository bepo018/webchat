package com.glkj.webchat.pojo;

/**
 * 此类只包含直播需要的信息
 */
public class LiveOK {

    private String name;
    private String photo;
    private Integer hot;
    private String roomAddress;

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

    @Override
    public String toString() {
        return "LiveOK{" +
                "name='" + name + '\'' +
                ", photo='" + photo + '\'' +
                ", hot=" + hot +
                ", roomAddress='" + roomAddress + '\'' +
                '}';
    }
}
