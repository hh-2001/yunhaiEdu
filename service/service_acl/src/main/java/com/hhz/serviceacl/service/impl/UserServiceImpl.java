package com.hhz.serviceacl.service.impl;

import com.hhz.base.exceptionhandler.EduException;
import com.hhz.commonutils.R;
import com.hhz.serviceacl.entity.LoginUser;
import com.hhz.serviceacl.entity.User;
import com.hhz.serviceacl.mapper.UserMapper;
import com.hhz.serviceacl.service.UserService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hhz.serviceacl.service.ValidateCodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.Objects;

/**
 * <p>
 * 用户表 服务实现类
 * </p>
 *
 * @author hhz
 * @since 2023-02-10
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {


    @Override
    public User selectByUsername(String username) {
        return baseMapper.selectOne(new QueryWrapper<User>().eq("username", username));
    }

    @Override
    public void addUser(User user) {
        User resUser = selectByUsername(user.getUsername());
        if (Objects.nonNull(resUser)){
            throw new EduException(20001, "用户名已存在");
        }
    }
}
