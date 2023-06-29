package com.hhz.ucenter.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.hhz.ucenter.entity.vo.CommentVo;

import java.util.Map;

/**
 * @author: hhz
 * @Date: 2023/3/7
 * @Time: 14:13
 * @Description:
 */
public interface EduCommentService extends IService<CommentVo> {
    //分页查询评论
    Map<String, Object> getCommentPage(Page<CommentVo> pageComment, String courseId);
}
