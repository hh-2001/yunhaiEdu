<template>
   
    <div class="body">
      <!-- 视频播放器 -->
      <div class="content">
        <nuxt />
      </div>
      
  </div>
</template>
<script>
import courseApi from "@/api/course";
export default {
}
</script>
<style>
html,
body {
  height: 100%;
}
</style>
<style scoped>
.head {
  height: 50px;
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
}
.body {
  width: 70%;
  position: relative;
  top: 50px;
  left: 0;
  right: 50px;
  bottom: 0;
  overflow: hidden;
}
</style>