package com.hhz.serviceorder.controller;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hhz.commonutils.JwtUtils;
import com.hhz.commonutils.R;
import com.hhz.serviceorder.entity.Order;
import com.hhz.serviceorder.service.OrderService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.swagger.annotations.ApiParam;
import org.apache.poi.util.StringUtil;
import org.aspectj.weaver.ast.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

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

    @GetMapping("{page}/{limit}")
    public R index(
            @ApiParam(name = "page", value = "当前页码", required = true)
            @PathVariable Long page,
            @ApiParam(name = "limit", value = "每页记录数", required = true)
            @PathVariable Long limit,
            @ApiParam(name = "orderQueryVo", value = "查询对象", required = false)
                    Order orderQueryVo) {

        Page<Order> pageParam = new Page<>(page, limit);
        QueryWrapper<Order> wrapper = new QueryWrapper<>();
        if (!StringUtils.isEmpty(orderQueryVo.getStatus())) {
            wrapper.like("status", orderQueryVo.getStatus());
        }

        orderService.page(pageParam, wrapper);
        long total = pageParam.getTotal();
        List<Order> records = pageParam.getRecords();
        return R.ok().data("items", records).data("total", total);
    }

    /**
     * 生成订单
     *
     * @param courseId
     * @param request
     * @return
     */
    @PostMapping("createOrder/{courseId}")
    public R saveOrder(@PathVariable String courseId, HttpServletRequest request) {
        String token = JwtUtils.getMemberIdByJwtToken(request);
        if (StringUtils.isEmpty(token)) {
            return R.error().message("还没有登录呢");
        }
        //创建订单，返回订单号
        String orderNo =
                orderService.createOrders(courseId, token);
        return R.ok().data("orderNo", orderNo);
    }

    /**
     * 查询订单信息
     *
     * @param orderNo 订单Id
     * @return
     */
    @GetMapping("getOrderInfo/{orderNo}")
    public R getOrderInfo(@PathVariable String orderNo) {
        QueryWrapper<Order> wrapper = new QueryWrapper<>();
        wrapper.eq("order_no", orderNo);
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
    public boolean isBuyCourse(@PathVariable("courseId") String courseId, @PathVariable("memberId") String memberId) {
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

    /**
     * 查询订单信息
     *
     * @return
     */
    @GetMapping("getOrderInfoByMember/{page}/{limit}")
    public R getOrderInfoByMember(@ApiParam(name = "page", value = "当前页码", required = true)
                                  @PathVariable Long page,
                                  @ApiParam(name = "limit", value = "每页记录数", required = true)
                                  @PathVariable Long limit,
                                  HttpServletRequest request) {
        String memberId = JwtUtils.getMemberIdByJwtToken(request);

        Page<Order> orderPage = new Page<Order>(page, limit);

        QueryWrapper<Order> wrapper = new QueryWrapper<>();
        wrapper.eq("member_id", memberId);
        wrapper.orderByDesc("gmt_create");

        orderService.page(orderPage,wrapper);

        List<Order> records = orderPage.getRecords();
        long total = orderPage.getTotal();
        return R.ok().data("items", records).data("total", total);
    }
}

