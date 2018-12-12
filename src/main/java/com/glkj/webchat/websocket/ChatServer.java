package com.glkj.webchat.websocket;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.glkj.webchat.utils.AutoMessage;
import com.glkj.webchat.utils.RegexValidator;
import com.glkj.webchat.utils.WordDefined;

import javax.servlet.http.HttpSession;
import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArraySet;

/**
 * Copyright © 2018 The so-called success is to make extraordinary persistence
 * in the ordinary.
 *
 * @author qsjteam
 * @ServerEndpoint 注解是一个类层次的注解，它的功能主要是将目前的类定义成一个websocket服务器端,
 * 注解的值将被用于监听用户连接的终端访问URL地址,客户端可以通过这个URL来连接到WebSocket服务器端
 * 可以把当前类变成websocket服务类
 * @date 2018-10-1
 */
@ServerEndpoint(value = "/chatServer/{roomName}", configurator = HttpSessionConfigurator.class)
public class ChatServer {

	private String userid; // 用户名
	private HttpSession httpSession; // request的session

	private static AutoMessage autoMessage; //自动消息获取类
	private static Random rand;
	private static Integer randomNumer;
	private static Integer count = 0; // 控制加入聊天和自动聊天分离

	/**
	 * concurrent包的线程安全Set，用来存放每个客户端对应的MyWebSocket对象。
	 * 若要实现服务端与单一客户端通信的话，可以使用Map来存放，其中Key可以为用户标识
	 */
	private static CopyOnWriteArraySet<ChatServer> webSocketSet = new CopyOnWriteArraySet<>();

	/**
	 * s 大厅 使用map来收集session，key为roomName，value为同一个房间的用户集合,
	 * s 房间集合的key为userId.value为ws的session
	 */
	@SuppressWarnings(value = {"unchecked", "rawtypes"})
	private static final Map<String, Map<String, Session>> ROOMS = new ConcurrentHashMap();

	static {
		autoMessage = new AutoMessage();
		rand = new Random();
	}

	/**
	 * s连接建立成功的回调方法
	 *
	 * @param session 可选的参数。session为与某个客户端的连接会话，需要通过它来给客户端发送数据
	 */
	@OnOpen
	public void onOpen(@PathParam("roomName") String roomName, Session session, EndpointConfig config) {
		httpSession = (HttpSession) config.getUserProperties().get(HttpSession.class.getName());
		userid = (String) httpSession.getAttribute("userid"); // 获取当前用户
		webSocketSet.add(this); // 加入set中
		// 将session按照房间名来存储，将各个房间的用户隔离
		try {
			// 判断房间名是否存在，containsKey方法:存在返回true 否则抛出空指针异常
			ROOMS.containsKey(roomName);
			// 房间已存在，直接添加用户到相应的房间
			ROOMS.get(roomName).put(userid, session);
		} catch (NullPointerException e) {
			// 房间不存在时，创建房间
			Map<String, Session> room = new HashMap<>();
			// 添加用户到房间
			room.put(userid, session);

			ROOMS.put(roomName, room);// 将房间绑定到大厅
            //第一个用户进入聊天室开启全房间同步开奖线程
            if(ROOMS.size()<=1){
                noticeWinner();
            }
            robotChat(roomName); // 自动广播
		}
		String message = getMessageAll(
				"欢迎 " + userid.substring(0, 2) + "***" + userid.substring(userid.length() - 2) + " 加入聊天室",
                "notice", getOnlineUserIds(roomName));
		broadcast(roomName, message); // 广播

	}

	/**
	 * s连接关闭调用的方法
	 *
	 * @throws IOException
	 */
	@OnClose
	public void onClose(@PathParam("roomName") String roomName) {
		webSocketSet.remove(this);
		ROOMS.get(roomName).remove(userid);
		String message = getMessageAll(
		        userid.substring(0, 2) + "***" + userid.substring(userid.length() - 2) + " 离开聊天室",
                "notice", getOnlineUserIds(roomName));
		broadcast(roomName, message);
	}

