package com.hhz.serviceorder.client;

import com.hhz.commonutils.ordervo.CourseWebVoOrder;
import com.hhz.serviceorder.client.factory.RemoteFallbackFactory;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Component
@FeignClient(value = "service-edu", fallbackFactory = RemoteFallbackFactory.class)
public interface EduClient {

    //根据课程id查询课程信息
    @PostMapping("/eduservice/coursefront/getCourseInfoOrder/{id}")
    public CourseWebVoOrder getCourseInfoOrder(@PathVariable("id") String id);

}
