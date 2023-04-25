package com.hhz.serviceacl.mapper;

import com.hhz.serviceacl.entity.RolePermission;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 * 角色权限 Mapper 接口
 * </p>
 *
 * @author hhz
 * @since 2023-02-10
 */
public interface RolePermissionMapper extends BaseMapper<RolePermission> {

    int removeByRoleId(@Param("roleId") String roleId);
}
