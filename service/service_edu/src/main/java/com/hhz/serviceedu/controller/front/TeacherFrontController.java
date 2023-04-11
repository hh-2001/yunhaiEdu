package com.hhz.serviceedu.controller.front;

import com.hhz.commonutils.R;
import com.hhz.serviceedu.entity.EduCourse;
import com.hhz.serviceedu.entity.EduLevel;
import com.hhz.serviceedu.entity.EduTeacher;
import com.hhz.serviceedu.service.EduCourseService;
import com.hhz.serviceedu.service.EduLevelService;
import com.hhz.serviceedu.service.EduTeacherService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/eduservice/teacherfront")
public class TeacherFrontController {

    @Autowired
    private EduTeacherService teacherService;

    @Autowired
    private EduCourseService courseService;

    @Autowired
    private EduLevelService levelService;

    //1 分页查询讲师的方法
    @GetMapping("getTeacherFrontList/{page}/{limit}")
    public R getTeacherFrontList(@PathVariable long page, @PathVariable long limit) {
        Page<EduTeacher> pageTeacher = new Page<>(page, limit);
        Map<String, Object> map = teacherService.getTeacherFrontList(pageTeacher);
        //返回分页所有数据
        return R.ok().data(map);
    }

    //2 讲师详情的功能
    @GetMapping("getTeacherFrontInfo/{teacherId}")
    public R getTeacherFrontInfo(@PathVariable String teacherId) {
        //1 根据讲师id查询讲师基本信息
        EduTeacher eduTeacher = teacherService.getById(teacherId);
        //2 根据讲师id查询所讲课程
        QueryWrapper<EduCourse> wrapper = new QueryWrapper<>();
        wrapper.eq("teacher_id", teacherId);
        List<EduCourse> courseList = courseService.list(wrapper);
        return R.ok().data("item", eduTeacher).data("items", courseList);
    }

    //2 讲师分类
    @GetMapping("getTeacherFrontType/{page}/{limit}")
    public R getTeacherFrontType(@PathVariable long page, @PathVariable long limit) {
        List<EduLevel> list = levelService.list(null);
        return R.ok().data("items", list);
    }
}












