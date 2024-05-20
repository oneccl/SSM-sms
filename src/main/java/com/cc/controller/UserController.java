package com.cc.controller;

import com.cc.pojo.Role;
import com.cc.pojo.User;
import com.cc.service.RoleService;
import com.cc.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Author: CC
 * E-mail: 203717588@qq.com
 * Date: 2022/11/23
 * Time: 11:14
 * Description:
 * ************************
 * Maven项目：主要用来管理jar包
 * ************************
 */
@Controller
public class UserController {

    @Autowired
    UserService userService;

    @Autowired
    private RoleService roleService;

    // 登录
    @PostMapping("/login.do")
    public String login(Model model, User user){
        User checkedUser = userService.check(user);
        if (checkedUser != null){
            // Model将数据checkedUser放到Request域中，渲染到View视图main.jsp
            model.addAttribute("loginUser",checkedUser);
            return "main";
        }
        return "login";
    }

    /*   分页常用方法(返回int类型)   */
    /*
    总页数：pageInfo.getPages()
    当前页：pageInfo.getPageNum()
    首页：pageInfo.getNavigateFirstPage()
    上一页：pageInfo.getPrePage()
    下一页：pageInfo.getNextPage()
    最后一页：pageInfo.getNavigateLastPage()
    每页条数：pageInfo.getPageSize()
    总记录数：pageInfo.getTotal()
    分页详细信息：pageInfo.getList()
     */
    // 查询用户
    @GetMapping("/getUsers.do")
    public String getUsers(Model model, Integer pageNo, String name, String role){
        if (pageNo == null || pageNo == 0){
            pageNo = 1;
        }
        // 设置分页规则
        PageHelper.startPage(pageNo,5);
        List<User> users = userService.find(name, role);
        PageInfo<User> pageInfo = new PageInfo<>(users);

        model.addAttribute("page",pageInfo);
        model.addAttribute("userList",users);
        return "userList";
    }

    // 注销/删除
    @GetMapping("/remove.do")
    public String remove(Integer id){
        userService.remove(id);
        // redirect：请求转发
        return "redirect:getUsers.do";
    }

    // 注册/添加用户
    @PostMapping ("/add.do")
    public String add(User user){
        userService.add(user);
        // redirect:/资源名 请求重定向
        // forward:/资源名 请求转发
        return "redirect:/getUsers.do";
    }

    // 去修改，回填原数据
    @GetMapping("/toModify.do")
    public String toModify(Model model, Integer id){
        User loginUser = userService.findById(id);
        model.addAttribute("user",loginUser);
        List<Role> roles = roleService.find();
        model.addAttribute("roleList",roles);
        return "userUpdate";
    }

    // 修改
    @PostMapping("/modify.do")
    public String modify(User user){
        Boolean modify = userService.modify(user);
        if (modify){
            return "redirect:getUsers.do";
        }
        return "redirect:toModify.do"+"?id="+user.getUserId();
    }

    // 查看用户
    @GetMapping("/view.do")
    public String view(Model model,Integer id){
        User user = userService.findById(id);
        model.addAttribute("viewUser",user);
        return "userShow";
    }

}
