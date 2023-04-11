package com.hhz.serviceedu.client;


/**
 * @author: hhz
 * @Date: 2023/4/10
 * @Time: 14:38
 * @Description:
 */
public class OrdersClientFeignClient implements OrdersClient {
    //出错会执行
    @Override
    public boolean isBuyCourse(String courseId, String memberId) {
        return false;
    }
}
