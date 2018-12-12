package com.glkj.webchat.dao;

import com.glkj.webchat.pojo.Admins;
import com.glkj.webchat.pojo.RightsAdmins;
import com.sun.mail.imap.Rights;
import org.springframework.stereotype.Repository;

/**
 *
 * 管理员映射
 */

@Repository(value = "adminDao")
public interface IAdminsDao {
    /**
     * 保存管理员
     * @param admin
     * @return
     */
    Integer save(Admins admin);

    /**
     * 保存一个管理员权限
     * @param rights
     * @return
     */
    Integer saveRights(RightsAdmins rights);

    /**
     * 根据id查找管理员
     * @param id
     * @return
     */
    Admins selectAdminById(Integer id);

    /**
     * 根据管理员用户名查找管理员
     * @param adminName
     * @return
     */
    Admins selectAdminByName(String adminName);

    /**
     * 修改管理员信息
     * @param admins
     * @return
     */
    Integer update(Admins admins);

    /**
     * 移除高级权限
     * @param aid 管理员ID
     * @param rid  权限ID
     * @return
     */
    Integer removeRights(Integer aid,Integer rid);
}
