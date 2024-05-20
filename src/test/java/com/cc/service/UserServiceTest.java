package com.cc.service;

import com.cc.pojo.User;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Author: CC
 * E-mail: 203717588@qq.com
 * Date: 2022/11/23
 * Time: 9:55
 * Description:
 */
public class UserServiceTest {

    ApplicationContext context;

    @Before
    public void init(){
        context = new ClassPathXmlApplicationContext("Spring-Config.xml");
    }

    @Test
    public void findAllTest(){
        UserService userService = context.getBean(UserService.class);
        List<User> users = userService.find("","");
        users.forEach(System.out::println);
    }

}
