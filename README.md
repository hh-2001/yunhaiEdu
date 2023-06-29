# 云海在线平台

### 开发环境:

| springBoot         | 2.2.1.RELEASE  |
| ------------------ | -------------- |
| springCloud        | Hoxton.RELEASE |
| springCloudAlibaba | 2.2.0.RELEASE  |
| node               | 16.20.0        |
| npm                | 6.14.12        |

数据库文件: 在common/sql/src/main/java/com/hhz/sql/all

### 启动流程

1.把nacos.sql和yunhaiedu.sql两个文件导入mysql数据库

2.下载nacos，修改application.properties文件

```properties
server.port=8848
spring.datasource.platform=mysql
db.num=1
db.url.0=jdbc:mysql://127.0.0.1:3306/nacos?characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&useUnicode=true&useSSL=false&serverTimezone=UTC
db.user.0=root
db.password.0=123456
```

3.在nacos下的bin下，启动cmd命令行调用startup.cmd

4.在浏览器输入localhost:8848/nacos网址，用户名和密码：nacos，然后修改nacos下的服务配置文件redis、ES和mysql。

5.启动redis和ES（若不需要分布式搜索和数据同步服务可以不启动）

6.分别进入yunhai-main和yunhai-front，执行npm i 命令进行依赖下载。

7.启动service_edu、service_ucenter、service_acl服务(若要使用视频，订单服务需要启动完其他的微服务，oss和vod的服务需要在阿里云购买后在nacos内配置对应的accessId和accessKey)

8.yunhai-main使用npm run dev 启动后台前端页面，yunhai-front使用yarn dev 启动前台前端页面，yunhai-app直接使用hbuilder打开（可以直接启动web版本和微信小程序）

### 技术栈:

#### 后端：

##### springBoot+springCloud+springCloudAlibaba

##### Nacos注册配置中心



#### 数据库：

##### Mysql8.0 , Redis , ElaticSearch



#### 前端：

##### 后台：vue+vuex+webpack+elementUI

##### 前台：nuxt



#### App：

##### uniapp



### 效果图:

##### 后台：

<img src="mdImage\首页-后.png" alt="首页-后" style="zoom:33%;" />

##### 前台：

<img src="mdImage\首页.png" alt="首页" style="zoom:33%;" />

app:

| <img src="mdImage\app-首页.png" alt="app-首页" style="zoom:50%;" /> | <img src="mdImage\app-课程详情.png" alt="app-课程详情" style="zoom:50%;" /> |
| :----------------------------------------------------------: | :----------------------------------------------------------: |
| <img src="D:\Users\Desktop\pdf\yunhai-edu\mdImage\app-搜索.png" alt="app-搜索" style="zoom:50%;" /> | <img src="D:\Users\Desktop\pdf\yunhai-edu\mdImage\app-视频播放.png" alt="app-视频播放" style="zoom:50%;" /> |

