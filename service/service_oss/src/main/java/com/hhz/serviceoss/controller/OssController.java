package com.hhz.serviceoss.controller;

import cn.hutool.core.codec.Base64;
import com.hhz.commonutils.R;
import com.hhz.serviceoss.service.OssService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@RestController
@RequestMapping("/eduoss/fileoss")
@CrossOrigin
public class OssController {

    @Autowired
    private OssService ossService;

    /**
     * 上传头像
     *
     * @param file 文件
     * @return
     */
    @PostMapping("upload")
    public R uploadOssFile(@RequestBody MultipartFile file) {
        //获取上传文件  MultipartFile
        //返回上传到oss的路径
        String url = ossService.uploadFileAvatar(file);
        return R.ok().data("url", url);
    }

    @PostMapping("uploadBase")
    public R uploadOssByBase(@RequestBody MultipartFile file) throws IOException {
        //String url = ossService.uploadFileAvatar(file);
        String url = ossService.uploadFileAvatarBase(file);
        return R.ok().data("url", url);
    }

}
