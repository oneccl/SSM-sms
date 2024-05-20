package com.cc.dao;


import com.cc.pojo.User;
import com.cc.util.MybatisUtil;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.io.IOException;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Author: CC
 * E-mail: 203717588@qq.com
 * Date: 2022/11/23
 * Time: 8:53
 * Description:
 */
public class UserDaoTest {

    UserDao userDao;

    // 加载配置文件
    @Before
    public void init() throws IOException {
        userDao = (UserDao) MybatisUtil.init("Mybatis-Config.xml", UserDao.class);
    }

    // 查询所有
    @Test
    public void queryAllTest(){
        List<User> users = userDao.query("","");
        users.forEach(System.out::println);
    }

    // 释放资源
    @After
    public void destroy() throws IOException {
        MybatisUtil.destroy();
    }

}
