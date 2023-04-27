package com.hhz.serviceedu.controller.front;

import com.hhz.base.RedisConfig;
import com.hhz.base.RedisService;
import com.hhz.commonutils.R;
import com.hhz.serviceedu.entity.EduCourse;
import com.hhz.serviceedu.entity.EduTeacher;
import com.hhz.serviceedu.entity.es.EsCourseInfo;
import com.hhz.serviceedu.service.EduCourseService;
import com.hhz.serviceedu.service.EduTeacherService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.hhz.serviceedu.service.SearchService;
import org.elasticsearch.action.search.SearchRequest;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.builder.SearchSourceBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
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

    @Autowired
    private SearchService searchService;

    //查询前8条热门课程，查询前4条名师
    @GetMapping("index")
    public R index() {
        Map<String, Object> indexHot = redisService.getCacheMap("indexHot");

        if (indexHot.size() < 1) {
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
            map.put("courseList", courseList);
            map.put("teacherList", teacherList);
            redisService.setCacheMap("indexHot", map);
            return R.ok().data("courseList", courseList).data("teacherList", teacherList);
        }

        return R.ok().data("courseList", indexHot.get("courseList")).data("teacherList", indexHot.get("teacherList"));
    }

    /**
     * 大数据搜索
     *
     * @param keyword
     * @return
     * @throws IOException
     */
    @GetMapping("/search/{keyword}/{page}/{limit}")
    public R searchCourse(@PathVariable("keyword") String keyword,
                          @PathVariable("page") Long page,
                          @PathVariable("limit") Long limit) throws Exception {
        List<Map<String, Object>> esCourse = searchService.getEsCourse(keyword, page, limit);
        List<Map<String, Object>> esTeacher = searchService.getEsTeacher(keyword, page, limit);
        return R.ok().data("courseList", esCourse).data("teacherList", esTeacher);
    }


    /**
     * 构建数据进入es
     *
     * @param keyWord
     * @return
     * @throws Exception
     */
    @GetMapping("makeData/{keyWord}")
    public R makeData(@PathVariable("keyWord") String keyWord) throws Exception {
        if (searchService.makeData(keyWord)) {
            return R.ok();
        }
        return R.error();
    }
}
