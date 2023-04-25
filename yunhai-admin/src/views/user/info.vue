<template>
    <el-form ref="form" :model="user" :rules="rules" label-width="80px">
        <el-form-item label="用户昵称" prop="nickname">
            <el-input v-model="user.username" maxlength="30" />
        </el-form-item>
        <el-form-item label="手机号码" prop="mobile">
            <el-input v-model="user.mobile" maxlength="11" />
        </el-form-item>
        <el-form-item label="个性签名" prop="sign">
            <el-input v-model="user.sign" maxlength="50" />
        </el-form-item>
        <el-form-item>
            <el-button type="primary" size="mini" @click="update">保存</el-button>
        </el-form-item>
    </el-form>
</template>
  
<script>
import {updateUserInfo} from "@/api/login.js";

export default {
    props: {
        user: {
            type: Object
        }
    },
    data() {
        return {
            // 表单校验
            rules: {
                nickname: [
                    { required: true, message: "用户昵称不能为空", trigger: "blur" }
                ],
                email: [
                    { required: true, message: "邮箱地址不能为空", trigger: "blur" },
                    {
                        type: "email",
                        message: "请输入正确的邮箱地址",
                        trigger: ["blur", "change"]
                    }
                ],
                mobile: [
                    { required: true, message: "手机号码不能为空", trigger: "blur" },
                    {
                        pattern: /^1[3|4|5|6|7|8|9][0-9]\d{8}$/,
                        message: "请输入正确的手机号码",
                        trigger: "blur"
                    }
                ]
            }
        };
    },
    methods: {
        update() {
            updateUserInfo(this.user,null).then(resp => {
                if (resp.data.success) {
                    this.$message({
                        message: "修改成功",
                        type: "success",
                    });
                }else{
                    this.$message({
                        message: resp.message,
                        type: "fail",
                    });
                }
            })
        },
        close() {
            this.$tab.closePage();
        }
    }
};
</script>
  