package com.hhz.base.exceptionhandler;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author: hhz
 * @Date: 2023/2/9
 * @Time: 13:37
 * @Description:
 */
@Data
@AllArgsConstructor  //生成有参数构造方法
@NoArgsConstructor   //生成无参数构造
public class EduException extends RuntimeException{
    private Integer code;//状态码
    private String msg;//异常信息
}
