package com.cc.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * Created with IntelliJ IDEA.
 * Author: CC
 * E-mail: 203717588@qq.com
 * Date: 2022/11/23
 * Time: 16:45
 * Description:
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Role implements Serializable {

    private Integer roleId;
    private String roleCode;
    private String roleName;

}
