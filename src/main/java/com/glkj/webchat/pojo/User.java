package com.glkj.webchat.pojo;

import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.Objects;

/**
 * Copyright © 2018 The so-called success is to make extraordinary persistence
 * in the ordinary. TODO 4 这里修改过
 *
 * @author qsjteam
 * @date 2018-10-1
 */
@Repository(value = "user")
public class User {
	private String userid;      //用户名
	private String password;    //密码
	private String nickname;    //昵称
	private Integer sex;        //性别
	private Integer age;        //年龄
	private String profilehead; //头像
	private String profile;     //简介
	private String firsttime;   //注册时间
	private String lasttime;    //最后登录时间
	private Integer status;     //账号状态(1正常 0禁用)
	private String ip;          //登陆ip
	private Integer level;      //会员等级
	private String weixin;      //微信
	private String phone;       //电话
	private Integer enterStatus;//入驻状态
	private String invitation;  //邀请码
	private String remarks;     //备注
	private Date createTime;    //创建时间
	private String createUser;  //创建者
	private Date modifiedTime;  //修改时间
	private String modifiedUser;//修改者
	private String realname;

	@Override
	public String toString() {
		return "User{" +
				"userid='" + userid + '\'' +
				", password='" + password + '\'' +
				", nickname='" + nickname + '\'' +
				", sex=" + sex +
				", age=" + age +
				", profilehead='" + profilehead + '\'' +
				", profile='" + profile + '\'' +
				", firsttime='" + firsttime + '\'' +
				", lasttime='" + lasttime + '\'' +
				", status=" + status +
				", ip='" + ip + '\'' +
				", level=" + level +
				", weixin='" + weixin + '\'' +
				", phone='" + phone + '\'' +
				", enterStatus=" + enterStatus +
				", invitation='" + invitation + '\'' +
				", remarks='" + remarks + '\'' +
				", createTime=" + createTime +
				", createUser='" + createUser + '\'' +
				", modifiedTime=" + modifiedTime +
				", modifiedUser='" + modifiedUser + '\'' +
				", realname='" + realname + '\'' +
				'}';
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getProfilehead() {
		return profilehead;
	}

	public void setProfilehead(String profilehead) {
		this.profilehead = profilehead;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getFirsttime() {
		return firsttime;
	}

	public void setFirsttime(String firsttime) {
		this.firsttime = firsttime;
	}

	public String getLasttime() {
		return lasttime;
	}

	public void setLasttime(String lasttime) {
		this.lasttime = lasttime;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
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

	public Integer getEnterStatus() {
		return enterStatus;
	}

	public void setEnterStatus(Integer enterStatus) {
		this.enterStatus = enterStatus;
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

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}
}
