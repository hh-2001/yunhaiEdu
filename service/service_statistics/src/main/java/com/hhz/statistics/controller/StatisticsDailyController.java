package com.hhz.statistics.controller;


import com.hhz.commonutils.R;
import com.hhz.statistics.service.StatisticsDailyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * <p>
 * 网站统计日数据 前端控制器
 * </p>
 *
 * @author hhz
 * @since 2023-02-12
 */
@RestController
@RequestMapping("/staservice/daily")
public class StatisticsDailyController {

    @Autowired
    private StatisticsDailyService staService;

    /**
     * 统计某一天注册人数，统计数据
     *
     * @param day
     * @return
     */
    @PostMapping("createStatisticsByDay/{day}")
    public R registerCount(@PathVariable String day) {
        staService.registerCount(day);
        return R.ok();
    }

    /**
     * 图表显示，返回两部分数据，日期json数组，数量json数组
     *
     * @param type
     * @param begin
     * @param end
     * @return
     */
    @GetMapping("showData/{type}/{begin}/{end}")
    public R showData(@PathVariable String type, @PathVariable String begin,
                      @PathVariable String end) {
        System.out.println("类型" + type);
        Map<String, Object> map = staService.getShowData(type, begin, end);
        System.out.println("生成结果"+map);
        return R.ok().data(map);
    }

    @GetMapping("showDataByType/{type}")
    public R showDataByType(@PathVariable String type) {
        System.out.println("类型" + type);
        Map<String, Object> map = staService.getShowDataByType(type);
        System.out.println("生成结果"+map);
        return R.ok().data(map);
    }
}

