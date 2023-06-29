<template>
	<view class="content">
		<uni-nav-bar>
			<template v-slot:left>
				<view slot="left" @click="checkGrade">
					<view class="check_class">
						<text>{{courseClass}}</text>
						<uni-icons type="arrowdown" color="#666" size="18" />
					</view>
				</view>
			</template>
			<template v-slot:right>
				<view slot="right" style="position: relative; ">
					<uni-icons type="search" @click="search()" class="cuIcon-search"></uni-icons>
				</view>
			</template>
		</uni-nav-bar>

		<!-- 轮播图 -->
		<view class="index-banner-wrap">
			<swiper class="index-banner swiper" :indicator-dots="indicatorDots" :autoplay="autoplay"
				:interval="interval" :duration="duration" circular>
				<swiper-item @click="bannerTo(item)" v-for="(item, index) in bannerList" :key="item.id">
					<image class="index-banner-img" :src="item.imageUrl" mode="aspectFill"></image>
				</swiper-item>
			</swiper>

		</view>
		<!-- 新闻资讯 -->
		<view @click="openArticle" class="news-wrap">
			<image class="news-wrap-title-img" src="../static/images/news_he.png" mode="aspectFit"></image>
			<text class="news-shu">|</text>

			<swiper class="swiper-wrap" :vertical="true" :autoplay="true" :interval="3000" :duration="1000" circular>
				<swiper-item v-for="(item, index) in articleList" :key="index" class="swiper-item">
					<text class="news-title">{{item.articleName}}</text>
				</swiper-item>
			</swiper>
			<text class="news-arow iconfont icon-jinrujiantou"></text>
		</view>
		<!-- 课程选项卡 -->
		<uni-section title="课程分类" class="index-course-wrap" type="line">

			<scroll-view class="scroll-view_H" scroll-x="true" @scroll="scroll" scroll-left="120">
				<view class="course-item"><text>全部</text></view>
				<view @click="getCourseByClass(item.id, item.name)" class="course-item scroll-view-item_H"
					v-for="(item, index) in subjectNestedList" :key="item.id">
					<!-- <image :src="item.thumb" mode="aspectFit"></image> -->
					<text>{{item.title}}</text>
				</view>
			</scroll-view>
		</uni-section>

		<!-- 新闻和讲师按钮 -->
		<view class="news-teacher-wrap">
			<image @click="openTeacher" class="news-teacher-img1" src="../static/images/teachericon.png"
				mode="aspectFit"></image>
			<image @click="openNews" class="news-teacher-img2" src="../static/images/newsicon.png" mode="aspectFit">
			</image>
		</view>
		<!-- 课程 -->
		<!-- 热门直播展示-->
		<!-- <view class="course-list-wrap">
			直播课堂
			<view class="course-list-wrap">
				<view class="live-title-wrap">
					标题 更多
					<text class="live-title">直播课堂</text>
					<text @click="moreLive" class="live-more">
						更多
					</text>
				</view>

				直播课列表
				<view class="course-wrap">
					<view @click="viewLiveInfo(item.id,item.paytype)" class="live-list" v-for="(item, index) in live_info" :key="index">
						<view class="live-list-img-wrap">
							<image class="live-list-img" :src="item.thumb" mode="aspectFill"></image>
							<text class="course-title-icon">直播</text>

						</view>
						<view class="live-list-info">
							<view class="live-c-title">{{item.name}}</view>
							<view class="live-status living-status" v-if="item.islive == 1">
								{{item.lesson}}
							</view>
							<view class="live-status" v-else>
								{{item.lesson}}
							</view>
							<view class="live-teacher-price">
								<image class="live-teacher-avatar" :src="item.avatar" mode="aspectFill"></image>
								<text class="teacher-name">{{item.user_nickname}}</text>
								<view class="price-wrap">
									<text v-if="item.paytype == 0" class="free">免费</text>
									<text v-else-if="item.paytype == 2" class="pass">密码</text>
									<text v-else-if="item.paytype ==1" class="numPrice">
										{{'¥' + item.payval}}
									</text>
								</view>
							</view>
						</view>
					</view>
					<view class="listline"></view>
				</view>
			</view>
		</view>
		 -->
		<!-- 热门讲师 -->
		<view class="course-list-wrap">
			<!-- 讲师列表 -->
			<view class="course-list-wrap">
				<view class="live-title-wrap">
					<!-- 标题 更多 -->
					<text class="live-title">热门讲师</text>
					<text @click="moreTeacher()" class="course-more">
						更多&nbsp;
					</text>
				</view>

				<!-- 讲师列表 -->
				<view class="course-wrap">
					<view @click="viewteacherInfo(item.id)" class="live-list" v-for="(item, index) in teacherList"
						:key="index">
						<view class="live-list-img-wrap">
							<image class="live-list-img" :src="item.avatar" mode="aspectFill"></image>
							<text class="course-title-icon">介绍</text>
						</view>
						<view class="live-list-info">
							<view class="live-c-title">{{item.name}}</view>

							<view class="teacher-introduce">
								<text class="teacher-name">头衔:{{item.career}}</text><br />
								<text style="font-size: 12px;">简介:{{item.intro}}</text>
							</view>
						</view>
					</view>
					<view class="listline"></view>
				</view>
			</view>
		</view>
		<!-- 热门课程展示 -->
		<view class="course-list-wrap">
			<!-- 精选内容 -->
			<view class="la-wrap">
				<view class="live-title-wrap">
					<!-- 标题 更多 -->
					<text class="live-title">精选内容</text>
					<text @click="moreCourse()" class="course-more">更多&nbsp;</text>
				</view>
			</view>

			<view class="course-wrap">
				<view @click="toDetail(item.id)" class="live-list" v-for="(item, index) in courseList" :key="index">
					<view class="live-list-img-wrap">
						<image class="live-list-img" :src="item.cover" mode="aspectFill"></image>
						<text class="course-title-icon">内容</text>
					</view>
					<view class="live-list-info">
						<view class="live-c-title">{{item.title}}</view>
						<view class="live-status-tuwen">
							<!-- {{item.title}}  目前未做指定 -->
							视频
						</view>
						<view class="live-teacher-price">
							<image class="live-teacher-avatar" :src="item.avatar" mode="aspectFill"></image>
							<text class="teacher-name">{{item.teacherName}}</text>
							<view class="price-wrap">
								<text v-if="item.price == 0" class="free">免费</text>
								<text v-else class="numPrice">
									{{'¥' + item.price}}
								</text>
							</view>
						</view>
					</view>
				</view>
			</view>
		</view>
	</view>

