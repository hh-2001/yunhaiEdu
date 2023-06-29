package com.hhz.serviceacl.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.hhz.base.exceptionhandler.EduException;
import com.hhz.commonutils.JwtUtils;
import com.hhz.commonutils.MD5;
import com.hhz.commonutils.R;
import com.hhz.serviceacl.entity.LoginUser;
import com.hhz.serviceacl.entity.Role;
import com.hhz.serviceacl.entity.User;
import com.hhz.serviceacl.service.*;
import org.apache.ibatis.cache.CacheException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class IndexServiceImpl implements IndexService {

    @Autowired
    private UserService userService;

    @Autowired
    private RoleService roleService;

    @Autowired
    private PermissionService permissionService;

    @Autowired
    private ValidateCodeService validateCodeService;

    @Autowired
    private RedisTemplate redisTemplate;

    /**
     * 根据用户名获取用户登录信息
     *
     * @param username
     * @return
     */
    @Override
    public Map<String, Object> getUserInfo(String username) {
        Map<String, Object> result = new HashMap<>();
        User user = userService.selectByUsername(username);
        if (null == user) {
            //throw new EduException(ResultCodeEnum.FETCH_USERINFO_ERROR);
        }

        //根据用户id获取角色
        List<Role> roleList = roleService.selectRoleByUserId(user.getId());
        List<String> roleNameList = roleList.stream().map(item -> item.getRoleName()).collect(Collectors.toList());
        if(roleNameList.size() == 0) {
            //前端框架必须返回一个角色，否则报错，如果没有角色，返回一个空角色
            roleNameList.add("");
        }

        //根据用户id获取操作权限值
        List<String> permissionValueList = permissionService.selectPermissionValueByUserId(user.getId());
        redisTemplate.opsForValue().set(username, permissionValueList);
        user.setPassword(null);
        result.put("name", user.getUsername());
        result.put("avatar", user.getAvatar());
        result.put("roles", roleNameList);
        result.put("item", user);
        result.put("permissionValueList", permissionValueList);
        return result;
    }

    /**
     * 根据用户名获取动态菜单
     * @param username
     * @return
     */
    @Override
    public List<JSONObject> getMenu(String username) {
        User user = userService.selectByUsername(username);
        //根据用户id获取用户菜单权限
        List<JSONObject> permissionList = permissionService.selectPermissionByUserId(user.getId());
        return permissionList;
    }

    @Override
    public String login(LoginUser user) {
        System.out.println(user);
        User resUser = userService.selectByUsername(user.getUsername());
        String password = resUser.getPassword();
        //登录的密码
        String pass = MD5.encrypt(user.getPassword());
        if (!pass.equals(password)){
            throw new EduException(20001, "密码错误");
        }
        try{
            validateCodeService.checkCaptcha(user.getCode(), user.getUuid());
        }catch (CacheException e){
            throw new EduException(20001, e.getMessage());
        }
        String token = JwtUtils.getJwtToken(resUser.getId(), resUser.getNickName());
        redisTemplate.opsForValue().set(user.getUsername(), getMenu(user.getUsername()));
        return token;
    }

    @Override
    public R createCaptcha() throws IOException {
        return validateCodeService.createCaptcha();
    }

}
