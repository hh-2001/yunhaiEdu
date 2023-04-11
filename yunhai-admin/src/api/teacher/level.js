import request from '@/utils/request' //引入已经封装好的axios 和 拦截器

export default {
    //1、类别列表（多条件分页查询）
    //page：当前页，limit：每页记录数，teacherQuery：条件对象
    getlevelListPage(page,limit,levelQuery){
        return request({
            url: `/eduservice/level/pageLevelCondition/${page}/${limit}`,
            method: 'post',
            //teacherQuery条件对象，如果后端使用RequestBody获取数据
            //data表示把对象转换成json对象进行传递到接口里
            data: levelQuery
          })
    },
    //查询所有类别
    getlevel(id) {
        return request({
            url: `/eduservice/level/${id}`,
            method: 'get'
        })
    },
    //添加教师类别
    addlevel(level) {
        return request({
            url: "/eduservice/level/addLevel",
            method: 'post',
            data: level
        })
    },
    //添加教师类别
    updatelevel(level) {
        return request({
            url: "/eduservice/level/updateLevel",
            method: 'put',
            data: level
        })
    },
    deletelevel(id){
        return request({
            url: `/eduservice/level/removeLevelById/${id}`,
            method: 'delete',
        })
    }
}