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
	private String qq;          //qq
	private String weixin;      //微信
	private String phone;       //电话
	private Integer enterStatus;//入驻状态
	private String invitation;  //邀请码
	private String remarks;     //备注
	private Date createTime;    //创建时间
	private String createUser;  //创建者
	private Date modifiedTime;  //修改时间
	private String modifiedUser;//修改者
	private String email;

	public User() {
	}

	public User(String userid, String password,String nickname, String profilehead,Integer status,Integer level, String qq, String weixin, String phone, Integer enterStatus, String remarks, Date createTime, String createUser) {
		this.userid = userid;
		this.password = password;
		this.nickname = nickname;
		this.profilehead = profilehead;
		this.status = status;
		this.level = level;
		this.qq = qq;
		this.weixin = weixin;
		this.phone = phone;
		this.enterStatus = enterStatus;
		this.remarks = remarks;
		this.createTime = createTime;
		this.createUser = createUser;
	}

	public User(String userid, String password, String nickname, Integer sex, Integer age, String profilehead, String profile, String firsttime, String lasttime, Integer status, String ip, Integer level, String qq, String weixin, String phone, Integer enterStatus,String invitation, String remarks, Date createTime, String createUser, Date modifiedTime, String modifiedUser,String email) {
		this.userid = userid;
		this.password = password;
		this.nickname = nickname;
		this.sex = sex;
		this.age = age;
		this.profilehead = profilehead;
		this.profile = profile;
		this.firsttime = firsttime;
		this.lasttime = lasttime;
		this.status = status;
		this.ip = ip;
		this.level = level;
		this.qq = qq;
		this.weixin = weixin;
		this.phone = phone;
		this.enterStatus = enterStatus;
		this.invitation = invitation;
		this.remarks = remarks;
		this.createTime = createTime;
		this.createUser = createUser;
		this.modifiedTime = modifiedTime;
		this.modifiedUser = modifiedUser;
		this.email = email;
	}

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
				", qq='" + qq + '\'' +
				", weixin='" + weixin + '\'' +
				", phone='" + phone + '\'' +
				", enterStatus=" + enterStatus +
				", invitation='" + invitation + '\'' +
				", remarks='" + remarks + '\'' +
				", createTime=" + createTime +
				", createUser='" + createUser + '\'' +
				", modifiedTime=" + modifiedTime +
				", modifiedUser='" + modifiedUser + '\'' +
				", email='" + email + '\'' +
				'}';
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getInvitation() {
		return invitation;
	}

	public void setInvitation(String invitation) {
		this.invitation = invitation;
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

	public Integer getEnterStatus() {
		return enterStatus;
	}

	public void setEnterStatus(Integer enterStatus) {
		this.enterStatus = enterStatus;
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

}
