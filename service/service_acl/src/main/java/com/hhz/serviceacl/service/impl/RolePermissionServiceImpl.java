package com.hhz.serviceacl.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.hhz.serviceacl.entity.RolePermission;
import com.hhz.serviceacl.mapper.RolePermissionMapper;
import com.hhz.serviceacl.service.RolePermissionService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 角色权限 服务实现类
 * </p>
 *
 * @author hhz
 * @since 2023-02-10
 */
@Service
public class RolePermissionServiceImpl extends ServiceImpl<RolePermissionMapper, RolePermission> implements RolePermissionService {

    @Override
    public int removeByRoleId(String roleId){

        return baseMapper.removeByRoleId(roleId);
    }
}
