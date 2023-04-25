package com.hhz.serviceedu.controller.front;

import com.hhz.base.RedisConfig;
import com.hhz.base.RedisService;
import com.hhz.commonutils.R;
import com.hhz.serviceedu.entity.EduCourse;
import com.hhz.serviceedu.entity.EduTeacher;
import com.hhz.serviceedu.service.EduCourseService;
import com.hhz.serviceedu.service.EduTeacherService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/eduservice/indexFront")
public class IndexFrontController {

    @Autowired
    private EduCourseService courseService;

    @Autowired
    private EduTeacherService teacherService;

    @Autowired
    private RedisService redisService;

    //查询前8条热门课程，查询前4条名师
    @GetMapping("index")
    public R index() {
        Map<String, Object> indexHot = redisService.getCacheMap("indexHot");

        if (indexHot.size() < 1){
            //查询前8条热门课程
            QueryWrapper<EduCourse> wrapper = new QueryWrapper<>();
            wrapper.orderByDesc("id");
            wrapper.last("limit 8");
            List<EduCourse> courseList = courseService.list(wrapper);

            //查询前4条名师
            QueryWrapper<EduTeacher> wrapperTeacher = new QueryWrapper<>();
            wrapperTeacher.orderByDesc("id");
            wrapperTeacher.last("limit 4");
            List<EduTeacher> teacherList = teacherService.list(wrapperTeacher);
            HashMap<String, Object> map = new HashMap<>();
            map.put("courseList",courseList);
            map.put("teacherList",teacherList);
            redisService.setCacheMap("indexHot",map);
            return R.ok().data("courseList", courseList).data("teacherList",teacherList);
        }

        return R.ok().data("courseList",indexHot.get("courseList")).data("teacherList",indexHot.get("teacherList"));
    }

}
