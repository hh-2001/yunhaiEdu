<template>
  <div id="aCoursesList" class="bg-fa of">
    <!-- 讲师列表 开始 -->
    <section class="container">
      <header class="comm-title all-teacher-title">

        <section class="c-tab-title">
          <dl>
            <dt>
              <h2 class="fl tac">
                <span class="c-333">全部讲师</span>
              </h2>
            </dt>
            <dd class="c-s-dl-li">
              <ul class="clearfix">
                <li>
                  <a title="全部" @click="initTeacherAll()" href="#">全部</a>
                </li>
                <li v-for="teacher in subjectList" :key="teacher.id">
                  <a :title="teacher.careerName" @click="seacherOne(teacher.careerName, index)" href="#">{{teacher.careerName}}</a>
                </li>
              </ul>
            </dd>
          </dl>
        </section>
      </header>
      <section class="c-sort-box unBr">
        <div>
          <!-- /无数据提示 开始-->
          <section class="no-data-wrap" v-if="data.total == 0">
            <em class="icon30 no-data-ico">&nbsp;</em>
            <span class="c-666 fsize14 ml10 vam">没有相关数据，小编正在努力整理 中...</span>
          </section>
          <!-- /无数据提示 结束-->
          <article class="i-teacher-list" v-if="data.total > 0">
            <ul class="of">
              <li v-for="item in teacherList" :key="item.id">
                <section class="i-teach-wrap">
                  <div class="i-teach-pic">
                    <a :href="'/teacher/' + item.id" :title="item.name" target="_blank">
                      <img :src="item.avatar" :alt="item.name" />
                    </a>
                  </div>
                  <div class="mt10 hLh30 txtOf tac">
                    <a :href="'/teacher/1' + item.id" :title="item.name" target="_blank" class="fsize18 c-666">{{
                      item.name
                    }}</a>
                  </div>
                  <div class="hLh30 txtOf tac">
                    <span class="fsize14 c-999">{{ item.intro }}</span>
                  </div>
                  <div class="mt15 i-q-txt">
                    <p class="c-999 f-fA">{{ item.career }}</p>
                  </div>
                </section>
              </li>
            </ul>
            <div class="clear"></div>
          </article>
        </div>
        <!-- 公共分页 开始 -->
        <div>
          <div class="paging">
            <!-- undisable这个class是否存在，取决于数据属性hasPrevious -->
            <a :class="{ undisable: !data.hasPrevious }" href="#" title="首页" @click.prevent="gotoPage(1)">首页</a>
            <a :class="{ undisable: !data.hasPrevious }" href="#" title="前一页"
              @click.prevent="gotoPage(data.current - 1)">&lt;</a>
            <a v-for="page in data.pages" :key="page" :class="{
              current: data.current == page,
              undisable: data.current == page,
            }" :title="'第' + page + '页'" href="#" @click.prevent="gotoPage(page)">{{ page }}</a>
            <a :class="{ undisable: !data.hasNext }" href="#" title="后一页"
              @click.prevent="gotoPage(data.current + 1)">&gt;</a>
            <a :class="{ undisable: !data.hasNext }" href="#" title="末页" @click.prevent="gotoPage(data.pages)">末页</a>
            <div class="clear" />
          </div>
        </div>
        <!-- 公共分页 结束 -->
      </section>
    </section>
    <!-- /讲师列表 结束 -->
  </div>
</template>
<script>
import teacherAPI from "@/api/teacher";

export default {
  data() {
    return {
      data: {},
      careerName:"",
      subjectList:[],
      teacherList:[],
      oneIndex: -1
    };
  },
  //异步调用，进页面调用，且只会调一次
  //params：相当于之前的 this.$route.params.id 等价 params.id
  //error：错误信息
  // asyncData({ params, error }) {
  //   return teacherAPI.getPageList(1, 8).then((resp) => {
  //     console.log(resp.data.data.total);
  //     this.data = null;
  //   });
  // },
  methods: {
    initTeacher() {
      teacherAPI.getPageList(1, 8).then((resp) => {
        this.data = resp.data.data;
        this.teacherList = this.data.items;
      });
    },
    initType() {
      teacherAPI.getTeacherType(1, 8).then((resp) => {
        this.subjectList = resp.data.data.items;
      });
    },
    //点击某个一级分类，查询对应的二级分类
    seacherOne(careerName, index) {
      //把传递来的index赋值给ondex，为了active样式生效
      this.oneIndex = index
      this.careerName=''
      this.teacherList=[]

      //把一级分类点击的id值，赋值给searchObj
      this.careerName = careerName;

      //拿着点击的一级分类id 和 所有一级分类id进行比较
      //如果id相同，从那个一级分类中获取他的二级分类
      for (let i = 0,j=0; i < this.data.items.length; i++) {
        //获取每个一级分类
        var teacher = this.data.items[i];
        //比较职位是否相同
        if (teacher.career == careerName) {
          this.teacherList[j++] = teacher;
        }
      }
    },
    //分页切换方法
    //参数是页码数
    gotoPage(page) {
      teacherAPI.getPageList(1, 8).then((resp) => {
        this.data = resp.data.data;
      });
    },
    initTeacherAll(){
      teacherAPI.getPageList(1, 8).then((resp) => {
        this.teacherList = resp.data.data.item;
      });
    }
  },
  created() {
    this.initTeacher();
    this.initType();
  },
};
</script>