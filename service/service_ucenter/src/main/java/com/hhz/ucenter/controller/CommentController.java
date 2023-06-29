package com.hhz.ucenter.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hhz.commonutils.JwtUtils;
import com.hhz.commonutils.R;
import com.hhz.commonutils.StringUtils;
import com.hhz.ucenter.entity.UcenterMember;
import com.hhz.ucenter.entity.vo.CommentVo;
import com.hhz.ucenter.service.EduCommentService;
import com.hhz.ucenter.service.UcenterMemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * @author: hhz
 * @Date: 2023/3/7
 * @Time: 13:58
 * @Description:
 */
@RestController
@RequestMapping("/educenter/comment")
public class CommentController {

    @Autowired
    private EduCommentService commentService;

    @Autowired
    private UcenterMemberService ucenterMemberService;

    @GetMapping("getCommentPage/{page}/{limit}/{courseId}")
    public R getCommentPage(@PathVariable long page, @PathVariable long limit, @PathVariable String courseId) {
        Page<CommentVo> pageComment = new Page<>(page,limit);
        Map<String, Object> map = commentService.getCommentPage(pageComment, courseId);
        //返回分页所有数据
        return R.ok().data(map);
    }

    @PostMapping("auth/addComment")
    public R addComment(@RequestBody CommentVo commentVo, HttpServletRequest request){
        String memberId = JwtUtils.getMemberIdByJwtToken(request);
        if (StringUtils.isNotEmpty(memberId) || StringUtils.isNotNull(memberId)){
            UcenterMember ucenterMember = ucenterMemberService.getById(memberId);
            commentVo.setAvatar(ucenterMember.getAvatar());
            commentVo.setNickname(ucenterMember.getNickname());
            commentVo.setMemberId(memberId);
        }
        boolean save = commentService.save(commentVo);
        if (save) {
            return R.ok();
        } else {
            return R.error();
        }
    }
}
