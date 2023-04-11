import request from '@/utils/request'

export default{
    //根据邮箱发送短信
    getPhone(phone){
        return request({
            url: `/edumsm/msm/send/${phone}`,
            method: 'get'
            })
    },
    //用户注册
    register(formItem){
        return request({
            url: `/educenter/member/register`,
            method: 'post',
            data: formItem
        })
    }

}