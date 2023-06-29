package com.hhz.serviceedu.entity.vo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

/**
 * @author: hhz
 * @Date: 2023/6/21
 * @Time: 9:58
 * @Description: 文章详情结果
 */
@Data
@NoArgsConstructor
@Accessors(chain = true)
public class ArticleInfoVo {
    @ApiModelProperty(value = "文章id")
    @TableId(value = "article_id", type = IdType.ID_WORKER_STR)
    private String articleId;

    @ApiModelProperty(value = "文章类型")
    private String articleType;

    @ApiModelProperty(value = "文章标题")
    private String articleName;

    @ApiModelProperty(value = "文章图")
    private String cover;

    @ApiModelProperty(value = "文章内容")
    private String articleDescription;

    @ApiModelProperty(value = "创建人")
    private String createName;

    @ApiModelProperty(value = "创建人ID")
    private String createId;

    @ApiModelProperty(value = "文章纲要")
    private String description;
}
