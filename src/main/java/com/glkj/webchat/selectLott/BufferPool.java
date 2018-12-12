package com.glkj.webchat.selectLott;

import java.util.HashMap;
import java.util.Map;

import com.glkj.webchat.pojo.LottType;

/**
 * Copyright © 2018 The so-called success is to make extraordinary persistence
 * in the ordinary.
 * s彩票缓存池 保存了最新一期的彩票信息  以及每个彩种的开奖周期
 * @author qsjteam
 * @date 2018-10-1
 */
public class BufferPool {

	
	private static BufferPool bufferPool;
	//彩票缓存池一个彩种1条记录
	private Map<String,String> allLott = new HashMap<>(20);
	
	//彩票缓存池一个彩种20条记录
	private Map<String,String> allLott20 = new HashMap<>(20);
	
	//全彩种（已存入数据库）
	private Map<String,LottType> lotterys = new HashMap<>();
	
	private Map<String,String> luzhus = new HashMap<>();
	
	private BufferPool() {
		initLuzhu();
	}
	
	public static BufferPool getInstance() {
		if(bufferPool == null)
			bufferPool = new BufferPool();
		return bufferPool;
	}
	
	public boolean setLuzhu(String lott,String info) {
		return luzhus.replace(lott, info) != null ? true : false;
	}
	
	public String getLuzhu(String lott) {
		return luzhus.get(lott);
	}
	
	public void initLuzhu() {
		luzhus.put("bjpk10",null);
		luzhus.put("ssc",null);
		luzhus.put("jsk3",null);
	}
	
	/**
	 * 修改指定彩票的开奖信息
	 * @param lott
	 * @return true 表示修改成功
	 */
	public boolean setSomeone(String lott,String info) {
		return allLott.replace(lott, info) != null ? true : false;
	}
	
	/**
	 * 修改指定彩票的开奖信息
	 * @param lott
	 * @return true 表示修改成功
	 */
	public boolean setSomeone20(String lott,String info) {
		return allLott20.replace(lott, info) != null ? true : false;
	}
	
	/**
	 * 获取指定彩票的开奖信息
	 * @param lott
	 * @return true 表示修改成功
	 */
	public String getSomeone(String lott) {
		return allLott.get(lott);
	}
	
	/**
	 * 获取指定彩票的开奖信息
	 * @param lott
	 * @return true 表示修改成功
	 */
	public String getSomeone20(String lott) {
		return allLott20.get(lott);
	}
	
	/**
	 * 初始化调用的方法
	 * @param lott
	 * @param info
	 * @return
	 */
	public void put(String lott,String info) {
		allLott.put(lott,info);
	}
	
	public void put20(String lott,String info) {
		allLott20.put(lott,info);
	}
	
	public void putLottType(String lott,LottType info) {
		lotterys.put(lott,info);
	}
	
	/**
	 * 获取指定的 彩票类型对象
	 * @param lott
	 * @return
	 */
	 public LottType getlottType(String lott) {
		return lotterys.get(lott);
	}

}
