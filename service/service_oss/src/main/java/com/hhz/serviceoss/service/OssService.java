package com.hhz.serviceoss.service;

import org.springframework.web.multipart.MultipartFile;

public interface OssService {
    //上传头像到oss
    String uploadFileAvatar(MultipartFile file);

    //上传头像，通过base方式
    String uploadFileAvatarBase(MultipartFile file);
}