	/**
	 * s接收客户端的message,判断是否有接收人而选择进行广播还是指定发送
	 *
	 * @param _message 客户端发送过来的消息
	 * @throws IOException
	 */
	@OnMessage
	public void onMessage(@PathParam("roomName") String roomName, String _message) {

		JSONObject chat = JSON.parseObject(_message);
		JSONObject message = JSON.parseObject(chat.get("message").toString());
        String msg = message.getString("content");
        if(RegexValidator.isURI(msg) || RegexValidator.isURL(msg)){
            List<String> list = new ArrayList<>();
            list.add(message.get("from").toString());
            singleSend(getMessage("禁止发送网址信息", "warning", list), ROOMS.get(roomName).get(message.get("from")));
            return;
        }


		// 如果to为空,则广播;如果不为空,则对指定的用户发送消息
		if ("out".equals(chat.get("type").toString())) {
			List<String> list = new ArrayList<>();
			list.add(message.get("from").toString());
			String admin = message.get("from").toString();
			String member = message.get("to").toString();
			// 提示发件人消息发送失败
			singleSend(getMessage(member + "," + roomName, "out", list), ROOMS.get(roomName).get(member));
			ROOMS.get(roomName).remove(member);

			String leave = getMessageAll(member.substring(0, 2) + "***" + member.substring(member.length() - 2) + " 已被管理员 "
							+ admin.substring(0, 2) + "***" + admin.substring(admin.length() - 2) + " 移除房间",
					"notice", getOnlineUserIds(roomName));
			broadcast(roomName, leave);
			return;
		} else if ("shutup".equals(chat.get("type").toString())) {
			singleSend(getMessage("你被禁言了", "shutup", null),
					ROOMS.get(roomName).get(message.get("to")));
			return;
		}
		if (message.get("to") == null || message.get("to").equals("")) {
			broadcast(roomName, _message);
		} else {
			// 将私聊接收者截到数组中
			String[] addresseeList = message.get("to").toString().split(",");

			boolean flag = true;
			for (String addressee : addresseeList) {
				for (String users : ROOMS.get(roomName).keySet()) {
					if (addressee.equals(users)) {
						flag = false;
						break;
					}
				}
				if (!addressee.equals(message.get("from")) && !flag) {
					// 收件人不是发送者自身 分别发送给每个指定用户
					singleSend(_message, ROOMS.get(roomName).get(addressee));
				}
			}
			if (flag) {
				List<String> list = new ArrayList<>();
				list.add(message.get("from").toString());
				// 提示发件人消息发送失败
				singleSend(getMessage("接收者已离开房间！！", "notice", list),
						ROOMS.get(roomName).get(message.get("from")));
			} else {
				// 发给发送者自己
				singleSend(_message, ROOMS.get(roomName).get(message.get("from")));
			}
		}
	}

	/**
	 * s发生错误时调用
	 *
	 * @param error
	 */
	@OnError
	public void onError(Throwable error) {
		error.printStackTrace();
	}

	/**
	 * s广播至所有房间的所有人
	 *
	 * @param message
	 */
	private void broadcast(String message) {
		for (Map<String, Session> room : ROOMS.values()) {
			for (Session session : room.values()) {
				synchronized (session) {
					try {
						session.getBasicRemote().sendText(message);
					} catch (IOException e) {
						//e.printStackTrace();
						//System.out.println("全频道广播通知时出错!");
						continue;
					}
				}
			}
		}
	}

	/**
	 * s广播消息到指定房间
	 *
	 * @param message
	 * @param roomName
	 */
	private void broadcast(String roomName, String message) {
		for (Session session : ROOMS.get(roomName).values()) {
			synchronized (session) {
				try {
					session.getBasicRemote().sendText(message);
				} catch (IOException e) {
					//e.printStackTrace();
					continue;
				}
			}
		}
	}

	/**
	 * s对特定用户发送消息
	 *
	 * @param message
	 * @param session
	 */
	private void singleSend(String message, Session session) {
		try {
			session.getBasicRemote().sendText(message);
		} catch (IOException e) {
			e.printStackTrace();
			// TODO

		}
	}

