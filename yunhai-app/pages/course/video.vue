<template>
	<view class="" style="height: 100%;">
		<!-- 定义播放器dom -->
		<!-- <view id="J_prismPlayer" class="prism-player">		</view> -->
		<template v-if="type == 1">
			<view class="video-wrap3">
			<video :src="videoInfo.playURL" class="video-wrap"></video>
		</view>
		</template>
		<template v-if="type == 2">
			<view class="video-wrap3">
			<image :src="videoInfo.coverURL" class="video-wrap1">
			</image>
			<imt-audio autoplay class="imtaudio" :src="videoInfo.playURL"></imt-audio>
		</view>
		</template>
		
		<!-- 使用自定义视频 组件-->
		<view class="course-bottom">
			<view class="flex align-center justify-center font-weight-bold course-info-tab">
				<view class="mx-5 c-info-tabbar" @click="changeTab(index)" v-for="(item, index) in items" :key="index"
					:class="tabIndex === index ? 'text-main font-md' : 'font-md text-light-muted'">
					{{item.name}}
				</view>
			</view>
			<swiper :current="tabIndex" class="swiper-box" :style="{height:scrollH+'rpx'}" @change="onChangeTab">
				<!-- 课程 -->
				<swiper-item class="course-info-item">
					<scroll-view scroll-y :style="{height:scrollH+'rpx'}">
						<view class="row">
							<view class="page_title">{{course.title}}</view>
							<view v-if="sorttype == '图文自学'">
								<image class="course_tag_image" src="../../static/tuwenzixue.png" mode="aspectFit">
								</image>
							</view>
							<view v-if="sorttype == '视频自学'">
								<image class="course_tag_image" src="../../static/shipinzixue.png" mode="aspectFit">
								</image>
							</view>
							<view v-if="sorttype == '语音自学'">
								<image class="course_tag_image" src="../../static/yuyinzixue.png" mode="aspectFit">
								</image>
							</view>
						</view>
						<view class="price-time-stunum">
							<text v-if="course.price == 0" class="free">免费</text>
							<text v-else-if="isbuyCourse == true" class="free">已购买</text>
							<text v-else class="price-wrap-new">
								{{'¥' + course.price}}
							</text>
							<template v-if="course.gmtModified != null || course.gmtModified != ''">
								<!-- <template v-if="liveInfo.add_time.length > 0">
									<text class="time-wrap">{{liveInfo.add_time}}</text>
								</template>
								<template v-else>
									<text class="time-wrap">尚未添加内容</text>
								</template> -->
								<text>{{course.gmtModified}}</text>
							</template>
							<template v-else>
								<text class="time-wrap">尚未添加内容</text>
							</template>
							<text class="stunum-wrap">999人在学</text>
						</view>
						<view class="new_line"></view>
						<view class="about-teacher-wrap">
							<text class="about-title ateacher-title">讲师介绍</text>
							<view class="ateacher-list">
								<view @click="viewTeacherInfo(course.ownerId)" class="ateacher-item">
									<image class="ateacher-img" :src="course.avatar" mode=""></image>
									<image class="dav" src="../../static/dav.png"></image>
									<view class="ateacher-info">
										<text class="at-info-item at-info-name">{{course.teacherName}}</text>
										<text class="at-info-item">主讲老师</text>
									</view>
									<text class="teacher-arow iconfont icon-jinrujiantou"></text>
								</view>
							</view>
						</view>

						<view class="about-live-wrap">
							<text class="about-title alive-title">课程大纲</text>
							<view class="alive-info">
								<ul>
									<!-- 文件目录 -->
									<li class="lh-menu-stair" v-for="chapter in chapterList" :key="chapter.id">
										<text :title="chapter.title" class="current-1">
											<em class="lh-menu-i-1 icon18 mr10"></em>{{ chapter.title }}
										</text>
										<ol class="lh-menu-ol" style="display: block">
											<li class="lh-menu-second ml30" v-for="video in chapter.children"
												:key="video.id">
												<div @click="toPlay(video.videoSourceId)" target="_blank"
													style="cursor: pointer;margin: 5px;">
													<span class="fr" v-if="video.isFree == true">
														<i class="free-icon vam mr10">免费试听</i>
													</span>
													<em class="lh-menu-i-2 icon16 mr5">&nbsp;</em>{{ video.title }}
												</div>
											</li>
										</ol>
									</li>
								</ul>
							</view>
						</view>
					</scroll-view>
				</swiper-item>
				<!-- 评论 -->
				<swiper-item class="course-info-item">
					<scroll-view :scroll-y="kongkong == true? false:true" :style="'height:' + scrollH+'rpx;'">
						<view class="xiepingjia">
							<view class="pingjia-all-star">
								<!-- <text v-for="(item, index) in stararr"
									v-if="index < Math.floor(parseInt(com_data.star))" :key="index"
									class="pingjia-star iconfont icon-pingfenxingxing checkstar"></text>
								<text class="score checkstar">{{com_data.star}}</text> -->
							</view>

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
				</swiper-item>
			</swiper>
		</view>
	</view>
