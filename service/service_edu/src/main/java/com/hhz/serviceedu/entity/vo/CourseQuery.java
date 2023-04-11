package com.hhz.serviceedu.entity.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class CourseQuery {

    @ApiModelProperty(value = "课程名称,模糊查询")
    private String name;

    @ApiModelProperty(value = "发布状态 Normal")
    private String status;
}
