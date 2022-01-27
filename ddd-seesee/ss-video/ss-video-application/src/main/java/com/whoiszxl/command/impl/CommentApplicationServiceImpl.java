package com.whoiszxl.command.impl;

import com.whoiszxl.adapter.model.FollowerAdapterDTO;
import com.whoiszxl.aggregate.model.Video;
import com.whoiszxl.aggregate.model.VideoComment;
import com.whoiszxl.aggregate.repository.VideoCommentRepository;
import com.whoiszxl.command.CommentApplicationService;
import com.whoiszxl.command.cmd.PublishCommentCommand;
import com.whoiszxl.command.converter.CommentCommandConverter;
import com.whoiszxl.utils.AuthUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 评论应用服务接口实现
 *
 * @author whoiszxl
 * @date 2022/1/26
 */
@Service
public class CommentApplicationServiceImpl implements CommentApplicationService {

    @Autowired
    private CommentCommandConverter commentCommandConverter;

    @Autowired
    private VideoCommentRepository videoCommentRepository;

    @Override
    public void commentLike(Long commentId) {

    }

    @Override
    public void commentLikeDislike(Long commentId) {

    }

    @Override
    public void commentPublish(PublishCommentCommand publishCommentCommand) {
        Long memberId = AuthUtils.getMemberId();

        //落库
        VideoComment videoComment = commentCommandConverter.commandToDomain(publishCommentCommand);
        videoComment.bindMemberId(memberId);
        videoCommentRepository.save(videoComment);

        //TODO 发布领域事件

    }
}
