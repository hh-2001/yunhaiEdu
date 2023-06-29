package com.hhz.serviceacl.service;

import com.alibaba.fastjson.JSONObject;
import com.hhz.commonutils.R;
import com.hhz.serviceacl.entity.LoginUser;

import java.io.IOException;
import java.util.List;
import java.util.Map;

public interface IndexService {

    /**
     * 根据用户名获取用户登录信息
     * @param username
     * @return
     */
    Map<String, Object> getUserInfo(String username);

    /**
     * 根据用户名获取动态菜单
     * @param username
     * @return
     */
    List<JSONObject> getMenu(String username);

    //登录
    String login(LoginUser user);

    //创建验证码
    R createCaptcha() throws IOException;
}
