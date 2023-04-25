<template>
  <div id="aCoursesList" class="bg-fa of">
    <!-- /文章列表 开始 -->
    <section class="container">
      <header class="comm-title">
        <h2 class="fl tac">
          <span class="c-333">文章</span>
        </h2>
      </header>
      <div>
        <section class="leftContainer">
          <el-card class="box-card">
            <span class="c-999 fsize14">文章类别</span><br />
            <a title="全部" @click="initCourseAll()" href="#">全部</a>
            <div v-for="o in subjectNestedList" :key="o" class="textItem">
              <a href="#" @click="toDetail" :title="o.title">{{ o.title }}</a>
            </div>
          </el-card>
          <div class="clear"></div>
        </section>
        <section class="rightContainer">
          <div class="textArea">
            <ul>
              <li v-for="article in data.items" :key="article.id" class="textArticle">
                <span style="font-size: 30px">{{ article.articleName }}</span>
                <p>纲要:{{ article.description }} </p>
                <p>作者:{{ article.createName }} 最新修改时间:{{ article.gmtModified }}</p>
              </li>
            </ul>
          </div>
          <div class="mt40">
            <!-- /无数据提示 开始-->
            <section class="no-data-wrap" v-if="data.total == 0">
              <em class="icon30 no-data-ico">&nbsp;</em>
              <span class="c-666 fsize14 ml10 vam">没有相关数据，小编正在努力整理 中...</span>
            </section>
            <!-- /无数据提示 结束-->
          </div>
          <!-- 公共分页 开始 -->
          <div>
            <div class="paging">
              <!-- undisable这个class是否存在，取决于数据属性hasPrevious -->
              <a :class="{ undisable: !data.hasPrevious }" href="#" title="首页" @click.prevent="gotoPage(1)">首</a>
              <a :class="{ undisable: !data.hasPrevious }" href="#" title="前一页"
                @click.prevent="gotoPage(data.current - 1)">&lt;</a>
              <a v-for="page in data.pages" :key="page" :class="{
                current: data.current == page,
                undisable: data.current == page,
              }" :title="'第' + page + '页'" href="#" @click.prevent="gotoPage(page)">{{ page }}</a>
              <a :class="{ undisable: !data.hasNext }" href="#" title="后一页"
                @click.prevent="gotoPage(data.current + 1)">&gt;</a>
              <a :class="{ undisable: !data.hasNext }" href="#" title="末页" @click.prevent="gotoPage(data.pages)">末</a>
              <div class="clear" />
            </div>
          </div>
          <!-- 公共分页 结束 -->
        </section>
      </div>
    </section>
    <!-- /课程列表 结束 -->
  </div>
</template>
<script>
import articleApi from "@/api/article";
import courseApi from "@/api/course";

export default {
  data() {
    return {
      page: 1, //当前页
      data: {}, //课程列表
      subjectNestedList: [], // 一级分类列表
    };
  },
  methods: {
    //文章第一次查询
    initArticleFirst() {
      articleApi.getPageList(1, 10).then((resp) => {
        this.data = resp.data.data;
        console.log(this.data)
      });
    },
    //查询所有一级分类
    initSubject() {
      courseApi.getAllSubject().then((resp) => {
        this.subjectNestedList = resp.data.data.items;
      });
    },
    //文章详情
    toDetail() {

    },
    //分页切换方法
    gotoPage(page) {
      articleApi.getConditionPage(page, 10, this.searchObj).then((resp) => {
        this.data = resp.data.data;
      });
    },
  },
  created() {
    //课程第一次查询
    this.initArticleFirst();
    this.initSubject();
  },
};
</script>
<style scoped>
.active {
  background: #bdbdbd;
}

.hide {
  display: none;
}

.show {
  display: block;
}

.leftContainer {
  float: left;
  width: 20%;
}

.rightContainer {
  float: right;
  width: 80%;
}

.textArea {
  background-color: #eee9e9;
  border: 1px solid white;
  height: 100%;
}
.box-card a{
  color: #007AFF;
  text-decoration: none;
  transition: all 0.2s ease-in-out;
}
.textArticle {
  border: 1px solid white;
}
</style>