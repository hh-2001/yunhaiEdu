import request from '@/utils/request'

// 登录方法
export function login(mobile, password, code, uuid) {
  const data = {
    mobile,
    password,
  }
  return request({
    'url': '/educenter/member/login',
    headers: {
      isToken: false
    },
    'method': 'post',
    'data': data
  })
}

// 获取用户详细信息
export function getInfo() {
  return request({
    'url': '/educenter/member/getMemberInfo',
    'method': 'get'
  })
}

// 退出方法(暂不使用，后台没有保存用户信息到redis)
export function logout() {
  return request({
    'url': '/logout',
    'method': 'post'
  })
}

// 获取验证码
export function getCodeImg() {
  return request({
    'url': '/captchaImage',
    headers: {
      isToken: false
    },
    method: 'get',
    timeout: 20000
  })
}
