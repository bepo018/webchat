package com.glkj.webchat.utils;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.*;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.glkj.webchat.dao.IUserDao;

/**
 * 自动获取消息类
 * 
 * @author willemjan
 *
 */
public class AutoMessage {
	ApplicationContext ac;
	IUserDao dao;
	private List<?> contents;
	private static Integer count;
	private Calendar now;
	private Random rand;
	private int page;
	private boolean flag;
	private int timeout;
	String joinOrLeave = null;
	List<String> chaters = new ArrayList<>(7200);

	public AutoMessage() {
		flag = true;
		ac = new ClassPathXmlApplicationContext("spring/spring-mybatis.xml");
		dao = ac.getBean("userDao", IUserDao.class);
		rand = new Random();
		addContents(); // 向集合里添加聊天内容
		page = 1;
		count = rand.nextInt(contents.size()); // 从集合里第随机条消息开始获取聊天内容
		//num指定机器人聊天集合里面的人数
				int num = 20; //
		for (int i = 0; i < num; i++) {
			String str = RandomCode.getCode(2) + "***" + RandomCode.getCode(2);
			chaters.add(str);
		}
		System.out.println("聊天内容添加完毕");
	}
	/**
	 * 返回虚拟会员加入聊天时
	 * 
	 * @return
	 */
	public String joinChat() {
		if (rand.nextInt(100) < 40) {
			joinOrLeave = "欢迎游客 " + RandomCode.getCode(2) + "***" + RandomCode.getCode(2) + " 加入聊天室";
		} else {
			joinOrLeave = "欢迎 " + RandomCode.getCode(2) + "***" + RandomCode.getCode(2) + " 加入聊天室";
		}
		return joinOrLeave;
	}

	public String leaveChat() {
		if (rand.nextInt(100) < 40) {
			joinOrLeave = "游客 " + RandomCode.getCode(2) + "***" + RandomCode.getCode(2) + " 离开聊天室";
		} else {
			joinOrLeave = RandomCode.getCode(2) + "***" + RandomCode.getCode(2) + " 离开聊天室";
		}
		return joinOrLeave;
	}
	/**
	 * 返回虚拟聊天json字符串
	 * 
	 * @return
	 */
	public String genarateMessage() {
		String content = getContent();
		String userid = getUserId();
		String time = getTime();
		String str = "{\"message\":{\"content\":\"" + content + "\",\"from\":\"" + userid + "\",\"to\":\"\",\"time\":\""
				+ time + "\"},\"type\":\"messageRobot\"}";
		return str;
	}

	/**
	 * 随机生成中奖者消息
	 * 
	 * @return
	 */
	public String generateWinner() {

		String str = "恭喜" + RandomCode.getCode(3) + "***" + RandomCode.getCode(3) + "在" + getType() + getMoney() + "元";
		return str;
	}

	/**
	 * 获取Money
	 * 
	 * @return
	 */
	private String getMoney() {
		// 4w 10w 4.1w 1k 15w 11w 5k 19w 16w 5.4k 7k 3yuan 194yuan
		Double money = null;
		if (rand.nextInt(100) < 10) { // 10% 200元以下
			money = rand.nextDouble() * 200;
		} else if (rand.nextInt(100) < 20) { // 10% 1k 以下
			money = rand.nextDouble() * 1000;
		} else if (rand.nextInt(100) < 60) { // 30% 5k 以下
			money = rand.nextDouble() * 5000;
		} else if (rand.nextInt(100) < 90) { // 30% 1w 以下
			money = rand.nextDouble() * 10000;
		} else if (rand.nextInt(100) < 100) { // 10% 10w 以下
			money = rand.nextDouble() * 100000;
		}
		DecimalFormat df = new DecimalFormat("0.00");
		return df.format(money);
	}

