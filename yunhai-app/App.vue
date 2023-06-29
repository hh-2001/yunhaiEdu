<script>
  import config from './config'
  import store from '@/store'
  import { getToken } from '@/utils/auth'

  export default {
    onLaunch: function() {
      this.initApp()
    },
    methods: {
      // 初始化应用
      initApp() {
        // 初始化应用配置
        this.initConfig()
        // 检查用户登录状态
        //#ifdef H5
        this.toIndex()
        //#endif
      },
      initConfig() {
        this.globalData.config = config
      },
      toIndex() {
        this.$tab.reLaunch('/pages/index') 
      }
    }
  }
</script>

<style lang="scss">
  @import '@/static/scss/index.scss'
</style>
