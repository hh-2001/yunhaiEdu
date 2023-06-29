import request from '@/utils/request'

export default {
    //前台多条件分页查询
    getConditionPage(page, limit, searchObj) {
        return request({
            url: `/eduservice/coursefront/getConditionPage/${page}/${limit}`,
            method: 'post',
            data: searchObj
        })
    },
    //查询所有分类（一级分类、二级分类）的方法
    getAllSubject() {
        return request({
            url: `/eduservice/subject/getAllSubject`,
            method: 'get'
        })
    },
    //根据课程id，查询课程详细信息
    getFrontCourseInfo(courseId) {
        return request({
            url: `/eduservice/coursefront/getFrontCourseInfo/${courseId}`,
            method: 'get'
        })
    },
    //收藏课程
    saveCollect(courseId) {
        return request({
            url: `eduservice/coursefront/saveCollect/${courseId}`,
            method: 'get'
        })
    },
    //收藏课程
    cancelCollect(courseId) {
        return request({
            url: `eduservice/coursefront/deleteCollect/${courseId}`,
            method: 'get'
        })
    },
    // 发布课程
    //添加课程信息功能
    addCourseInfo(courseInfo) {
        return request({
            url: "/eduservice/course/addCourseInfo",
            method: 'post',
            data: courseInfo,
        })
    },
    //根据课程id 查询课程基本信息
    getCourseInfoById(courseId) {
        return request({
            url: `/eduservice/course/getCourseInfo/${courseId}`,
            method: 'get',
        })
    },
    //修改课程信息
    updateCourseInfo(courseInfoForm) {
        return request({
            url: "/eduservice/course/updateCourseInfo",
            method: 'post',
            data: courseInfoForm,
        })
    },
    //课程确认信息显示
    getPublishCourseInfo(courseId) {
        return request({
            url: "/eduservice/course/getPublishCourseInfo/" + courseId,
            method: 'get',
        })
    },
}
