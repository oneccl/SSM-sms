package com.cc.service;

import com.cc.dao.RoleDao;
import com.cc.pojo.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Author: CC
 * E-mail: 203717588@qq.com
 * Date: 2022/11/24
 * Time: 17:41
 * Description:
 */
@Service
public class RoleService {

    @Autowired
    private RoleDao roleDao;

    public List<Role> find(){
        return roleDao.query();
    }

}
