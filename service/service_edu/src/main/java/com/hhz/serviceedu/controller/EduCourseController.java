package com.hhz.serviceedu.controller;


import com.hhz.commonutils.R;
import com.hhz.serviceedu.entity.EduCourse;
import com.hhz.serviceedu.entity.vo.CourseInfoVo;
import com.hhz.serviceedu.entity.vo.CoursePublishVo;
import com.hhz.serviceedu.service.EduCourseService;
import io.swagger.annotations.Api;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 课程 前端控制器
 * </p>
 *
 * @author hhz
 * @since 2023-02-09
 */
@Api(description = "课程管理")
@RestController
@RequestMapping("/eduservice/course")
//@CrossOrigin
public class EduCourseController {

    @Autowired
    private EduCourseService courseService;

    /**
     * 课程列表
     * TODO 条件查询和分页
     * @return
     */
    @GetMapping
    public R getCourseList() {
        List<EduCourse> list = courseService.list(null);
        return R.ok().data("list",list);
    }

    /**
     * 添加课程基本信息的方法
     * @param courseInfoVo 课程信息Vo
     * @return
     */
    @PostMapping("addCourseInfo")
    public R addCourseInfo(@RequestBody CourseInfoVo courseInfoVo) {
        //返回添加之后课程id，为了后面添加大纲使用
        String id = courseService.saveCourseInfo(courseInfoVo);
        return R.ok().data("courseId",id);
    }

    /**
     * 根据课程id查询课程基本信息
     * @param courseId 课程Id
     * @return
     */
    @GetMapping("getCourseInfo/{courseId}")
    public R getCourseInfo(@PathVariable String courseId) {
        CourseInfoVo courseInfoVo = courseService.getCourseInfo(courseId);
        return R.ok().data("courseInfoVo",courseInfoVo);
    }

    /**
     * 修改课程信息
     * @param courseInfoVo 课程信息Vo
     * @return
     */
    @PostMapping("updateCourseInfo")
    public R updateCourseInfo(@RequestBody CourseInfoVo courseInfoVo) {
        courseService.updateCourseInfo(courseInfoVo);
        return R.ok();
    }

    /**
     * 根据课程id查询课程确认信息
     * @param id 课程Id
     * @return
     */
    @GetMapping("getPublishCourseInfo/{id}")
    public R getPublishCourseInfo(@PathVariable String id) {
        CoursePublishVo coursePublishVo = courseService.publishCourseInfo(id);
        return R.ok().data("publishCourse",coursePublishVo);
    }

    /**
     * 课程最终发布
     * 修改课程状态
     * @param id 课程Id
     * @return
     */
    @PostMapping("publishCourse/{id}")
    public R publishCourse(@PathVariable String id) {
        EduCourse eduCourse = new EduCourse();
        eduCourse.setId(id);
        eduCourse.setStatus("Normal");//设置课程发布状态
        courseService.updateById(eduCourse);
        return R.ok();
    }

    /**
     * 删除课程
     * @param courseId 课程Id
     * @return
     */
    @DeleteMapping("{courseId}")
    public R deleteCourse(@PathVariable String courseId) {
        courseService.removeCourse(courseId);
        return R.ok();
    }

}

