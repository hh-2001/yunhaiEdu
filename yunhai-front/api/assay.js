import request from '@/utils/request'

export default{
    //分页文章查询
    getPageList(page, limit){
        return request({
            url:`/eduservice/teacherfront/getTeacherFrontList/${page}/${limit}`,
            method: 'get'
        })
    },
    //根据ID查询文章详情页
    getTeacherInfoByid(id){
        return request({
            url: `/eduservice/teacherfront/getTeacherInfo/${id}`,
            method: `get`
        })
    },
}
