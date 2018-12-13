package com.glkj.webchat.serviceImpl;

import com.glkj.webchat.dao.IAdminsDao;
import com.glkj.webchat.pojo.AdminPermission;
import com.glkj.webchat.pojo.AdminRole;
import com.glkj.webchat.pojo.Admins;
import com.glkj.webchat.pojo.RightsAdmins;
import com.glkj.webchat.service.IAdminsService;
import com.glkj.webchat.service.ex.PasswordNotMatchException;
import com.glkj.webchat.service.ex.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * TODO 这里修改过
 * 管理员业务层实现类
 */
@Service(value = "adminsService")
class adminsDaoImpl implements IAdminsService {
    @Resource
    private IAdminsDao adminsDao;

    @Override
    public Admins findById(Integer id) {
        return adminsDao.selectAdminById(id);
    }

    @Override
    public Admins findByName(String adminName) {
        return adminsDao.selectAdminByName(adminName);
    }

    @Override
    public Boolean save(Admins admin, int[] rights, String createUser) {
        Admins a = adminsDao.selectAdminByName(admin.getUsername());
        if (a == null) {
            adminsDao.save(admin);
            int adminId = findByName(admin.getUsername()).getId();
            //循环创建权限关联记录
            for (int i = 0; i < rights.length; i++) {
                RightsAdmins rightsAdmins = new RightsAdmins();
                rightsAdmins.setAdminID(adminId);
                rightsAdmins.setRoleID(rights[i]);
                rightsAdmins.setCreate_time(new Date());
                rightsAdmins.setCreate_user(createUser);
                adminsDao.saveRights(rightsAdmins);
            }
            return true;
        } else {
            throw new UsernameNotFoundException("管理员已存在");
        }
    }

    @Override
    public Admins login(String username, String password) {
        Admins admins = adminsDao.selectAdminByName(username);
        if (admins == null) {
            throw new UsernameNotFoundException("管理员不存在");
        } else {
            if (admins.getPassword().equals(password)) {
                return admins;
            } else {

                throw new PasswordNotMatchException("密码错误");
            }
        }
    }

    @Override
    public Boolean update(Admins admins, Integer rights, String modifiedUser) {
        Admins a1 = findByName(admins.getUsername());
        if (a1 == null) {
            throw new UsernameNotFoundException("管理员不存在");
        } else {
            Integer aid = a1.getId();
            admins.setId(aid);
            adminsDao.update(admins);
            if (rights == 1) {
                adminsDao.removeRights(aid, 2);
            } else if (rights == 2) {
                if (adminsDao.getCountByAidRid(aid, 2) <1) {
                    RightsAdmins admins1 = new RightsAdmins();
                    admins1.setRoleID(2);
                    admins1.setAdminID(aid);
                    admins1.setCreate_user(modifiedUser);
                    admins1.setCreate_time(new Date());
                    adminsDao.saveRights(admins1);
                }else{
                    System.out.println("高级权限已存在");
                }
            }
            return true;
        }
    }

    @Override
    public List<Admins> findAllAdmins() {
        return adminsDao.selectAllAdmins();
    }

    @Override
    public Boolean deleteAdmind(String adminName) {
        Admins admins = adminsDao.selectAdminByName(adminName);
        if(admins == null){
            throw new UsernameNotFoundException("管理员不存在");
        }else{
            return adminsDao.deleteAdmins(admins.getId())>0;
        }
    }

    @Override
    public Boolean checkRights(String adminName) {
        AdminRole role = adminsDao.selectRoleByName(adminName);
        return role.getRoleCode()==2;
    }

    @Override
    public List<AdminPermission> findPermissionByName(String adminName) {
        return adminsDao.selectPermissionByName(adminName);
    }
}
