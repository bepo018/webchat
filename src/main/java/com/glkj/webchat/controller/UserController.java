package com.glkj.webchat.controller;

import com.glkj.webchat.pojo.JsonResult;
import com.glkj.webchat.pojo.UserShow;
import com.glkj.webchat.service.ex.UsernameNotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.glkj.webchat.pojo.User;
import com.glkj.webchat.service.ILogService;
import com.glkj.webchat.service.IUserService;
import com.glkj.webchat.utils.*;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.channels.MembershipKey;
import java.util.List;

/**
 * Copyright © 2018 The so-called success is to make extraordinary persistence
 * in the ordinary.
 * 
 * @author qsjteam
 * @date 2018-10-1
 */
@Controller
@SessionAttributes("userid")
public class UserController {
	
    @Resource private User user;
    @Resource private IUserService userService;
    @Resource private ILogService logService;
    
    /**
     * 视频主页
     
    @RequestMapping(value = "chat")
    public ModelAndView getVideo(){
        ModelAndView view = new ModelAndView("video");
        return view;
    }*/
    
    /**
     * 聊天主页
    */
    @RequestMapping(value = "chat")
    public String getIndex(HttpServletRequest request) {

        //判断手机端还是pc端
        boolean judgeIsMoblie = JudgePcOrMobile.JudgeIsMoblie(request);
        if (judgeIsMoblie == true) {
            //手机端
            return "index_m";
        } else {
            //pc端
            return "index";
        }
    }

    /**
     * 显示个人信息页面
     */
    @RequestMapping(value = "{userid}", method = RequestMethod.GET)
    public ModelAndView selectUserByUserid(@PathVariable("userid") String userid, @ModelAttribute("userid") String sessionid){
        ModelAndView view = new ModelAndView("information");
        user = userService.selectUserByUserid(userid);
        view.addObject("user", user);
        return view;
    }
    
    /**
     * 显示休闲游戏页面
     */
    @RequestMapping(value = "five", method = RequestMethod.GET)
    public String fivechess(@PathVariable("userid") String userid, @ModelAttribute("userid") String sessionid){
        return "fivechess";
    }

    /**
     * 显示注册页面
     *
     * @return
     */
    @RequestMapping("register")
    public String showRegister() {
        return "register";
    }

    /**
     * 检查用户名
     *
     * @param username
     * @return
     */
    @RequestMapping("check_username")
    @ResponseBody
    public JsonResult<Void> check_username(String username) {
        JsonResult<Void> jr;
        if (!userService.checkUsernameExists(username)) {
            jr = new JsonResult<>(1, "可以使用的用户名");
        } else {

            jr = new JsonResult<>(0, "用户名已存在");
        }
        return jr;
    }

    /**
     * 检查qq号
     *
     * @param qq
     * @return
     */
    @RequestMapping("check_qq")
    @ResponseBody
    public JsonResult<Void> check_qq(String qq) {
        JsonResult<Void> jr;
        if (userService.checkQqExists(qq)) {
            jr = new JsonResult<>(0, "号码已被占用");
        } else {
            jr = new JsonResult<>(1, "可以使用的号码");
        }
        return jr;
    }

    /**
     * 检查电话号码
     *
     * @param phone
     * @return
     */
    @RequestMapping("check_phone")
    @ResponseBody
    public JsonResult<Void> check_phone(String phone) {
        JsonResult<Void> jr;
        if (userService.checkPhoneExists(phone)) {
            jr = new JsonResult<>(0, "号码已被占用");
        } else {
            jr = new JsonResult<>(1, "可以使用的号码");
        }
        return jr;
    }
    /**
     * 检查电话号码
     *
     * @param weixin
     * @return
     */
    @RequestMapping("check_weixin")
    @ResponseBody
    public JsonResult<Void> check_weixin(String weixin) {
        JsonResult<Void> jr;
        if (userService.checkWeixinExists(weixin)) {
            jr = new JsonResult<>(0, "号码已被占用");
        } else {
            jr = new JsonResult<>(1, "可以使用的号码");
        }
        return jr;
    }

    /**
     * 注册会员
     *
     * @param invitation
     * @param uname
     * @param password
     * @param phone
     * @param qq
     * @return
     */
    @RequestMapping(value = "form_register", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult<Void> handle_Register(String invitation, String uname, String password, String phone, String qq,String weixin) {
        JsonResult<Void> jr;
        User user = new User();
        user.setUserid(uname);
        user.setPassword(password);
        user.setInvitation(invitation);
        if(invitation ==null){
            user.setInvitation("没有归属");
        }
        user.setPhone(phone);
        user.setQq(qq);
        user.setWeixin(weixin);
        try {
            userService.register(user);
            jr = new JsonResult<>(1, "注册成功");
        } catch (Exception e) {
            jr = new JsonResult<>(0, "注册失败，请重新注册");
        }
        return jr;
    }

    /**
     * 展示没有归属的用户信息
     * @return
     */
    @RequestMapping("showUserInfo")
    public String showUserInfo(Model model){
        List<UserShow> list = userService.showUserInfo();
        model.addAttribute("list",list);
        return "vip";
    }

    /**
     * 展示私有归属的用户信息
     * @return
     */
    @RequestMapping("showPrivateUser")
    public String showPrivateUser(HttpSession session,Model model){
        Object uidObject = session.getAttribute("userid");
        String  uid = uidObject.toString();
        List<UserShow> list = userService.showPrivateUser(uid);
        model.addAttribute("list",list);
        return "privateVip";
    }

    /**
     * 修改用户归属
     * @param userid
     * @param session
     * @return
     */
    @RequestMapping(value = "updateInvitation",method = RequestMethod.GET)
    @ResponseBody
    public JsonResult<Void> updateInvitation(String userid ,HttpSession session){
        JsonResult<Void> jr;
        // 获取当前用户id
        String  id = session.getAttribute("userid").toString();
        try {
            userService.updateInvitation(id,userid);
            jr = new JsonResult<>(1,"用户已修改");
        } catch (UsernameNotFoundException e) {
            jr = new JsonResult<>(0,"用户数据不存在");
        }
        return jr;
    }

}
