package com.hhz.serviceacl.controller;

import com.alibaba.fastjson.JSONObject;
import com.hhz.commonutils.JwtUtils;
import com.hhz.commonutils.MD5;
import com.hhz.serviceacl.entity.Permission;
import com.hhz.serviceacl.entity.User;
import com.hhz.serviceacl.service.IndexService;
import com.hhz.serviceacl.service.PermissionService;
import com.hhz.commonutils.R;
import com.hhz.serviceacl.service.UserService;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

import static org.bouncycastle.asn1.x500.style.RFC4519Style.member;

@RestController
@RequestMapping("/admin/acl/index")
//@CrossOrigin
public class IndexController {

    @Autowired
    private IndexService indexService;

    @Autowired
    private UserService userService;

    /**
     * 根据token获取用户信息
     */
    @GetMapping("info")
    public R info() {
        //获取当前登录用户用户名
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        Map<String, Object> userInfo = indexService.getUserInfo(username);
        return R.ok().data(userInfo);
    }

    /**
     * 根据token获取用户信息
     */
    @PutMapping("updateInfo/{oldPassword}")
    public R update(@RequestBody User user, @PathVariable String oldPassword) {
        boolean b = false;

        //获取当前登录用户用户名
        if (StringUtils.isNotBlank(user.getPassword())) {
            User userInfo = userService.getById(user);
            String pass = MD5.encrypt(oldPassword);
            if(userInfo.getPassword().equals(pass)){
                user.setPassword(MD5.encrypt(user.getPassword()));
                b = userService.updateById(user);
                return R.ok();
            }
            return R.error().message("旧密码错误");
        }
        b = userService.updateById(user);
        if (b){
            return R.ok();
        }
        return R.error().message("更新失败");
    }

    /**
     * 获取菜单
     *
     * @return
     */
    @GetMapping("menu")
    public R getMenu() {
        //获取当前登录用户用户名
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        List<JSONObject> permissionList = indexService.getMenu(username);
        permissionList.forEach(System.out::println);
        return R.ok().data("items", permissionList);
    }

    @PostMapping("logout")
    public R logout() {
        return R.ok();
    }

}
