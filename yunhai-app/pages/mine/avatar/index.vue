<template>
	<view class="container">
		<view class="flex imageArea" @click="updateImg()">
			<image v-if="ucenter.avatar" :src="ucenter.avatar"></image>
			<image v-else src="../../../static/images/profile.jpg"></image>
		</view>
		<view>
			<button type="primary" @click="update()" style='margin-top: 30rpx;'> 提交 </button>
		</view>
	</view>

</template>

<script>
	import config from '@/config'
	import store from "@/store"
	import storage from '@/utils/storage'
	import constant from '@/utils/constant'
	import ucenterApi from "@/api/ucenter.js"
	import {
		getToken
	} from "../../../utils/auth"
	const baseUrl = config.baseUrl
	export default {
		/**
		 * 页面的初始数据
		 */
		data() {
			return {
				ucenter: {
					avatar: store.getters.avatar,
				},
			}
		},
		methods: {
			updateImg() {
				var _this = this
				uni.chooseImage({
					sourceType: ['album'], //从相册选择
					success: chooseImageRes => {
						console.log('成功', chooseImageRes);
						const tempFilePaths = chooseImageRes.tempFilePaths;
						uni.uploadFile({
							url: baseUrl + '/eduoss/fileoss/upload',
							//仅为示例，非真实的接口地址
							filePath: tempFilePaths[0],
							name: 'file',
							header: {
								accessToken: getToken(),
								platform: 2,
								type: 1
							},
							formData: {
								category: 3
							},
							success: res => {
								// console.log('上传成功', JSON.parse(res.data));
								// uploadFile上传成功后，根据和后台的约定msgCode判断接口调用状态
								let data = JSON.parse(res.data)
								this.ucenter.avatar = data.data.url
							}
						});
					},
					fail: err => {
						this.myToast('图片上传失败', 'none');
					}
				});
			},
			update() {
				// 更新当前页面数据
				ucenterApi.updateUcenterInfo(this.ucenter, null).then(resp => {
					if (resp.success) {
						storage.set(constant.avatar, this.ucenter.avatar)
						console.log("成功")
					}
					uni.showToast({
						title: "修改成功",
						icon: 'success'
					})
					uni.navigateBack()
				})
			}
		}
	}
</script>

<style>
	.imageArea{
		width: 100%;
		margin: 5%;
	}
</style>