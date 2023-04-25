package com.hhz.serviceedu.service;

import com.hhz.serviceedu.controller.front.CourseFrontController;
import com.hhz.serviceedu.entity.EduCourse;
import com.hhz.serviceedu.entity.EduCourseCollect;
import com.hhz.serviceedu.entity.frontvo.CourseCollectVo;
import com.hhz.serviceedu.entity.frontvo.CourseFrontVo;
import com.hhz.serviceedu.entity.frontvo.CourseWebVo;
import com.hhz.serviceedu.entity.vo.CourseInfoVo;
import com.hhz.serviceedu.entity.vo.CoursePublishVo;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 课程 服务类
 * </p>
 *
 * @author hhz
 * @since 2023-02-09
 */
public interface EduCourseService extends IService<EduCourse> {

    //添加课程基本信息的方法
    String saveCourseInfo(CourseInfoVo courseInfoVo);

    //根据课程id查询课程基本信息
    CourseInfoVo getCourseInfo(String courseId);

    //修改课程信息
    void updateCourseInfo(CourseInfoVo courseInfoVo);

    //根据课程id查询课程确认信息
    CoursePublishVo publishCourseInfo(String id);

    //删除课程
    void removeCourse(String courseId);

    //1 条件查询带分页查询课程前台
    Map<String, Object> getCourseFrontList(Page<EduCourse> pageCourse, CourseFrontVo courseFrontVo);

    //根据课程id，编写sql语句查询课程信息
    CourseWebVo getBaseCourseInfo(String courseId);

    //收藏课程
    Boolean saveCollect(EduCourseCollect courseCollect);

    //获取对应会员收藏的课程
    List<CourseCollectVo> getCourseCollect(String memberId);
}
