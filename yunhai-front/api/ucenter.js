import request from '@/utils/request'

export default{
    //根据ID查询个人信息
    getUcenterInfo(){
        return request({
            url: `/educenter/member/getMemberInfo`,
            method: 'get'
        })
    },
    //获取个人收藏的课程
    getCourseCollect(){
        return request({
            url: `eduservice/coursefront/getCourseCollect`,
            method: 'get'
        })
    },
    //更新个人信息
    updateUcenterInfo(ucenter, opas){
        return request({
            url: `/educenter/member/${opas}`,
            method: 'put',
            data: ucenter,
        })
    },
    //获取订单信息
    getOrderInfo(page,limit){
        return request({
            url:`/eduorder/order/getOrderInfoByMember/${page}/${limit}`,
            method: 'get'
        })
    }
}
