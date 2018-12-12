package com.glkj.webchat.serviceImpl;

import com.glkj.webchat.dao.IAdminsDao;
import com.glkj.webchat.pojo.Admins;
import com.glkj.webchat.service.IAdminsService;
import com.glkj.webchat.service.ex.PasswordNotMatchException;
import com.glkj.webchat.service.ex.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/** TODO 这里修改过
 * 管理员业务层实现类
 */
@Service(value = "adminsService")
class adminsDaoImpl implements IAdminsService {
    @Resource
    private IAdminsDao adminsDao;

    @Override
    public Admins selectById(Integer id) {
        return adminsDao.selectAdminById(id);
    }

    @Override
    public Admins selectByName(String adminName) {
        return adminsDao.selectAdminByName(adminName);
    }

    @Override
    public Boolean save(Admins admin) {
        return adminsDao.save(admin)>0;
    }

    @Override
    public Admins login(String username, String password) {
        Admins admins = adminsDao.selectAdminByName(username);
        if(admins == null){
            throw new UsernameNotFoundException("管理员不存在");
        }else{
            if(admins.getPassword().equals(password)){
                return admins;
            }else{
                throw new PasswordNotMatchException("密码错误");
            }
        }
    }
}
