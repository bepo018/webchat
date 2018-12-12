package com.glkj.webchat.service;

import com.glkj.webchat.pojo.Admins;

/**
 * 管理员类业务层
 */
public interface IAdminsService {
    /**
     * 根据id查找管理员
     * @param id
     * @return
     */
    Admins selectById(Integer id);

    /**
     * 根据管理员用户名查找管理员
     * @param adminName
     * @return
     */
    Admins selectByName(String adminName);

    /**
     * 保存管理员信息
     * @param admin
     * @return 返回受影响的行数
     */
    Boolean save(Admins admin);

    /**
     * 管理员登录
     * @param username
     * @param password
     * @return 返回管理员信息
     * @throws com.glkj.webchat.service.ex.UsernameNotFoundException
     * @throws com.glkj.webchat.service.ex.PasswordNotMatchException
     */
    Admins login(String username, String password);
}
