<template>
  <div>
    <!--多条件查询表单-->
    <el-form :inline="true" class="demo-form-inline" style="margin-left: 20px; margin-top: 12px">
      <el-form-item label="名称">
        <el-input v-model="orderQuery.status" placeholder="状态"></el-input>
      </el-form-item>
      <el-form-item label="添加时间">
        <el-time-picker placeholder="选择开始时间" v-model="orderQuery.begin" value-format="yyyy-MM-dd HH:mm:ss"
          default-time="00:00:00" type="datetime"></el-time-picker>
      </el-form-item>
      <el-form-item>
        <el-time-picker placeholder="选择截止时间" v-model="orderQuery.end" value-format="yyyy-MM-dd HH:mm:ss"
          default-time="00:00:00" type="datetime"></el-time-picker>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" @click="getList()">查询</el-button>
        <el-button type="default" @click="resetData()">清空</el-button>
      </el-form-item>
    </el-form>

    <!--数据显示的表格-->
    <el-table :data="list" style="width: 100%" border fit highlight-current-row element-loading-text="数据加载中">
      <el-table-column prop="id" label="序号" width="70" align="center">
        <template slot-scope="scope">
          {{ (page - 1) * limit + scope.$index + 1 }}
        </template>
      </el-table-column>
      <el-table-column prop="orderNo" label="订单号"> </el-table-column>
      <el-table-column label="用户名" prop="nickname" />
      <el-table-column label="金额" width="80" prop="totalFee" />
      <el-table-column label="支付方式">
        <template slot-scope="scope">
          {{ scope.row.payType == 1 ? '微信支付' : (scope.row.payType == 2 ? '支付宝' : '其他') }}
        </template>
      </el-table-column>
      <el-table-column label="状态">
        <template slot-scope="scope">
          {{ scope.row.status == 0 ? '未支付' : '已支付' }}
        </template>
      </el-table-column>
      <el-table-column label="课程名称" prop="courseTitle" />
      <el-table-column label="课程讲师" prop="teacherName" />
      <el-table-column prop="gmtCreate" label="添加时间" width="160" />
    </el-table>
    <!--分页组件-->
    <el-pagination background layout="prev, pager, next,total,jumper" :total="total" :page-size="limit"
      style="padding: 30px 0; text-align: center" :current-page="page" @current-change="getList">
    </el-pagination>
  </div>
</template>
  
<script>
//引入要调用的方法，teacher.js文件
import order from "@/api/order/order.js";

export default {
  //写核心代码位置
  data() {
    //1、定义变量和初始值
    return {
      list: null, //查询之后给接口返回的数据装的集合
      page: 1, //当前页
      limit: 10, //每页显示记录数
      orderQuery: {}, //条件封装对象
      total: 0, //总记录数
    };
  },
  created() {
    //页面渲染之前执行，调用method定义的方法
    //调用
    this.getList();
  },
  methods: {
    //调用具体的方法，调用teacher.js定义的方法
    //讲师列表的方法
    getList(page = 1) {
      this.page = page;
      order
        .getPageList(this.page, this.limit, this.orderQuery)
        .then((resp) => {
          //resp接口返回的数据
          // console.log(resp);
          this.list = resp.data.items;
          this.total = resp.data.total;
        }) //请求成功
        .catch((err) => {
          console.log(err);
        }); //请求失败
    },
    //清空方法
    resetData() {
      //表单输入项数据清空
      this.orderQuery = {};
      //查询所有订单数据
      this.getList();
    }
  },
};
</script>
  
<style></style>