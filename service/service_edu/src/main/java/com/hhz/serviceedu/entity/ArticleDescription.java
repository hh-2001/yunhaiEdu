package com.hhz.serviceedu.entity;

import com.baomidou.mybatisplus.annotation.*;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.util.Date;

/**
 * @author: hhz
 * @Date: 2023/6/21
 * @Time: 10:01
 * @Description: 文章内容
 */
@Data
@Accessors(chain = true)
@TableName("edu_article_description")
@ApiModel(value="Article文章内容对象", description="")
public class ArticleDescription {
    @ApiModelProperty(value = "文章内容ID")
    @TableId(value = "id", type = IdType.INPUT)
    private String id;

    @ApiModelProperty(value = "文章Id")
    private String articleId;

    @ApiModelProperty(value = "文章内容")
    private String articleDescription;

    @ApiModelProperty(value = "创建时间")
    @TableField(fill = FieldFill.INSERT)
    private Date gmtCreate;

    @ApiModelProperty(value = "更新时间")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Date gmtModified;
}
