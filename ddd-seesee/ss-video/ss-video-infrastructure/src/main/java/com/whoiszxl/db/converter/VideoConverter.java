package com.whoiszxl.db.converter;

import com.whoiszxl.aggregate.model.Video;
import com.whoiszxl.db.model.VideoPO;
import com.whoiszxl.dozer.DozerUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * 视频实体转换器
 *
 * @author whoiszxl
 * @date 2022/1/24
 */
@Component
public class VideoConverter {

    @Autowired
    private DozerUtils dozerUtils;


    public Video poToDomain(VideoPO videoPO) {
        Video video = dozerUtils.map(videoPO, Video.class);
        return video;
    }

    public VideoPO domainToPo(Video video) {
        VideoPO videoPO = dozerUtils.map(video, VideoPO.class);
        return videoPO;
    }
}
