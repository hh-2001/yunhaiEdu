import request from '@/utils/request'

//导出pdf
export default {
    exportArticlePdf(articleId) {
        // debugger
        return request({
            url: `/eduservice/article/export/${articleId}`,
            method: `post`
        })
    },
    getArticle(articleId){
        return request({
            url: `/eduservice/article/getArticle/${articleId}`,
            method: `get`
        })
    },
    //分页文章查询
    getPageList(page, limit) {
        return request({
            url: `/eduservice/article/${page}/${limit}`,
            method: 'get'
        })
    },
    //添加文章介绍
    addArticle(article) {
        return request({
            url: '/eduservice/article/addArticle',
            method: 'post',
            data: article
        })
    },
    //更新文章介绍
    updateArticle(article) {
        return request({
            url: '/eduservice/article/updateArticle',
            method: 'put',
            data: article
        })
    },
    //删除文章
    removeArticle(articleId) {
        return request({
            url: `/eduservice/article/removeArticle/${articleId}`,
            method: 'detele'
        })
    },

//根据ID查询文章详情页
getArticleInfoByid(id) {
    return request({
        url: `/eduservice/article/getArticleInfo/${id}`,
        method: `get`
    })
},
}