package com.hhz.serviceedu.controller;

import com.hhz.commonutils.R;
import io.swagger.annotations.Api;
import org.springframework.web.bind.annotation.*;

//@CrossOrigin
@Api(description = "后台登录管理")
@RestController
@RequestMapping("/eduservice/user")
public class EduLoginController {
    /**
     * 登录
     * @return
     */
    @PostMapping("login")
    public R login() {
        System.out.println("后台登录");
        return R.ok().data("token", "admin");
    }

    /**
     * 登录信息
     * @return
     */
    @GetMapping("info")
    public R info() {
        return R.ok().data("roles", "[admin]").data("name", "admin").data("avatar", "https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif");
    }
}
