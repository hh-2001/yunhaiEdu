import request from '@/utils/request'

export default{
    //前台多条件分页查询
    getConditionPage(page,limit,searchObj){
        return request({
            url: `/eduservice/coursefront/getConditionPage/${page}/${limit}`,
            method: 'post',
            data: searchObj
        })
    },
    //查询所有分类（一级分类、二级分类）的方法
    getAllSubject(){
        return request({
            url: `/eduservice/subject/getAllSubject`,
            method: 'get'
        })
    },
    //根据课程id，查询课程详细信息
    getFrontCourseInfo(courseId){
        return request({
            url: `/eduservice/coursefront/getFrontCourseInfo/${courseId}`,
            method: 'get'
        })
    },
    //收藏课程
    saveCollect(courseId){
        return request({
            url: `eduservice/coursefront/saveCollect/${courseId}`,
            method: 'get'
        })
    },
	//分页课程查询
	getPageList(page, limit){
	    return request({
	        url:`/eduservice/coursefront/getPageList/${page}/${limit}`,
	        method: 'get'
	    })
	}
}
