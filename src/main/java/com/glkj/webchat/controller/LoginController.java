package com.glkj.webchat.controller;

import com.glkj.webchat.pojo.Admins;
import com.glkj.webchat.pojo.User;
import com.glkj.webchat.service.IAdminsService;
import com.glkj.webchat.service.ILogService;
import com.glkj.webchat.service.IUserService;
import com.glkj.webchat.utils.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Copyright © 2018 The so-called success is to make extraordinary persistence
 * in the ordinary.
 *
 * @author qsjteam
 * @date 2018-10-1
 */
@Controller
@RequestMapping(value = "/user")
public class LoginController {

    @Autowired
    private IAdminsService adminsService;

    @Autowired
    private IUserService userService;

    @Autowired
    private ILogService logService;

    @RequestMapping(value = "/guest", method = RequestMethod.GET)
    public String guestLogin(HttpSession session, RedirectAttributes attributes, WordDefined defined,
                             CommonDate date, LogUtil logUtil, NetUtil netUtil, HttpServletRequest request) {
        String ip = netUtil.getIpAddress(request);
        //默认所有人都是游客，随机分配游客账号
        String userid = RandomCode.getCode(6);
        User user = new User();
        user.setUserid(userid);
        user.setNickname("游客");
        user.setProfilehead("avater" + RandomCode.getNum(136) + ".png");
        user.setProfile("游客登录临时账号");
        user.setStatus(1);
        user.setIp(ip);
        user.setLevel(1);
        session.setAttribute("level", user.getLevel());
        session.setAttribute("userid", userid);
        session.setAttribute("login_status", true);
        session.setAttribute("headmsg", user.getProfilehead());
        session.setMaxInactiveInterval(-1);

        attributes.addFlashAttribute("message", defined.LOGIN_SUCCESS);
        return "redirect:/chat";

    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        return "login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(String userid, String password, HttpSession session, RedirectAttributes attributes,
                        WordDefined defined, CommonDate date, LogUtil logUtil, NetUtil netUtil, HttpServletRequest request) {
        String pwd = password;
        password = GetMD5.getMD5(password);
        System.out.println(password);
        String ip = netUtil.getIpAddress(request);
        User user = userService.selectUserByUserid(userid);
        if (user == null) {
            try {
                attributes.addFlashAttribute("error", defined.LOGIN_USERID_ERROR);
                //登录成功
                Admins admins = adminsService.login(userid,pwd);
                session.setAttribute("level", admins.getLevel());
                session.setAttribute("userid", userid);
                session.setAttribute("login_status", true);
                System.out.println("admins.getProfilehead()::"+admins.getProfilehead());
                session.setAttribute("headmsg", admins.getProfilehead());
                session.setMaxInactiveInterval(-1);
                return "redirect:/chat";
            } catch (Exception e) {
                System.out.println("用户名或密码错误");
                attributes.addFlashAttribute("error", e.getMessage());
                System.out.println(e.getMessage());
                //登录失败
                return "redirect:/user/login";
            }
        } else {
            if (!user.getPassword().equals(password)) {
                attributes.addFlashAttribute("error", defined.LOGIN_PASSWORD_ERROR);
                return "redirect:/user/login";
            } else {
                if (user.getStatus() != 1) {
                    attributes.addFlashAttribute("msg", "账号未激活，请前往你的邮箱完成激活");
                    return "redirect:/registActive";
                } else {
                    logService.insert(logUtil.setLog(userid, date.getTime24(), defined.LOG_TYPE_LOGIN, defined.LOG_DETAIL_USER_LOGIN, netUtil.getIpAddress(request)));
                    session.setAttribute("level", user.getLevel());
                    session.setAttribute("userid", userid);
                    session.setAttribute("login_status", true);
                    session.setAttribute("headmsg", user.getProfilehead());
                    session.setMaxInactiveInterval(-1);
                    user.setLasttime(date.getTime24());
                    user.setIp(ip);
                    userService.update(user);
                    attributes.addFlashAttribute("message", defined.LOGIN_SUCCESS);
                    return "redirect:/chat";
                }
            }
        }
    }

    @RequestMapping(value = "/logout")
    public String logout(HttpSession session, RedirectAttributes attributes, WordDefined defined) {
        session.removeAttribute("userid");
        session.removeAttribute("login_status");
        session.removeAttribute("level");
        session.removeAttribute("headmsg");
        attributes.addFlashAttribute("message", defined.LOGOUT_SUCCESS);
        return "redirect:/user/login";
    }



}
