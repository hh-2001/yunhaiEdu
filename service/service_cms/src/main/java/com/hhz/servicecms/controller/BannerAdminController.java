package com.hhz.servicecms.controller;


import com.hhz.commonutils.R;
import com.hhz.servicecms.entity.CrmBanner;
import com.hhz.servicecms.service.CrmBannerService;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 后台banner管理接口
 * </p>
 *
 * @author hhz
 * @since 2023-02-10
 */
@RestController
@RequestMapping("/educms/banneradmin")
@CrossOrigin
public class BannerAdminController {

    @Autowired
    private CrmBannerService bannerService;

    /**
     * 查询banner
     * @param page
     * @param limit
     * @return
     */
    @GetMapping("pageBanner/{page}/{limit}")
    public R pageBanner(@PathVariable long page, @PathVariable long limit) {
        Page<CrmBanner> pageBanner = new Page<>(page,limit);
        bannerService.page(pageBanner,null);
        return R.ok().data("items",pageBanner.getRecords()).data("total",pageBanner.getTotal());
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
    @GetMapping("get/{id}")
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
    @PutMapping("update")
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
    @DeleteMapping("remove/{id}")
    public R remove(@PathVariable String id) {
        bannerService.removeById(id);
        return R.ok();
    }
}