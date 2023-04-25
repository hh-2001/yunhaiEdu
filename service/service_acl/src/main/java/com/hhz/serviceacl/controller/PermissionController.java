package com.hhz.serviceacl.controller;


import com.hhz.serviceacl.entity.Permission;
import com.hhz.serviceacl.service.PermissionService;
import com.hhz.commonutils.R;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 权限 菜单管理
 * </p>
 *
 * @author hhz
 * @since 2023-02-10
 */
@RestController
@RequestMapping("/admin/acl/permission")
//@CrossOrigin
public class PermissionController {

    @Autowired
    private PermissionService permissionService;

    /**
     * 获取全部菜单
     * @return
     */
    @ApiOperation(value = "查询所有菜单")
    @GetMapping
    public R indexAllPermission() {
        List<Permission> list =  permissionService.queryAllMenuGuli();

        return R.ok().data("items",list);
    }

    /**
     * 递归删除菜单
     * @param id 菜单Id
     * @return
     */
    @ApiOperation(value = "递归删除菜单")
    @DeleteMapping("remove/{id}")
    public R remove(@PathVariable String id) {
        permissionService.removeChildByIdGuli(id);
        return R.ok();
    }

    /**
     * 角色分配权限
     * @param roleId 角色Id
     * @param permissionId 菜单Id(即是权限)
     * @return
     */
    @ApiOperation(value = "给角色分配权限")
    @PostMapping("/doAssign")
    public R doAssign(String roleId,String[] permissionId) {
        if(permissionService.saveRolePermissionRealtionShipGuli(roleId,permissionId)){
           return R.ok();
        }
        return R.error();
    }

    /**
     * 根据角色获取菜单
     * @param roleId 角色Id
     * @return
     */
    @ApiOperation(value = "根据角色获取菜单")
    @GetMapping("toAssign/{roleId}")
    public R toAssign(@PathVariable String roleId) {
        List<Permission> list = permissionService.selectAllMenu(roleId);
        return R.ok().data("items", list);
    }

    /**
     * 新增菜单
     * @param permission 菜单实体
     * @return
     */
    @ApiOperation(value = "新增菜单")
    @PostMapping("save")
    public R save(@RequestBody Permission permission) {
        permissionService.save(permission);
        return R.ok();
    }

    /**
     * 修改菜单
     * @param permission 菜单实体
     * @return
     */
    @ApiOperation(value = "修改菜单")
    @PutMapping("update")
    public R updateById(@RequestBody Permission permission) {
        permissionService.updateById(permission);
        return R.ok();
    }

}

