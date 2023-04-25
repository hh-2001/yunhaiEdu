<template>
  <div class="app-container">
    <el-form label-width="120px">
      <el-form-item label="幻灯片名称">
        <el-input v-model="banner.title" />
      </el-form-item>
      <el-form-item label="幻灯片排序">
        <el-input-number v-model="banner.sort" controls-position="right" :min="0" />
      </el-form-item>
      <!-- 课程封面 TODO -->
      <el-form-item label="幻灯片图片">
        <el-upload :show-file-list="false" :on-success="handleAvatarSuccess" :before-upload="beforeAvatarUpload"
          :action="BASE_API + '/eduoss/fileoss/upload'" class="avatar-uploader">
          <img :src="banner.imageUrl" />
        </el-upload>
      </el-form-item>
      <el-form-item label="所属模块 如:/index">
        <el-input v-model="banner.linkUrl" :rows="10" type="textarea" />
      </el-form-item>

      <el-form-item>
        <el-button :disabled="saveBtnDisabled" type="primary" @click="saveOrUpdate">保存</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
//引入对应的新增api方法
import banner from "@/api/teacher/banner.js";


export default {
  data() {
    return {
      banner: {
        title: "",
        sort: 0,
        imageUrl: "",
        linkUrl: "",
      },
      //上传弹框组件是否显示
      imagecropperShow: false,
      //上传组件key值
      imagecropperKey: 0,
      //获取dev.env.js里面的ip:端口号地址
      BASE_API: process.env.BASE_API,
      saveBtnDisabled: false, // 保存按钮是否禁用,
    };
  },
  methods: {
    saveOrUpdate() {
      //判断修改还是新增操作
      //根据teacher对象是否有id值来判断
      if (!this.banner.id) {
        //没有id值，做【新增操作】
        this.saveBtnDisabled = true;
        this.saveData();
      } else {
        //有id值，做【修改操作】
        this.updateBanner();
      }
    },

    //修改幻灯片的方法
    updateBanner() {
      banner.updateBannerInfo(this.banner).then((resp) => {
        //提示信息
        this.$message({
          message: "修改幻灯片记录成功",
          type: "success",
        });
        //回到幻灯片列表 路由跳转
        this.$router.push({ path: "/banner/list" });
      });
    },
    //上传封面成功调用的方法
    handleAvatarSuccess(resp, file) {
      this.banner.imageUrl = resp.data.url;
    },
    //上传之前要调用的方法
    beforeAvatarUpload(file) {
      const isJPG = file.type === "image/jpeg";
      const isLt2M = file.size / 1024 / 1024 < 2;
      if (!isJPG) {
        this.$message.error("上传头像图片只能是 JPG 格式!");
      }
      if (!isLt2M) {
        this.$message.error("上传头像图片大小不能超过 2MB!");
      }
      return isJPG && isLt2M;
    },
    // 保存
    saveData() {
      banner.saveBanner(this.banner).then((resp) => {
        //添加成功
        //提示信息
        this.$message({
          message: "添加幻灯片记录成功",
          type: "success",
        });
        //回到幻灯片列表 路由跳转
        this.$router.push({ path: "/banner/list" });
      });
    },
    //根据id查询，数据回显
    getInfoById(id) {
      banner.updateById(id).then((resp) => {
        this.banner = resp.data.item;
      });
    },
    init() {
      //判断路径中是否有id值
      if (this.$route.params && this.$route.params.id) {
        //从路径中获取id值
        const id = this.$route.params.id;
        //调用根据id查询的方法
        this.getInfoById(id);
      } else {
        this.banner = {};
      }
    },
  },
  created() {
    //在页面渲染之前
    this.init();
  },
  watch: {
    $route(to, from) {
      //路由变化方式，当路由发送变化，方法就执行
      console.log("watch $route");
      this.init();
    },
  },
};
</script>

<style>
.avatar-uploader img{
  width: 200px;
  height: 200px;
  border-radius: 30%;
}
</style>