package com.hhz.serviceacl.service;

import com.hhz.base.exceptionhandler.CaptchaException;
import com.hhz.commonutils.R;

import java.io.IOException;

/**
 * 验证码处理
 *
 * @author hhz
 */
public interface ValidateCodeService
{
    /**R
     * 生成验证码
     */
    public R createCaptcha() throws IOException, CaptchaException;

    /**
     * 校验验证码
     */
    public void checkCaptcha(String key, String value) throws CaptchaException;
}
