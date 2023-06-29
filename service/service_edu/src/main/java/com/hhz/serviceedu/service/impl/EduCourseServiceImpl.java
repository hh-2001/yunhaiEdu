package com.hhz.serviceedu.service.impl;

import com.hhz.base.exceptionhandler.EduException;
import com.hhz.serviceedu.entity.EduCourse;
import com.hhz.serviceedu.entity.EduCourseCollect;
import com.hhz.serviceedu.entity.EduCourseDescription;
import com.hhz.serviceedu.entity.EduTeacher;
import com.hhz.serviceedu.entity.chapter.ChapterVo;
import com.hhz.serviceedu.entity.es.EsCourseInfo;
import com.hhz.serviceedu.entity.frontvo.CourseCollectVo;
import com.hhz.serviceedu.entity.frontvo.CourseFrontVo;
import com.hhz.serviceedu.entity.frontvo.CourseWebVo;
import com.hhz.serviceedu.entity.vo.CourseInfoVo;
import com.hhz.serviceedu.entity.vo.CoursePublishVo;
import com.hhz.serviceedu.mapper.EduCourseMapper;
import com.hhz.serviceedu.service.*;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * <p>
 * 课程 服务实现类
 * </p>
 *
 * @author hhz
 * @since 2023-02-09
 */
@Service
public class EduCourseServiceImpl extends ServiceImpl<EduCourseMapper, EduCourse> implements EduCourseService {

    //课程描述注入
    @Autowired
    private EduCourseDescriptionService courseDescriptionService;

    //视频内容
    @Autowired
    private EduVideoService eduVideoService;

    @Autowired
    private EduCourseCollectService eduCourseCollectService;

    //注入小节和章节service
    @Autowired
    private EduChapterService chapterService;

    @Autowired
    private EduTeacherService eduTeacherService;

    //添加课程基本信息的方法
    @Override
    public String saveCourseInfo(CourseInfoVo courseInfoVo) {
        //1 向课程表添加课程基本信息
        //CourseInfoVo对象转换eduCourse对象
        EduCourse eduCourse = new EduCourse();
        BeanUtils.copyProperties(courseInfoVo,eduCourse);
        int insert = baseMapper.insert(eduCourse);
        if(insert == 0) {
            //添加失败
            throw new EduException(20001,"添加课程信息失败");
        }
        //获取添加之后课程id
        String cid = eduCourse.getId();

        //2 向课程简介表添加课程简介
        //edu_course_description
        EduCourseDescription courseDescription = new EduCourseDescription();
        courseDescription.setDescription(courseInfoVo.getDescription());
        //设置描述id就是课程id
        courseDescription.setId(cid);
        courseDescriptionService.save(courseDescription);

        return cid;
    }

    //根据课程id查询课程基本信息
    @Override
    public CourseInfoVo getCourseInfo(String courseId) {
        //1 查询课程表
        EduCourse eduCourse = baseMapper.selectById(courseId);
        CourseInfoVo courseInfoVo = new CourseInfoVo();
        BeanUtils.copyProperties(eduCourse,courseInfoVo);

        //2 查询描述表
        EduCourseDescription courseDescription = courseDescriptionService.getById(courseId);
        if (Objects.nonNull(courseDescription)) {
            courseInfoVo.setDescription(courseDescription.getDescription());
        }
        return courseInfoVo;
    }

    //修改课程信息
    @Override
    public void updateCourseInfo(CourseInfoVo courseInfoVo) {
        //1 修改课程表
        EduCourse eduCourse = new EduCourse();
        BeanUtils.copyProperties(courseInfoVo,eduCourse);
        int update = baseMapper.updateById(eduCourse);
        if(update == 0) {
            throw new EduException(20001,"修改课程信息失败");
        }

        //2 修改描述表
        EduCourseDescription description = new EduCourseDescription();
        description.setId(courseInfoVo.getId());
        description.setDescription(courseInfoVo.getDescription());
        if (Objects.isNull(courseDescriptionService.getById(courseInfoVo.getId()))){
            courseDescriptionService.save(description);
        }else {
            courseDescriptionService.updateById(description);
        }
    }

    //根据课程id查询课程确认信息
    @Override
    public CoursePublishVo publishCourseInfo(String id) {
        //调用mapper内自定义方法
        return baseMapper.getPublishCourseInfo(id);
    }

    //删除课程
    @Override
    public void removeCourse(String courseId) {
        //1 根据课程id删除小节
        eduVideoService.removeVideoByCourseId(courseId);

        //2 根据课程id删除章节
        chapterService.removeChapterByCourseId(courseId);

        //3 根据课程id删除描述
        courseDescriptionService.removeById(courseId);

        //4 根据课程id删除课程本身
        int result = baseMapper.deleteById(courseId);
        if(result == 0) { //失败返回
            throw new EduException(20001,"删除失败");
        }
    }

