package com.glkj.webchat.selectLott;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.ConnectException;
import java.net.URL;
import java.net.URLConnection;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

/**
 * Copyright © 2018 The so-called success is to make extraordinary persistence
 * in the ordinary.
 * 线程安全的访问彩票接口工具   露珠查询
 * @author qsjteam
 * @date 2018-10-1
 */
public class ChangLong {
	
	

	/**
	 * 程序中访问http数据接口
	 * 
	 * @param urlStr 彩种的字符串编号
	 * @return 返回最指定期的开奖号码
	 * @throws IOException
	 */
	private synchronized static String searchLottInfo(String urlStr) throws IOException {

		/** 网络的url地址 */
		URL url = null;
		URLConnection conn = null;

		/** 输入流 */
		BufferedReader in = null;
		String str = null;
		
		try {
			do {
				
				String uri ="http://api.jiekouapi.com:7373/hall/trendService/getRoadBeads?lotKey="+urlStr+"&uid=330&date=&time=1540179556&md5=f7ab80d949a4e60bcd1590c31060b6d4&site=www.caipiaoapi.com";
				url = new URL(uri);
				conn = url.openConnection();
				in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
				str = in.readLine();
			}while(str == null /*|| !str.matches(".*gid.*")*/);

		} catch (ConnectException e) {
			try {
				Thread.sleep(5000);
			} catch (InterruptedException e1) {
				e1.printStackTrace();
			}
			str = searchLottInfo(urlStr);
		} catch (IOException e) {
			try {
				Thread.sleep(5000);
			} catch (InterruptedException e1) {
				e1.printStackTrace();
			}
			str = searchLottInfo(urlStr);
		} finally {
			try {
				if (in != null) {
					in.close();
				}
			} catch (IOException e) {
				throw e;
			}
		}
		return str;
	}

	public static String getLottInfo(String urlStr) throws IOException {
		JSONObject data = new JSONObject();
		try {
			String lottInfo = searchLottInfo(urlStr);
			
			JSONObject json = JSONObject.parseObject(lottInfo).getJSONObject("result");
			JSONArray arr = json.getJSONArray("data");
			data.put("data", arr);
		} catch (IOException e) {
			throw e;
		}
		System.out.println(data);
		return data.toJSONString();
	}
	
	public static void main(String[] args) throws IOException {
		getLottInfo("ssc");
	}
	
}
