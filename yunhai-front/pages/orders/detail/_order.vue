<template>
    <div class="Title">
        <span><i></i>返回</span>
      <h1 class="fl f18">订单详情</h1>
      <div class="clear"></div>
      <table class="GoodList">
        <tbody>
          <tr>
            <th class="name">商品</th>
            <th class="price">原价</th>
            <th class="priceNew">价格</th>
          </tr>
        </tbody>
        <tbody>
          <!-- <tr>
  <td colspan="3" class="Title red f18 fb"><p>限时折扣</p></td>
  </tr> -->
          <tr>
            <td colspan="3" class="teacher">讲师：{{ order.teacherName }}</td>
          </tr>
          <tr class="good">
            <td class="name First">
              <a target="_blank" :href="'https://localhost:3000/course/' + order.courseId">
                <img :src="order.courseCover" /></a>
              <div class="goodInfo">
                <input type="hidden" class="ids ids_14502" value="14502" />
                <a target="_blank" :href="'https://localhost:3000/course/' + order.courseId">{{ order.courseTitle }}</a>
              </div>
            </td>
            <td class="price">
              <p>
                ￥<strong>{{ order.totalFee }}</strong>
              </p>
              <!-- <span class="discName red">限时8折</span> -->
            </td>
            <td class="red priceNew Last">
              ￥<strong>{{ order.totalFee }}</strong>
            </td>
          </tr>
          <tr>
            <td class="Billing tr" colspan="3">
              <div class="tr">
                <p>
                  共 <strong class="red">1</strong> 件商品，合计<span class="red f20">￥<strong>{{ order.totalFee }}</strong></span>
                </p>
              </div>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </template>
  <script>
  import orderApi from '@/api/order'
  export default {
    created() {
      this.orderNo = this.$route.params.order
      this.getOrderInfoByOrderNo()
    },
    methods: {
      getOrderInfoByOrderNo() {
        orderApi.getOrderInfoByNo(this.orderNo).then(resp => {
          this.order = resp.data.data.item
        })
      }
    },
    data() {
      return {
        order: {},
        orderNo: '',
      }
    },
  }
  </script>
  