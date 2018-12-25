package com.glkj.webchat.selectLott;

import java.io.IOException;
import java.util.Date;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import static javax.swing.UIManager.getString;

/**
 * Copyright © 2018 The so-called success is to make extraordinary persistence
 * in the ordinary. s查询彩票的处理器 将接口取得的彩票信息缓存下来 定时从接口更新数据 解决频繁请求彩票接口的一系列问题
 * 
 * @author qsjteam
 * @date 2018-10-1
 */
public class LotteryHandler {

	/**
	 * 获取彩票信息
	 * 
	 * @param lott
	 * @param rows
	 * @return
	 */
	public static String getLottery(String lott, int rows) {
		try {
			if (rows == 20) {
				String lottOld = BufferPool.getInstance().getSomeone20(lott);
				if (checkTimeout(lott, rows)) {
					System.out.println("重新缓存数据:" + lott + "  rows:" + rows);
					String lottNew = HttpUtil.getLottInfo(lott, rows);
					if (!lottNew.equals(lottOld)) {
						BufferPool.getInstance().setSomeone20(lott, lottNew);
						System.out.println("数据变动:" + lott);
						lottOld = BufferPool.getInstance().getSomeone20(lott);
					}
				}
				return lottOld;

			} else if (rows == 1) {
				String lottOld = BufferPool.getInstance().getSomeone(lott);
				if (checkTimeout(lott, rows)) {
					System.out.println("重新缓存数据:" + lott + "  rows:" + rows);
					String lottNew = HttpUtil.getLottInfo(lott, rows);
					if (!lottNew.equals(lottOld)) {
						BufferPool.getInstance().setSomeone(lott, lottNew);
						System.out.println("数据变动:" + lott);
						lottOld = BufferPool.getInstance().getSomeone(lott);
					}
				}
				return lottOld;
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "参数异常";
	}

	/**
	 * 获取露珠信息
	 * 
	 * @param lott
	 * @return lottOld
	 */
	public static String getLuzhu(String lott) {
		try {
			String luzhuOld = null;
			if ((luzhuOld = BufferPool.getInstance().getLuzhu(lott)) == null) {
				luzhuOld = ChangLong.getLottInfo(lott);
				BufferPool.getInstance().setLuzhu(lott, luzhuOld);
			}
			if (checkTimeout(lott)) {
				System.out.println("重新缓存露珠:" + lott);
				String lottNew = ChangLong.getLottInfo(lott);
				BufferPool.getInstance().setLuzhu(lott, lottNew);
				System.out.println("露珠变动:" + lott);
				luzhuOld = lottNew;
			}
			return luzhuOld;

		} catch (IOException e) {
			e.printStackTrace();
		}
		return "参数异常";
	}

	/**
	 * 获取指定彩种的开奖周期 时间戳
	 * 
	 * @param lott
	 * @return
	 */
	private static long maxOpenTime(String lott) {
		return Long.parseLong(BufferPool.getInstance().getlottType(lott).getLottCycle());
	}

	/**
	 * 检查上一次获取露珠到现在的间隔时间是否超过开奖周期
	 * 
	 * @param lott
	 * @return true 表示已超时 需更新数据
	 */
	@SuppressWarnings("deprecation")
	private static boolean checkTimeout(String lott) {
		String luzhu = BufferPool.getInstance().getLuzhu(lott);
		if (!luzhu.matches(".*roadBeads.*"))
			return true;
		JSONObject json = JSONObject.parseObject(luzhu);
        Object[] arr = json.getJSONArray("data").toArray();
		// 上一个
		if(arr.length != 0) {
            JSONArray newlott = json.getJSONArray("data");
            Date date = JSONObject.parseObject(newlott.getString(0)).getDate("date");// * 1000;
			return date.getDay() < new Date().getDay();
		}
		return true;
	}

	/**
	 * 检查下一次开奖时间和现在的大小比较
	 * 
	 * @param lott
	 * @return ture 表示已超时 需更新数据
	 */
	private static boolean checkTimeout(String lott, int rows) {
		String someone = null;
		//获取指定彩票信息
		if (rows == 20) {
			someone = BufferPool.getInstance().getSomeone20(lott);
		} else if (rows == 1) {
			someone = BufferPool.getInstance().getSomeone(lott);
		}
		//将缓存中的字符串转换为json对象
		JSONObject json = JSONObject.parseObject(someone);
		//获取下一次开奖时间
        Object[] arr = json.getJSONArray("data").toArray();
        if (arr.length == 0)
            return false;
        Date date = JSONObject.parseObject(json.getJSONArray("data").getString(0)).getDate("nextOpenTime");
		long nexttime = date.getTime() + 120000L;
		//获取系统当前时间的毫秒数
		long systemTime = new Date().getTime();
		return nexttime <= systemTime;
	}

}
