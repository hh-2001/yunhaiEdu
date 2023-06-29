package com.hhz.base.exceptionhandler;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 验证码错误异常类
 *
 * @author ruoyi
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class CaptchaException extends RuntimeException
{
    private static final long serialVersionUID = 1L;
    private String msg;
}
