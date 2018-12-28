package test;

import com.glkj.webchat.dao.ILiveDao;
import com.glkj.webchat.pojo.LiveInfo;
import com.glkj.webchat.service.IUserService;
import com.glkj.webchat.service.LiveInfoService;
import org.junit.Test;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class TestCase {


    @Test
    public void test1() throws InterruptedException {
        AbstractApplicationContext ac = new ClassPathXmlApplicationContext("spring/spring-mvc.xml", "spring/spring-mybatis.xml");
        LiveInfoService service = ac.getBean("liveInfoService",LiveInfoService.class);
        List<LiveInfo> list ;

        while (true) {
            list = service.selectAll();
            for (LiveInfo l :
                    list) {
                System.out.println(l);
            }
            System.out.println("-----------------已经更改---------------------");
            Thread.sleep(5000);
        }
    }
}
