<template>
  <div class="app-container">
    <el-row :gutter="20">
      <el-col :span="6" :xs="24">
        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <span>个人信息</span>
          </div>

          <div>
            <div class="text-center">
              <avatar :user="user" />
            </div>
            <ul class="list-group">
              <li class="list-group-item">
                <svg-icon icon-class="user" />用户名称
                <div class="pull-right">{{ user.username }}</div>
              </li>
              <li class="list-group-item">
                <svg-icon icon-class="telephone" />手机号码
                <div class="pull-right">{{ user.mobile }}</div>
              </li>
              <li class="list-group-item">
                <svg-icon icon-class="sign" />个性签名
                <div class="pull-right">{{ user.sign }}</div>
              </li>
              <li class="list-group-item">
                <svg-icon icon-class="date" />创建日期
                <div class="pull-right">{{ user.gmtCreate }}</div>
              </li>
            </ul>
          </div>
        </el-card>
      </el-col>
      <el-col :span="18" :xs="24">
        <el-card>
          <div slot="header" class="clearfix">
            <span>基本资料</span>
          </div>
          <el-tabs v-model="activeTab">
            <el-tab-pane label="基本资料" name="info">
              <info :user="user" />
            </el-tab-pane>
            <el-tab-pane label="修改密码" name="rePass">
              <rePass :user="user" />
            </el-tab-pane>
          </el-tabs>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import {getInfo} from "@/api/login.js";
import avatar from "./avatar.vue";
import rePass from "./rePass.vue";
import info from "./info.vue"

export default {
  name: "user",
  components: { avatar, rePass, info },
  data() {
    return {
      user: {},
      id: "",
      activeTab: "info"
    }
  },
  created() {
    this.getUser();
  },
  methods: {
    getUser() {
      getInfo().then(response => {
        this.user = response.data.item;
        console.log(this.user)
      });
    }
  }
};
</script>
<style scoped>
.text-center {
  display: block;
  text-align: center;
}
.list-group {
  padding: 0;
  margin: 0;
  display: block;
  list-style-type: none;
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
</style>