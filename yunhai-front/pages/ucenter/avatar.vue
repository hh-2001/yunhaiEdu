<template>
    <div class="containerAvatar">
        <div class="user-info-head" @click="editCropper()"><img v-bind:src="ucenter.avatar" title="点击上传头像"
                class="img-circle img-lg" /></div>
        <el-dialog :title="title" :visible.sync="open" width="400px" append-to-body >
            <el-row>
                <el-col>
                    <el-upload :show-file-list="false" :on-success="handleAvatarSuccess" :before-upload="beforeAvatarUpload"
                        :action="BASE_API + '/eduoss/fileoss/upload'" class="avatar-uploader">
                        <img :src="ucenter.avatar" width="80%" />
                    </el-upload>
                </el-col>
            </el-row>
            <br />
            <el-row>
                <el-col :lg="{ span: 2, offset: 6 }" :sm="2" :xs="2">
                    <el-button type="primary" size="small" @click="uploadImg()">提 交</el-button>
                </el-col>
            </el-row>
        </el-dialog>
    </div>
</template>
<script>
import ucenterApi from "@/api/ucenter";

export default {
    props: {
        ucenter: {
            type: Object
        }
    },
    data() {
        return {
            // 是否显示弹出层
            open: false,
            // 是否显示cropper
            visible: false,
            // 弹出层标题
            title: "修改头像",
            BASE_API: "http://localhost:8222",
        };
    },
    methods: {
        // 编辑头像
        editCropper() {
            this.open = true;
        },
        //上传封面成功调用的方法
        handleAvatarSuccess(resp, file) {
            this.ucenter.avatar = resp.data.url;
        },
        //上传之前要调用的方法
        beforeAvatarUpload(file) {
            const isJPG = file.type === "image/jpeg";
            const isLt2M = file.size / 1024 / 1024 < 2;
            if (!isJPG) {
                this.$message.error("上传头像图片只能是 JPG 格式!");
            }
            if (!isLt2M) {
                this.$message.error("上传头像图片大小不能超过 2MB!");
            }
            return isJPG && isLt2M;
        },
        uploadImg() {
            ucenterApi.updateUcenterInfo(this.ucenter,null).then(resp => {
                if (resp.data.success) {
                    this.$message({
                        message: "修改头像成功",
                        type: "success",
                    });
                    this.$router.go(0);
                }else{
                    this.$message({
                        message: resp.message,
                        type: "fail",
                    });
                    this.open=false
                }
            })
        }
    },
    
}
</script>
<style>
.user-info-head {
    position: relative;
    display: inline-block;
    height: 120px;
}
.img-lg {
    width: 120px;
    height: 120px;
}
.img-circle {
    border-radius: 50%;
}
.user-info-head:hover:after {
    content: '+';
    position: absolute;
    left: 0;
    right: 0;
    top: 0;
    bottom: 0;
    color: #eee;
    background: rgba(0, 0, 0, 0.5);
    font-size: 24px;
    font-style: normal;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    cursor: pointer;
    line-height: 110px;
    border-radius: 50%;
}
</style>