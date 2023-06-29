import request from '@/utils/request'

export default {
	//分页文章查询
	getPageList(page, limit) {
		return request({
			url: `/eduservice/article/${page}/${limit}`,
			method: 'get'
		})
	},
	//根据ID查询文章详情页
	getArticleInfoByid(id) {
		return request({
			url: `/eduservice/article/getArticleInfo/${id}`,
			method: `get`
		})
	},
	//根据ID查询文章详情页
	exportPdf(articleId) {
		return request({
			url: `/eduservice/article/export/${articleId}`,
			method: `post`
		})
	},
}