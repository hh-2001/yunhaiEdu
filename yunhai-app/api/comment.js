import request from '@/utils/request'

export default {
    //获取评论
    getPageList(page, limit, courseId) {
        return request({
            url: `/educenter/comment/getCommentPage/${page}/${limit}/${courseId}`,
            method: 'get',
        })
    },
    //添加评论
    addComment(comment) {
        return request({
            url: `/educenter/comment/auth/addComment`,
            method: 'post',
            data: comment
        })
    }
}