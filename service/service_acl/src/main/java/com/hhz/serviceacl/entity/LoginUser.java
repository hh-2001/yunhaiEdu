package com.hhz.serviceacl.entity;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

/**
 * @author: hhz
 * @Date: 2023/5/17
 * @Time: 10:44
 * @Description:
 */
@Data
@ApiModel(description = "登录用户")
public class LoginUser implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "微信openid")
    private String username;

    @ApiModelProperty(value = "密码")
    private String password;

    @ApiModelProperty(value = "昵称")
    private String nickName;

    @ApiModelProperty(value = "用户头像")
    private String salt;

    @ApiModelProperty(value = "用户签名")
    private String token;

    /** 验证码在redis的键 */
    private String uuid;

    /** 验证码 */
    @ApiModelProperty(value = "验证码")
    private String code;

}
