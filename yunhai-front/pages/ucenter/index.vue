<template>
  <div class="app-container">
    <el-row :gutter="20">
      <el-col :span="6" :xs="24" class="sync-height">
        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <span>个人信息</span>
          </div>

          <div>
            <div class="text-center">
              <avatar :ucenter="ucenter" />
            </div>
            <ul class="list-group">
              <li class="list-group-item">
                <svg-icon icon-class="user" />用户名称
                <div class="pull-right">{{ ucenter.nickname }}</div>
              </li>
              <li class="list-group-item">
                <svg-icon icon-class="phone" />手机号码
                <div class="pull-right">{{ ucenter.mobile }}</div>
              </li>
              <li class="list-group-item">
                <svg-icon icon-class="peoples" />年龄
                <div class="pull-right">{{ ucenter.age }}</div>
              </li>
              <li class="list-group-item">
                <svg-icon icon-class="date" />创建日期
                <div class="pull-right">{{ ucenter.gmtCreate }}</div>
              </li>
            </ul>
          </div>
        </el-card>
      </el-col>
      <el-col :span="18" :xs="24" class="sync-height">
        <el-card>
          <div slot="header" class="clearfix">
            <span>基本资料</span>
          </div>
          <el-tabs v-model="activeTab">
            <el-tab-pane label="基本资料" name="info">
              <info :ucenter="ucenter" />
            </el-tab-pane>
            <el-tab-pane label="修改密码" name="rePass">
              <rePass :ucenter="ucenter" />
            </el-tab-pane>
            <el-tab-pane label="课程收藏" name="collect">
              <collect :ucenter="ucenter" />
            </el-tab-pane>
            <el-tab-pane label="订单信息" name="orderDeatil">
              <orderDeatil :ucenter="ucenter" />
            </el-tab-pane>
            <el-tab-pane label="发布课程" name="publicCourse">
              <publicCourse :ucenter="ucenter" />
            </el-tab-pane>
          </el-tabs>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import ucenterApi from "@/api/ucenter";
import avatar from "./avatar.vue";
import rePass from "./rePass.vue";
import info from "./info.vue";
import collect from "./collect.vue";
import orderDeatil from "./orderDetail.vue";
import publicCourse from "./publicCourse.vue"

export default {
  name: "Profile",
  components: { avatar, rePass, info, collect, orderDeatil ,publicCourse },
  data() {
    return {
      ucenter: {},
      memberId: "",
      activeTab: "info"
    }
  },
  created() {
    this.getUser();
  },
  methods: {
    getUser() {
      ucenterApi.getUcenterInfo().then(response => {
        this.ucenter = response.data.data.item;
      });
    }
  }
};
</script>
<style scoped>
.app-container {
  margin: 5%;
}

.text-center {
  display: block;
  text-align: center;
}

.list-group {
  padding: 0;
  margin: 0;
  list-style: none;
}

.list-group ul {
  display: block;
  list-style-type: disc;
  margin-block-start: 1em;
  margin-block-end: 1em;
  margin-inline-start: 0px;
  margin-inline-end: 0px;
  padding-inline-start: 40px;
}

.list-group-item {
  border-bottom: 1px solid #e7eaec;
  border-top: 1px solid #e7eaec;
  margin-bottom: -1px;
  padding: 11px 0px;
  font-size: 13px;
}

.list-group li {
  display: list-item;
  text-align: -webkit-match-parent;
}

.pull-right {
  float: right !important;
}

.box-card {
  border-radius: 4px;
  border: 1px solid #e6ebf5;
  background-color: #FFFFFF;
  overflow: hidden;
  color: #303133;
  -webkit-transition: 0.3s;
  transition: 0.3s;
}
.sync-height {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}
</style>