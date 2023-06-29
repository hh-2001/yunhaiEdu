<template>
	<view class="container">
			<!-- #ifdef H5 -->
			<button @click="exportPdf('1')">导出</button>
			<!-- 新闻列表 -->
			<scroll-view class="liveinfo-wrap" scroll-y :style="{height:scrollH+'rpx'}">
				<!-- #endif -->
				<!-- #ifndef H5 -->
				<scroll-view :refresher-threshold="45" :refresher-enabled="true" :refresher-triggered="refresherTriggered"
					@refresherrefresh="refresherrefresh" class="liveinfo-wrap" scroll-y :style="{height:scrollH+'rpx'}">
					<!-- #endif -->
				<view @click="viewNewsInfo(item.articleId)" class="live-list" v-for="(item, index) in articleList" :key="index">
						<view class="live-list-img-wrap">
							<image class="live-list-img" :src="item.cover" mode="aspectFill"></image>
							<template v-if="item.sort == undefined">
								<text class="course-title-icon">国文</text>
							</template>
							<template v-else>
								<text class="course-title-icon">外文</text>
							</template>
						</view>
						<view class="live-list-info">
							<view class="live-c-title">{{item.articleName}}</view>
							
							<template>
								<view  class="live-status ">
									文章
								</view>
							</template>
							<view class="live-teacher-price">
								<text class="view-nums-title">访问量:</text>
								<text class="view-nums">222</text>
								<view class="price-wrap">
									<text class="add-time">{{item.gmtCreate}}</text>
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
	import loadmore from '../../components/common/load-more.vue'
	import articleApi from '@/api/article.js'
	export default {
		components: {
			loadmore
		},
		onLoad(options) {
			this.getArticle()
		},
		onReady() {
			var that = this;
			uni.getSystemInfo({
				success: function(res) {
					that.scrollH = res.windowHeight * 750 / res.windowWidth;
				}
			});
		},
		data() {
			return {
				articleList: [],
				page: 1,
				limit: 10,
				scrollH: 0,
				refresherTriggered: false,
				kongkong:false,
				limit:10,
			}
		},
		methods: {
			exportPdf(articleId){
				articleApi.exportPdf(articleId).then(resp =>{
					this.$message = "success"
				})
			},
			refresherrefresh() {
				this.refresherTriggered = true;
				this.page = this.page + 1
				this.getTeacher();
				setTimeout(() => {
					this.refresherTriggered = false;
				}, 1000);
			},
			getArticle() {
				articleApi.getPageList(this.page, this.limit).then(resp => {
					this.articleList = resp.data.items
				})
			},
			viewNewsInfo(articleId) {
				this.$tab.navigateTo('/pages/article/detail?articleId=' + articleId)
			}
		}
	}
</script>

<style>
	/* 大班课/内容列表公共样式 */
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