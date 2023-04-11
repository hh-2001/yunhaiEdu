package com.hhz.serviceorder.client.factory;

import com.hhz.commonutils.ordervo.CourseWebVoOrder;
import com.hhz.serviceorder.client.EduClient;
import feign.hystrix.FallbackFactory;
import org.springframework.stereotype.Component;

/**
 * @author: hhz
 * @Date: 2023/4/10
 * @Time: 14:29
 * @Description:
 */
@Component
public class RemoteFallbackFactory implements FallbackFactory<EduClient> {
    @Override
    public EduClient create(Throwable throwable) {
        return new EduClient() {
            @Override
            public CourseWebVoOrder getCourseInfoOrder(String id) {
                return new CourseWebVoOrder();
            }
        };
    }
}
