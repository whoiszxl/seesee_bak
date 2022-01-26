package com.whoiszxl.db.converter;

import com.whoiszxl.aggregate.model.VideoComment;
import com.whoiszxl.db.model.VideoCommentPO;
import com.whoiszxl.dozer.DozerUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * 评论转换器
 *
 * @author whoiszxl
 * @date 2022/1/24
 */
@Component
public class VideoCommentConverter {

    @Autowired
    private DozerUtils dozerUtils;

    public VideoComment poToDomain(VideoCommentPO videoCommentPO) {
        VideoComment videoComment = dozerUtils.map(videoCommentPO, VideoComment.class);
        return videoComment;
    }

    public VideoCommentPO domainToPo(VideoComment memberInfo) {
        VideoCommentPO videoCommentPO = dozerUtils.map(memberInfo, VideoCommentPO.class);
        return videoCommentPO;
    }
}