    //1 条件查询带分页查询课程
    @Override
    public Map<String, Object> getCourseFrontList(Page<EduCourse> pageParam, CourseFrontVo courseFrontVo) {
        //2 根据讲师id查询所讲课程
        QueryWrapper<EduCourse> wrapper = new QueryWrapper<>();
        if (Objects.nonNull(courseFrontVo)){
            //判断条件值是否为空，不为空拼接
            if(!StringUtils.isEmpty(courseFrontVo.getSubjectParentId())) { //一级分类
                wrapper.eq("subject_parent_id",courseFrontVo.getSubjectParentId());
            }
            if(!StringUtils.isEmpty(courseFrontVo.getSubjectId())) { //二级分类
                wrapper.eq("subject_id",courseFrontVo.getSubjectId());
            }
            if(!StringUtils.isEmpty(courseFrontVo.getBuyCountSort())) { //关注度
                wrapper.orderByDesc("buy_count");
            }
            if (!StringUtils.isEmpty(courseFrontVo.getGmtCreateSort())) { //最新
                wrapper.orderByDesc("gmt_create");
            }

            if (!StringUtils.isEmpty(courseFrontVo.getPriceSort())) {//价格
                wrapper.orderByDesc("price");
            }
        }
        wrapper.eq("status", "Normal");
        baseMapper.selectPage(pageParam,wrapper);

        List<EduCourse> records = pageParam.getRecords();
        long current = pageParam.getCurrent();
        long pages = pageParam.getPages();
        long size = pageParam.getSize();
        long total = pageParam.getTotal();
        boolean hasNext = pageParam.hasNext();//下一页
        boolean hasPrevious = pageParam.hasPrevious();//上一页

        //把分页数据获取出来，放到map集合
        Map<String, Object> map = new HashMap<>();
        map.put("items", records);
        map.put("current", current);
        map.put("pages", pages);
        map.put("size", size);
        map.put("total", total);
        map.put("hasNext", hasNext);
        map.put("hasPrevious", hasPrevious);

        //map返回
        return map;
    }

    @Override
    public List<EsCourseInfo> getCourseFrontListByTeacher(Page<EduCourse> pageCourse) {
        List<EsCourseInfo> list = new ArrayList<>();
        QueryWrapper<EduCourse> wrapper = new QueryWrapper<>();
        wrapper.eq("status", "Normal");

        baseMapper.selectPage(pageCourse,wrapper);
        List<EduCourse> records = pageCourse.getRecords();
        for (EduCourse record : records) {
            EsCourseInfo esCourseInfo = new EsCourseInfo();
            EduTeacher teacher = eduTeacherService.getById(record.getOwnerId());
            esCourseInfo.setTeacherName(teacher.getName());
            esCourseInfo.setIntro(teacher.getIntro());
            esCourseInfo.setAvatar(teacher.getAvatar());
            esCourseInfo.setId(record.getId());
            esCourseInfo.setPrice(record.getPrice());
            esCourseInfo.setCover(record.getCover());
            esCourseInfo.setTitle(record.getTitle());
            list.add(esCourseInfo);
        }
        return list;
    }

    //根据课程id，编写sql语句查询课程信息
    @Override
    public CourseWebVo getBaseCourseInfo(String courseId) {
        return baseMapper.getBaseCourseInfo(courseId);
    }

    @Override
    public Boolean saveCollect(EduCourseCollect courseCollect) {
        if (StringUtils.isBlank(courseCollect.getMemberId()) || StringUtils.isEmpty(courseCollect.getMemberId())){
            throw new EduException(20002,"还没进行登录");
        }
        return eduCourseCollectService.save(courseCollect);
    }

    @Override
    public Boolean deleteCollect(EduCourseCollect courseCollect){
        return baseMapper.deleteCollect(courseCollect) > 0;
    }

    @Override
    public List<CourseCollectVo> getCourseCollect(String memberId) {

        ArrayList<CourseCollectVo> list = new ArrayList<>();

        List<EduCourseCollect> collect = baseMapper.getCourseCollect(memberId);
        for (EduCourseCollect courseCollect : collect) {
            EduCourse eduCourse = baseMapper.selectById(courseCollect.getCourseId());
            EduTeacher teacher = eduTeacherService.getById(eduCourse.getOwnerId());
            CourseCollectVo collectVo = new CourseCollectVo(courseCollect, eduCourse, teacher);
            list.add(collectVo);
        }
        return list;
    }

    @Override
    public boolean isOkPublic(String id) {
        EduCourse eduCourse = baseMapper.selectById(id);
        if(StringUtils.isBlank(eduCourse.getOwnerId()) || StringUtils.isEmpty(eduCourse.getOwnerId())){
            throw new EduException(20001, "还没有设置所属人");
        }
        List<ChapterVo> list = chapterService.getChapterVideoByCourseId(id);
        if (list.size() <= 0){
            throw new EduException(20001,"还没设置章节内容");
        }
        return true;
    }

    @Override
    public boolean checkCollect(String courseId, String memberId) {
        EduCourseCollect courseCollect = baseMapper.getCollectByCourse(courseId,memberId);
        if(Objects.isNull(courseCollect)){
            return false;
        }
        return true;
    }

}
