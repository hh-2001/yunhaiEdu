<template>
  <view class="container">
    <uni-list>
      <uni-list-item showExtraIcon="true" :extraIcon="{type: 'person-filled'}" title="昵称" :rightText="user.nickname" />
      <uni-list-item showExtraIcon="true" :extraIcon="{type: 'phone-filled'}" title="手机号码" :rightText="user.mobile" />
	  <uni-list-item showExtraIcon="true" :extraIcon="{type: 'shop-filled'}" title="性别" :rightText="user.sex == 1 ? '男' : (user.sex == 2 ? '女':'') " />
      <uni-list-item showExtraIcon="true" :extraIcon="{type: 'email-filled'}" title="邮箱" :rightText="user.email" />
      <uni-list-item showExtraIcon="true" :extraIcon="{type: 'calendar-filled'}" title="创建日期" :rightText="user.gmtCreate" />
    </uni-list>
  </view>
</template>

<script>
  import ucenterApi from '@/api/ucenter.js'

  export default {
    data() {
      return {
        user: {
			sex:''
		},
      }
    },
    onLoad() {
      this.getUser()
    },
    methods: {
      getUser() {
        ucenterApi.getUcenterInfo().then(response => {
          this.user = response.data.item
        })
      }
    }
  }
</script>

<style lang="scss">
  page {
    background-color: #ffffff;
  }
</style>
