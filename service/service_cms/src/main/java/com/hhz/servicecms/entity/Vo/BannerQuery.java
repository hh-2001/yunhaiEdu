package com.hhz.servicecms.entity.Vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @author: hhz
 * @Date: 2023/3/6
 * @Time: 16:35
 * @Description:
 */
@Data
public class BannerQuery {

    @ApiModelProperty(value = "banner名称")
    private String name;

    @ApiModelProperty(value = "查询开始时间", example = "2019-01-01 10:10:10")
    private String begin;//注意，这里使用的是String类型，前端传过来的数据无需进行类型转换

    @ApiModelProperty(value = "查询结束时间", example = "2019-12-01 10:10:10")
    private String end;
}
