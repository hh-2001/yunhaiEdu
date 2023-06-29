package com.hhz.vod.controller;

import com.aliyun.oss.ClientException;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.vod.model.v20170321.*;
import com.hhz.base.exceptionhandler.EduException;
import com.hhz.commonutils.R;
import com.hhz.vod.Utils.ConstantVodUtils;
import com.hhz.vod.Utils.InitVodCilent;
import com.hhz.vod.pojo.VideoVo;
import com.hhz.vod.service.VodService;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/eduvod/video")
@CrossOrigin
public class VodController {

    @Autowired
    private VodService vodService;

    /**
     * 上传视频到阿里云
     *
     * @param file
     * @return
     */
    @PostMapping("uploadAlyVideo")
    public R uploadAlyiVideo(@RequestBody MultipartFile file) {
        //返回上传视频id
        Map<String, Object> res = vodService.uploadVideoAly(file);
        return R.ok().data("video", res);
    }

    /**
     * 删除阿里云视频
     *
     * @param id 视频Id
     * @return
     */
    @DeleteMapping("removeAlyVideo/{id}")
    public R removeAlyVideo(@PathVariable String id) {
        try {
            //初始化对象
            DefaultAcsClient client = InitVodCilent.initVodClient(ConstantVodUtils.ACCESS_KEY_ID, ConstantVodUtils.ACCESS_KEY_SECRET);
            //创建删除视频request对象
            DeleteVideoRequest request = new DeleteVideoRequest();
            //向request设置视频id
            request.setVideoIds(id);
            //调用初始化对象的方法实现删除
            client.getAcsResponse(request);
            return R.ok();
        } catch (Exception e) {
            e.printStackTrace();
            throw new EduException(20001, "删除视频失败");
        }
    }

    /**
     * 删除多个阿里云视频
     *
     * @param videoIdList 视频Id列表
     * @return
     */
    @DeleteMapping("delete-batch")
    public R deleteBatch(@RequestParam("videoIdList") List<String> videoIdList) {
        vodService.removeMoreAlyVideo(videoIdList);
        return R.ok();
    }

    /**
     * 根据视频Id获取视频凭证
     *
     * @param id 视频Id
     * @return
     */
    @GetMapping("getPlayAuth/{id}")
    public R getPlayAuth(@PathVariable String id) {
        try {
            //创建初始化对象
            DefaultAcsClient client =
                    InitVodCilent.initVodClient(ConstantVodUtils.ACCESS_KEY_ID, ConstantVodUtils.ACCESS_KEY_SECRET);
            //创建获取凭证request和response对象
            GetVideoPlayAuthRequest request = new GetVideoPlayAuthRequest();
            //向request设置视频id
            request.setVideoId(id);
            //调用方法得到凭证
            GetVideoPlayAuthResponse response = client.getAcsResponse(request);
            String playAuth = response.getPlayAuth();
            return R.ok().data("playAuth", playAuth);
        } catch (Exception e) {
            throw new EduException(20001, "获取凭证失败");
        }
    }

    @GetMapping("getVideoInfo/{id}")
    public R getVideoInfo(@PathVariable String id){
        try {
            //创建初始化对象
            DefaultAcsClient client =
                    InitVodCilent.initVodClient(ConstantVodUtils.ACCESS_KEY_ID, ConstantVodUtils.ACCESS_KEY_SECRET);
            //创建获取凭证request和response对象
            GetPlayInfoRequest request = new GetPlayInfoRequest();
            //向request设置视频id
            request.setVideoId(id);
            //调用方法得到凭证
            GetPlayInfoResponse response = client.getAcsResponse(request);
            VideoVo videoVo = vodService.getVideoVo(response);
            return R.ok().data("item", videoVo);
        } catch (Exception e) {
            throw new EduException(20001, "获取视频信息失败");
        }
    }
}