	//	public static void main(String[] args) {
	//		AutoMessage a = new AutoMessage();
	//		for (int i = 0; i < 100; i++) {
	//			System.out.println(a.getMoney());
	//			try {
	//				Thread.sleep(1000);
	//			} catch (InterruptedException e) {
	//				e.printStackTrace();
	//			}
	//		}
	//	}
	/**
	 * 获取中奖信息
	 * 
	 * @return
	 */
	private String getType() {
		Random rand = new Random();
		/*
		 * 江苏快3、安微快3、广西快3、湖北快3、北京快3， 大发快3、河北快3、甘肃快3、上海快3、贵州快3、
		 * 吉林快3、重庆时时彩、新疆时时彩、天津时时彩、大发时时彩、 北京快8、北京PK10、香港六合彩、大发六合彩、大发PK10,
		 * 广东11选5、上海11选5、山东11选5、江西11选5、山东11选5， 江西11选5、福彩3D
		 */

		String[] prizesType = { "江苏快3", "安微快3", "广西快3", "湖北快3", "北京快3", "大发快3", "河北快3", "甘肃快3", "上海快3", "贵州快3", "吉林快3",
				"重庆时时彩", "新疆时时彩", "天津时时彩", "大发时时彩", "北京快8", "北京PK10", "香港六合彩", "、大发六合彩", "、大发PK10", "广东11选5", "上海11选5",
				"山东11选5", "江西11选5", "山东11选5", "江西11选5", "福彩3D" };
		// 快3
		String[] k3 = { "和值", "三同号通选", "三同号单选", "二同号复选", "二同号单选", "三不同号", "二不同号", "三连号通选", };
		// 时时彩
		String[] ssc = { "一星", "二星", "三星", "五星", "三星直选组合", "三星组选三", "三星组选六", "三星组选包胆", "三星组选和值" };
		// 11选5
		String[] _11x5 = { "单式", "复式", "多期", "多倍", "基数组合" };
		// 福彩3d
		String[] fc3d = { "单选", "组选", "1D", "猜1D", "2D", "猜2D", "通选", "和数", "包选", "猜大小", "拖拉机", "猜奇偶" };
		String play = "";
		String prize = prizesType[rand.nextInt(prizesType.length)];
		String target = prize.substring(prize.length() - 2);
		if ("快3".equals(target)) {
			play = k3[rand.nextInt(k3.length)];
		}
		if ("时彩".equals(target)) {
			play = ssc[rand.nextInt(ssc.length)];
		}
		if ("选5".equals(target)) {
			play = _11x5[rand.nextInt(_11x5.length)];
		}
		if ("3d".equals(target)) {
			play = fc3d[rand.nextInt(fc3d.length)];
		}
		String type = prize + "-" + play + "玩法中投注,中奖";
		return type;
	}

	/**
	 * 获取当前时间
	 * 
	 * @return
	 */
	private String getTime() {
		Date now = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 可以方便地修改日期格式
		String time = dateFormat.format(now);
		return time;
	}

	/**
	 * 获取聊天消息
	 * 
	 * @return
	 */
	private String getContent() {
		now = Calendar.getInstance();
		int time = now.get(Calendar.HOUR_OF_DAY);
		//初始化
		if(flag){
			timeout=time;
			flag=false;
			addContents();
		}
		// 判断是否更换
		if(time != timeout) {
			contents.clear();
			timeout=time;
			addContents();
		}
		if (count >= contents.size()) { // 如果是集合最后一条数据则重新定位
			count = rand.nextInt(contents.size());
		}
		String str = (String) contents.get(count++);
		return str;
	}

	/**
	 * 添加聊天信息
	 */
	private void addContents() {
		contents = dao.list(page);
		page=page+7200;
		if(7200 > contents.size()) {
			page=1;
		}else if (contents.size() == 0){
			page=1;
			contents = dao.list(page);
		}

	}

	/**
	 * 获取发送聊天信息者
	 * 
	 * @return
	 */
	private String getUserId() {
		return chaters.get(rand.nextInt(chaters.size()));
	}

}
