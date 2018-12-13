package com.glkj.webchat.controller;

import com.glkj.webchat.pojo.AdminPermission;
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
import java.security.Permission;
import java.util.Arrays;
import java.util.List;

/**
 * 管理员控制器层
 */
@Controller
@RequestMapping("admin")
public class AdminsController {
    @Resource
    private IAdminsService adminsService;

    /**
     * 展示注册管理员页面 TODO
     *
     * @return
     */
    @RequestMapping(value = "registerAdmin", method = RequestMethod.GET)
    public String toRegisterAdmin() {
        return "registerAdmin";
    }

    /**
     * 注册管理员   TODO 注册管理员
     *
     * @param username
     * @param password
     * @param level
     * @param qq
     * @param weixin
     * @param phone
     * @param remarks
     * @param rights
     * @param session
     * @return
     */
    @RequestMapping(value = "registerAdmin", method = RequestMethod.POST)
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
        for (int i = 0; i < rights; i++) {
            r[i] = i + 1;
        }
        try {
            adminsService.save(admins, r, createUser);
            jr = new JsonResult<>(1, "创建成功");
        } catch (UsernameNotFoundException e) {
            jr = new JsonResult<>(0, e);
        }
        return jr;
    }

    /**
     * 展示修改管理员页面 TODO
     * @return
     */
    @RequestMapping(value = "editAdmin",method = RequestMethod.GET)
    public String toEditAdmin(){
        return "editAdmin";
    }

    /**
     * 修改管理员信息   TODO 修改管理员
     * @param username
     * @param password
     * @param level
     * @param qq
     * @param weixin
     * @param phone
     * @param remarks
     * @param rights
     * @param session
     * @return
     */
    @RequestMapping(value = "editAdmin",method = RequestMethod.POST)
    @ResponseBody
    public JsonResult<Void> editAdmin(
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
        String modifiedUser = session.getAttribute("userid").toString();

        try {
            Boolean  flag = adminsService.update(admins, rights, modifiedUser);
            if (flag) {
                jr = new JsonResult<>(1, "修改成功！");
            } else {
                jr = new JsonResult<>(0, "修改失败！");
            }
        } catch (UsernameNotFoundException e) {
           jr = new JsonResult<>(-1,e);
        }
        return jr;
    }

    /**
     * 查询所有管理员
     * @return
     */
    @RequestMapping(value = "getAll",method = RequestMethod.GET)
    @ResponseBody
    public JsonResult<List<Admins>> getAll(){
        List<Admins> list = adminsService.findAllAdmins();
        JsonResult<List<Admins>> jr = new JsonResult<>(1,"success",list);
        return jr;
    }

    /**
     * 删除管理员 TODO 删除管理员
     * @param adminName
     * @return
     */
    @RequestMapping(value = "deleteAdmin",method = RequestMethod.GET)
    @ResponseBody
    public JsonResult<Void> deleteAdmin(String adminName){
        JsonResult<Void> jr;
        try {
            adminsService.deleteAdmind(adminName);
            jr = new JsonResult<>(1,"操作成功");
        } catch (UsernameNotFoundException e) {
            jr = new JsonResult<>(0,e);
        }
        return jr;
    }

    /**
     * 根据用户名获取操作许可
     * @param adminName
     * @return
     */
    @RequestMapping(value = "findRoleByName",method = RequestMethod.GET)
    @ResponseBody
    public JsonResult<List<AdminPermission>> findRoleByName(String adminName){
        JsonResult<List<AdminPermission>> jr;
        List<AdminPermission>  list =  adminsService.findPermissionByName(adminName);
        jr = new JsonResult<>(1,"success",list);
        return jr;
    }
}