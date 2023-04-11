<template>
  <div class="sign">
    <!--标题-->
    <div class="logo">
      <a href="/" title="云海学院">
            <img
              src="~/assets/img/logo.png"
              width="100%"
              alt="云海学院"
            />
          </a>
    </div>
    <div class="content">
      <nuxt />
    </div>
  </div>
</template>
<style scoped>
.sign{
  position: absolute;
  background-image: url(~/assets/img/background.jpg);
  width: 100%;
  height: 100%;
}
.logo{
  width: 25%;
  height: 50px;
}
.content{
  top: 5%;
}
</style>