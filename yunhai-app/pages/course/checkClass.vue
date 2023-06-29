<!-- 选择年级 -->
<template>
	<view>
			
		<view class="check-class-wrap">
	
			<view class="check-title">
				选择你想看的课程类别
			</view>
			
			<view class="check-title-two">
				<text>随时可以更改, 请放心选择</text>
			</view>
			
			<view class="border-bottom"></view>
			
			<!-- 课程 -->
			<view class="check-nianji">
				<!-- 学级 -->
				<view class="school" v-for="(item, index) in subjectNestedList" :key="item.id">
					<view class="one-vertical">
						<text>{{item.title}}</text>
					</view>
					<view class="two-vertical">
						<button @click="checkClass(im.id, im.title)" v-for="(im, idx) in item.children" :key="im.id"
						:class="currentIndex === im.title ? 'bg-click' : ''">
							{{im.title}}
						</button>
					</view>	
				</view>
				
			</view>
		</view>
		
	</view>
</template>

<script>
	import courseApi from '@/api/course.js'
	import storage from '@/utils/storage'
	import constant from '@/utils/constant'
	import store from "@/store"
	
	export default {
		data() {
			return {
				currentIndex: '',
				class: '',
				subjectNestedList: [], // 一级分类列表
			}
		},
		onLoad(option) {
			//获取课程分类
			this.initSubject()
			this.currentIndex = store.getters.courseClass
		},
		methods: {
			initSubject() {
				courseApi.getAllSubject().then((resp) => {
					this.subjectNestedList = resp.data.items;
				});
			},
			checkClass(id, title) {
				// 切换选择分类
				storage.set(constant.courseClass, title)
				this.$tab.reLaunch("/pages/index")
			}
		}
	}
</script>

<style>
	
	.check-class-wrap {
		width: 90%;
		margin: 0 auto;
	}
	
	.check-title {
		font-size: 45rpx;
		font-weight: bold;
		text-align: center;
	}
	
	.check-title-two {
		font-size: 28rpx;
		color: #969696;
		text-align: center;
		margin-top: 15rpx;
		margin-bottom: 30rpx;
	}
	
	.border-bottom {
		margin: 50rpx 0;
	}
	
	/********** 年级 **********/
	.school {
		margin-bottom: 55rpx;
	}
	
	.school::after {
		display: block;
		clear: both;
		height: 0;
		content: "";
		visibility: hidden;
		overflow: hidden;
	}
	
	.school > view {
		float: left;
		font-size: 28rpx;
	}
	
	.school > view button {
		text-align: center;
		height: 70rpx;
		line-height: 70rpx;
		margin-bottom: 28rpx;
		background-color: #F5F5F5;
		border: none;
		border-radius: 40rpx;
		font-size: 28rpx;
		color: #969696;
	}
	
	button::after{
		border: none;
	}
	
	.school > .one-vertical button {
		background-color: #FFFFFF;
		border-radius: 0;
		font-weight: bold;
	}
	
	.school > view.one-vertical {
		text-align: center;
		color: #000000;
		width: 180rpx;
		height: 70rpx;
		line-height: 70rpx;
	}
	
	.school .two-vertical {
		/* margin-right: 50rpx; */
		width: 480rpx;
	}
	
	.school .two-vertical button {
		width: 188rpx;
		float: left;
		margin-right: 50rpx;
	}
	
	.bg-click {
		background-color: #38E1AB !important;
		color: #FFFFFF !important;
	}
	
	
	
</style>
