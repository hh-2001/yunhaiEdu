import request from '@/utils/request' //引入已经封装好的axios 和 拦截器

const api_name = '/eduorder/order'

export default {
    //获取订单信息
    getPageList(page, limit, searchObj) {
        return request({
            url: `${api_name}/${page}/${limit}`,
            method: 'get',
            params: searchObj // url查询字符串或表单键值对
        })
    },
}