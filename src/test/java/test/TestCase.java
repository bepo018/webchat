package test;

import com.glkj.webchat.dao.IAdminsDao;
import com.glkj.webchat.pojo.AdminPermission;
import com.glkj.webchat.pojo.AdminRole;
import com.glkj.webchat.pojo.Admins;
import com.glkj.webchat.pojo.RightsAdmins;
import com.glkj.webchat.service.IAdminsService;
import com.glkj.webchat.service.ex.UsernameNotFoundException;
import org.junit.Test;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.Date;
import java.util.List;

public class TestCase {
    AbstractApplicationContext ac = new ClassPathXmlApplicationContext("spring/spring-mvc.xml", "spring/spring-mybatis.xml");
    IAdminsDao adminsDao = ac.getBean("adminDao", IAdminsDao.class);
    IAdminsService adminsService = ac.getBean("adminsService", IAdminsService.class);

    @Test
    public void test1() {
        RightsAdmins rightsAdmins = new RightsAdmins();
        rightsAdmins.setAdminID(5);
        rightsAdmins.setRoleID(2);
        rightsAdmins.setCreate_user("adminSky");
        rightsAdmins.setCreate_time(new Date());
        adminsDao.saveRights(rightsAdmins);
    }

    @Test
    public void test2() {
        Admins admins = new Admins();
        admins.setUsername("demo");
        admins.setPassword("123456");
        admins.setLevel(4);
        admins.setQq("584878273");
        admins.setWeixin("4242fef");
        admins.setPhone("141452525");
        admins.setCreateUser("adminSky");
        admins.setCreateTime(new Date());
        int[] right = {1, 2};
        try {
            adminsService.save(admins, right, "adminSky");
            System.out.println("ok");
        } catch (UsernameNotFoundException e) {
            System.out.println(e.getMessage());
        }
    }

    @Test
    public void test3() {
        Admins admins = new Admins();
        admins.setId(1);
        admins.setLevel(4);
        admins.setUsername("adminsky");
        admins.setPassword("123456");
        admins.setQq("543543533333");
        admins.setWeixin("weixin434");
        admins.setPhone("154333211111");
        admins.setRemarks("已经修改");
        admins.setModifiedTime(new Date());
        admins.setModifiedUser("[System]");
        adminsDao.update(admins);
    }

    @Test
    public void test4() {
        Admins admins = new Admins();
        admins.setId(1);
        admins.setUsername("test");
        admins.setQq("okmyqq");
        admins.setPhone("okphone");
        admins.setPassword("ok123456");
        admins.setWeixin("okweixin");
        admins.setLevel(4);
        adminsService.update(admins, 1, "adminsky");
    }

    @Test
    public void test5() {
        List<Admins> list = adminsDao.selectAllAdmins();
        for (Admins a : list
                ) {
            System.out.println(a);
        }
    }
    @Test
    public void test6(){
        List<AdminPermission> list = adminsDao.selectPermissionByName("adminsky");
        for (AdminPermission a :
                list) {
            System.out.println(a);
        }
    }
}
