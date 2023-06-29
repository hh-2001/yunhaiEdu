<template>
  <div class="dashboard-container">
    <el-row>
      <el-col :span="24">
        <div class="showTime"></div>
      </el-col>
    </el-row>
    <!-- 第一 -->
    <el-row :gutter="20">
      <el-col :span="8">

        <el-card class="box-card panel" shadow="hover">
          <div slot="header" class="clearfix" style="color: black; font-size: 28px; font-weight: bold;text-align:center">
            <span>注册人数</span>
          </div>
          <div id="chart" class="chartBody" ></div>
          <div class="panel-footer"></div>
        </el-card>
        <el-card class="box-card panel" shadow="hover">
          <div slot="header" class="clearfix" style="color: black; font-size: 28px; font-weight: bold;text-align:center">
            <span>课程分类</span>
          </div>
          <div id="courseClass" class="chartBody" ></div>
          <div class="panel-footer"></div>
        </el-card>
      </el-col>
      <el-col :span="8"><h3> </h3></el-col>
      <el-col :span="8">
        <el-card class="box-card panel" shadow="hover">
          <div slot="header" class="clearfix" style="color: black; font-size: 28px; font-weight: bold;text-align:center">
            <span>权限状态</span>
          </div>
          <div id="menuStatus" class="chartMenu"></div>
          <div class="panel-footer"></div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import echarts from "echarts";
import staApi from "@/api/sta.js";
import menuApi from "@/api/acl/menu.js";

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
    ClassChart() {
      staApi.getCourseClass().then(resp => {
        var classChart = echarts.init(
          document.getElementById("courseClass"),
          "light"
        );
        classChart.setOption({
          backgroundColor: "white",
          tooltip: {},
          series: [
            {
              name: "比例",
              type: "pie",
              radius: "55%",
              data: resp.data.items,
            },
          ],
        });
      })

    },
    menuChart() {
      menuApi.getNestedTreeList().then(resp => {
        var menuChart = echarts.init(
          document.getElementById("menuStatus"),
          "light"
        );
        console.log(resp.data.items)
        menuChart.setOption({
          backgroundColor: "white",
          tooltip: {
            trigger: 'item',
            triggerOn: 'mousemove'
          },
          series: [
            {
              type: 'tree',
              data: resp.data.items,
              top: '1%',
              left: '15%',
              bottom: '1%',
              right: '20%',
              symbolSize: 7,
              label: {
                position: 'left',
                verticalAlign: 'middle',
                align: 'right',
                fontSize: 15
              },
              leaves: {
                label: {
                  position: 'right',
                  verticalAlign: 'middle',
                  align: 'left'
                }
              },
              emphasis: {
                focus: 'descendant'
              },
              expandAndCollapse: true,
              animationDuration: 550,
              animationDurationUpdate: 750
            }
          ]
        });
      })
    }
  },
  created() {
    const date = new Date();
    let year = date.getFullYear()
    let month = date.getMonth() + 1
    let day = date.getDate()
    const NOW_MONTHS_AGO = `${year}-${month}-${day}`
    this.searchObj.begin = NOW_MONTHS_AGO
    this.searchObj.end = NOW_MONTHS_AGO
    this.getNowDate();

  },
  mounted() {
    this.menuChart();
    this.showChart();
    this.ClassChart();
  }
}
</script>

<style rel="stylesheet/scss" lang="scss" scoped>  .dashboard-container {
    height: 100%;

    &-container {
      margin: 30px;
    }

    &-text {
      font-size: 30px;
      line-height: 46px;
    }
  }

  .chart-container {
    width: 100%;
  }

  .showTime {
    width: 100%;
    font-size: 36px;
    color: black;
    text-align: center;
  }

  .el-row {
    margin: 10px 5px;
  }

  .el-card {
    text-align: center;
    background-color: rgba(255, 255, 255, 0.925);
    margin-bottom: 30px;
  }

  .clearfix {
    width: 100%;
  }

  .chartBody {
    left: 0;
    height: 20rem;
  }
  .chartMenu{
    left: 0;
    height: 50rem;
  }
  </style>
