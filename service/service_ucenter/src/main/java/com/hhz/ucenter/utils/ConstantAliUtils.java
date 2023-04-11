package com.hhz.ucenter.utils;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * @author: hhz
 * @Date: 2023/4/10
 * @Time: 15:10
 * @Description:
 */
@Component
public class ConstantAliUtils implements InitializingBean {

    @Value("${alipay.APP_ID}")
    private String appId;
    @Value("${alipay.APP_PRIVATE_KEY}")
    private String appPrivateKey;
    @Value("${alipay.ALIPAY_PUBLIC_KEY}")
    private String aliPublicKey;
    @Value("${alipay.GATEWAY_URL}")
    private String gateWayUrl;

    public static String ALIPAY_APP_ID;
    public static String ALIPAY_PRIVATE_KEY;
    public static String ALIPAY_PUBLIC_KEY;
    public static String GATEWAY_URL;

    @Override
    public void afterPropertiesSet() throws Exception {
        ALIPAY_APP_ID = appId;
        ALIPAY_PRIVATE_KEY = appPrivateKey;
        ALIPAY_PUBLIC_KEY = aliPublicKey;
        GATEWAY_URL = gateWayUrl;
    }
}
