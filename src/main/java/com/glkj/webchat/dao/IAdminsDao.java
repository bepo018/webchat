package com.glkj.webchat.dao;

import com.glkj.webchat.pojo.Admins;
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
}
