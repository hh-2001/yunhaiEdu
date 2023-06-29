<template>
	<view class="container">
		<view class="fl t-infor-box c-desc-content">
			<view class="live_course_bg_wrap">
				<image class="live_course_img" :src="teacher.avatar" mode="aspectFill"></image>
			</view>
			<view class="t-info-intro">
				<h1 class="hLh30">
					<span class="fsize24 c-333">{{teacher.name}}&nbsp;
					</span>
				</h1>
				<view class="mt10">
					<span class="t-tag-bg"><h5>头衔:</h5>{{teacher.career}}</span>
				</view>
				<view class="t-infor-txt">
					<h5>个人简介:</h5>
					<p class="mt20">
						{{teacher.intro}}
					</p>
				</view>
			</view>
		</view>

		<!-- 主讲课程 -->
		<view class="class-content">
			<view class="la-wrap">
				<view class="live-title-wrap">
					<!-- 标题 更多 -->
					<h2 class="live-title">主讲课程</h2>
				</view>
			</view>
			<view class="listline"></view>
			<!-- /无数据提示 开始-->
			<view class="no-data-wrap" v-if="courseList.length==0">
				<em class="icon30 no-data-ico">&nbsp;</em>
				<span class="c-666 fsize14 ml10 vam">没有相关数据</span>
			</view>
			<!-- /无数据提示 结束-->
			<view class="course-wrap" v-else>
				<view @click="toCourse(item.id)" class="live-list" v-for="(item, index) in courseList" :key="index">
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
	import teacherApi from '@/api/teacher.js'
	export default {
		onLoad(options) {
			this.teacherId = options.teacherId;
			this.getTeacher()
		},
		data() {
			return {
				teacher: {
					name: '',
					intro: '',
					career: '',
					level: '',
				},
				courseList: [],
				teacherId: '',
			}
		},
		methods: {
			getTeacher() {
				teacherApi.getTeacherInfoByid(this.teacherId).then(resp => {
					this.teacher = resp.data.item
					this.courseList = resp.data.items
				})
			},
			toCourse(courseId) {
				this.$tab.navigateTo('/pages/course/detail?courseId=' + courseId)
			}
		}
	}
</script>

<style>
	@import url("/static/css//teacher_info/teacher_info.css");
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
</style>