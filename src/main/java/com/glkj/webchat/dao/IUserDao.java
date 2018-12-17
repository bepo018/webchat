package com.glkj.webchat.dao;

import java.util.List;

import com.glkj.webchat.pojo.UserShow;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.glkj.webchat.pojo.User;

/**
 * Copyright © 2018 The so-called success is to make extraordinary persistence
 * in the ordinary.
 * 
 * @author qsjteam
 * @date 2018-10-1
 */
@Repository(value = "userDao")
public interface IUserDao {
    List<User> selectAll(@Param("offset") int offset, @Param("limit") int limit);

    User selectUserByUserid(String userid);

    User selectCount();

    boolean insert(User user);

    boolean update(User user);

    boolean delete(String userid);
    
    User find (String userid);
    //返回权限值
	Integer level(String userid);
    
	List<String> list(int page);

    /**
     * 插入高级会员
     * @param user
     * @return 返回受影响的行数
     */
    Integer insertSeniorMenber(User user);

    /**
     * 根据uid查找用户  这里的uid就是username
     * @param uid
     * @return
     */
    User findUserByUserid(String uid);

    /**
     * 获取qq记录
     * @param qq
     * @return 返回qq记录
     */
    Integer getRecordCountByQq(String qq);

    /**
     * 获取微信记录
     * @param weixin
     * @return 返回微信记录
     */
    Integer getRocordCountByWeixin(String weixin);

    /**
     * 获取电话记录
     * @param phone
     * @return 返回电话记录
     */
    Integer getRocordCountByPhone(String phone);

    /**
     * 展示未归属用户信息
     * @return
     */
    List<UserShow> selectUserInfo();

    /**
     * 根据用户名查询UserShow
     * @param userid
     * @return
     */
    UserShow selectUseShow(String userid);

    /**
     * 展示私有归属用户信息
     * @return
     */
    List<UserShow> selectPrivateUser(String invitation);

    /**
     * 修改归属
     * @param userid 要修改的用户id
     * @param invitation  归属者id
     * @return
     */
    Integer updateInvitation(String invitation,String userid);

    /**
     * 查找验证码与adminId相同的记录
     * @param invitation
     * @return
     */
    Integer selectCountByAdmin(String invitation);


    /**
     * 删除用户log日志
     * @param userid
     */
    void deleteLog(String userid);

    Integer selectUserCountByAdminId(String userid);
}
