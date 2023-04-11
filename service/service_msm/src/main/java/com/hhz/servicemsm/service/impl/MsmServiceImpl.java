package com.hhz.servicemsm.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.aliyuncs.CommonRequest;
import com.aliyuncs.CommonResponse;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;
import com.hhz.servicemsm.service.MsmService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.validation.Valid;
import java.util.Map;

@Service
public class MsmServiceImpl implements MsmService {

    @Value("${aliyun.msm.keyId}")
    private String accessKey;
    @Value("${aliyun.msm.keySecret}")
    private String secret;
    @Value("${aliyun.msm.region}")
    private String region;
    @Value("${aliyun.msm.signName}")
    private String signName;
    @Value("${aliyun.msm.templateCode}")
    private String templateCode;

    //发送短信的方法
    @Override
    public boolean send(Map<String, Object> param, String phone) {
        if(StringUtils.isEmpty(phone)) return false;

        DefaultProfile profile =
                DefaultProfile.getProfile(region, accessKey, secret);
        IAcsClient client = new DefaultAcsClient(profile);

        //设置相关固定的参数
        CommonRequest request = new CommonRequest();
        //request.setProtocol(ProtocolType.HTTPS);
        request.setMethod(MethodType.POST);
        request.setDomain("dysmsapi.aliyuncs.com");//阿里云发送
        request.setVersion("2017-05-25");//版本
        request.setAction("SendSms");//发送方法

        //设置发送相关的参数
        request.putQueryParameter("PhoneNumbers", phone); //手机号
        request.putQueryParameter("SignName", signName); //申请阿里云 签名名称
        request.putQueryParameter("TemplateCode", templateCode); //申请阿里云 模板code
        request.putQueryParameter("TemplateParam", JSONObject.toJSONString(param)); //验证码数据，转换json数据传递

        System.out.println("执行到这:" + signName);

        try {
            //最终发送
            CommonResponse response = client.getCommonResponse(request);
            boolean success = response.getHttpResponse().isSuccess();
            System.out.println("结果："+success);
            return success;
        }catch(Exception e) {
            e.printStackTrace();
            return false;
        }

    }
}
