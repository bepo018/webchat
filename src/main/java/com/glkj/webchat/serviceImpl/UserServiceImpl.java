package com.glkj.webchat.serviceImpl;

import com.glkj.webchat.pojo.UserShow;
import com.glkj.webchat.service.ex.PasswordNotMatchException;
import com.glkj.webchat.service.ex.UsernameAlreadExistsException;
import com.glkj.webchat.service.ex.UsernameNotFoundException;
import com.glkj.webchat.utils.GetMD5;
import com.glkj.webchat.utils.MailUtil;
import org.springframework.stereotype.Service;

import com.glkj.webchat.dao.IUserDao;
import com.glkj.webchat.pojo.User;
import com.glkj.webchat.service.IUserService;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.UUID;

/**
 * Copyright © 2018 The so-called success is to make extraordinary persistence
 * in the ordinary.
 *
 * @author qsjteam
 * @date 2018-10-1
 */
@Service(value = "userService")
public class UserServiceImpl implements IUserService {

    @Resource
    private IUserDao userDao;

    @Override
    public List<User> selectAll(int page, int pageSize) {
        return userDao.selectAll(page, pageSize);
    }

    @Override
    public User selectUserByUserid(String userid) {
        return userDao.selectUserByUserid(userid);
    }

    @Override
    public int selectCount(int pageSize) {
        int pageCount = Integer.parseInt(userDao.selectCount().getUserid());
        return pageCount % pageSize == 0 ? pageCount / pageSize : pageCount / pageSize + 1;
    }

    @Override
    public boolean insert(User user) {
        return userDao.insert(user);
    }

    @Override
    public boolean update(User user) {
        return userDao.update(user);
    }

    @Override
    public boolean delete(String userid) {
        User user = findUserByUserId(userid);
        if (user == null) {
            throw new UsernameNotFoundException("用户数据不存在");
        } else {
            userDao.deleteLog(userid);
            return userDao.delete(userid);
        }
    }

    @Override
    public Integer level(String userid) {
        return userDao.level(userid);
    }

    public Integer register(User user) {
        if (findUserByUserId(user.getUserid()) == null) {

            return userDao.insertSeniorMenber(user);
        } else {
            throw new UsernameAlreadExistsException("用户名已存在");
        }
    }

    public User findUserByUserId(String userid) {
        return userDao.findUserByUserid(userid);
    }

    public Boolean checkUsernameExists(String username) {
        return userDao.findUserByUserid(username) != null;
    }

    public Boolean checkQqExists(String qq) {
        return userDao.getRecordCountByQq(qq) > 0;
    }


    public Boolean checkPhoneExists(String phone) {
        return userDao.getRocordCountByPhone(phone) > 0;
    }

    public Boolean checkWeixinExists(String weixin) {
        return userDao.getRocordCountByWeixin(weixin) > 0;
    }

    public User login(String username, String password) {
        User user = userDao.findUserByUserid(username);
        if (user != null) {
            password = GetMD5.getMD5(password);
            if (user.getPassword().equals(password)) {
                return user;
            } else {
                throw new PasswordNotMatchException("密码不正确");
            }
        } else {
            throw new UsernameNotFoundException("该用户不存在");
        }
    }

    @Override
    public List<UserShow> showUserInfo() {
        return userDao.selectUserInfo();
    }

    @Override
    public List<UserShow> showPrivateUser(String invitation) {
        return userDao.selectPrivateUser(invitation);
    }

    @Override
    public Boolean updateInvitation(String invitation, String userid) {
        UserShow usershow = userDao.selectUseShow(userid);
        if (usershow == null) {
            throw new UsernameNotFoundException("用户名不存在");
        } else {
            return userDao.updateInvitation(invitation, userid) > 0;
        }
    }

    @Override
    public boolean checkInvitation(String invitation) {
        return userDao.selectCountByAdmin(invitation) > 0;
    }

    @Override
    public Integer adminUsers(String userid) {
        return userDao.selectUserCountByAdminId(userid);
    }

    @Override
    public String findUserByProFile(String code) {
        return userDao.findUserByProFile(code);
    }

    @Override
    public void active(String userID) {
        userDao.activeUserid(userID);
    }

    @Override
    public boolean checkEmailExists(String email) {
        return userDao.findUserByEmail(email) > 0;
    }

    @Override
    public boolean checkCaptcha(String profile, String email) {
        return userDao.findUserByEmailAndProfile(profile,email) > 0;
    }

    @Override
    public Integer updatePassword(String password, String email) {
        return userDao.updatePassword(password,email);
    }

    @Override
    public Integer updateCaptcha(String pro, String email) {
        System.out.println(pro);
        return userDao.updateProfileByEmail(pro, email);
    }


}
