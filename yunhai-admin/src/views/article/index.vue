<template>
    <div class="app-container">
        <div>
            <el-button type="primary" @click="handleAdd()">添加</el-button>
        </div>
        <el-table :data="articleList" style="width: 100%" stripe v-loading="listLoading">
            <el-table-column prop="articleId" label="序号" width="70" align="center" />
            <el-table-column prop="articleName" label="文章标题" width="200">
            </el-table-column>
            <el-table-column label="文章封面" width="200">
                <template slot-scope="scope">
                    <img :src="scope.row.cover" style="width: 50%;height: 50%;" />
                </template>
            </el-table-column>
            <el-table-column prop="articleType" label="文章类别" width="200" />
            <el-table-column prop="gmtCreate" label="添加时间" width="250" />
            <el-table-column prop="createName" label="创作人" width="160" />
            <el-table-column prop="description" label="简介" width="160" />
            <el-table-column label="操作" align="center">
                <template slot-scope="scope">
                    <el-button type="primary">
                        <a :href="BASE_API + '/eduservice/article/export/' + scope.row.articleId">下载</a>
                    </el-button>
                    <el-button type="default" @click="handleUpdate(scope.row.articleId)">更新</el-button>
                    <el-button type="danger" @click="removeArticle(scope.row.articleId)">删除</el-button>
                </template>
            </el-table-column>
        </el-table>
        <!-- 弹窗信息 -->
        <el-dialog :visible.sync="dialogFormVisible" :title="title">
            <el-form ref="article" :model="article" :rules="articleValidateRules" label-width="120px">
                <el-form-item label="文章标题" prop="articleName">
                    <el-input v-model="article.articleName" />
                </el-form-item>
                <el-form-item label="文章类别" prop="articleType">
                    <el-input v-model="article.articleType" />
                </el-form-item>
                <el-form-item label="文章封面">
                    <el-upload :show-file-list="false" :on-success="handleAvatarSuccess" :before-upload="beforeAvatarUpload"
                        :action="BASE_API + '/eduoss/fileoss/upload'" class="avatar-uploader">
                        <img :src="article.cover" />
                    </el-upload>
                </el-form-item>
                <el-form-item label="文章介绍" prop="description">
                    <el-input type="textarea" :rows="4" placeholder="请输入内容" v-model="article.description" />
                </el-form-item>
            </el-form>
            <div slot="footer" class="dialog-footer">
                <el-button @click="close()">取 消</el-button>
                <el-button type="primary" @click="operaArticle()">确 定</el-button>
            </div>
        </el-dialog>
        <!-- 分页组件 -->
        <el-pagination :current-page="page" :total="total" :page-size="limit" :page-sizes="[5, 10, 20, 30, 40, 50, 100]"
            style="padding: 30px 0; text-align: center;" layout="sizes, prev, pager, next, jumper, ->, total, slot"
            @current-change="fetchData" @size-change="changeSize" />
    </div>
</template>
  
<script>
import articleApi from '@/api/article.js';

export default {
    name: 'article',
    data() {
        return {
            title: "",
            dialogFormVisible: false,
            BASE_API: process.env.BASE_API, // 接口API地址
            article: {},
            articleId: null,
            listLoading: true, // 数据是否正在加载
            page: 1,
            limit: 10,
            total: 0,
            articleList: [],
            articleValidateRules: {
                name: [{ required: true, trigger: 'blur', message: '菜单名必须输入' }],
                path: [{ required: true, trigger: 'blur', message: '菜单路径必须输入' }],
                component: [{ required: true, trigger: 'blur', message: '组件名称必须输入' }]
            },
        };
    },
    methods: {
        fetchData(page = 1) {
            // 异步获取远程数据（ajax）
            this.page = page
            articleApi.getPageList(this.page, this.limit).then(
                response => {
                    this.articleList = response.data.items
                    this.total = response.data.total
                    // 数据加载并绑定成功
                    this.listLoading = false
                }
            )
        },
        removeArticle(articleId) {
            this.$confirm('此操作将永久删除该记录, 是否继续?', '提示', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'warning'
            }).then(() => { // promise
                // 点击确定，远程调用ajax
                return articleApi.removeArticle(articleId)
            }).then((response) => {
                this.fetchData(this.page)
                if (response.success) {
                    this.$message({
                        type: 'success',
                        message: '删除成功!'
                    })
                }
            }).catch(() => {
                this.$message({
                    type: 'info',
                    message: '已取消删除'
                })
            })
        },
        handleAdd() {
            this.dialogFormVisible = true;
            this.title = "添加文章信息";
        },
        handleUpdate(articleId) {
            this.title = "更新文章信息";
            articleApi.getArticle(articleId).then(resp => {
                this.article = resp.data.item
                this.articleId = this.article.articleId
                if (resp.code === 20000) {
                    this.dialogFormVisible = true
                }
            })
        },
        operaArticle() {
            console.log(this.articleId)
            if (this.articleId === null) {
                articleApi.addArticle(this.article).then(resp => {
                    this.$message({
                        type: 'success',
                        message: '新增成功!'
                    })
                })
            } else {
                articleApi.updateArticle(this.article).then(resp => {
                    this.$message({
                        type: 'success',
                        message: '更新成功!'
                    })
                    
                })
            }
            this.dialogFormVisible = false
            this.article = {}
            this.articleId = null
            this.fetchData()
        },
        close() {
            this.dialogFormVisible = false
            this.article = {}
        },

        //上传封面成功调用的方法
        handleAvatarSuccess(resp, file) {
            this.article.cover = resp.data.url;
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
        // 当页码发生改变的时候
        changeSize(size) {
            this.limit = size
            this.fetchData(1)
        },
    },
    created() {
        this.fetchData()
    }
}
</script>
  
<style rel="stylesheet/scss" lang="scss" scoped>
.avatar-uploader img {
    width: 12rem;
    height: 12rem;
}
</style>
  