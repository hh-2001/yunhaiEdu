package com.hhz.serviceedu.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.hhz.serviceedu.entity.Article;
import com.hhz.serviceedu.entity.vo.ArticleInfoVo;

import javax.servlet.http.HttpServletResponse;

/**
 * @author: hhz
 * @Date: 2023/4/21
 * @Time: 9:28
 * @Description:
 */
public interface ArticleService extends IService<Article> {
    ArticleInfoVo getArticleDetail(String articleId);

    /**
     * 文章导出为pdf
     * @param articleId
     */
    void exportPdf(String articleId, HttpServletResponse response);
}
