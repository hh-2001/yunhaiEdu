<template>
    <div class="containerAvatar">
        <el-table :data="orderList" style="width: 100%">
            <el-table-column prop="courseTitle" label="课程名称" width="180">
            </el-table-column>
            <el-table-column prop="teacherName" label="讲师名称">
            </el-table-column>
            <el-table-column prop="totalFee" label="金额">
            </el-table-column>
            <el-table-column label="支付方式">
                <template slot-scope="scope">
                    {{ scope.row.payType == 1 ? "微信支付" : "支付宝支付" }}
                </template>
            </el-table-column>
            <el-table-column label="支付状态" width="180">
                <template slot-scope="scope">
                    {{ scope.row.status == 0 ? "未支付" : "已支付" }}
                </template>
            </el-table-column>
            <el-table-column prop="gmtCreate" label="订单创建时间">
            </el-table-column>
            <el-table-column>
                <template slot-scope="scope">
                    <router-link :to="'/orders/' + scope.row.orderNo" v-if="scope.row.status == 0">
                        <el-button type="primary" size="mini" icon="el-icon-edit">继续支付</el-button>
                    </router-link>
                    <router-link :to="'/orders/detail/' + scope.row.orderNo" v-else>
                        <el-button type="primary" size="mini" icon="el-icon-edit">订单详情</el-button>
                    </router-link>
                </template>
            </el-table-column>
        </el-table>
        <el-pagination :current-page="page" :total="total" :page-size="limit" :page-sizes="[5, 10, 20, 30, 40, 50, 100]"
            style="padding: 30px 0; text-align: center;" layout="sizes, prev, pager, next, jumper, ->, total, slot"
            @current-change="fetchData" @size-change="changeSize" />
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
            listLoading: true, // 数据是否正在加载
            //课程列表
            orderList: [],
            page: 1, //当前页
            limit: 10, //每页显示记录数
            total: 0,
        };
    },
    methods: {
        // 当页码发生改变的时候
        changeSize(size) {
            console.log(size)
            this.limit = size
            this.fetchData(1)
        },
        // 加载讲师列表数据
        fetchData(page = 1) {
            console.log('翻页。。。' + page)
            // 异步获取远程数据（ajax）
            this.page = page

            ucenterApi.getOrderInfo(this.page, this.limit).then(
                response => {
                    this.orderList = response.data.data.items
                    this.total = response.data.data.total

                    // 数据加载并绑定成功
                    this.listLoading = false
                }
            )
        },

    },
    created() {
        this.fetchData()
    }
}
</script>
<style></style>