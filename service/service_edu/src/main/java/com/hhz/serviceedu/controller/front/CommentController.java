package com.hhz.serviceedu.controller.front;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hhz.commonutils.R;
import com.hhz.serviceedu.entity.EduTeacher;
import com.hhz.serviceedu.entity.frontvo.CommentVo;
import com.hhz.serviceedu.service.EduCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.websocket.server.PathParam;
import java.util.Map;

/**
 * @author: hhz
 * @Date: 2023/3/7
 * @Time: 13:58
 * @Description:
 */
@RestController
@RequestMapping("/eduservice/comment")
public class CommentController {

    @Autowired
    private EduCommentService commentService;

    @GetMapping("getCommentPage/{page}/{limit}/{courseId}")
    public R getCommentPage(@PathVariable long page, @PathVariable long limit, @PathVariable String courseId) {
        Page<CommentVo> pageComment = new Page<>(page,limit);
        Map<String, Object> map = commentService.getCommentPage(pageComment, courseId);
        //返回分页所有数据
        return R.ok().data(map);
    }

    @PostMapping("auth/addComment")
    public R addComment(@RequestBody CommentVo commentVo){
        boolean save = commentService.save(commentVo);
        if (save) {
            return R.ok();
        } else {
            return R.error();
        }
    }
}
