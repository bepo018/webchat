package test;

import com.glkj.webchat.service.IUserService;
import org.junit.Test;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestCase {


    @Test
    public void test1() {
        AbstractApplicationContext ac = new ClassPathXmlApplicationContext("spring/spring-mvc.xml", "spring/spring-mybatis.xml");
        //IUserService service = ac.getBean("userService", IUserService.class);
        // xxxxxx = service.updateCaptcha("xxxxxx", "3056439417@qq.com");

    }


}
