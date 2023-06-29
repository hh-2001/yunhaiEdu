<template>
    <div class="containerAvatar">
        <el-table :data="courseList" style="width: 100%">
            <el-table-column prop="title" label="课程名称" width="180">
            </el-table-column>
            <el-table-column prop="status" label="课程状态" width="180">
            </el-table-column>
            <el-table-column prop="version" label="课程版本">
            </el-table-column>
            <el-table-column prop="teacherName" label="讲师名称">
            </el-table-column>
            <el-table-column prop="career" label="讲师头衔">
            </el-table-column>
            <el-table-column prop="gmtCreate" label="收藏时间">
            </el-table-column>
            <el-table-column>
                <template slot-scope="scope">
                    <el-button type="primary" size="mini" icon="el-icon-edit" @click="toCourse(scope.row.courseId)">继续学习</el-button>
                </template>
            </el-table-column>
        </el-table>
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
            //课程列表
            courseList: [],
        };
    },
    methods: {
        getCourseCollect() {
            ucenterApi.getCourseCollect().then(resp => {
                this.courseList = resp.data.data.items
            })
        },
        toCourse(id) {
            this.$router.push({
                name: 'course-id',
                params: {
                    id: id
                }
            })
        }
    },
    created() {
        this.getCourseCollect()
    }
}
</script>
<style></style>