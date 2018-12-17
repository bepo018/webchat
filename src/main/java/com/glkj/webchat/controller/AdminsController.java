package com.glkj.webchat.controller;

import com.glkj.webchat.pojo.AdminPermission;
import com.glkj.webchat.pojo.Admins;
import com.glkj.webchat.pojo.JsonResult;
import com.glkj.webchat.service.IAdminsService;
import com.glkj.webchat.service.ex.PasswordNotMatchException;
import com.glkj.webchat.service.ex.UsernameNotFoundException;
import com.glkj.webchat.utils.WordDefined;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.security.Permission;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Random;

/**
 * 管理员控制器层
 */
@Controller
@RequestMapping("admin")
public class AdminsController {
    @Resource
    private IAdminsService adminsService;

    /**
     * 展示登录页面
     * @return
     */
    @RequestMapping(value = "adminLogin",method = RequestMethod.GET)
    public String toLogin(){
        return "ht_login";
    }

    /**
     * 展示主页页面
     * @return
     */
    @RequestMapping(value = "index",method = RequestMethod.GET)
    public String index(Model model ,HttpSession session){
        String userid = (String) session.getAttribute("userid");
        if(userid == null || userid == "")
            return "redirect:/admin/adminLogin";
        List<AdminPermission> list = adminsService.findPermissionByName(userid);
        model.addAttribute("menus",list);
        return "ht_index";
    }

    /**
     * 处理登录业务
     * @param adminName
     * @param password
     * @return
     */
    @RequestMapping(value = "adminLogin",method = RequestMethod.POST)
    public String login(String adminName, String password, RedirectAttributes attributes, HttpSession session, Model model){
        try {
            Admins admins = adminsService.login(adminName, password);
            session.setAttribute("level", admins.getLevel());
            session.setAttribute("userid", admins.getUsername());
            session.setAttribute("headmsg", admins.getProfilehead());
            return "redirect:/admin/index";
        } catch (UsernameNotFoundException e) {
            attributes.addFlashAttribute("error",e.getMessage());
            return "redirect:/admin/adminLogin";
        } catch (PasswordNotMatchException e){
            attributes.addFlashAttribute("error",e.getMessage());
            return "redirect:/admin/adminLogin";
        }
    }

    /**
     * 展示注册管理员页面 TODO
     *
     * @return
     */
    @RequestMapping(value = "registerAdmin", method = RequestMethod.GET)
    public String toRegisterAdmin(Model model) {
        model.addAttribute("levels",adminsService.selectRoles());
        return "editAdmin";
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
     * @param session
     * @return
     */
    @RequestMapping(value = "registerAdmin", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult<Void> registeAdmin(String username, String password, Integer level, String qq, String weixin,
                                        String phone, String remarks, HttpSession session) {
        JsonResult<Void> jr;
        Admins admins = new Admins();
        admins.setUsername(username);
        admins.setPassword(password);
        admins.setLevel(level);
        admins.setQq(qq);
        admins.setWeixin(weixin);
        admins.setPhone(phone);
        admins.setRemarks(remarks);
        admins.setCreateUser(session.getAttribute("userid").toString());
        admins.setCreateTime(new Date());
        Random random = new Random();
        admins.setProfilehead("avater"+random.nextInt(90)+".png");
        try {
            adminsService.save(admins, level);
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
    public String toEditAdmin(String adminName,Model model){
        Admins admin = adminsService.findByName(adminName);
        model.addAttribute("levels",adminsService.selectRoles());
        model.addAttribute("admin",admin);
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
     * @param session
     * @return
     */
    @RequestMapping(value = "editAdmin",method = RequestMethod.POST)
    @ResponseBody
    public JsonResult<Void> editAdmin(String username, String password, Integer level, String qq, String weixin,
            String phone, String remarks, HttpSession session ) {
        JsonResult<Void> jr;
        Admins admins = new Admins();
        admins.setUsername(username);
        admins.setPassword(password);
        admins.setLevel(level);
        admins.setQq(qq);
        admins.setWeixin(weixin);
        admins.setPhone(phone);
        admins.setRemarks(remarks);
        admins.setModifiedUser(session.getAttribute("userid").toString());
        admins.setModifiedTime(new Date());
        try {
            Boolean  flag = adminsService.update(admins);
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
    public String getAll(Model model){
        List<Admins> list = adminsService.findAllAdmins();
        model.addAttribute("admins",list);
        return "seniorAdmin";
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


    @RequestMapping(value = "/logout")
    public String logout(HttpSession session, RedirectAttributes attributes, WordDefined defined) {
        session.removeAttribute("userid");
        session.removeAttribute("level");
        session.removeAttribute("headmsg");
        attributes.addFlashAttribute("message", defined.LOGOUT_SUCCESS);
        return "redirect:/admin/adminLogin";

    }
}