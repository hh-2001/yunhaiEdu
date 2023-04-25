package com.hhz.serviceedu.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import com.hhz.serviceedu.entity.Article;
import com.hhz.serviceedu.mapper.ArticleMapper;
import com.hhz.serviceedu.service.ArticleService;
import org.springframework.stereotype.Service;

/**
 * @author: hhz
 * @Date: 2023/4/21
 * @Time: 9:29
 * @Description:
 */
@Service
public class ArticleServiceImpl extends ServiceImpl<ArticleMapper, Article> implements ArticleService {
}
