<template>
    <el-form ref="form" :model="temp" :rules="rules" label-width="80px">
        <el-form-item label="旧密码" prop="oldPassword">
            <el-input v-model="temp.oldPassword" placeholder="请输入旧密码" type="password" show-password />
        </el-form-item>
        <el-form-item label="新密码" prop="newPassword">
            <el-input v-model="temp.newPassword" placeholder="请输入新密码" type="password" show-password />
        </el-form-item>
        <el-form-item label="确认密码" prop="confirmPassword">
            <el-input v-model="temp.confirmPassword" placeholder="请确认新密码" type="password" show-password />
        </el-form-item>
        <el-form-item>
            <el-button type="primary" size="mini" @click="update">保存</el-button>
        </el-form-item>
    </el-form>
</template>
  
<script>
import { updateUserInfo } from "@/api/login.js";

export default {
    props: {
        user: {
            type: Object
        }
    },
    data() {
        const equalToPassword = (rule, value, callback) => {
            if (this.temp.newPassword !== value) {
                callback(new Error("两次输入的密码不一致"));
            } else {
                callback();
            }
        };
        return {
            temp: {
                oldPassword: undefined,
                newPassword: undefined,
                confirmPassword: undefined
            },
            // 表单校验
            rules: {
                oldPassword: [
                    { required: true, message: "旧密码不能为空", trigger: "blur" }
                ],
                newPassword: [
                    { required: true, message: "新密码不能为空", trigger: "blur" },
                    { min: 6, max: 20, message: "长度在 6 到 20 个字符", trigger: "blur" }
                ],
                confirmPassword: [
                    { required: true, message: "确认密码不能为空", trigger: "blur" },
                    { required: true, validator: equalToPassword, trigger: "blur" }
                ]
            }
        };
    },
    methods: {
        update() {
            this.user.password = this.temp.confirmPassword;
            updateUserInfo(this.user, this.temp.oldPassword).then(resp => {
                console.log(resp.success)
                if (resp.success) {
                    this.logout();
                } else {
                    this.$message({
                        message: resp.message,
                        type: "fail",
                    });
                }
            })
        },
        logout() {
            this.$store.dispatch('LogOut').then(() => {
                location.reload() // 为了重新实例化vue-router对象 避免bug
            })
        }
    }
};
</script>
  