package com.hhz.serviceacl.service.impl;

import com.google.code.kaptcha.Producer;

import com.hhz.base.RedisService;
import com.hhz.base.exceptionhandler.CaptchaException;
import com.hhz.commonutils.Base64;
import com.hhz.commonutils.R;

import com.hhz.commonutils.StringUtils;
import com.hhz.commonutils.constants.CacheConstants;
import com.hhz.commonutils.constants.Constants;
import com.hhz.serviceacl.service.ValidateCodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.commons.util.IdUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.FastByteArrayOutputStream;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

/**
 * 验证码实现处理
 *
 * @author hhz
 */
@Service
public class ValidateCodeServiceImpl implements ValidateCodeService {

    @Resource(name = "captchaProducer")
    private Producer captchaProducer;

    @Resource(name = "captchaProducerMath")
    private Producer captchaProducerMath;

    @Autowired
    private RedisService redisService;

    /**
     * 生成验证码
     */
    @Override
    public R createCaptcha() throws IOException, CaptchaException {
        R r = R.ok();
        // 保存验证码信息
        String uuid = UUID.randomUUID().toString();
        String verifyKey = CacheConstants.CAPTCHA_CODE_KEY + uuid;

        String capStr = null, code = null;
        BufferedImage image = null;

        // 生成验证码

        String capText = captchaProducerMath.createText();
        capStr = capText.substring(0, capText.lastIndexOf("@"));
        code = capText.substring(capText.lastIndexOf("@") + 1);
        image = captchaProducerMath.createImage(capStr);

        redisService.setCacheObject(verifyKey, code, Constants.CAPTCHA_EXPIRATION, TimeUnit.MINUTES);
        // 转换流信息写出
        FastByteArrayOutputStream os = new FastByteArrayOutputStream();
        try {
            ImageIO.write(image, "jpg", os);
        } catch (IOException e) {
            return R.error().message(e.getMessage());
        }

        r.data("uuid", uuid);
        r.data("img", Base64.encode(os.toByteArray()));
        return r;
    }

    /**
     * 校验验证码
     */
    @Override
    public void checkCaptcha(String code, String uuid) throws CaptchaException {
        //判断验证码状态
        if (StringUtils.isEmpty(code)) {
            throw new CaptchaException("验证码不能为空");
        }
        if (StringUtils.isEmpty(uuid)) {
            throw new CaptchaException("验证码已失效");
        }
        String verifyKey = CacheConstants.CAPTCHA_CODE_KEY + uuid;
        String captcha = redisService.getCacheObject(verifyKey);
        redisService.deleteObject(verifyKey);

        //非默认值，需要校验
        if (!code.equals(CacheConstants.DEFAULT_CODE)) {
            if (!code.equalsIgnoreCase(captcha)) {
                throw new CaptchaException("验证码错误");
            }
        }
    }
}
