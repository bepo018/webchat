package com.glkj.webchat.pojo;

import java.io.Serializable;

public class Lott implements Serializable {

	private static final long serialVersionUID = 3331749052401105243L;
	/** 开奖期号 */
	private String gid;
	/** 开奖结果 */
	private String award;
	/** 开奖时间 格式 1970-01-01 00:00:00 */
	private String time;
	/** 下期期号 */
	private String nextOpenIssue;
	/** 下期开奖时间  1970-01-01 00:00:00 */
	private String nextOpenTime;

	@Override
	public String toString() {
		return "LottType [gid=" + gid + ", award=" + award + ", time=" + time + ", nextOpenIssue=" + nextOpenIssue
				+ ", nextOpenTime=" + nextOpenTime + "]";
	}

	public String getGid() {
		return gid;
	}

	public void setGid(String gid) {
		this.gid = gid;
	}

	public String getAward() {
		return award;
	}

	public void setAward(String award) {
		this.award = award;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getNextOpenIssue() {
		return nextOpenIssue;
	}

	public void setNextOpenIssue(String nextOpenIssue) {
		this.nextOpenIssue = nextOpenIssue;
	}

	public String getNextOpenTime() {
		return nextOpenTime;
	}

	public void setNextOpenTime(String nextOpenTime) {
		this.nextOpenTime = nextOpenTime;
	}

}
