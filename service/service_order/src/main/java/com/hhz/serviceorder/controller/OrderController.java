package com.hhz.serviceorder.controller;


import com.hhz.commonutils.JwtUtils;
import com.hhz.commonutils.R;
import com.hhz.serviceorder.entity.Order;
import com.hhz.serviceorder.service.OrderService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * <p>
 * 订单 前端控制器
 * </p>
 *
 * @author hhz
 * @since 2023-02-11
 */
@RestController
@RequestMapping("/eduorder/order")
@CrossOrigin
public class OrderController {

    @Autowired
    private OrderService orderService;

    /**
     * 生成订单
     *
     * @param courseId
     * @param request
     * @return
     */
    @PostMapping("createOrder/{courseId}")
    public R saveOrder(@PathVariable String courseId, HttpServletRequest request) {
        //创建订单，返回订单号
        String orderNo =
                orderService.createOrders(courseId, JwtUtils.getMemberIdByJwtToken(request));
        return R.ok().data("orderId", orderNo);
    }

    /**
     * 查询订单信息
     *
     * @param orderId 订单Id
     * @return
     */
    @GetMapping("getOrderInfo/{orderId}")
    public R getOrderInfo(@PathVariable String orderId) {
        QueryWrapper<Order> wrapper = new QueryWrapper<>();
        wrapper.eq("order_no", orderId);
        Order order = orderService.getOne(wrapper);
        return R.ok().data("item", order);
    }

    /**
     * 查询订单状态
     *
     * @param courseId 课程Id
     * @param memberId 用户Id
     * @return
     */
    @GetMapping("isBuyCourse/{courseId}/{memberId}")
    public boolean isBuyCourse(@PathVariable String courseId, @PathVariable String memberId) {
        QueryWrapper<Order> wrapper = new QueryWrapper<>();
        wrapper.eq("course_id", courseId);
        wrapper.eq("member_id", memberId);
        wrapper.eq("status", 1);//支付状态 1代表已经支付
        int count = orderService.count(wrapper);
        if (count > 0) { //已经支付
            return true;
        } else {
            return false;
        }
    }
}