	/**
	 * s组装返回给前台的消息 封装给在线列表使用
	 *
	 * @param message 交互信息
	 * @param type    信息类型
	 * @param list    在线列表
	 * @return 封装用户信息（userID， level， 头像）
	 */
	private String getMessageAll(String message, String type, List<Map<String, String>> list) {
		JSONObject member = new JSONObject();
		member.put("message", message);
		member.put("type", type);
		member.put("list", list);
		return member.toString();
	}

	/**
	 * s组装返回给前台的消息 不需要更新在线列表
	 *
	 * @param message 交互信息
	 * @param type    信息类型
	 * @param list    在线列表
	 * @return 封装用户信息（userID）
	 */
	private String getMessage(String message, String type, List<String> list) {
		JSONObject member = new JSONObject();
		member.put("message", message);
		member.put("type", type);
		member.put("list", list);
		return member.toString();
	}

	/**
	 * s当前房间的用户信息（userID， level， 头像）
	 *
	 * @param roomName
	 * @return
	 */
	private List<Map<String, String>> getOnlineUserIds(String roomName) {
		List<Map<String, String>> list = new ArrayList<>();

		for (String userid : ROOMS.get(roomName).keySet()) {
			for (ChatServer key : webSocketSet) {
				// s判断所有websocket集合中是否包含当前房间的用户
				if (userid.equals(key.userid)) {
					Map<String, String> s = new HashMap<String, String>();
					s.put("userid", key.userid);
					s.put("level", key.httpSession.getAttribute("level").toString());
					s.put("headmsg", key.httpSession.getAttribute("headmsg").toString());
					list.add(s);
				}
			}
		}
		return list;

	}

	/**
	 * s获取所有房间的用户id
	 *
	 * @return
	 */
	private List<String> getAllUserIds() {
		List<String> list = new ArrayList<>();
		for (ChatServer key : webSocketSet) {
			// s判断所有websocket集合中是否包含当前房间的用户
			if (!(httpSession.getId() == null || "".equals(httpSession.getId()))) {
				list.add(key.userid);
			}
		}
		return list;
	}

	/**
	 * s聊天方法:2-5秒内有70%几率触发聊天消息
	 *
	 * @param roomName
	 */
	private void robotChat(String roomName) {
		new Thread(() -> {
			while (true) {
				randomNumer = rand.nextInt(100);
				if (randomNumer < 30 && count % (rand.nextInt(3) + 3) == 0) {
					// 广播加入聊天室
					String join = autoMessage.joinChat();
					String message = getMessageAll(join, "noticeRobot",
							getOnlineUserIds(roomName));
					broadcast(roomName, message);// 广播
				}
				if (randomNumer < 20 && count % 8 == 0) {
					// 广播离开聊天室
					String leave = autoMessage.leaveChat();
					String message = getMessageAll(leave, "noticeRobot",
							getOnlineUserIds(roomName));
					broadcast(roomName, message);// 广播
				}
				if (randomNumer < 70 && count % (rand.nextInt(3) + 1) == 0) {
					// 广播聊天内容
					String message = autoMessage.genarateMessage(); // 获取聊天内容
					broadcast(roomName, message);// 广播
				}
				try {
					Thread.sleep(1000); // 3-5秒内有70%几率触发聊天消息
					count++;
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}

		}).start();
	}

	/**
	 * s中奖消息:每5秒有30%几率触发中奖通知消息
	 *
	 */
	private void noticeWinner() {
		new Thread(() -> {
			while (true) {
				randomNumer = rand.nextInt(100);
				if (randomNumer < 50) {
					String message = getMessage(autoMessage.generateWinner(), "noticeWin",
							getAllUserIds());
					broadcast(message);// 广播
				}
				try {
					Thread.sleep((rand.nextInt(5) + 5) * 1000);
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} // 每5秒有30%几率触发中奖通知消息
			}

		}).start();
	}

}
