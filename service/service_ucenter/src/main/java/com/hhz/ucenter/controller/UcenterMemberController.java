package com.hhz.ucenter.controller;


import com.hhz.commonutils.JwtUtils;
import com.hhz.commonutils.MD5;
import com.hhz.commonutils.R;
import com.hhz.commonutils.ordervo.UcenterMemberOrder;
import com.hhz.ucenter.entity.UcenterMember;
import com.hhz.ucenter.entity.vo.RegisterVo;
import com.hhz.ucenter.service.UcenterMemberService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * <p>
 * 会员表 前端控制器
 * </p>
 *
 * @author hhz
 * @since 2023-02-11
 */
@RestController
@RequestMapping("/educenter/member")
@CrossOrigin
public class UcenterMemberController {

    @Autowired
    private UcenterMemberService memberService;

    /**
     * 会员登录
     *
     * @param member 人员信息
     * @return
     */
    @PostMapping("login")
    public R loginUser(@RequestBody UcenterMember member) {
        //member对象封装手机号和密码
        //调用service方法实现登录
        //返回token值，使用jwt生成
        String token = memberService.login(member);
        return R.ok().data("token", token);
    }

    /**
     * 注册会员
     *
     * @param registerVo
     * @return
     */
    @PostMapping("register")
    public R registerUser(@RequestBody RegisterVo registerVo) {
        memberService.register(registerVo);
        return R.ok();
    }

    /**
     * 根据token获取用户信息
     *
     * @param request
     * @return
     */
    @GetMapping("getMemberInfo")
    public R getMemberInfo(HttpServletRequest request) {
        //调用jwt工具类的方法。根据request对象获取头信息，返回用户id
        String memberId = JwtUtils.getMemberIdByJwtToken(request);
        //查询数据库根据用户id获取用户信息
        UcenterMember member = memberService.getById(memberId);
        member.setPassword(null);
        return R.ok().data("item", member);
    }

    /**
     * 获取用户信息
     *
     * @param id 用户Id
     * @return
     */
    @PostMapping("getUserInfoOrder/{id}")
    public UcenterMemberOrder getUserInfoOrder(@PathVariable String id) {
        UcenterMember member = memberService.getById(id);
        //把member对象里面值复制给UcenterMemberOrder对象
        UcenterMemberOrder ucenterMemberOrder = new UcenterMemberOrder();
        BeanUtils.copyProperties(member, ucenterMemberOrder);
        return ucenterMemberOrder;
    }

    /**
     * 查询某一天注册人数
     *
     * @param day
     * @return
     */
    @GetMapping("countRegister/{day}")
    public R countRegister(@PathVariable String day) {
        Integer count = memberService.countRegisterDay(day);
        return R.ok().data("countRegister", count);
    }

    @PutMapping("{oldPassword}")
    public R updateMember(HttpServletRequest request, @RequestBody UcenterMember member, @PathVariable("oldPassword") String oldPassword){
        String memberId = JwtUtils.getMemberIdByJwtToken(request);
        member.setId(memberId);
        System.out.println(member);
        boolean b = false;
        if (StringUtils.isNotBlank(member.getPassword())) {
            UcenterMember ucenterMember = memberService.getById(member);
            String pass = MD5.encrypt(oldPassword);
            if(ucenterMember.getPassword().equals(pass)){
                member.setPassword(MD5.encrypt(member.getPassword()));
                b = memberService.updateById(member);
                return R.ok();
            }
            return R.error().message("旧密码错误");
        }
        b = memberService.updateById(member);
        if (b){
            return R.ok();
        }
        return R.error().message("修改失败");
    }
}

