import request from '@/utils/request' //引入已经封装好的axios 和 拦截器
import { Level } from 'chalk'

export default{
    //1、讲师列表（多条件分页查询）
    //page：当前页，limit：每页记录数，teacherQuery：条件对象
    getTeacherListPage(page,limit,teacherQuery){
        return request({
            // url: '/eduservice/edu-teacher/pageTeacherCondition/'+page+'/'+limit,
            url: `/eduservice/teacher/pageTeacherCondition/${page}/${limit}`,
            method: 'post',
            //teacherQuery条件对象，如果后端使用RequestBody获取数据
            //data表示把对象转换成json对象进行传递到接口里
            data: teacherQuery
          })
    },
    //根据id删除讲师
    removeById(id){
        return request({
            url: `/eduservice/teacher/${id}`,
            method: 'delete',
        })
    },
    //新增讲师
    saveTeacher(teacher){
        return request({
            url: `/eduservice/teacher/addTeacher`,
            method: `post`,
            data: teacher
        })
    },
    //根据id查询讲师
    updateById(id){
        return request({
            url: `/eduservice/teacher/getTeacher/${id}`,
            method: `get`,
        })
    },
    //修改讲师信息
    updateTeacherInfo(teacher){
        return request({
            url: `/eduservice/teacher/updateTeacher`,
            method: `put`,
            data: teacher
        })
    },
    getLevel(page,limit,level){
        return request({
            url: `/eduservice/level/pageLevelCondition/${page}/${limit}`,
            method: `post`,
            data: level
        })
    }
}