</template>
<script>
	import vodApi from "@/api/vod";
	import courseApi from '@/api/course.js'
	import commentApi from '@/api/comment.js'
	import imtAudio from '@/components/imt-audio/imt-audio.vue';
	
	export default {
		components: {
			imtAudio
		},
		data() {
			return {
				type:1,
				vid: '',
				videoInfo: {},
				courseId: "",
				course: {},
				chapterList: [],
				isbuyCourse: true,
				current: 0,
				activeColor: '#007aff',
				styleType: 'button',
				items: [{
					name: "课程"
				}, {
					name: "评价"
				}],
				commentList: [],
				comment: {
					content: "",
					courseId: "",
					ownerId: "",
				},
				page: 1,
				limit: 10,
				sorttype: '视频自学',
				kongkong: false,
				scrollH: 0,
				scrollallH: 0,
				tabIndex: 0,
			}
		},
		onLoad(options) {
			this.vid = options.vid;
			this.courseId = options.courseId;
			var that = this;
			uni.getSystemInfo({
				success: function(res) {
					that.scrollH = res.windowHeight * 750 / res.windowWidth - 600;
				}
			});
			this.getVideoInfo()
			this.getCourseDetail()
			this.initComment()
		},
		// onLoad(options) {
		// 	
		// 		this.getLive(options.id)
		// 	
		// },
		methods: {
			getCourseDetail() {
				courseApi.getFrontCourseInfo(this.courseId).then((resp) => {
					this.chapterList = resp.data.items
					this.course = resp.data.item
					this.isbuyCourse = resp.data.isBuy
				});
			},
			onClickItem(e) {
				if (this.current !== e.currentIndex) {
					this.current = e.currentIndex
				}
			},
			initComment() {
				commentApi
					.getPageList(this.page, this.limit, this.courseId)
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
				this.$tab.navigateTo('/pages/course/video?vid=' + vid + "&courseId=" + this.courseId)
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
			viewTeacherInfo(teacherId) {
				this.$tab.navigateTo("/pages/teacher/detail?teacherId="+teacherId)
			},
			getVideoInfo() {
				vodApi.getPlayInfo(this.vid).then(resp => {
					this.videoInfo = resp.data.item
					console.log(this.videoInfo)
				})
			}
		},
		onReady() {
			//页面渲染之后  created
			// new Aliplayer({
			// 		id: "J_prismPlayer",
			// 		vid: this.vid, // 视频id
			// 		playauth: this.playAuth, // 播放凭证
			// 		encryptType: "1", // 如果播放加密视频，则需设置encryptType=1，非加密视频无需设置此项
			// 		width: "100%",
			// 		height: "40%",
			// 		// 以下可选设置
			// 		cover: "https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/timg.gif", // 封面
			// 		qualitySort: "asc", // 清晰度排序

			// 		mediaType: "video", // 返回音频还是视频
			// 		autoplay: false, // 自动播放
			// 		isLive: false, // 直播
			// 		rePlay: false, // 循环播放
			// 		preload: true,
			// 		controlBarVisibility: "hover", // 控制条的显示方式：鼠标悬停
			// 		useH5Prism: true, // 播放器类型：html5
			// 	},
			// 	function(player) {
			// 		console.log("播放器创建成功");
			// 	}
			// );
		}
	};
</script>
<style>
	@import url("/static/css/course_info/course_info.css");
	@import url("/static/common/css/pingjia.css");
	@import url("/static/common/css//beisu.css");

	.video-wrap3 {
		width: 100%;
		height: 50%;
	}
	.video-wrap{
		width: 100%;
	}
</style>