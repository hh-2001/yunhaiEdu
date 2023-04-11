.<template>
  <div class="app-container">
    <el-form label-width="120px">
      <el-form-item label="级别名称">
        <el-input v-model="level.name" />
      </el-form-item>
      <el-form-item label="讲师级别排序">
        <el-input-number
          v-model="level.sort"
          controls-position="right"
          :min="0"
        />
      </el-form-item>

      <el-form-item label="类别备注">
        <el-input v-model="level.remark" :rows="10" type="textarea" />
      </el-form-item>

      <el-form-item>
        <el-button
          :disabled="saveBtnDisabled"
          type="primary"
          @click="saveOrUpdate"
          >保存</el-button
        >
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
//引入对应的新增api方法
import level from "@/api/teacher/level.js";
//引入头像组件
import ImageCropper from '@/components/ImageCropper'
import PanThumb from '@/components/PanThumb'

export default {
  //声明引入的组件
  components:{ImageCropper,PanThumb},
  data() {
    return {
      level: {
        id:"",
        name: "",
        sort: 0,
        remark: "",
      },
      //获取dev.env.js里面的ip:端口号地址
      BASE_API: process.env.BASE_API,
      saveBtnDisabled: false, // 保存按钮是否禁用,
    };
  },
  methods: {
    saveOrUpdate() {
      //判断修改还是新增操作
      //根据teacher对象是否有id值来判断
      if (!this.level.id) {
        //没有id值，做【新增操作】
        this.saveBtnDisabled = true;
        this.saveData();
      } else {
        //有id值，做【修改操作】
        this.updatelevel();
      }
    },

    //修改讲师的方法
    updatelevel() {
      level.updatelevel(this.level).then((resp) => {
        //提示信息
        this.$message({
          message: "修改讲师类别记录成功",
          type: "success",
        });
        //回到讲师类别列表 路由跳转
        this.$router.push({ path: "/teacher/listlevel" });
      });
    },

    // 保存
    saveData() {
      level.addlevel(this.level).then((resp) => {
        //添加成功
        //提示信息
        this.$message({
          message: "添加讲师类别记录成功",
          type: "success",
        });
        //回到讲师类别列表 路由跳转
        this.$router.push({ path: "/teacher/listlevel" });
      });
    },
    //根据id查询，数据回显
    getInfoById(id) {
      level.getlevel(id).then((resp) => {
        this.level = resp.data.item;
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
        this.level = {};
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

<style></style>