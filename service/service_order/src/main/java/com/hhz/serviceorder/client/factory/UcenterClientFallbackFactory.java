package com.hhz.serviceorder.client.factory;

import com.hhz.commonutils.ordervo.UcenterMemberOrder;
import com.hhz.serviceorder.client.UcenterClient;
import feign.hystrix.FallbackFactory;
import org.springframework.stereotype.Component;

/**
 * @author: hhz
 * @Date: 2023/4/10
 * @Time: 14:33
 * @Description:
 */
@Component
public class UcenterClientFallbackFactory implements FallbackFactory<UcenterClient> {
    @Override
    public UcenterClient create(Throwable throwable) {
        return new UcenterClient() {
            @Override
            public UcenterMemberOrder getUserInfoOrder(String id) {
                return new UcenterMemberOrder();
            }
        };
    }
}
