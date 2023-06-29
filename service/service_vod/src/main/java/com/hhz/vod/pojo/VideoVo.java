package com.hhz.vod.pojo;

import lombok.Data;

/**
 * @author: hhz
 * @Date: 2023/5/9
 * @Time: 10:48
 * @Description: 视频信息（通过原生视频组件）小程序端，安卓端
 */
@Data
public class VideoVo {
    /** 视频ID */
    private String videoId;
    /** 视频状态 */
    private String status;
    /** 视频封面地址 */
    private String coverURL;
    /** 视频时长 */
    private String duration;
    /** 视频标题 */
    private String title;
    /** 视频类型： video视频，audio音频*/
    private String mediaType;

    /** 视频流宽度 */
    private Long width;
    /** 视频流高度 */
    private Long height;
    /** 视频地址 */
    private String playURL;
    /** 视频清晰度 */
    private String definition;
    /** 是否进行加密 */
    private Long encrypt;
    /** 加密方式：AliyunVoDEncryption：阿里云加密，HLSEncryption：HLS加密 */
    private String encryptType;
}