</template>

<script>
	import {
		getListBanner
	} from '@/api/banner'
	import courseApi from '@/api/course.js'
	import indexApi from '@/api/index.js'
	import articleApi from '@/api/article.js'
	import store from "@/store"

	export default {
		onLoad() {
			this.getBanner()
			this.getHot()
			this.getArticle()
		},
		data() {
			return {
				courseClass: "全部",
				courseList: [],
				teacherList: [],
				subjectNestedList: [], // 一级分类列表
				subSubjectList: [], // 二级分类列表
				bannerList: [],
				articleList: [],
				current: 0,
				swiperDotIndex: 0,
				// 组件需要
				scrollTop: 0,
				old: {
					scrollTop: 0
				},
				//顶部选项卡
				tabIndex: 0,
				swiperheight: 0, //高度
				autoplay: true,
				interval: 2000,
				duration: 500,
				indicatorDots: true,
				page: 1,
				limit: 5
			}
		},
		onShow: function() {
			this.initSubject()
			this.courseClass = store.getters.courseClass == '' ? "全部" : store.getters.courseClass
		},
		methods: {
			getArticle() {
				articleApi.getPageList(this.page, this.limit).then(resp => {
					this.articleList = resp.data.items;
				})
			},
			getBanner() {
				getListBanner().then(response => {
					this.bannerList = response.data.items
				})
			},
			getHot() {
				indexApi.getIndexData().then(response => {
					this.courseList = response.data.courseList;
					this.teacherList = response.data.teacherList;
				})
			},
			initSubject() {
				courseApi.getAllSubject().then((resp) => {
					this.subjectNestedList = resp.data.items;
					this.subSubjectList = resp.data.items.children
				});
			},
			changeSwiper(e) {
				this.current = 1
			},
			search() {
				this.$tab.navigateTo("search/search")
			},
			moreCourse() {
				this.$tab.navigateTo("course/index")
			},
			moreTeacher() {
				this.$tab.navigateTo("teacher/index")
			},
			//官方滚动方法
			scroll: function(e) {
				this.old.scrollTop = e.detail.scrollTop;
			},
			goTop: function(e) {
				this.scrollTop = this.old.scrollTop;
				this.$nextTick(function() {
					this.scrollTop = 0;
				});
				uni.showToast({
					icon: "none",
					title: "纵向滚动 scrollTop 值已被修改为 0"
				})
			},
			bannerTo(item) {
				//此方法只能在真机端运行
				uni.navigateTo({
					url: '../about/banner?url=' + encodeURIComponent(JSON.stringify(item.url)) + '&title=' + item
						.title,
				});
			},
			toDetail(id) {
				this.$tab.navigateTo("course/detail?courseId=" + id)

			},
			viewteacherInfo(id) {
				this.$tab.navigateTo("teacher/detail?teacherId=" + id)
			},
			openArticle() {
				this.$tab.navigateTo("article/index")
			},
			checkGrade() {
				this.$tab.navigateTo("course/checkClass")
			}
		}
	}
</script>

