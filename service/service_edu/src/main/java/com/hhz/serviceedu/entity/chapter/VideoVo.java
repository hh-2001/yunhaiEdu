package com.hhz.serviceedu.entity.chapter;

import lombok.Data;

@Data
public class VideoVo {

    private String id;

    private String title;

    private String videoSourceId;//视频id

    private Boolean isFree;
}
