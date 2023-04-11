CREATE TABLE `statistics_daily` (
  `id` char(19) NOT NULL COMMENT '主键',
  `date_calculated` varchar(20) NOT NULL COMMENT '统计日期',
  `register_num` int(11) NOT NULL DEFAULT '0' COMMENT '注册人数',
  `login_num` int(11) NOT NULL DEFAULT '0' COMMENT '登录人数',
  `video_view_num` int(11) NOT NULL DEFAULT '0' COMMENT '每日播放视频数',
  `course_num` int(11) NOT NULL DEFAULT '0' COMMENT '每日新增课程数',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `statistics_day` (`date_calculated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='网站统计日数据';

#
# Data for table "statistics_daily"
#

INSERT INTO `statistics_daily` VALUES ('1078490017163833345','2018-12-28',0,0,154,170,'2018-12-28 11:17:12','2019-09-09 12:12:12'),('1087142127818768386','2019-01-02',2,0,167,177,'2019-01-21 08:17:36','2019-09-09 12:12:12'),('1087198321809457153','2019-01-01',1,0,130,189,'2019-01-21 12:00:54','2019-09-09 12:12:12'),('1087198383973236738','2019-01-03',0,0,114,130,'2019-01-21 12:01:09','2019-09-09 12:12:12'),('1087451681764982785','2019-01-04',0,0,118,155,'2019-01-22 04:47:39','2019-09-09 12:12:12'),('1087455336471785473','2019-01-05',0,0,184,186,'2019-01-22 05:02:11','2019-09-09 12:12:12'),('1105339962460491777','2019-03-01',0,143,168,136,'2019-03-12 13:29:18','2019-03-12 13:29:18'),('1105339977027309569','2019-03-02',0,165,171,158,'2019-03-12 13:29:21','2019-03-12 13:29:21'),('1105339990738489346','2019-03-03',0,143,147,194,'2019-03-12 13:29:25','2019-03-12 13:29:25'),('1105340000544772098','2019-03-04',0,155,106,153,'2019-03-12 13:29:27','2019-03-12 13:29:27'),('1105340011244441602','2019-03-05',0,186,102,155,'2019-03-12 13:29:30','2019-03-12 13:29:30'),('1105340020929089538','2019-03-06',0,140,192,129,'2019-03-12 13:29:32','2019-03-12 13:29:32'),('1105340029800042497','2019-03-07',0,186,139,116,'2019-03-12 13:29:34','2019-03-12 13:29:34'),('1105340038696161282','2019-03-08',0,120,166,112,'2019-03-12 13:29:36','2019-03-12 13:29:36'),('1105340049441968129','2019-03-09',0,182,147,119,'2019-03-12 13:29:39','2019-03-12 13:29:39'),('1105340059738984449','2019-03-10',0,199,141,103,'2019-03-12 13:29:41','2019-03-12 13:29:41'),('1105340070438653953','2019-03-11',0,127,137,156,'2019-03-12 13:29:44','2019-03-12 13:29:44'),('1105340080307851266','2019-03-12',0,167,123,132,'2019-03-12 13:29:46','2019-03-12 13:29:46'),('1105340090047025153','2019-03-13',0,106,132,103,'2019-03-12 13:29:48','2019-03-12 13:29:48'),('1105340100075606017','2019-03-14',0,166,180,118,'2019-03-12 13:29:51','2019-03-12 13:29:51'),('1105340110511034370','2019-03-15',0,114,151,185,'2019-03-12 13:29:53','2019-03-12 13:29:53'),('1105340121412030466','2019-03-16',0,134,105,126,'2019-03-12 13:29:56','2019-03-12 13:29:56'),('1105340132833120258','2019-03-17',0,169,106,131,'2019-03-12 13:29:59','2019-03-12 13:29:59'),('1105340145659301890','2019-03-18',0,120,106,163,'2019-03-12 13:30:02','2019-03-12 13:30:02'),('1105340153578147842','2019-03-19',0,146,155,153,'2019-03-12 13:30:03','2019-03-12 13:30:03'),('1105340162436517890','2019-03-20',0,127,181,186,'2019-03-12 13:30:06','2019-03-12 13:30:06'),('1105340171517186050','2019-03-21',0,106,134,145,'2019-03-12 13:30:08','2019-03-12 13:30:08'),('1105340181034061825','2019-03-22',0,161,182,143,'2019-03-12 13:30:10','2019-03-12 13:30:10'),('1105340190072786946','2019-03-23',0,183,101,182,'2019-03-12 13:30:12','2019-03-12 13:30:12'),('1105340199426084865','2019-03-24',0,117,100,102,'2019-03-12 13:30:14','2019-03-12 13:30:14'),('1105340209261727745','2019-03-25',0,116,103,160,'2019-03-12 13:30:17','2019-03-12 13:30:17'),('1105340217935548418','2019-03-26',0,101,119,150,'2019-03-12 13:30:19','2019-03-12 13:30:19'),('1105340225967640577','2019-03-27',0,129,141,181,'2019-03-12 13:30:21','2019-03-12 13:30:21'),('1105340234075230209','2019-03-28',0,113,179,158,'2019-03-12 13:30:23','2019-03-12 13:30:23'),('1105340242837131265','2019-03-29',0,117,131,101,'2019-03-12 13:30:25','2019-03-12 13:30:25'),('1105340252395950082','2019-03-30',0,153,187,174,'2019-03-12 13:30:27','2019-03-12 13:30:27'),('1105340261958963201','2019-03-31',0,179,135,199,'2019-03-12 13:30:29','2019-03-12 13:30:29'),('1105372743634898945','2019-01-06',0,113,143,148,'2019-03-12 15:39:34','2019-03-12 15:39:34'),('1105372754380705793','2019-01-07',0,173,158,153,'2019-03-12 15:39:36','2019-03-12 15:39:36'),('1105372762526044162','2019-01-08',0,135,199,131,'2019-03-12 15:39:38','2019-03-12 15:39:38'),('1105372771229224961','2019-01-09',0,161,107,162,'2019-03-12 15:39:40','2019-03-12 15:39:40'),('1105372780922261505','2019-01-10',0,182,196,135,'2019-03-12 15:39:42','2019-03-12 15:39:42'),('1105372790103592961','2019-01-11',0,123,194,102,'2019-03-12 15:39:45','2019-03-12 15:39:45'),('1105372798626418689','2019-01-12',0,185,106,180,'2019-03-12 15:39:47','2019-03-12 15:39:47'),('1165','2018-01-01',583,26,236,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1166','2018-01-02',583,26,236,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1167','2018-01-03',584,26,236,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1168','2018-01-04',584,26,237,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1169','2018-01-05',585,26,237,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1170','2018-01-06',585,26,237,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1171','2018-01-07',586,26,237,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1172','2018-01-08',586,26,237,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1173','2018-01-09',587,26,238,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1174','2018-01-10',587,26,238,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1175','2018-01-11',588,27,238,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1176','2018-01-12',588,27,238,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1177','2018-01-13',589,27,238,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1178','2018-01-14',589,27,239,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1179','2018-01-15',590,27,239,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1180','2018-01-16',590,27,239,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1181','2018-01-17',591,27,239,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1182','2018-01-18',591,27,239,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1183','2018-01-19',592,27,240,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1183991737299263490','2019-10-01',0,145,149,153,'2019-10-15 14:23:22','2019-10-15 14:23:22'),('1183999299272904705','2019-10-03',0,125,102,153,'2019-10-15 14:53:25','2019-10-15 14:53:25'),('1183999309477646338','2019-10-04',0,103,194,161,'2019-10-15 14:53:28','2019-10-15 14:53:28'),('1183999318919024642','2019-10-05',0,173,174,147,'2019-10-15 14:53:30','2019-10-15 14:53:30'),('1183999331409661954','2019-10-06',0,129,197,173,'2019-10-15 14:53:33','2019-10-15 14:53:33'),('1183999342897860610','2019-10-07',0,184,125,169,'2019-10-15 14:53:36','2019-10-15 14:53:36'),('1183999351588458498','2019-10-08',0,173,143,138,'2019-10-15 14:53:38','2019-10-15 14:53:38'),('1183999360316805122','2019-10-09',0,161,158,117,'2019-10-15 14:53:40','2019-10-15 14:53:40'),('1183999367480676353','2019-10-10',0,190,166,135,'2019-10-15 14:53:42','2019-10-15 14:53:42'),('1184','2018-01-20',592,27,240,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1184030117693284353','2019-10-11',0,182,199,193,'2019-10-15 16:55:53','2019-10-15 16:55:53'),('1185','2018-01-21',593,27,240,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1185373213064482818','2019-01-19',6,135,126,167,'2019-10-19 09:52:52','2019-10-19 09:52:52'),('1186','2018-01-22',593,27,240,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1186536619937435650','2019-10-02',0,187,183,108,'2019-10-22 14:55:50','2019-10-22 14:55:50'),('1187','2018-01-23',594,27,240,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1188','2018-01-24',594,27,241,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1189','2018-01-25',595,27,241,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1190','2018-01-26',595,27,241,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1191','2018-01-27',596,27,241,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1192','2018-01-28',596,27,241,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1192253597226455042','2019-11-01',0,129,122,167,'2019-11-07 09:33:03','2019-11-07 09:33:03'),('1192253902756335617','2019-11-02',0,170,192,192,'2019-11-07 09:34:16','2019-11-07 09:34:16'),('1193','2018-01-29',597,27,242,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1194','2018-01-30',597,27,242,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1194060032935493633','2019-11-11',0,121,121,122,'2019-11-12 09:11:11','2019-11-12 09:11:11'),('1194060301425475585','2019-11-10',0,155,187,140,'2019-11-12 09:12:15','2019-11-12 09:12:15'),('1195','2018-01-31',598,27,242,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1196','2018-02-01',598,27,242,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1197','2018-02-02',599,27,242,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1198','2018-02-03',599,27,243,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1199','2018-02-04',600,27,243,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1200','2018-02-05',600,27,243,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1201','2018-02-06',601,27,243,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1202','2018-02-07',601,27,243,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1203','2018-02-08',602,27,244,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1204','2018-02-09',602,27,244,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1205','2018-02-10',603,27,244,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1206','2018-02-11',603,27,244,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1207','2018-02-12',604,27,244,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1208','2018-02-13',604,27,245,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1209','2018-02-14',605,27,245,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1210','2018-02-15',605,27,245,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1211','2018-02-16',606,27,245,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1212','2018-02-17',606,27,245,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1213','2018-02-18',607,27,246,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1214','2018-02-19',607,27,246,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1215','2018-02-20',608,27,246,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1216','2018-02-21',608,27,246,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1217','2018-02-22',609,27,246,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1218','2018-02-23',609,27,247,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1219','2018-02-24',610,27,247,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1220','2018-02-25',610,27,247,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1221','2018-02-26',611,27,247,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1222','2018-02-27',611,27,247,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1223','2018-02-28',612,27,248,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1224','2018-03-01',612,27,248,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1225','2018-03-02',613,28,248,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1226','2018-03-03',613,28,248,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1227','2018-03-04',614,28,248,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1228','2018-03-05',614,28,249,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1229','2018-03-06',615,28,249,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1230','2018-03-07',615,28,249,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1231','2018-03-08',616,28,249,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1232','2018-03-09',616,28,249,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1233','2018-03-10',617,28,250,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1234','2018-03-11',617,28,250,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1235','2018-03-12',618,28,250,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1236','2018-03-13',618,28,250,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1237','2018-03-14',619,28,250,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1238','2018-03-15',619,28,251,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1239','2018-03-16',620,28,251,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1240','2018-03-17',620,28,251,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1241','2018-03-18',621,28,251,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1242','2018-03-19',621,28,251,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1243','2018-03-20',622,28,252,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1244','2018-03-21',622,28,252,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1245','2018-03-22',623,28,252,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1246','2018-03-23',623,28,252,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1247','2018-03-24',624,28,252,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1248','2018-03-25',624,28,253,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1249','2018-03-26',625,28,253,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1250','2018-03-27',625,28,253,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1251','2018-03-28',626,28,253,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1252','2018-03-29',626,28,253,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1253','2018-03-30',627,28,254,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1254','2018-03-31',627,28,254,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1255','2018-04-01',628,28,254,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1256','2018-04-02',628,28,254,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1257','2018-04-03',629,28,254,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1258','2018-04-04',629,28,255,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1259','2018-04-05',630,28,255,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1260','2018-04-06',630,28,255,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1261','2018-04-07',631,28,255,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1262','2018-04-08',631,28,255,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1263','2018-04-09',632,28,256,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1264','2018-04-10',632,28,256,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1265','2018-04-11',633,28,256,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1266','2018-04-12',633,28,256,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1267','2018-04-13',634,28,256,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1268','2018-04-14',634,28,257,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1269','2018-04-15',635,28,257,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1270','2018-04-16',635,28,257,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1271','2018-04-17',636,28,257,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1272','2018-04-18',636,28,257,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1273','2018-04-19',637,28,258,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1274','2018-04-20',637,28,258,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1275','2018-04-21',638,29,258,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1276','2018-04-22',638,29,258,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1277','2018-04-23',639,29,258,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1278','2018-04-24',639,29,259,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1279','2018-04-25',640,29,259,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1280','2018-04-26',640,29,259,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1281','2018-04-27',641,29,259,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1282','2018-04-28',641,29,259,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1283','2018-04-29',642,29,260,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1284','2018-04-30',642,29,260,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1285','2018-05-01',643,29,260,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1286','2018-05-02',643,29,260,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1287','2018-05-03',644,29,260,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1288','2018-05-04',644,29,261,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1289','2018-05-05',645,29,261,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1290','2018-05-06',645,29,261,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1291','2018-05-07',646,29,261,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1292','2018-05-08',646,29,261,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1293','2018-05-09',647,29,262,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1294','2018-05-10',647,29,262,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1295','2018-05-11',648,29,262,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1296','2018-05-12',648,29,262,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1297','2018-05-13',649,29,262,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1298','2018-05-14',649,29,263,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1299','2018-05-15',5,29,263,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1300','2018-05-16',650,29,263,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1301','2018-05-17',651,29,263,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1302','2018-05-18',651,29,263,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1303','2018-05-19',652,29,264,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1304','2018-05-20',652,29,264,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1305','2018-05-21',653,29,264,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1306','2018-05-22',1,29,264,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1307','2018-05-23',654,29,264,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1308','2018-05-24',654,29,265,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1309','2018-05-25',1,29,265,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1310','2018-05-26',655,29,265,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1311','2018-05-27',656,29,265,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1312','2018-05-28',656,29,265,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1313','2018-05-29',657,29,266,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1314','2018-05-30',657,29,266,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1315','2018-05-31',658,29,266,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1316','2018-06-01',658,29,266,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1317','2018-06-02',659,29,266,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1318','2018-06-03',659,29,267,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1319','2018-06-04',660,29,267,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1320','2018-06-05',660,29,267,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1321','2018-06-06',661,29,267,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1322','2018-06-07',661,29,267,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1323','2018-06-08',662,29,268,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1324','2018-06-09',662,29,268,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1325','2018-06-10',663,30,268,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1326','2018-06-11',663,30,268,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1327','2018-06-12',664,30,268,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1328','2018-06-13',664,30,269,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1329','2018-06-14',665,30,269,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1330','2018-06-15',665,30,269,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1331','2018-06-16',666,30,269,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1332','2018-06-17',666,30,269,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1333','2018-06-18',667,30,270,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1334','2018-06-19',667,30,270,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1335','2018-06-20',668,30,270,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1336','2018-06-21',668,30,270,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1337','2018-06-22',669,30,270,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1338','2018-06-23',669,30,271,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1339','2018-06-24',670,30,271,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1340','2018-06-25',670,30,271,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1341','2018-06-26',671,30,271,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1342','2018-06-27',671,30,271,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1343','2018-06-28',672,30,272,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1344','2018-06-29',672,30,272,14,'2018-01-25 06:38:19','2019-09-09 12:12:12'),('1345','2018-06-30',673,30,272,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1346','2018-07-01',673,30,272,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1347','2018-07-02',674,30,272,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1348','2018-07-03',674,30,273,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1349','2018-07-04',675,30,273,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1350','2018-07-05',675,30,273,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1351','2018-07-06',676,30,273,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1352','2018-07-07',676,30,273,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1353','2018-07-08',677,30,274,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1354','2018-07-09',677,30,274,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1355','2018-07-10',678,30,274,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1356','2018-07-11',678,30,274,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1357','2018-07-12',679,30,274,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1358','2018-07-13',679,30,275,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1359','2018-07-14',680,30,275,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1360','2018-07-15',680,30,275,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1361','2018-07-16',681,30,275,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1362','2018-07-17',681,30,275,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1363','2018-07-18',682,30,276,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1364','2018-07-19',682,30,276,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1365','2018-07-20',683,30,276,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1366','2018-07-21',683,30,276,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1367','2018-07-22',684,30,276,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1368','2018-07-23',684,30,277,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1369','2018-07-24',685,30,277,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1370','2018-07-25',685,30,277,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1371','2018-07-26',686,30,277,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1372','2018-07-27',686,30,277,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1373','2018-07-28',687,30,278,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1374','2018-07-29',687,30,278,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1375','2018-07-30',688,31,278,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1376','2018-07-31',688,31,278,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1377','2018-08-01',689,31,278,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1378','2018-08-02',689,31,279,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1379','2018-08-03',690,31,279,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1380','2018-08-04',690,31,279,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1381','2018-08-05',691,31,279,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1382','2018-08-06',691,31,279,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1383','2018-08-07',692,31,280,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1384','2018-08-08',692,31,280,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1385','2018-08-09',1,31,280,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1386','2018-08-10',693,31,280,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1387','2018-08-11',694,31,280,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1388','2018-08-12',694,31,281,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1389','2018-08-13',695,31,281,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1390','2018-08-14',695,31,281,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1391','2018-08-15',696,31,281,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1392','2018-08-16',696,31,281,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1393','2018-08-17',697,31,282,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1394','2018-08-18',697,31,282,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1395','2018-08-19',698,31,282,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1396','2018-08-20',698,31,282,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1397','2018-08-21',699,31,282,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1398','2018-08-22',699,31,283,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1399','2018-08-23',700,31,283,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1400','2018-08-24',700,31,283,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1401','2018-08-25',701,31,283,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1402','2018-08-26',701,31,283,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1403','2018-08-27',702,31,284,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1404','2018-08-28',702,31,284,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1405','2018-08-29',703,31,284,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1406','2018-08-30',703,31,284,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1407','2018-08-31',704,31,284,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1408','2018-09-01',1,31,285,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1409','2018-09-02',705,31,285,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1410','2018-09-03',705,31,285,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1411','2018-09-04',706,31,285,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1412','2018-09-05',706,31,285,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1413','2018-09-06',707,31,286,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1414','2018-09-07',707,31,1,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1415','2018-09-08',708,31,1,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1416','2018-09-09',1,31,1,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1417','2018-09-10',1,31,2,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1418','2018-09-11',709,31,287,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1419','2018-09-12',710,31,287,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1420','2018-09-13',710,31,287,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1421','2018-09-14',711,31,287,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1422','2018-09-15',711,31,287,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1423','2018-09-16',712,31,288,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1424','2018-09-17',712,31,288,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1425','2018-09-18',713,32,288,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1426','2018-09-19',713,32,288,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1427','2018-09-20',714,32,288,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1428','2018-09-21',714,32,289,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1429','2018-09-22',715,32,289,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1430','2018-09-23',715,32,289,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1431','2018-09-24',716,32,1,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1432','2018-09-25',716,32,289,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1433','2018-09-26',717,32,290,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1434','2018-09-27',717,32,290,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1435','2018-09-28',718,32,290,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1436','2018-09-29',718,32,1,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1437','2018-09-30',719,32,290,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1438','2018-10-01',719,32,291,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1439','2018-10-02',720,32,291,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1440','2018-10-03',720,32,291,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1441','2018-10-04',721,32,291,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1442','2018-10-05',721,32,291,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1443','2018-10-06',722,32,292,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1444','2018-10-07',722,32,292,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1445','2018-10-08',1,32,292,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1446','2018-10-09',723,32,292,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1447','2018-10-10',724,32,292,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1448','2018-10-11',724,32,293,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1449','2018-10-12',725,32,293,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1450','2018-10-13',725,32,293,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1451','2018-10-14',726,32,4,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1452','2018-10-15',726,32,293,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1453','2018-10-16',727,32,294,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1454','2018-10-17',727,32,294,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1455','2018-10-18',728,32,294,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1456','2018-10-19',728,32,294,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1457','2018-10-20',729,32,294,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1458','2018-10-21',729,32,295,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1459','2018-10-22',730,32,1,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1460','2018-10-23',730,32,295,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1461','2018-10-24',731,32,295,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1462','2018-10-25',731,32,295,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1463','2018-10-26',732,32,296,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1464','2018-10-27',732,32,296,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1465','2018-10-28',733,32,296,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1466','2018-10-29',2,32,3,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1467','2018-10-30',734,32,296,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1468','2018-10-31',734,32,297,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1469','2018-11-01',735,32,297,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1470','2018-11-02',735,32,297,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1471','2018-11-03',1,32,297,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1472','2018-11-04',736,32,1,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1473','2018-11-05',737,32,298,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1474','2018-11-06',737,32,298,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1475','2018-11-07',738,33,298,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1476','2018-11-08',738,33,169,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1477','2018-11-09',1,33,298,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1478','2018-11-10',739,33,78,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1479','2018-11-11',740,33,299,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1480','2018-11-12',740,33,299,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1481','2018-11-13',741,33,299,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1482','2018-11-14',741,33,299,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1483','2018-11-15',742,33,300,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1484','2018-11-16',742,33,35,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1485','2018-11-17',743,33,300,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1486','2018-11-18',743,33,300,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1487','2018-11-19',744,33,300,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1488','2018-11-20',744,33,301,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1489','2018-11-21',745,33,234,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1490','2018-11-22',456,33,301,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1491','2018-11-23',746,33,301,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1492','2018-11-24',746,33,301,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1493','2018-11-25',747,33,302,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1494','2018-11-26',747,4,302,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1495','2018-11-27',748,33,302,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1496','2018-11-28',748,33,36,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1497','2018-11-29',749,33,302,2,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1498','2018-11-30',749,3,303,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1499','2018-12-01',750,33,303,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1500','2018-12-02',234,33,303,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1501','2018-12-03',751,33,303,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1502','2018-12-04',751,33,303,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1503','2018-12-05',752,6,304,33,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1505','2018-12-07',753,33,55,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1506','2018-12-08',753,33,304,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1507','2018-12-09',754,33,304,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1508','2018-12-10',754,1,305,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1509','2018-12-11',755,33,305,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1510','2018-12-12',755,33,305,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1511','2018-12-13',756,33,305,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1512','2018-12-14',366,33,305,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1513','2018-12-15',757,33,66,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1514','2018-12-16',757,33,306,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1515','2018-12-17',758,33,306,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1516','2018-12-18',758,2,306,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1517','2018-12-19',759,33,306,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1518','2018-12-20',564,33,307,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1519','2018-12-21',760,33,307,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1520','2018-12-22',760,33,307,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1521','2018-12-23',761,33,307,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1522','2018-12-24',761,33,307,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1527','2018-12-29',764,34,308,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1528','2018-12-30',764,34,309,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1529','2018-12-31',765,34,309,14,'2018-01-25 06:38:20','2019-09-09 12:12:12'),('1554','2018-01-01',333,34,314,14,'2018-02-02 08:58:31','2019-09-09 12:12:12'),('1555','2018-01-02',778,34,314,14,'2018-02-02 08:58:31','2019-09-09 12:12:12'),('1556','2018-01-03',778,34,314,14,'2018-02-02 08:58:31','2019-09-09 12:12:12'),('1557','2018-01-04',779,34,314,14,'2018-02-02 08:58:31','2019-09-09 12:12:12'),('1558','2018-01-05',779,34,315,14,'2018-02-02 08:58:31','2019-09-09 12:12:12'),('1559','2018-01-06',780,34,315,14,'2018-02-02 08:58:31','2019-09-09 12:12:12'),('1560','2018-01-07',780,34,315,14,'2018-02-02 08:58:31','2019-09-09 12:12:12'),('1561','2018-01-08',781,34,315,14,'2018-02-02 08:58:31','2019-09-09 12:12:12'),('1562','2018-01-09',781,34,315,14,'2018-02-02 08:58:31','2019-09-09 12:12:12'),('1563','2018-01-10',782,34,316,14,'2018-02-02 08:58:31','2019-09-09 12:12:12'),('1564','2018-01-11',782,34,316,14,'2018-02-02 08:58:31','2019-09-09 12:12:12'),('1565','2018-01-12',783,34,316,14,'2018-02-02 08:58:31','2019-09-09 12:12:12'),('1566','2018-01-13',783,34,316,14,'2018-02-02 08:58:31','2019-09-09 12:12:12'),('1567','2018-01-14',784,34,316,14,'2018-02-02 08:58:31','2019-09-09 12:12:12'),('1568','2018-01-15',784,34,317,14,'2018-02-02 08:58:31','2019-09-09 12:12:12'),('1569','2018-01-16',23,34,317,14,'2018-02-02 08:58:31','2019-09-09 12:12:12'),('1570','2018-01-17',785,34,317,14,'2018-02-02 08:58:31','2019-09-09 12:12:12'),('1571','2018-01-18',786,34,317,14,'2018-02-02 08:58:31','2019-09-09 12:12:12'),('1572','2018-01-19',786,34,317,14,'2018-02-02 08:58:31','2019-09-09 12:12:12'),('1573','2018-01-20',787,2,318,14,'2018-02-02 08:58:31','2019-09-09 12:12:12'),('1574','2018-01-21',787,2,318,14,'2018-02-02 08:58:31','2019-09-09 12:12:12'),('1575','2018-01-22',788,1,318,14,'2018-02-02 08:58:31','2019-09-09 12:12:12'),('1576','2018-01-23',788,35,318,14,'2018-02-02 08:58:31','2019-09-09 12:12:12'),('1577','2018-01-24',789,35,318,14,'2018-02-02 08:58:31','2019-09-09 12:12:12'),('1578','2018-01-25',789,1,319,14,'2018-02-02 08:58:31','2019-09-09 12:12:12'),('1579','2018-01-26',790,1,319,14,'2018-02-02 08:58:31','2019-09-09 12:12:12'),('1580','2018-01-27',531,2,319,14,'2018-02-02 08:58:31','2019-09-09 12:12:12'),('1581','2018-01-28',791,2,319,14,'2018-02-02 08:58:31','2019-09-09 12:12:12'),('1582','2018-01-29',791,2,319,14,'2018-02-02 08:58:31','2019-09-09 12:12:12'),('1583','2018-01-30',2,4,2,14,'2018-02-02 08:58:31','2019-09-09 12:12:12'),('1584','2018-01-31',792,35,320,14,'2018-02-02 08:58:31','2019-09-09 12:12:12'),('1586','2018-02-01',793,4,3,14,'2018-02-25 10:54:34','2019-09-09 12:12:12'),('1587','2018-02-02',794,2,1,14,'2018-02-25 10:54:34','2019-09-09 12:12:12'),('1588','2018-02-03',794,1,4,14,'2018-02-25 10:54:34','2019-09-09 12:12:12'),('1589','2018-02-04',795,35,321,14,'2018-02-25 10:54:34','2019-09-09 12:12:12'),('1590','2018-02-05',795,35,321,14,'2018-02-25 10:54:34','2019-09-09 12:12:12'),('1591','2018-02-06',796,35,321,14,'2018-02-25 10:54:34','2019-09-09 12:12:12'),('1592','2018-02-07',796,35,321,14,'2018-02-25 10:54:34','2019-09-09 12:12:12'),('1593','2018-02-08',797,35,322,14,'2018-02-25 10:54:34','2019-09-09 12:12:12'),('1594','2018-02-09',797,35,322,14,'2018-02-25 10:54:34','2019-09-09 12:12:12'),('1595','2018-02-10',99,35,322,14,'2018-02-25 10:54:34','2019-09-09 12:12:12'),('1596','2018-02-11',798,35,322,14,'2018-02-25 10:54:34','2019-09-09 12:12:12'),('1597','2018-02-12',799,35,322,14,'2018-02-25 10:54:34','2019-09-09 12:12:12'),('1598','2018-02-13',799,35,323,14,'2018-02-25 10:54:34','2019-09-09 12:12:12'),('1599','2018-02-14',800,35,323,14,'2018-02-25 10:54:34','2019-09-09 12:12:12'),('1600','2018-02-15',800,35,323,14,'2018-02-25 10:54:34','2019-09-09 12:12:12'),('1601','2018-02-16',89,35,90,14,'2018-02-25 10:54:34','2019-09-09 12:12:12'),('1602','2018-02-17',801,35,323,14,'2018-02-25 10:54:34','2019-09-09 12:12:12'),('1603','2018-02-18',802,23,324,14,'2018-02-25 10:54:34','2019-09-09 12:12:12'),('1604','2018-02-19',802,2,324,14,'2018-02-25 10:54:34','2019-09-09 12:12:12'),('1605','2018-02-20',803,56,324,14,'2018-02-25 10:54:34','2019-09-09 12:12:12'),('1606','2018-02-21',45,35,89,14,'2018-02-25 10:54:34','2019-09-09 12:12:12'),('1607','2018-02-22',804,35,324,14,'2018-02-25 10:54:34','2019-09-09 12:12:12'),('1608','2018-02-23',804,35,325,14,'2018-02-25 10:54:34','2019-09-09 12:12:12'),('1609','2018-02-24',805,1,3,14,'2018-02-25 10:54:34','2019-09-09 12:12:12'),('1610','2018-05-15',0,0,0,7,'2018-05-16 00:25:27','2019-09-09 12:12:12'),('1611','2018-10-01',0,0,0,7,'2018-10-24 16:17:15','2019-09-09 12:12:12'),('1612','2018-10-02',0,0,0,7,'2018-10-24 16:17:15','2019-09-09 12:12:12'),('1613','2018-10-03',0,0,0,7,'2018-10-24 16:17:15','2019-09-09 12:12:12'),('1614','2018-10-04',0,0,0,7,'2018-10-24 16:17:15','2019-09-09 12:12:12'),('1615','2018-10-05',0,0,0,7,'2018-10-24 16:17:15','2019-09-09 12:12:12');
