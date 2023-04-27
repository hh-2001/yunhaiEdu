<template>
    <div id="aCoursesList" class="bg-fa of">
        <!-- 讲师介绍 开始 -->
        <section class="container">
            <header class="comm-title">
                <h2 class="fl tac">
                    <span class="c-333">讲师搜索结果</span>
                </h2>
            </header>
            <div class="t-infor-wrap">
                <section class="no-data-wrap" v-if="teacherList.length == 0">
                    <em class="icon30 no-data-ico">&nbsp;</em>
                    <span class="c-666 fsize14 ml10 vam">没有相关数据，小编正在努力整理 中...</span>
                </section>
                <!-- 讲师结果 -->
                <section class="fl t-infor-box c-desc-content" v-else>
                    <article class="i-teacher-list">
                        <ul class="of">
                            <li v-for="item in teacherList" :key="item.id">
                                <section class="i-teach-wrap">
                                    <div class="i-teach-pic">
                                        <a :href="'/teacher/' + item.id" :title="item.name" target="_blank">
                                            <img :src="item.avatar" :alt="item.name" />
                                        </a>
                                    </div>
                                    <div class="mt10 hLh30 txtOf tac">
                                        <a :href="'/teacher/1' + item.id" :title="item.name" target="_blank"
                                            class="fsize18 c-666">{{
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
                </section>
                <div class="clear"></div>
            </div>
            <section class="container">
                <header class="comm-title">
                    <h2 class="fl tac">
                        <span class="c-333">课程搜索结果</span>
                    </h2>
                </header>
                <div class="t-infor-wrap">
                    <!-- /无数据提示 开始-->
                    <section class="no-data-wrap" v-if="courseList.length == 0">
                        <em class="icon30 no-data-ico">&nbsp;</em>
                        <span class="c-666 fsize14 ml10 vam">没有相关数据，小编正在努力整理 中...</span>
                    </section>
                    <!-- /无数据提示 结束-->
                    <section class="fl t-infor-box c-desc-content" v-else>
                        <article class="comm-course-list">
                            <ul class="of" id="bna">
                                <li v-for="item in courseList" :key="item.id">
                                    <div class="cc-l-wrap">
                                        <section class="course-img">
                                            <img :src="item.cover" class="img-responsive" :alt="item.title" />
                                            <div class="cc-mask">
                                                <a :href="/course/ + item.id" title="开始学习"
                                                    class="comm-btn c- btn-1">开始学习</a>
                                            </div>
                                        </section>
                                        <h3 class="hLh30 txtOf mt10">
                                            <a :href="/course/ + item.id" :title="item.title"
                                                class="course-title fsize18 c-333">{{ item.title }}</a>
                                        </h3>
                                        <section class="mt10 hLh20 of">
                                            <span class="fr jgTag bg-green" v-if="Number(item.price) === 0">
                                                <i class="c-fff fsize12 f-fA">免费</i>
                                            </span>
                                            <span class="fl jgAttr c-ccc f-fA">
                                                <i class="c-999 f-fA">9634人学习</i>
                                                |
                                                <i class="c-999 f-fA">9634评论</i>
                                                |
                                                <i class="c-999 f-fA">{{ item.teacherName }}</i>
                                            </span>
                                        </section>
                                    </div>
                                </li>
                            </ul>
                            <div class="clear"></div>
                        </article>
                    </section>
                </div>
            </section>
        </section>
        <!-- /讲师介绍 结束 -->
    </div>
</template>
<script>
import searchApi from '@/api/search'
export default {
    created() {
        this.keyword = this.$route.params.query;
        this.queryWord()
    },
    data() {
        return {
            page: 1,
            limit: 10,
            keyword: '',
            teacherList: [],
            courseList: []
        }
    },
    methods: {
        queryWord() {
            searchApi.searchWord(this.keyword, this.page, this.limit).then(resp => {
                this.teacherList = resp.data.data.teacherList
                this.courseList = resp.data.data.courseList
            })
        }
    },
};
</script>
<style></style>