package com.hhz.serviceedu.service.impl;

import com.alibaba.fastjson.JSON;
import com.hhz.serviceedu.entity.EduCourse;
import com.hhz.serviceedu.entity.EduTeacher;
import com.hhz.serviceedu.entity.es.EsCourseInfo;
import com.hhz.serviceedu.service.EduCourseService;
import com.hhz.serviceedu.service.EduTeacherService;
import com.hhz.serviceedu.service.SearchService;
import org.elasticsearch.action.bulk.BulkRequest;
import org.elasticsearch.action.bulk.BulkResponse;
import org.elasticsearch.action.index.IndexRequest;
import org.elasticsearch.action.search.SearchRequest;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.common.unit.TimeValue;
import org.elasticsearch.common.xcontent.XContentType;
import org.elasticsearch.index.query.*;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.builder.SearchSourceBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * @author: hhz
 * @Date: 2023/4/26
 * @Time: 10:59
 * @Description:
 */
@Service
public class SearchServiceImpl implements SearchService {

    @Autowired
    private RestHighLevelClient restHighLevelClient;

    @Autowired
    private EduTeacherService eduTeacherService;

    @Autowired
    private EduCourseService eduCourseService;

    @Override
    public Boolean makeData(String keyWord) throws Exception {

        BulkRequest bulkRequest = new BulkRequest();

        if (keyWord.equals("teacher")){
            List<EduTeacher> list = eduTeacherService.list(null);

            for (int i = 0; i < list.size(); i++) {
                System.out.println(JSON.toJSONString(list.get(i)));
                bulkRequest.add(new IndexRequest("teacher_list").source(JSON.toJSONString(list.get(i)), XContentType.JSON));
            }

            BulkResponse bulk = restHighLevelClient.bulk(bulkRequest, RequestOptions.DEFAULT);
            return !bulk.hasFailures();
        }else if(keyWord.equals("course")){
            List<EduCourse> list = eduCourseService.list(null);
            List<EsCourseInfo> list1 = new ArrayList<>();

            for (EduCourse eduCourse : list) {
                EduTeacher teacher = eduTeacherService.getById(eduCourse.getTeacherId());
                EsCourseInfo esCourseInfo = new EsCourseInfo();
                esCourseInfo.setCover(eduCourse.getCover());
                esCourseInfo.setId(eduCourse.getId());
                esCourseInfo.setTitle(eduCourse.getTitle());
                esCourseInfo.setIntro(teacher.getIntro());
                esCourseInfo.setTeacherName(teacher.getName());
                esCourseInfo.setPrice(eduCourse.getPrice());
                list1.add(esCourseInfo);
            }
            for (int i = 0; i < list1.size(); i++) {
                bulkRequest.add(new IndexRequest("course_list").source(JSON.toJSONString(list1.get(i)), XContentType.JSON));
            }

            BulkResponse bulk = restHighLevelClient.bulk(bulkRequest, RequestOptions.DEFAULT);
            return !bulk.hasFailures();
        }
        return false;
    }

    /**
     * 获取
     * @param keyWord
     * @param page
     * @param limit
     * @return
     * @throws Exception
     */
    @Override
    public List<Map<String,Object>> getEsCourse(String keyWord, Long page, Long limit) throws Exception {

        if(page <= 1L){
            page = 1L;
        }

        //搜索1
        SearchRequest searchRequest = new SearchRequest("course_list");
        SearchSourceBuilder sourceBuilder = new SearchSourceBuilder();
        //分页
//        sourceBuilder.from(page.intValue());
//        sourceBuilder.size(limit.intValue());

        //或查询
        BoolQueryBuilder boolQuery = QueryBuilders.boolQuery();
        QueryBuilder queryBuilder = QueryBuilders.matchQuery("title", keyWord);
        QueryBuilder queryBuilder1 = QueryBuilders.matchQuery("teacherName", keyWord);

        boolQuery.should(queryBuilder);
        boolQuery.should(queryBuilder1);

        sourceBuilder.query(boolQuery);
        searchRequest.source(sourceBuilder);
        SearchResponse searchResponse = restHighLevelClient.search(searchRequest, RequestOptions.DEFAULT);

        //解析结果
        List<Map<String,Object>> list = new ArrayList<>();
        for (SearchHit hit : searchResponse.getHits()) {
            list.add(hit.getSourceAsMap());
        }
        System.out.println(list.size());
        return list;
    }

    @Override
    public List<Map<String,Object>> getEsTeacher(String keyWord, Long page, Long limit) throws Exception {

        if(page <= 1L){
            page = 1L;
        }

        //搜索条件
        SearchRequest searchRequest = new SearchRequest("teacher_list");
        SearchSourceBuilder sourceBuilder = new SearchSourceBuilder();

        //分页
//        sourceBuilder.from(page.intValue());
//        sourceBuilder.size(limit.intValue());

        //精准搜索
        TermQueryBuilder termQuery = QueryBuilders.termQuery("name", keyWord);
        sourceBuilder.query(termQuery);
        sourceBuilder.timeout(new TimeValue(60, TimeUnit.SECONDS));

        //执行搜索
        searchRequest.source(sourceBuilder);
        SearchResponse searchResponse = restHighLevelClient.search(searchRequest, RequestOptions.DEFAULT);

        //解析结果
        List<Map<String,Object>> list = new ArrayList<>();
        for (SearchHit hit : searchResponse.getHits()) {
            list.add(hit.getSourceAsMap());
        }

        return list;
    }
}
