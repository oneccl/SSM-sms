package com.cc.dao;

import com.cc.pojo.User;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Author: CC
 * E-mail: 203717588@qq.com
 * Date: 2022/11/23
 * Time: 8:39
 * Description:
 */
@Repository
public interface UserDao {

    List<User> query(String name, String role);

    User queryCheck(User user);

    Boolean delete(Integer userId);

    Boolean insert(User user);

    Boolean update(User user);

    User queryById(Integer id);

}
