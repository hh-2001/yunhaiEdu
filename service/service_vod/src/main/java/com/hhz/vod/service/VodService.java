package com.hhz.vod.service;

import com.aliyuncs.vod.model.v20170321.GetPlayInfoResponse;
import com.hhz.vod.pojo.VideoVo;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

public interface VodService {
    /**上传视频到阿里云
     *
     * @param file
     * @return
     */
    Map<String, Object> uploadVideoAly(MultipartFile file);

    /**删除多个阿里云视频的方法
     *
     * @param videoIdList
     */
    void removeMoreAlyVideo(List videoIdList);

    /**
     * 获取视频信息
     * @param response
     * @return
     */
    VideoVo getVideoVo(GetPlayInfoResponse response);
}
