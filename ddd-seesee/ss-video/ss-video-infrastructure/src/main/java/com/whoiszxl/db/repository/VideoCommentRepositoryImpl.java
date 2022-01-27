package com.whoiszxl.db.repository;

import com.whoiszxl.aggregate.model.VideoComment;
import com.whoiszxl.aggregate.repository.VideoCommentRepository;
import com.whoiszxl.db.converter.VideoCommentConverter;
import com.whoiszxl.db.mapper.VideoCommentMapper;
import com.whoiszxl.db.model.VideoCommentPO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Objects;

/**
 * 评论仓储接口实现
 *
 * @author whoiszxl
 * @date 2022/1/26
 */
@Service
public class VideoCommentRepositoryImpl implements VideoCommentRepository {

    @Autowired
    private VideoCommentMapper videoCommentMapper;

    @Autowired
    private VideoCommentConverter videoCommentConverter;

    @Override
    public void delete(Long id) {
        videoCommentMapper.deleteById(id);
    }

    @Override
    public VideoComment byId(Long id) {
        VideoCommentPO videoCommentPO = videoCommentMapper.selectById(id);
        VideoComment videoComment = videoCommentConverter.poToDomain(videoCommentPO);
        return videoComment;
    }

    @Override
    public VideoComment save(VideoComment videoComment) {
        VideoCommentPO videoCommentPO = videoCommentConverter.domainToPo(videoComment);
        if(Objects.isNull(videoCommentPO.getId())) {
            videoCommentMapper.insert(videoCommentPO);
        }else {
            videoCommentMapper.updateById(videoCommentPO);
        }
        return videoComment;
    }
}
