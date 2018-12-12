package com.glkj.webchat.selectLott;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.math.BigInteger;
import java.net.ConnectException;
import java.net.URL;
import java.net.URLConnection;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

/**
 * Copyright © 2018 The so-called success is to make extraordinary persistence
 * in the ordinary.
 * s线程安全的访问彩票接口工具   开奖查询
 * @author qsjteam
 * @date 2018-10-1
 */
public class HttpUtil {
	
	private static final String TOKEN = "f740161ff9aec92f23d616f65488f6a7";
	private static final String UID = "330";
	private static final String API = "apiGameList";
	private static final String SITE = "api.jiekouapi.com";

	/**
	 * 程序中访问http数据接口
	 * 
	 * @param urlStr 彩种的字符串编号
	 * @param rows   需要查询最近多少期开奖结果
	 * @return 返回最指定期的开奖号码
	 * @throws IOException
	 */
	private synchronized static String searchLottInfo(String urlStr, int rows) throws IOException {

		/** 网络的url地址 */
		URL url = null;
		URLConnection conn = null;

		/** 输入流 */
		BufferedReader in = null;
		String str = null;
		if (rows <= 0)
			rows = 1;
		try {
			while(str == null || !str.matches(".*gid.*")){
				
				long time = System.currentTimeMillis()/1000L;
				String key = md5(md5(time + "-" + TOKEN));
				
				String uri ="http://api.caipiaoapi.com/hall/nodeService/api_request?uid="
						+UID+"&md5="+key+"&api="+API+"&gamekey="+urlStr+"&time="+time+"&site="+SITE+"&count="+rows;
				url = new URL(uri);
				conn = url.openConnection();
				in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
				str = in.readLine();
				if(!str.matches(".*gid.*")) {
					System.out.println("data为空，没有数据："+str);
					try {
						Thread.sleep(5000);
					} catch (InterruptedException e) {
						e.printStackTrace();
					}
				}
			}

		} catch (ConnectException e) {
			e.printStackTrace();
			try {
				Thread.sleep(5000);
			} catch (InterruptedException e1) {
				e1.printStackTrace();
			}
			str = searchLottInfo(urlStr, rows);
		} catch (IOException e) {
			e.printStackTrace();
			try {
				Thread.sleep(5000);
			} catch (InterruptedException e1) {
				e1.printStackTrace();
			}
			str = searchLottInfo(urlStr, rows);
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

	public static String getLottInfo(String urlStr, int rows) throws IOException {
		JSONObject data = new JSONObject();
		try {
			String lottInfo = searchLottInfo(urlStr,rows);
			JSONObject json = JSONObject.parseObject(lottInfo).getJSONObject("result");
			JSONArray arr = json.getJSONArray("data");

			data.put("data", arr);
		} catch (IOException e) {
			throw e;
		}
		System.out.println(data);
		return data.toJSONString();
	}
	
	private static String md5(String str) {
		try {
			// 生成一个MD5加密计算摘要
			MessageDigest md = MessageDigest.getInstance("MD5");
			// 计算md5函数
			md.update(str.getBytes());
			// digest()最后确定返回md5 hash值，返回值为8为字符串。因为md5 hash值是16位的hex值，实际上就是8位的字符
			// BigInteger函数则将8位的字符串转换成16位hex值，用字符串来表示；得到字符串形式的hash值
			return new BigInteger(1, md.digest()).toString(16).toLowerCase();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static void main(String[] args) throws IOException {
		getLottInfo("bjpk10", 1);
	}
}