<style>
	@import url("/static/css/index.css");
	@import url("/static/css/course_list.css");

	page {
		display: flex;
		flex-direction: column;
		box-sizing: border-box;
		background-color: #fff;
		min-height: 100%;
		height: auto;
		overflow: auto;
	}

	view {
		font-size: 14px;
		line-height: inherit;
	}

	/* #ifndef APP-PLUS-NVUE */
	/* 搜索框 */
	/* $nav-height: 30px; */
	/* #endif */
	.box-bg {
		background-color: #F5F5F5;
		padding: 5px 0;
	}

	.input-view {
		/* #ifndef APP-PLUS-NVUE */
		display: flex;
		/* #endif */
		flex-direction: row;
		// width: 500rpx;
		flex: 1;
		background-color: #f8f8f8;
		height: $nav-height;
		border-radius: 15px;
		padding: 0 15px;
		flex-wrap: nowrap;
		margin: 7px 0;
		line-height: $nav-height;
	}

	.input-uni-icon {
		line-height: $nav-height;
	}

	.nav-bar-input {
		height: $nav-height;
		line-height: $nav-height;
		/* #ifdef APP-PLUS-NVUE */
		width: 80%;
		/* #endif */
		padding: 0 5px;
		font-size: 12px;
		background-color: #f8f8f8;
	}

	/* 轮播图 */
	.uni-margin-wrap {
		width: 690rpx;
		width: 100%;
		;
	}

	.swiper {
		height: 300rpx;
	}

	.swiper-box {
		height: 150px;
	}

	.swiper-item {
		/* #ifndef APP-NVUE */
		display: flex;
		/* #endif */
		flex-direction: column;
		justify-content: center;
		align-items: center;
		color: #fff;
		height: 300rpx;
		line-height: 300rpx;
	}

	@media screen and (min-width: 500px) {
		.uni-swiper-dot-box {
			width: 400px;
			/* #ifndef APP-NVUE */
			margin: 0 auto;
			/* #endif */
			margin-top: 8px;
		}

		.image {
			width: 48%;
		}
	}

	/* 课程展示列 */

	.s-all-wrap {
		position: relative;
	}

	.search-all-wrap {
		margin-top: 0rpx;
		width: 90%;
		height: 65rpx;
		line-height: 65rpx;
	}

	.search-wrap {
		width: 100%;
		height: 100%;
		line-height: 65rpx;
		border-radius: 30rpx;
		margin-left: 20rpx;
		ding-left: 20rpx;
		background-color: #F5F5F5;
		float: left;
	}

	.search-wrap text,
	.search-wrap input {
		float: left;
		background-color: #F5F5F5;
		height: 100%;
		padding: 0;
	}

	.search-wrap text {
		margin-right: 20rpx;
		color: #C7C7C7;
	}

	.search-wrap input {
		width: 70%;
	}

	.gouwunums {
		display: flex;
		flex-direction: row;

	}

	.gowucheimage {
		display: flex;
		width: 70upx;
		height: 50upx;
		display: flex;
		flex-direction: row;
		flex-flow: column;
	}

	.carnums {
		margin-left: -30upx;
		margin-top: -15upx;
		width: 40upx;
		height: 40upx;
		font-size: small;
		color: #FFFFFF;
		text-align: center;
		background-color: #FF3333;
		border-radius: 20upx;
	}

	/* 新闻资讯 */
	.news-wrap {
		width: 97%;
		height: 80rpx;
		margin: 30rpx auto 0;
		padding-left: 3%;
		line-height: 80rpx;
		border-radius: 34rpx;
		background-color: #F6F6F6;
		display: flex;
		align-items: center;
	}

	.news-wrap-title-img {
		float: left;
		width: 120rpx;
		height: 100%;
	}

	.news-shu {
		float: left;
		margin: 0 20rpx;
		color: #CCCCCC;
	}

	.news-title {
		float: left;
		width: 70%;
		color: #333333;
		font-size: 26rpx;
		display: inline-block;
		width: 100%;
		text-overflow: ellipsis;
		white-space: nowrap;
	}

	.news-arow {
		color: #CCCCCC;
		font-size: 28rpx;
		position: absolute !important;
		right: 45rpx !important;
	}


	.swiper-wrap {
		width: 68%;
		height: 70rpx;
		line-height: 70rpx;
	}

	.c-more-icon {
		position: relative;
		top: 5rpx;
	}

	.live-more {
		right: 29rpx !important;
	}

	.content-more {
		right: 29rpx !important;
	}

	.course-list-wrap .course-wrap {
		width: 100% !important;
		padding-bottom: 0 !important;
	}

	.course-list-wrap {
		margin-bottom: 60rpx;
	}

	.price-wrap {
		padding-right: 16rpx !important;
	}

	/* 讲师和新闻按钮 */
	.news-teacher-wrap {
		display: flex;
		height: 133rpx;
	}

	.news-teacher-img1 {
		height: 133rpx;
	}

	.news-teacher-img2 {
		height: 133rpx;
	}
</style>