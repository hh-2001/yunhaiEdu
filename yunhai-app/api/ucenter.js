import request from '@/utils/request'
import upload from '@/utils/upload'


export default {
	//根据ID查询个人信息
	getUcenterInfo() {
		return request({
			url: `/educenter/member/getMemberInfo`,
			method: 'get'
		})
	},
	//获取个人收藏的课程
	getCourseCollect() {
		return request({
			url: `eduservice/coursefront/getCourseCollect`,
			method: 'get'
		})
	},
	//更新个人信息
	updateUcenterInfo(ucenter, opas) {
		return request({
			url: `/educenter/member/${opas}`,
			method: 'put',
			data: ucenter,
		})
	},
	//获取订单信息
	getOrderInfo(page, limit) {
		return request({
			url: `/eduorder/order/getOrderInfoByMember/${page}/${limit}`,
			method: 'get'
		})
	},
	// 用户头像上传
	uploadAvatar(data) {
	  return upload({
	    url: '/eduoss/fileoss/upload',
	  })
	},
	// 用户头像上传
	uploadAvatarBase(data) {
	  return upload({
	    url: '/eduoss/fileoss/uploadBase',
	  })
	}
}