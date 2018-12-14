package com.glkj.webchat.dao;

import com.glkj.webchat.pojo.AdminPermission;
import com.glkj.webchat.pojo.AdminRole;
import com.glkj.webchat.pojo.Admins;
import com.glkj.webchat.pojo.RightsAdmins;
import org.springframework.stereotype.Repository;

import javax.persistence.criteria.CriteriaBuilder;
import java.util.List;

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
     * @return
     */
    Integer removeRights(Integer aid);

    /**
     * 查询管理员权限是否存在
     * @param aid
     * @param rid
     * @return
     */
    Integer getCountByAidRid(Integer aid,Integer rid);

    /**
     * 查询所有管理员
     * @return
     */
    List<Admins> selectAllAdmins();

    /**
     * 删除管理员
     * @param adminName
     * @return
     */
    Integer deleteAdmins(Integer adminName);

    /**
     * 根据管理员名查询 管理员等级
     * @param adminName
     * @return
     */
    AdminRole selectRoleByName(String adminName);

    /**
     * 根据用户名 查询 操作内容
     * @param adminName
     * @return
     */
    List<AdminPermission> selectPermissionByName(String adminName);
}
