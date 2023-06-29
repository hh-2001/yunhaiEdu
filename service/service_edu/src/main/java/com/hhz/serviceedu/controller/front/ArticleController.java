package com.hhz.serviceedu.controller.front;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hhz.commonutils.R;
import com.hhz.serviceedu.entity.Article;
import com.hhz.serviceedu.entity.ArticleDescription;
import com.hhz.serviceedu.entity.vo.ArticleInfoVo;
import com.hhz.serviceedu.service.ArticleDescriptionService;
import com.hhz.serviceedu.service.ArticleService;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;

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

    @Autowired
    private ArticleDescriptionService articleDescriptionService;

    /**
     * 获取文章列表
     *
     * @param page  页面大小
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

        articleService.page(pageParam, null);

        return R.ok().data("items", pageParam.getRecords()).data("total", pageParam.getTotal());
    }

    @ApiOperation(value = "文章详情")
    @GetMapping("getArticleInfo/{articleId}")
    public R detail(@PathVariable("articleId") String articleId) {
        ArticleInfoVo articleDetail = articleService.getArticleDetail(articleId);
        return R.ok().data("item", articleDetail);
    }

    @ApiOperation(value = "获取文章内容")
    @GetMapping("getArticle/{articleId}")
    public R getArticle(@PathVariable String articleId) {
        Article article = articleService.getById(articleId);
        return R.ok().data("item", article);
    }

    @ApiOperation(value = "添加文章内容")
    @PostMapping("addArticle")
    public R addArticle(@RequestBody Article article) {
        articleService.save(article);
        return R.ok();
    }

    @ApiOperation(value = "修改文章内容")
    @PutMapping("updateArticle")
    public R updateArticle(@RequestBody Article article) {
        UpdateWrapper<Article> wrapper = new UpdateWrapper<>();
        wrapper.eq("article_id", article.getArticleId());
        articleService.update(article,wrapper);
        return R.ok();
    }

    @ApiOperation(value = "删除文章")
    @DeleteMapping("removeArticle/{articleId}")
    public R removeArticle(@PathVariable String articleId){
        articleService.removeById(articleId);
        UpdateWrapper<ArticleDescription> wrapper = new UpdateWrapper<>();
        wrapper.eq("article_id", articleId);
        articleDescriptionService.remove(wrapper);
        return R.ok();
    }

    @ApiOperation(value = "添加文章内容")
    @PostMapping("addArticleDescription")
    public R addArticleDescription(@RequestBody ArticleDescription articleDescription) {
        articleDescriptionService.save(articleDescription);
        return R.ok();
    }

    @ApiOperation(value = "修改文章内容")
    @PutMapping("updateArticleDescription")
    public R updateArticleDescription(@RequestBody ArticleDescription articleDescription) {
        UpdateWrapper<ArticleDescription> wrapper = new UpdateWrapper<>();
        wrapper.eq("article_id", articleDescription.getArticleId());
        articleDescriptionService.update(articleDescription, wrapper);
        return R.ok();
    }

    @ApiOperation(value = "删除文章内容")
    @DeleteMapping("removeArticleDescription/{id}")
    public R removeArticleDescription(@PathVariable("id") String id) {
        articleDescriptionService.removeById(id);
        return R.ok();
    }

    @ApiOperation(value = "导出pdf")
    @GetMapping("export/{articleId}")
    public R export(@PathVariable String articleId, HttpServletResponse response){
        articleService.exportPdf(articleId,response);
        return R.ok();
    }
}
