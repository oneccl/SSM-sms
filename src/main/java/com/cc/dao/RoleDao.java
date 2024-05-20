package com.cc.dao;

import com.cc.pojo.Role;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Author: CC
 * E-mail: 203717588@qq.com
 * Date: 2022/11/24
 * Time: 17:27
 * Description:
 */
@Repository
public interface RoleDao {

    List<Role> query();

}
