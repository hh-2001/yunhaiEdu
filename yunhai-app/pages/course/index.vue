<template>
	<view class="container">
		<!-- #ifdef H5 -->
		<scroll-view class="liveinfo-wrap" scroll-y :style="{height:scrollH+'rpx'}">
			<!-- #endif -->
			<!-- #ifndef H5 -->
			<scroll-view @scrolltolower="refresherrefresh" class="liveinfo-wrap" scroll-y
				:style="{height:scrollH+'rpx'}">
				<!-- #endif -->
				<view @click="viewcourseInfo(item.id)" class="live-list" v-for="(item, index) in courseList"
					:key="index">
					<view class="live-list-img-wrap">
						<image class="live-list-img" :src="item.cover" mode="aspectFill"></image>
						<template v-if="item.sort == undefined">
							<text class="course-title-icon">课程</text>
						</template>
						<template v-else-if="item.sort == 0">
							<text class="course-title-icon">内容</text>
						</template>
						<template v-else-if="item.sort == 1">
							<text class="course-title-icon">套餐</text>
						</template>
						<template v-else>
							<text class="course-title-icon">直播</text>
						</template>
					</view>
					<view class="live-list-info">
						<view class="live-c-title">{{item.title}}</view>
						<!-- <template v-if="item.sort == 0">
							<view class="tuwen-image" v-if="item.lesson == '图文自学'">
								<image class="tuwen-image" src="../../static/tuwenzixue.png"></image>
							</view>
							<view class="tuwen-image" v-if="item.lesson == '视频自学'">
								<image class="tuwen-image" src="../../static/shipinzixue.png"></image>
							</view>
							<view class="tuwen-image" v-if="item.lesson == '音频自学'">
								<image class="tuwen-image" src="../../static/yinpinzixue.png"></image>
							</view>
						</template>
						<template v-else>
							<view class="row">
								<view class="live-status living-status" v-if="item.islive == 1">
									{{item.lesson}}
								</view>
								<view class="live-status" v-else>
									<template v-if="item.lesson.length == 0">
										尚未添加内容
									</template>
									<template v-else>
										{{item.lesson}}
									</template>
								</view>
								<image v-if="item.ismaterial == 1" class="jiaocai-image"
									src="../../static/hanjiaocai.png">
								</image>
								<view class="jiaocai-text" v-if="item.ismaterial == 1">含教材</view>
							</view>
						</template> -->
						<template>
							<view class="live-status ">
								视频
							</view>
						</template>
						<view class="live-teacher-price">
							<image class="live-teacher-avatar" :src="item.avatar" mode="aspectFill"></image>
							<text class="teacher-name">{{item.teacherName}}</text>
							<view class="price-wrap">
								<text v-if="item.price == 0">免费</text>
								<text v-else class="numPrice">
									{{'¥' + item.price}}
								</text>
							</view>
						</view>

					</view>
				</view>
			</scroll-view>
			<template v-if="kongkong == true">
				<view :class="{xiangziwrap : (kongkong == true)}">
					<image class="xiangzi" src="../../static/images/xiangzi.png" mode="aspectFill"></image>
					<text class="xiangzi_txt">暂无相关课程</text>
				</view>
			</template>
	</view>
</template>

<script>
	import courseApi from '@/api/course.js'
	import loadmore from '../../components/common/load-more.vue'

	export default {
		components: {
			loadmore
		},
		data() {
			return {
				courseList: [],
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
			this.getCourse();
		},
		methods: {
			refresherrefresh() {
				this.refresherTriggered = true;
				this.page = this.page + 1
				this.getCourse();
				setTimeout(() => {
					this.refresherTriggered = false;
				}, 1000);
			},
			getCourse() {
				courseApi.getPageList(this.page, this.limit).then(resp => {
					if (this.courseList.length > 0) {
						// 这是ES6的数组语法糖，用于合并数组
						this.courseList = [...this.courseList, ...resp.data.items];
					} else {
						this.courseList = resp.data.items
					}
					if (this.courseList.length > 0) {
						this.kongkong = false
					}
				})
			},
			viewcourseInfo(courseId) {
				this.$tab.navigateTo('/pages/course/detail?courseId=' + courseId)
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