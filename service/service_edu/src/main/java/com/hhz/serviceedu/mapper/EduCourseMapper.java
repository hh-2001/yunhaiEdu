package com.hhz.serviceedu.mapper;

import com.hhz.serviceedu.entity.EduCourse;
import com.hhz.serviceedu.entity.EduCourseCollect;
import com.hhz.serviceedu.entity.frontvo.CourseWebVo;
import com.hhz.serviceedu.entity.vo.CoursePublishVo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 课程 Mapper 接口
 * </p>
 *
 * @author hhz
 * @since 2023-02-09
 */
public interface EduCourseMapper extends BaseMapper<EduCourse> {

    //根据课程id，获取当前课程信息
    public CoursePublishVo getPublishCourseInfo(String courseId);

    //根据课程id，编写sql语句查询课程信息
    CourseWebVo getBaseCourseInfo(@Param("courseId") String courseId);

    int saveCollect(EduCourseCollect courseCollect);

    List<EduCourseCollect> getCourseCollect(@Param("memberId") String memberId);
}
