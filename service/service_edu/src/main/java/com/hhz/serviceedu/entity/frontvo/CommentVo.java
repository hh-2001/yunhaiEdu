package com.hhz.serviceedu.entity.frontvo;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @author: hhz
 * @Date: 2023/3/7
 * @Time: 14:04
 * @Description: 评论实体类
 */
@Data
@TableName("edu_comment")
public class CommentVo {

    @ApiModelProperty(value = "评论id")
    private String id;

    @ApiModelProperty(value = "课程id")
    private String courseId;

    @ApiModelProperty(value = "讲师id")
    private String teacherId;

    @ApiModelProperty(value = "头像Url")
    private String avatar;

    @ApiModelProperty(value = "名称")
    private String nickname;

    @ApiModelProperty(value = "评论内容")
    private String content;

    @ApiModelProperty(value = "创建时间")
    @TableField(fill = FieldFill.INSERT)
    private String gmtCreate;

    @ApiModelProperty(value = "修改时间")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private String gmtModified;
}
