package com.glkj.webchat.pojo;

import java.io.Serializable;
import java.util.Date;

public class LottType implements Serializable{

	private static final long serialVersionUID = -7124846821540053626L;
	private Integer id;
	private String lottCode;
	private String lottName;
	private String lottCycle;
	private Integer state;
	private String createdUser;
	private Date createdTime;
	private String modifiedUser;
	private Date modifiedTime;

	@Override
	public String toString() {
		return "LottType [id=" + id + ", lottCode=" + lottCode + ", lottName=" + lottName + ", lottCycle=" + lottCycle
				+ ", state=" + state + ", createdUser=" + createdUser + ", createdTime=" + createdTime
				+ ", modifiedUser=" + modifiedUser + ", modifiedTime=" + modifiedTime + "]";
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getLottCode() {
		return lottCode;
	}

	public void setLottCode(String lottCode) {
		this.lottCode = lottCode;
	}

	public String getLottName() {
		return lottName;
	}

	public void setLottName(String lottName) {
		this.lottName = lottName;
	}

	public String getLottCycle() {
		return lottCycle;
	}

	public void setLottCycle(String lottCycle) {
		this.lottCycle = lottCycle;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public String getCreatedUser() {
		return createdUser;
	}

	public void setCreatedUser(String createdUser) {
		this.createdUser = createdUser;
	}

	public Date getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
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

}
