package com.glkj.webchat.service;

import com.glkj.webchat.pojo.AdminPermission;
import com.glkj.webchat.pojo.AdminRole;
import com.glkj.webchat.pojo.Admins;

import java.util.List;

/**
 * 管理员类业务层
 */
public interface IAdminsService {
    /**
     * 根据id查找管理员
     * @param id
     * @return
     */
    Admins findById(Integer id);

    /**
     * 根据管理员用户名查找管理员
     * @param adminName
     * @return
     */
    Admins findByName(String adminName);

    /**
     * 保存管理员信息
     * @param admin
     * @return 返回受影响的行数
     */
    Boolean save(Admins admin,Integer rights,String createUser);

    /**
     * 管理员登录
     * @param username
     * @param password
     * @return 返回管理员信息
     * @throws com.glkj.webchat.service.ex.UsernameNotFoundException
     * @throws com.glkj.webchat.service.ex.PasswordNotMatchException
     */
    Admins login(String username, String password);

    /**
     * 修改管理员信息
     * @param admins 管理员ID
     * @param rights 权限等级  1 基本管理  2 高级管理
     * @param modifiedUser  修改者
     * @return   返回是否修改成功
     */
    Boolean update(Admins admins,Integer rights,String modifiedUser);

    /**
     * 查询所有管理员
     * @return
     */
    List<Admins> findAllAdmins();

    /**
     * 删除管理员
     * @return
     */
    Boolean deleteAdmind(String adminName);

    /**
     * 根据用户名查询是否为高级管理员
     * @param adminName
     * @return
     */
    Boolean checkRights(String adminName);

    /**
     *  根据用户名查找操作许可
     * @param adminName
     * @return  返回AdminPermission集合
     */
    List<AdminPermission> findPermissionByName(String adminName);


    List<AdminRole> selectRoles();
}
