package com.hhz.ucenter.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hhz.ucenter.entity.vo.CommentVo;
import com.hhz.ucenter.mapper.EduCommentMapper;
import com.hhz.ucenter.service.EduCommentService;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.util.StringUtil;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author: hhz
 * @Date: 2023/3/7
 * @Time: 14:13
 * @Description:
 */
@Service
public class EduCommentServiceImpl extends ServiceImpl<EduCommentMapper, CommentVo> implements EduCommentService {
    @Override
    public Map<String, Object> getCommentPage(Page<CommentVo> pageParam, String courseId) {

        QueryWrapper<CommentVo> wrapper = new QueryWrapper<>();
        wrapper.orderByDesc("member_id");
        if (StringUtils.isNoneBlank(courseId)){
            wrapper.eq("course_id", courseId);
        }
        //把分页数据封装到pageTeacher对象
        baseMapper.selectPage(pageParam,wrapper);

        List<CommentVo> records = pageParam.getRecords();
        long current = pageParam.getCurrent();
        long pages = pageParam.getPages();
        long size = pageParam.getSize();
        long total = pageParam.getTotal();

        //把分页数据获取出来，放到map集合
        Map<String, Object> map = new HashMap<>();
        map.put("items", records);
        map.put("current", current);
        map.put("pages", pages);
        map.put("size", size);
        map.put("total", total);

        //map返回
        return map;
    }
}
