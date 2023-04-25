<template>
  <div class="dashboard-container">
    <el-row>
      <el-col :span="24">
        <div class="showTime"></div>
      </el-col>
    </el-row>
    <el-row>
      <el-col :span="12">

        <div id="chart" class="chart" style="height: 500px; width: 100%"></div>

      </el-col>
    </el-row>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import echarts from "echarts";
import staApi from "@/api/sta.js";

export default {
  name: 'Dashboard',
  computed: {
    ...mapGetters([
      'name',
      'roles'
    ])
  },
  data() {
    return {
      searchObj: {
        begin: "",
        end: "",
        type: "register_num",
      },
      btnDisabled: false,
      chart: null,
      title: "",
      xData: [],
      yData: [],
    };
  },
  methods: {
    setChart() {
      // 基于准备好的dom，初始化echarts实例
      this.chart = echarts.init(document.getElementById("chart"));
      // console.log(this.chart)
      // 指定图表的配置项和数据
      var option = {
        title: {
          text: "当日注册人数",
        },
        tooltip: {
          trigger: "axis",
        },
        dataZoom: [
          {
            show: true,
            height: 30,
            xAxisIndex: [0],
            bottom: 30,
            start: 10,
            end: 80,
            handleIcon:
              "path://M306.1,413c0,2.2-1.8,4-4,4h-59.8c-2.2,0-4-1.8-4-4V200.8c0-2.2, 1.8-4, 4-4h59.8c2.2, 0, 4, 1.8, 4, 4V413z",
            handleSize: "110%",
            handleStyle: {
              color: "#d3dee5",
            },
            textStyle: {
              color: "#fff",
            },
            borderColor: "#90979c",
          },
          {
            type: "inside",
            show: true,
            height: 15,
            start: 1,
            end: 35,
          },
        ],

        // x轴是类目轴（离散数据）,必须通过data设置类目数据
        xAxis: {
          type: "category",
          data: this.xData,
        },
        // y轴是数据轴（连续数据）
        yAxis: {
          type: "value",
        },
        // 系列列表。每个系列通过 type 决定自己的图表类型
        series: [
          {
            // 系列中的数据内容数组
            data: this.yData,
            // 折线图
            type: "line",
          },
        ],
      };
      this.chart.setOption(option);
    },
    showChart() {
      staApi.getShowDataByType(this.searchObj).then((resp) => {
        //x轴 时间
        this.xData = resp.data.xlist;
        //y轴 数据
        this.yData = resp.data.ylist;

        //调用下面生成图表方法，改变值
        this.setChart();
      });
    },
    getNowDate() {
      var t = null;
      t = setTimeout(time, 1000); //開始运行
      function time() {
        clearTimeout(t); //清除定时器
        this.dt = new Date();
        var y = this.dt.getFullYear();
        var mt = this.dt.getMonth() + 1;
        var day = this.dt.getDate();
        var h = this.dt.getHours(); //获取时
        var m = this.dt.getMinutes(); //获取分
        var s = this.dt.getSeconds(); //获取秒
        if (document.querySelector(".showTime").innerHTML != null) {
          document.querySelector(".showTime").innerHTML =
            "当前时间：" +
            y +
            "年" +
            mt +
            "月" +
            day +
            "日-" +
            h +
            "时" +
            m +
            "分" +
            s +
            "秒";
        }
        t = setTimeout(time, 1000); //设定定时器，循环运行
      }
    },
  },
  created() {
    const date = new Date();
    let year = date.getFullYear()
    let month = date.getMonth() + 1
    let day = date.getDate()
    const NOW_MONTHS_AGO = `${year}-${month}-${day}`
    this.searchObj.begin = NOW_MONTHS_AGO
    this.searchObj.end = NOW_MONTHS_AGO
    this.showChart();
    this.getNowDate();
  }
}
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
.dashboard {
  &-container {
    margin: 30px;
  }

  &-text {
    font-size: 30px;
    line-height: 46px;
  }
}
.chart-container{
  width: 100%;
}
.showTime{
  width: 100%;
  font-size: 36px;
  text-align: center;
}

</style>
