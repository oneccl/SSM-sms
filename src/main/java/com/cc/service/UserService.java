package com.cc.service;

import com.cc.dao.UserDao;
import com.cc.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Author: CC
 * E-mail: 203717588@qq.com
 * Date: 2022/11/23
 * Time: 9:52
 * Description:
 */
@Service
public class UserService {

    @Autowired
    UserDao userDao;

    public List<User> find(String name, String role){
        return userDao.query(name, role);
    }

    public User check(User user){
        return userDao.queryCheck(user);
    }

    public Boolean remove(Integer id){
        return userDao.delete(id);
    }

    public Boolean add(User user) {
        return userDao.insert(user);
    }

    public Boolean modify(User user) {
        return userDao.update(user);
    }

    public User findById(Integer id) {
        return userDao.queryById(id);
    }

}
