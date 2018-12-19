package com.glkj.webchat.utils;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.sun.mail.util.MailSSLSocketFactory;

/**   
 * Copyright © 2018  Sometimes perseverance does win out.
 * 
 * @Package: com.qsj.util 
 * @author:作者 Mao   
 * @date:创建时间 2018年2月24日 上午9:45:42 
 */
public class MailUtil implements Runnable {
	private String email;// 收件人邮箱
	private String code;// 激活码
	
	// 有参构造
	public MailUtil(String email, String code) {
		this.email = email;
		this.code = code;
	}

	@Override
	public void run() {
		  // 1.创建连接对象javax.mail.Session
        // 2.创建邮件对象 javax.mail.Message
        // 3.发送一封激活邮件
        String from = "1358762450@qq.com";// 发件人电子邮箱
        String host = "smtp.qq.com"; // 指定发送邮件的主机smtp.qq.com(QQ)|smtp.163.com(网易)
 
        Properties properties = System.getProperties();// 获取系统属性
 
        properties.setProperty("mail.smtp.host", host);// 设置邮件服务器
        properties.setProperty("mail.smtp.auth", "true");// 打开认证
 
        try {
            //QQ邮箱需要下面这段代码，163邮箱不需要
            MailSSLSocketFactory sf = new MailSSLSocketFactory();
            sf.setTrustAllHosts(true);
            properties.put("mail.smtp.ssl.enable", "true");
            properties.put("mail.smtp.ssl.socketFactory", sf);
 
            // 1.获取默认session对象
            Session session = Session.getDefaultInstance(properties, new Authenticator() {
                public PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("1358762450@qq.com", "txdswwgqdiyvgbci"); // 发件人邮箱账号、授权码
                }
            });
 
            // 2.创建邮件对象
            Message message = new MimeMessage(session);
            // 2.1设置发件人
            message.setFrom(new InternetAddress(from));
            // 2.2设置接收人
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
            // 2.3设置邮件主题
            message.setSubject("彩天下账号验证");
            // 2.4设置邮件内容
            String content = "<p>彩天下账号验证邮件,验证后才能使用账号，请点击以下链接开始验证!注意有效期2天!!!</p><p><a href='http://chatcai.com/registActive/"
                    + code + "'>点击此处完成账号验证——验证码:" + code + "</a></p>" +
                    "<div><p>© 2018 彩天下. All rights reserved | Design by <a href='http://chatcai.com'>chatcai.com</a></p>" +
                    "</div>";
            message.setContent(content, "text/html;charset=UTF-8");
            // 3.发送邮件
            Transport.send(message);
            System.out.println("邮件成功发送!");
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
