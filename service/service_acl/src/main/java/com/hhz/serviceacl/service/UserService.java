package com.hhz.serviceacl.service;

import com.hhz.commonutils.R;
import com.hhz.serviceacl.entity.LoginUser;
import com.hhz.serviceacl.entity.User;
import com.baomidou.mybatisplus.extension.service.IService;

import java.io.IOException;

/**
 * <p>
 * 用户表 服务类
 * </p>
 *
 * @author hhz
 * @since 2023-02-10
 */
public interface UserService extends IService<User> {

    // 从数据库中取出用户信息
    User selectByUsername(String username);

    //添加用户
    void addUser(User user);
}
