package com.hhz.serviceedu.entity;

import com.baomidou.mybatisplus.annotation.*;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

/**
 * @author: hhz
 * @Date: 2023/4/21
 * @Time: 9:16
 * @Description:
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("edu_article")
@ApiModel(value="Article文章标题对象", description="")
public class Article implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "文章id")
    @TableId(value = "article_id", type = IdType.ID_WORKER_STR)
    private String articleId;

    @ApiModelProperty(value = "文章类型")
    private String articleType;

    @ApiModelProperty(value = "文章标题")
    private String articleName;

    @ApiModelProperty(value = "创建人")
    private String createName;

    @ApiModelProperty(value = "创建人ID")
    private String createId;

    @ApiModelProperty(value = "文章纲要")
    private String description;

    @ApiModelProperty(value = "创建时间")
    @TableField(fill = FieldFill.INSERT)
    private Date gmtCreate;

    @ApiModelProperty(value = "更新时间")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Date gmtModified;


}
