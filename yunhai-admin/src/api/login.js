import request from '@/utils/request'

// 登录
export function login(user) {
 // debugger
  return request({
    url: '/admin/acl/login',
    method: 'post',
    data: user
  })
}

// 获取用户信息
export function getInfo(token) {
  return request({
    url: '/admin/acl/index/info',
    method: 'get',
    params: { token }
  })
}

// 更新用户信息
export function updateUserInfo(user,opas) {
  return request({
    url: `/admin/acl/index/updateInfo/${opas}`,
    method: 'put',
    data: user
  })
}


// 登出
export function logout() {
  //debugger
  return request({
    url: '/admin/acl/index/logout',
    method: 'post'
  })
}

// 获取菜单权限数据
export function getMenu() {
  return request({
    url: '/admin/acl/index/menu',
    method: 'get'
  })
}
// 获取验证码
export function getCodeImg() {
  return request({
    url: '/admin/acl/index/code',
    method: 'get',
    timeout: 20000
  })
}