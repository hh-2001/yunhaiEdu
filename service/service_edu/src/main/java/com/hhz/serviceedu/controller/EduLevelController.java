package com.hhz.serviceedu.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hhz.commonutils.R;
import com.hhz.serviceedu.entity.EduLevel;
import com.hhz.serviceedu.entity.vo.CourseQuery;
import com.hhz.serviceedu.service.EduLevelService;
import io.swagger.annotations.Api;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Objects;

/**
 * <p>
 * 课程 前端控制器
 * </p>
 *
 * @author hhz
 * @since 2023-02-09
 */
@Api(description = "教师类别")
@RestController
@RequestMapping("/eduservice/level")
//@CrossOrigin
public class EduLevelController {

    @Autowired
    private EduLevelService levelService;

    /**
     * 课程列表
     * @return
     */
    @GetMapping("/{id}")
    public R getLevel(@PathVariable("id") String id) {
        EduLevel level = levelService.getById(id);
        return R.ok().data("item", level);
    }

    /**
     * 教师类别分页查询
     * @param page
     * @param limit
     * @param courseQuery
     * @return
     */
    @PostMapping("pageLevelCondition/{page}/{limit}")
    public R pageLevelCondition(@PathVariable long page, @PathVariable long limit,
                                @RequestBody(required = false) CourseQuery courseQuery) {
        //创建page对象
        Page<EduLevel> LevelPage = new Page<>(page, limit);

        //构建条件
        QueryWrapper<EduLevel> wrapper = new QueryWrapper<>();
        if (Objects.nonNull(courseQuery)){
            // 多条件组合查询
            String name = courseQuery.getName();
            //判断条件值是否为空，如果不为空拼接条件
            if (!StringUtils.isEmpty(name)) {
                //构建条件
                wrapper.like("name", name);
            }

            //排序
            wrapper.orderByDesc("gmt_create");
        }

        //调用方法实现条件查询分页
        levelService.page(LevelPage, wrapper);

        long total = LevelPage.getTotal();//总记录数
        List<EduLevel> LevelList = LevelPage.getRecords(); //数据list集合
        return R.ok().data("total", total).data("items", LevelList);
    }

    /**
     * 添加教师类别基本信息的方法
     *
     * @param level 教师类别
     * @return
     */
    @PostMapping("addLevel")
    public R addLevel(@RequestBody EduLevel level) {
        levelService.save(level);
        return R.ok();
    }

    /**
     * 修改课程信息
     *
     * @param level 课程信息Vo
     * @return
     */
    @PutMapping("updateLevel")
    public R updateLevel(@RequestBody EduLevel level) {
        levelService.updateById(level);
        return R.ok();
    }

    /**
     * 删除课程
     *
     * @param id 课程Id
     * @return
     */
    @DeleteMapping("removeLevelById/{id}")
    public R deleteLevel(@PathVariable String id) {
        levelService.removeById(id);
        return R.ok();
    }

}

