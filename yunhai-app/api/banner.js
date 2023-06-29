import request from '@/utils/request'

//查询前两条banner数据
export function getListBanner(){
    return request({
        url: '/cmsservice/bannerFront/getAllBanner/',
        method: 'get'
    })
}
