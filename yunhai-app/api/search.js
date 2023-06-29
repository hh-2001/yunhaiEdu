import request from '@/utils/request'

export default {
    //根据邮箱发送短信
    searchWord(word, page, limit) {
        return request({
            url: `/eduservice/indexFront/search/${word}/${page}/${limit}`,
            method: 'get'
        })
    },
}