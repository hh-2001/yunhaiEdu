package com.hhz.servicecms.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.hhz.commonutils.R;
import com.hhz.servicecms.entity.CrmBanner;
import com.hhz.servicecms.entity.Vo.BannerQuery;
import com.hhz.servicecms.service.CrmBannerService;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 后台banner管理接口
 * </p>
 *
 * @author hhz
 * @since 2023-02-10
 */
@RestController
@RequestMapping("/cmsservice/bannerAdmin")
public class BannerAdminController {

    @Autowired
    private CrmBannerService bannerService;

    /**
     * 查询banner
     * @param page
     * @param limit
     * @return
     */
    @PostMapping("pageBanner/{page}/{limit}")
    public R pageBanner(@PathVariable long page, @PathVariable long limit,
                        @RequestBody(required = false) BannerQuery bannerQuery) {
        //创建page对象
        Page<CrmBanner> pageBanner = new Page<>(page,limit);

        //构建条件
        QueryWrapper<CrmBanner> wrapper = new QueryWrapper<>();

        //多条件查询
        String name = bannerQuery.getName();
        String begin = bannerQuery.getBegin();
        String end = bannerQuery.getEnd();
        //判断条件值是否为空，如果不为空拼接条件
        if (!StringUtils.isEmpty(name)) {
            //构建条件
            wrapper.like("title", name);
        }
        if (!StringUtils.isEmpty(begin)) {
            wrapper.ge("gmt_create", begin);
        }
        if (!StringUtils.isEmpty(end)) {
            wrapper.le("gmt_create", end);
        }

        //排序
        wrapper.orderByDesc("gmt_create");

        bannerService.page(pageBanner, wrapper);
        long total = pageBanner.getTotal();
        List<CrmBanner> records = pageBanner.getRecords();
        return R.ok().data("items",records).data("total",total);
    }

    /**
     * 添加banner
     * @param crmBanner
     * @return
     */
    @PostMapping("addBanner")
    public R addBanner(@RequestBody CrmBanner crmBanner) {
        bannerService.save(crmBanner);
        return R.ok();
    }

    /**
     * 获取Banner
     * @param id bannerId
     * @return
     */
    @ApiOperation(value = "获取Banner")
    @GetMapping("getBannerById/{id}")
    public R get(@PathVariable String id) {
        CrmBanner banner = bannerService.getById(id);
        return R.ok().data("item", banner);
    }

    /**
     * 修改Banner
     * @param banner
     * @return
     */
    @ApiOperation(value = "修改Banner")
    @PutMapping("updateBanner")
    public R updateById(@RequestBody CrmBanner banner) {
        bannerService.updateById(banner);
        return R.ok();
    }

    /**
     * 删除Banner
     * @param id bannerId
     * @return
     */
    @ApiOperation(value = "删除Banner")
    @DeleteMapping("deleteBannerById/{id}")
    public R remove(@PathVariable String id) {
        bannerService.removeById(id);
        return R.ok();
    }
}