package com.hhz.serviceacl.controller;


import com.hhz.commonutils.JwtUtils;
import com.hhz.serviceacl.entity.User;
import com.hhz.serviceacl.service.RoleService;
import com.hhz.serviceacl.service.UserService;
import com.hhz.commonutils.MD5;
import com.hhz.commonutils.R;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * <p>
 * 用户表 前端控制器
 * </p>
 *
 * @author hhz
 * @since 2023-02-10
 */
@RestController
@RequestMapping("/admin/acl/user")
//@CrossOrigin
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private RoleService roleService;

    /**
     *获取管理用户分页列表
     * @param page
     * @param limit
     * @param userQueryVo
     * @return
     */
    @ApiOperation(value = "获取管理用户分页列表")
    @GetMapping("{page}/{limit}")
    public R index(
            @ApiParam(name = "page", value = "当前页码", required = true)
            @PathVariable Long page,
            @ApiParam(name = "limit", value = "每页记录数", required = true)
            @PathVariable Long limit,
            @ApiParam(name = "userQueryVo", value = "查询对象", required = false)
             User userQueryVo) {
        Page<User> pageParam = new Page<>(page, limit);
        QueryWrapper<User> wrapper = new QueryWrapper<>();
        if(!StringUtils.isEmpty(userQueryVo.getUsername())) {
            wrapper.like("username",userQueryVo.getUsername());
        }

        IPage<User> pageModel = userService.page(pageParam, wrapper);
        return R.ok().data("items", pageModel.getRecords()).data("total", pageModel.getTotal());
    }

    @ApiOperation(value = "根据Id获取对应的用户信息")
    @GetMapping("/get/{id}")
    public R getOne(@PathVariable String id){
        User user = userService.getById(id);
        if (Objects.isNull(user)){
            return R.error().message("没有该用户信息");
        }
        return R.ok().data("item", user);
    }

    /**
     * 新增管理用户
     * @param user 用户实体
     * @return
     */
    @ApiOperation(value = "新增管理用户")
    @PostMapping("save")
    public R save(@RequestBody User user) {
        user.setPassword(MD5.encrypt(user.getPassword()));
        userService.save(user);
        return R.ok();
    }

    /**
     * 修改管理用户
     * @param user 用户实体
     * @return
     */
    @ApiOperation(value = "修改管理用户")
    @PutMapping("update")
    public R updateById(@RequestBody User user) {
        userService.updateById(user);
        return R.ok();
    }

    /**
     * 删除管理用户
     * @param id 管理用户Id
     * @return
     */
    @ApiOperation(value = "删除管理用户")
    @DeleteMapping("remove/{id}")
    public R remove(@PathVariable String id) {
        userService.removeById(id);
        return R.ok();
    }

    /**
     * 根据Id删除管理用户
     * @param idList 用户Id列表
     * @return
     */
    @ApiOperation(value = "根据id列表删除管理用户")
    @DeleteMapping("batchRemove")
    public R batchRemove(@RequestBody List<String> idList) {
        userService.removeByIds(idList);
        return R.ok();
    }

    /**
     * 根据用户Id获取角色数据
     * @param userId 用户Id
     * @return
     */
    @ApiOperation(value = "根据用户获取角色数据")
    @GetMapping("/toAssign/{userId}")
    public R toAssign(@PathVariable String userId) {
        Map<String, Object> roleMap = roleService.findRoleByUserId(userId);
        return R.ok().data(roleMap);
    }

    /**
     * 根据用户Id分配角色
     * @param userId 用户Id
     * @param roleId 角色Id列表
     * @return
     */
    @ApiOperation(value = "根据用户分配角色")
    @PostMapping("/doAssign")
    public R doAssign(@RequestParam String userId,@RequestParam String[] roleId) {
        roleService.saveUserRoleRealtionShip(userId,roleId);
        return R.ok();
    }
}

