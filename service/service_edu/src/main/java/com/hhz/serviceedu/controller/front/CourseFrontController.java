package com.hhz.serviceedu.controller.front;

import com.hhz.commonutils.JwtUtils;
import com.hhz.commonutils.R;
import com.hhz.commonutils.ordervo.CourseWebVoOrder;
import com.hhz.serviceedu.client.OrdersClient;
import com.hhz.serviceedu.entity.EduCourse;
import com.hhz.serviceedu.entity.EduCourseCollect;
import com.hhz.serviceedu.entity.chapter.ChapterVo;
import com.hhz.serviceedu.entity.frontvo.CourseCollectVo;
import com.hhz.serviceedu.entity.frontvo.CourseFrontVo;
import com.hhz.serviceedu.entity.frontvo.CourseWebVo;
import com.hhz.serviceedu.service.EduChapterService;
import com.hhz.serviceedu.service.EduCourseService;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/eduservice/coursefront")
public class CourseFrontController {

    @Autowired
    private EduCourseService courseService;

    @Autowired
    private EduChapterService chapterService;

    @Autowired
    private OrdersClient ordersClient;

    //1 条件查询带分页查询课程
    @PostMapping("getConditionPage/{page}/{limit}")
    public R getFrontCourseList(@PathVariable long page, @PathVariable long limit,
                                @RequestBody(required = false) CourseFrontVo courseFrontVo) {
        Page<EduCourse> pageCourse = new Page<>(page,limit);;
        Map<String,Object> map = courseService.getCourseFrontList(pageCourse,courseFrontVo);
        return R.ok().data(map);
    }

    //2 课程详情的方法
    @GetMapping("getFrontCourseInfo/{courseId}")
    public R getFrontCourseInfo(@PathVariable String courseId, HttpServletRequest request) {
        //根据课程id，编写sql语句查询课程信息
        CourseWebVo courseWebVo = courseService.getBaseCourseInfo(courseId);
        //根据课程id查询章节和小节
        List<ChapterVo> chapterVideoList = chapterService.getChapterVideoByCourseId(courseId);
        //根据课程id和用户id查询当前课程是否已经支付过了
        boolean buyCourse = false;
        if (!StringUtils.isEmpty(JwtUtils.getMemberIdByJwtToken(request))){
            buyCourse = ordersClient.isBuyCourse(courseId, JwtUtils.getMemberIdByJwtToken(request));
        }
        return R.ok().data("item",courseWebVo).data("items",chapterVideoList).data("isBuy",buyCourse);
    }

    //根据课程id查询课程信息
    @PostMapping("getCourseInfoOrder/{id}")
    public CourseWebVoOrder getCourseInfoOrder(@PathVariable String id) {
        CourseWebVo courseInfo = courseService.getBaseCourseInfo(id);
        CourseWebVoOrder courseWebVoOrder = new CourseWebVoOrder();
        BeanUtils.copyProperties(courseInfo,courseWebVoOrder);
        return courseWebVoOrder;
    }

    //收藏课程
    @GetMapping("saveCollect/{courseId}")
    public R saveCollect(@PathVariable String courseId, HttpServletRequest request){
        String memberId = JwtUtils.getMemberIdByJwtToken(request);
        Boolean aBoolean = courseService.saveCollect(new EduCourseCollect(courseId,memberId));
        if (aBoolean){
            return R.ok();
        }
        return R.error();
    }

    @GetMapping("getCourseCollect")
    public R getCourseCollect(HttpServletRequest request){
        String memberId = JwtUtils.getMemberIdByJwtToken(request);

        List<CourseCollectVo> list = courseService.getCourseCollect(memberId);
        return R.ok().data("items", list);
    }
}












