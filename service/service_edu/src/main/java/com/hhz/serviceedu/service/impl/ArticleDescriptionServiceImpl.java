package com.hhz.serviceedu.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hhz.serviceedu.entity.ArticleDescription;
import com.hhz.serviceedu.mapper.ArticleDescriptionMapper;
import com.hhz.serviceedu.service.ArticleDescriptionService;
import com.hhz.serviceedu.service.ArticleService;
import org.springframework.stereotype.Service;

/**
 * @author: hhz
 * @Date: 2023/6/21
 * @Time: 10:11
 * @Description:
 */
@Service
public class ArticleDescriptionServiceImpl extends ServiceImpl<ArticleDescriptionMapper , ArticleDescription> implements ArticleDescriptionService {
}
