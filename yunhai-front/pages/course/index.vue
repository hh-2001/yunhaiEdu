<template>
  <div id="aCoursesList" class="bg-fa of">
    <!-- /课程列表 开始 -->
    <section class="container">
      <header class="comm-title">
        <h2 class="fl tac">
          <span class="c-333">全部课程</span>
        </h2>
      </header>
      <section class="c-sort-box">
        <section class="c-s-dl">
          <dl>
            <dt>
              <span class="c-999 fsize14">课程类别</span>
            </dt>
            <dd class="c-s-dl-li">
              <ul class="clearfix">
                <li>
                  <a title="全部" @click="initCourseAll()" href="#">全部</a>
                </li>
                <li v-for="subjectNested in subjectNestedList" :key="subjectNested.id">
                  <a :title="subjectNested.title" @click="seacherOne(subjectNested.id, index)" href="#">{{
                    subjectNested.title }}</a>
                </li>
              </ul>
            </dd>
          </dl>
          <dl>
            <dt>
              <span class="c-999 fsize14"></span>
            </dt>
            <dd class="c-s-dl-li">
              <ul class="clearfix">
                <li v-for="subject in subSubjectList" :key="subject.id">
                  <a :title="subject.title" @click="searchTwo(subject.id, index)" href="#">{{ subject.title }}</a>
                </li>
              </ul>
            </dd>
          </dl>
          <div class="clear"></div>
        </section>

        <div class="mt40">
          <!-- /无数据提示 开始-->
          <section class="no-data-wrap" v-if="data.total == 0">
            <em class="icon30 no-data-ico">&nbsp;</em>
            <span class="c-666 fsize14 ml10 vam">没有相关数据，小编正在努力整理 中...</span>
          </section>
          <!-- /无数据提示 结束-->
          <article class="comm-course-list" v-if="data.total > 0">
            <ul class="of" id="bna">
              <li v-for="item in data.items" :key="item.id">
                <div class="cc-l-wrap">
                  <section class="course-img">
                    <img :src="item.cover" class="img-responsive" :alt="item.title" />
                    <div class="cc-mask">
                      <a :href="/course/ + item.id" title="开始学习" class="comm-btn c- btn-1">开始学习</a>
                    </div>
                  </section>
                  <h3 class="hLh30 txtOf mt10">
                    <a :href="/course/ + item.id" :title="item.title" class="course-title fsize18 c-333">{{ item.title}}</a>
                  </h3>
                  <section class="mt10 hLh20 of">
                    <span class="fr jgTag bg-green" v-if="Number(item.price) === 0">
                      <i class="c-fff fsize12 f-fA">免费</i>
                    </span>
                    <span v-else class="fr jgTag numPrice">
                      {{ '¥' + item.price }}
                    </span>
                    <span class="fl jgAttr c-ccc f-fA">
                      <i class="c-999 f-fA">9634人学习</i>
                      |
                      <i class="c-999 f-fA">9634评论</i>
                    </span>
                  </section>
                </div>
              </li>
            </ul>
            <div class="clear"></div>
          </article>
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
    </section>
    <!-- /课程列表 结束 -->
  </div>
</template>
<script>
import courseApi from "@/api/course";
export default {
  data() {
    return {
      page: 1, //当前页
      data: {}, //课程列表
      subjectNestedList: [], // 一级分类列表
      subSubjectList: [], // 二级分类列表
      searchObj: {}, // 查询表单对象
      oneIndex: -1,
      twoIndex: -1,
      buyCountSort: "",
      gmtCreateSort: "",
      priceSort: "",
    };
  },
  methods: {
    //根据价格进行排序
    searchPrice() {
      //设置对应变量值，为了样式生效
      this.buyCountSort = ''
      this.gmtCreateSort = ''
      this.priceSort = '1'

      //把值赋值到searchObj中
      this.searchObj.buyCountSort = this.buyCountSort
      this.searchObj.priceSort = this.priceSort
      this.searchObj.gmtCreateSort = this.gmtCreateSort

      //调用方法查询
      this.gotoPage(1)
    },
    //根据最新进行排序
    searchGmtCreate() {
      //设置对应变量值，为了样式生效
      this.buyCountSort = ''
      this.gmtCreateSort = '1'
      this.priceSort = ''

      //把值赋值到searchObj中
      this.searchObj.buyCountSort = this.buyCountSort
      this.searchObj.priceSort = this.priceSort
      this.searchObj.gmtCreateSort = this.gmtCreateSort

      //调用方法查询
      this.gotoPage(1)
    },
    //根据销量排序
    searchBuyCount() {
      //设置对应变量值，为了样式生效
      this.buyCountSort = '1'
      this.gmtCreateSort = ''
      this.priceSort = ''

      //把值赋值到searchObj中
      this.searchObj.buyCountSort = this.buyCountSort
      this.searchObj.priceSort = this.priceSort
      this.searchObj.gmtCreateSort = this.gmtCreateSort

      //调用方法查询
      this.gotoPage(1)

    },
    //课程第一次查询
    initCourseFirst() {
      courseApi.getConditionPage(1, 8, this.searchObj).then((resp) => {
        this.data = resp.data.data;
      });
    },
    //课程第一次查询
    initCourseAll() {
      courseApi.getConditionPage(1, 8).then((resp) => {
        this.data = resp.data.data;
      });
    },
    //查询所有一级分类
    initSubject() {
      courseApi.getAllSubject().then((resp) => {
        this.subjectNestedList = resp.data.data.items;
        this.subSubjectList = resp.data.data.items.children
      });
    },
    //分页切换方法
    gotoPage(page) {
      courseApi.getConditionPage(page, 8, this.searchObj).then((resp) => {
        this.data = resp.data.data;
      });
    },
    //点击某个一级分类，查询对应的二级分类
    seacherOne(subjectParentId, index) {
      //把传递来的index赋值给ondex，为了active样式生效
      this.oneIndex = index
      this.twoIndex = -1
      this.searchObj.subjectId = ''
      this.subSubjectList = []

      //把一级分类点击的id值，赋值给searchObj
      this.searchObj.subjectParentId = subjectParentId;
      //点击某个一级分类进行条件查询
      this.gotoPage(1);

      //拿着点击的一级分类id 和 所有一级分类id进行比较
      //如果id相同，从那个一级分类中获取他的二级分类
      for (let i = 0; i < this.subjectNestedList.length; i++) {
        //获取每个一级分类
        var oneSubject = this.subjectNestedList[i];
        //比较id是否相同
        if (oneSubject.id == subjectParentId) {
          this.subSubjectList = oneSubject.children;
        }
      }
    },
    //点击某个二级分类实现查询
    searchTwo(subjectId, index) {
      //把index赋值，为了样式生效
      this.twoIndex = index;
      //把二级分类点击id值，赋给searchObj
      this.searchObj.subjectId = subjectId;
      //点击某个二级分类进行调节查询
      this.gotoPage(1);
    },
  },
  created() {
    //课程第一次查询
    this.initCourseFirst();
    //一级分类显示
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

.numPrice {
  color: #FF1B20;
}
</style>