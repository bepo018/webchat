package com.glkj.webchat.service;

import java.util.List;

import com.glkj.webchat.pojo.User;
import com.glkj.webchat.pojo.UserShow;
import com.glkj.webchat.service.ex.UsernameNotFoundException;

/**
 * Copyright © 2018 The so-called success is to make extraordinary persistence
 * in the ordinary.
 * 
 * @author qsjteam
 * @date 2018-10-1
 */
public interface IUserService {
    List<User> selectAll(int page, int pageSize);
    User selectUserByUserid(String userid);
    int selectCount(int pageSize);
    boolean insert(User user);
    boolean update(User user);
    boolean delete(String userid);
    //返回权限值
	Integer level(String userid);

    /**
     * 用户注册
     * @param user
     * @return
     */
    Integer register(User user);

    /**
     * 根据userid查找用户
     * @param userid
     * @return  返回 用户信息
     */
    User findUserByUserId(String userid);

    /**
     * 检查用户名是否存在
     * @param username 用户名
     * @return true 存在 false 不存在
     */
    Boolean checkUsernameExists(String username);

    /**
     * 检查qq是否存在
     * @param qq qq
     * @return true 存在 false 不存在
     */
    Boolean checkQqExists(String qq);

    /**
     * 检查电话号码是否存在
     * @param phone
     * @return true 存在 false 不存在
     */
    Boolean checkPhoneExists(String phone);

    /**
     * 检查微信是否存在
     * @param weixin
     * @return
     */
    Boolean checkWeixinExists(String weixin);

    /**
     * 登录
     * @param username
     * @param password
     */
    User login(String username, String password);

    /**
     * 展示未归属的用户信息
     * @return
     */
    List<UserShow> showUserInfo();

    /**
     * 展示私有归属用户信息
     * @return
     */
    List<UserShow> showPrivateUser(String invitation);

    /**
     * 修改用户归属
     * @param invitation
     * @param userid
     * @return
     * @throws UsernameNotFoundException 用户没找到
     */
    Boolean updateInvitation(String invitation,String userid);

    /**
     * 检查用户输入的验证码是否是管理员账号
     * @param invitation
     * @return
     */
    boolean checkInvitation(String invitation);
}
