package com.hhz.serviceedu.service;

import com.hhz.serviceedu.entity.es.EsCourseInfo;

import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * @author: hhz
 * @Date: 2023/4/26
 * @Time: 10:58
 * @Description: es操作
 */
public interface SearchService {

    public List<Map<String, Object>> getEsCourse(String keyWord, Long page, Long limit) throws IOException, Exception;

    public List<Map<String, Object>> getEsTeacher(String keyWord, Long page, Long limit) throws IOException, Exception;

    Boolean makeData(String keyWord) throws Exception;
}
