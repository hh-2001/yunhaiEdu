package com.hhz.serviceedu.controller.front;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hhz.commonutils.R;
import com.hhz.serviceedu.entity.Article;
import com.hhz.serviceedu.service.ArticleService;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author: hhz
 * @Date: 2023/4/21
 * @Time: 9:30
 * @Description:
 */
@RestController
@RequestMapping("eduservice/article")
public class ArticleController {

    @Autowired
    private ArticleService articleService;

    /**
     * 获取文章列表
     * @param page 页面大小
     * @param limit 页面个数
     * @return
     */
    @ApiOperation(value = "获取文章分页列表")
    @GetMapping("{page}/{limit}")
    public R index(
            @ApiParam(name = "page", value = "当前页码", required = true)
            @PathVariable Long page,
            @ApiParam(name = "limit", value = "每页记录数", required = true)
            @PathVariable Long limit) {

        Page<Article> pageParam = new Page<>(page, limit);

        articleService.page(pageParam,null);

        return R.ok().data("items", pageParam.getRecords()).data("total", pageParam.getTotal());
    }
}
