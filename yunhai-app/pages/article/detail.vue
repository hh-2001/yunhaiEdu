<template>
	<view class="" style="height: 100%;">
		<view><a :href="baseUrl+'eduservice/article/export/'+articleId">导出我</a></view>
		<view class="articleContent">
				<mp-html :content="articleVo.articleDescription" />
			</view>
		<view class="course-bottom">
			<view class="about-teacher-wrap">
				<view class="ateacher-info">
					<text class="at-info-item at-info-name">{{articleVo.articleName}}</text>
					<text class="at-info-item">{{articleVo.articleType}}</text>
				</view>
				<image class="live-teacher-avatar" :src="articleVo.cover" mode="aspectFill"></image>
				<view class="ateacher-info">
					<text class="at-info-item at-info-name">{{articleVo.createName}}</text>
					<text class="at-info-item">创作人</text>
				</view>
				<text class="teacher-arow iconfont icon-jinrujiantou"></text>
			</view>
			<scroll-view :scroll-y="kongkong == true? false:true" :style="'height:' + scrollH+'rpx;'">
				<view class="xiepingjia">
					<view class="pingjia-all-star">
						<!-- <text v-for="(item, index) in stararr"
							v-if="index < Math.floor(parseInt(com_data.star))" :key="index"
							class="pingjia-star iconfont icon-pingfenxingxing checkstar"></text>
						<text class="score checkstar">{{com_data.star}}</text> -->
					</view>
					<view><text></text></view>
					<view class="pingjia-title" @click="openpinglun">写评价</view>
					<!-- <view class="pingjia-title" @click="openpinglun">写评价</view> -->
				</view>
				<view v-if="kongkong == false">
					<view class="com-list-wrap">
						<view v-for="(item, index) in commentList" class="com-item-wrap">
							<view class="com-user-star">
								<image class="com-user-avatar" :src="item.avatar" mode="aspectFill"></image>
								<view class="new1">
									<view class="new2">
										<text class="com-user-nickname">{{item.nickname}}</text>
									</view>
									<!-- 点赞星数 -->
									<!-- <view class="list-star-wrap star-wrap">
										<text v-for="(it, idx) in stararr"
											v-if="idx < Math.floor(parseInt(item.star))" :key="idx"
											class="pingjia-star iconfont icon-pingfenxingxing checkstar"></text>
									</view> -->
								</view>
								<view class="com-time">{{item.gmtCreate}}</view>
							</view>
							<template v-if="item.content.length == 0">
								<view class="com-content-kong">{{item.content}}</view>
							</template>
							<template v-else>
								<view class="com-content">{{item.content}}</view>
							</template>
							<view class="pingjialine"></view>
						</view>
					</view>
				</view>
			
				<view v-else>
					<view class="kong-wrap">
						<view class="kong-info">
							<image class="kong-ping-img" src="/static/images/xiangzi.png" mode="aspectFill">
							</image>
							<view class="kong-ping-txt">还未收到评价</view>
						</view>
					</view>
				</view>
			</scroll-view>
		</view>
	</view>
</template>

<script>
	import articleApi from '@/api/article.js'
	import commentApi from '@/api/comment.js'
	import mpHtml from '../../components/mp-html/mp-html.vue'
	import config from '@/config'
	const baseUrl = config.baseUrl
	export default {
		components: {
			mpHtml
		},
		data() {
			return {
				articleId: "",
				articleVo:{},
				current: 0,
				activeColor: '#007aff',
				styleType: 'button',
				commentList: [],
				page: 1,
				limit: 10,
				kongkong: false,
				scrollH: 0,
				scrollallH: 0,
				tabIndex: 0,
			}
		},
		onLoad(options) {
			this.articleId = options.articleId
			var that = this;
			uni.getSystemInfo({
				success: function(res) {
					that.scrollH = res.windowHeight * 750 / res.windowWidth - 600;
				}
			});
			this.getArticleDetail()
			// this.initComment()
		},
		methods: {
			getArticleDetail() {
				articleApi.getArticleInfoByid(this.articleId).then((resp) => {
					this.articleVo = resp.data.item
				});
			},
			onClickItem(e) {
				if (this.current !== e.currentIndex) {
					this.current = e.currentIndex
				}
			},
			initComment() {
				commentApi
					.getPageList(this.page, this.limit, this.articleId)
					.then((response) => {
						this.commentList = response.data.items;
					});
			},
			addComment() {
				this.comment.courseId = this.courseId;
				this.comment.teacherId = this.course.ownerId;
				comment.addComment(this.comment).then((response) => {
					if (response.data.success) {
						this.$message({
							message: "评论成功",
							type: "success",
						});
						this.comment.content = "";
						this.initComment();
					}
				});
			},
			toPlay(vid) {
				this.$tab.navigateTo('video?vid=' + vid+"&courseId="+this.courseId)
			},
			//切换选项卡
			changeTab(index) {
				this.tabIndex = index
			},
			//滑动
			onChangeTab(e) {
				//切换当前索引
				this.tabIndex = e.detail.current
			},
			openpinglun(){
				console.log("开启评论")
			},
			viewTeacherInfo(teacherId) {
				this.$tab.navigateTo("/pages/teacher/detail?teacherId="+teacherId)
			}
		}
	}
</script>

<style>
	/* 课程详情页公共样式 */
	@import url("/static/css/course_info/course_info.css");
	@import url("/static/common/css/pingjia.css");

	page {
		width: 100%;
		height: 100%;
	}

	.course-info-item {
		width: 100%;
		height: 100%;
	}

	@media screen and (min-width: 500px) {
		.image {
			width: 35%;
			height: 50%;
			border-radius: 8rpx;
		}
	}

	.live-teacher-avatar {
		width: 35rpx;
		height: 35rpx;
		border-radius: 50%;
		margin-top: 13rpx;
	}
	.content {
			border: 1px solid #4e83ff;
			border-radius: 15px;
			width: 95%;
			height: 600rpx;
			margin: 0 auto;
			margin-top: 10rpx;
		}
</style>