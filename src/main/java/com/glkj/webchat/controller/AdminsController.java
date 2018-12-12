package com.glkj.webchat.controller;

import com.glkj.webchat.service.IAdminsService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

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
     * @return
     */
    @RequestMapping("registerAdmin")
    public String toRegisterAdmin(){
        System.out.println("可以吗");
        return "registerAdmin";
    }

}
