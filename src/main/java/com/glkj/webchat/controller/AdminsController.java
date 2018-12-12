package com.glkj.webchat.controller;

import com.glkj.webchat.pojo.Admins;
import com.glkj.webchat.pojo.JsonResult;
import com.glkj.webchat.service.IAdminsService;
import com.glkj.webchat.service.ex.UsernameNotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Arrays;

/**
 * 管理员控制器层
 */
@Controller
@RequestMapping("admin")
public class AdminsController {
    @Resource
    private IAdminsService adminsService;

    /**
     * 展示注册管理员页面
     *
     * @return
     */
//    @RequestMapping(value = "registerAdmin", method = RequestMethod.GET)
//    public String toRegisterAdmin() {
//        return "registerAdmin";
//    }

    @RequestMapping(value = "registerAdmin", method = RequestMethod.GET)
    @ResponseBody
    public JsonResult<Void> registeAdmin(
            String username, String password, Integer level, String qq, String weixin,
            String phone, String remarks, Integer rights, HttpSession session
    ) {
        JsonResult<Void> jr;
        Admins admins = new Admins();
        admins.setUsername(username);
        admins.setPassword(password);
        admins.setLevel(level);
        admins.setQq(qq);
        admins.setWeixin(weixin);
        admins.setPhone(phone);
        admins.setRemarks(remarks);
        String createUser = session.getAttribute("userid").toString();
        int[] r = new int[rights];
        for (int i=0;i<rights;i++){
             r[i] = i+1;
        }
        try {
            adminsService.save(admins, r, createUser);
            jr = new JsonResult<>(1, "创建成功");
        } catch (UsernameNotFoundException e) {
            jr = new JsonResult<>(0, e);
        }
        return jr;
    }

}
