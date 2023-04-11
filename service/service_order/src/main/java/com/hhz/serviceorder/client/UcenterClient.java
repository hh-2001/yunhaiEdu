package com.hhz.serviceorder.client;

import com.hhz.commonutils.ordervo.UcenterMemberOrder;
import com.hhz.serviceorder.client.factory.RemoteFallbackFactory;
import com.hhz.serviceorder.client.factory.UcenterClientFallbackFactory;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Component
@FeignClient(value = "service-ucenter", fallbackFactory = UcenterClientFallbackFactory.class)
public interface UcenterClient {

    //根据用户id获取用户信息
    @PostMapping("/educenter/member/getUserInfoOrder/{id}")
    public UcenterMemberOrder getUserInfoOrder(@PathVariable("id") String id);
}
