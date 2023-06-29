<template>
	<view class="container">
		<!-- #ifdef H5 -->
		<scroll-view class="liveinfo-wrap" scroll-y :style="{height:scrollH+'rpx'}">
			<!-- #endif -->
			<!-- #ifndef H5 -->
			<scroll-view :refresher-threshold="45" :refresher-enabled="true" :refresher-triggered="refresherTriggered"
				@refresherrefresh="refresherrefresh" class="liveinfo-wrap" scroll-y :style="{height:scrollH+'rpx'}">
				<!-- #endif -->
				<view class="course-list-wrap">
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
									<text style="font-size: 12px;" class="introduce">简介:{{item.intro}}</text>
								</view>
							</view>
						</view>
					</view>
				</view>
			</scroll-view>
			<template v-if="kongkong == true">
				<view :class="{xiangziwrap : (kongkong == true)}">
					<image class="xiangzi" src="../../static/images/xiangzi.png" mode="aspectFill"></image>
					<text class="xiangzi_txt">暂无相关教师</text>
				</view>
			</template>
	</view>
</template>

<script>
	import teacherApi from '@/api/teacher.js'
	import loadmore from '../../components/common/load-more.vue'

	export default {
		components: {
			loadmore
		},
		data() {
			return {
				teacherList: [],
				page: 1,
				limit: 10,
				refresherTriggered: false,
				scrollH: 0,
				kongkong: true,
			}
		},
		onReady() {
			var that = this;
			uni.getSystemInfo({
				success: function(res) {
					that.scrollH = res.windowHeight * 750 / res.windowWidth;
				}
			});
		},
		onLoad() {
			this.getTeacher();
		},
		methods: {
			refresherrefresh() {
				this.refresherTriggered = true;
				this.page = this.page + 1
				this.getTeacher();
				setTimeout(() => {
					this.refresherTriggered = false;
				}, 1000);
			},
			getTeacher() {
				teacherApi.getPageList(this.page, this.limit).then(response => {
					this.teacherList = response.data.items
					if (this.teacherList.length > 0) {
						this.kongkong = false
					}
				})
			},
			viewteacherInfo(teacherId) {
				this.$tab.navigateTo('/pages/teacher/detail?teacherId=' + teacherId)
			}
		},
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

	.introduce {
		display: -webkit-box;
		-webkit-box-orient: vertical;
		-webkit-line-clamp: 2;
		overflow: hidden;
		text-overflow: ellipsis;
	}
</style>