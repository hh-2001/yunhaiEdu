package com.hhz.canalclient.entity.es;

import lombok.Data;
import lombok.experimental.Accessors;

import java.math.BigDecimal;

/**
 * @author: hhz
 * @Date: 2023/4/25
 * @Time: 14:17
 * @Description:
 */
@Data
@Accessors(chain = true)
public class EsCourseInfo {

    private String id;

    private String title;

    private String cover;

    private String teacherName;

    private String intro;

    private BigDecimal price;
}
