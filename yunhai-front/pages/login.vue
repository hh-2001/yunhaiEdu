.<template>
  <div class="main">
    <div class="title">
      <a class="active" href="/login">登录</a>
      <span>·</span>
      <a href="/register">注册</a>
    </div>
    <div class="sign-up-container">
      <el-form ref="userForm" :model="user">
        <el-form-item
          class="input-prepend restyle"
          prop="phone"
          :rules="[
            {
              required: true,
              message: '请输入电话',
              trigger: 'blur',
            },
            { validator: checkPhone, trigger: 'blur' },
          ]"
        >
          <div>
            <el-input type="text" placeholder="电话" v-model="user.mobile" />
            <i class="iconfont icon-phone" />
          </div>
        </el-form-item>
        <el-form-item
          class="input-prepend"
          prop="password"
          :rules="[{ required: true, message: '请输入密码', trigger: 'blur' }]"
        >
          <div>
            <el-input
              type="password"
              placeholder="密码"
              v-model="user.password"
            />
            <i class="iconfont icon-password" />
          </div>
        </el-form-item>
        <div class="btn">
          <input
            type="button"
            class="sign-in-button"
            value="登录"
            @click="submitLogin()"
          />
        </div>
      </el-form>
      <!-- 更多登录方式 -->
      <div class="more-sign">
        <h6>社交帐号登录</h6>
        <ul>
          <li>
            <a
              id="weixin"
              class="weixin"
              target="_blank"
              href="http://localhost:8150/api/ucenter/wx/login"
              ><i class="iconfont icon-weixin"
            /></a>
          </li>
          <li>
            <a id="qq" class="qq" target="_blank" href="#"
              ><i class="iconfont icon-qq"
            /></a>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
import "~/assets/css/sign.css";
import "~/assets/css/iconfont.css";
import cookie from "js-cookie";
import loginApi from "@/api/login";
export default {
  layout: "sign",
  data() {
    return {
      user: {
        //封装用于登录的用户对象
        mobile: "",
        password: "",
      },
      //用于获取接口传来的token中的对象
      loginInfo: {},
    };
  },
  methods: {
    submitLogin() {
      loginApi.submitLogin(this.user).then((response) => {
        if (response.data.success) {
          //把token存在cookie中、也可以放在localStorage中
          //参数1：cookie名称，参数2：具体的值，参数3：作用范围
          cookie.set("token", response.data.data.token, {
            domain: "localhost",
          });
          //登录成功根据token获取用户信息
          loginApi.getLoginInfo().then((response) => {
            this.loginInfo = response.data.data.item;
            //将用户信息记录cookie
            cookie.set("yunhai_ucenter", this.loginInfo, { domain: "localhost" });
            //跳转页面
            this.$router.go(-1);
            //this.$router.push({path:'/'})
          });
        }
      });
    },
    checkPhone(rule, value, callback) {
      //debugger
      // if (!/^1[34578]\d{9}$/.test(value)) {
      //   return callback(new Error("手机号码格式不正确"));
      // }
      return callback();
    },
  },
};
</script>
<style>
.el-form-item__error {
  z-index: 9999999;
}
</style>