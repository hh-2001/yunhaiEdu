package com.hhz.serviceedu.entity.frontvo;

import com.hhz.serviceedu.entity.EduCourse;
import com.hhz.serviceedu.entity.EduCourseCollect;
import com.hhz.serviceedu.entity.EduTeacher;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @author: hhz
 * @Date: 2023/4/19
 * @Time: 10:05
 * @Description: 收藏磕碜返回对象
 */
@Data
public class CourseCollectVo implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "课程名称")
    private String title;

    @ApiModelProperty(value = "讲师ID")
    private String teacherName;

    @ApiModelProperty(value = "讲师头衔")
    private String career;

    @ApiModelProperty(value = "课程ID")
    private String courseId;

    @ApiModelProperty(value = "课程状态")
    private String status;

    @ApiModelProperty(value = "版本")
    private Long version;

    @ApiModelProperty(value = "收藏时间")
    private Date gmtCreate;

    public CourseCollectVo(EduCourseCollect courseCollect, EduCourse course, EduTeacher teacher){
        this.title = course.getTitle();
        this.teacherName = teacher.getName();
        this.career = teacher.getCareer();
        this.courseId = courseCollect.getCourseId();
        this.gmtCreate = courseCollect.getGmtCreate();
        this.status = course.getStatus();
        this.version = course.getVersion();
    }
}
