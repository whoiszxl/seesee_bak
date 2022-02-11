package com.whoiszxl.command.impl;

import com.whoiszxl.aggregate.model.VideoComment;
import com.whoiszxl.aggregate.repository.VideoCommentRepository;
import com.whoiszxl.command.CommentApplicationService;
import com.whoiszxl.command.cmd.LikeCommand;
import com.whoiszxl.command.cmd.PublishCommentCommand;
import com.whoiszxl.command.converter.CommentCommandConverter;
import com.whoiszxl.enums.LikeTypeEnum;
import com.whoiszxl.enums.VideoCounterStatusEnum;
import com.whoiszxl.strategy.LikeFactory;
import com.whoiszxl.utils.AuthUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

    @Autowired
    private LikeFactory likeFactory;

    @Override
    public void commentLike(String commentId) {
        Long memberId = AuthUtils.getMemberId();

        LikeCommand likeCommand = new LikeCommand();
        likeCommand.setId(Long.parseLong(commentId));
        likeCommand.setMemberId(memberId);
        likeCommand.setLikeType(LikeTypeEnum.COMMENT.getCode());
        likeCommand.setStatus(VideoCounterStatusEnum.INCR.getCode());

        likeFactory.getLikeStrategy(likeCommand.getLikeType()).like(likeCommand);
    }

    @Override
    public void commentLikeDislike(String commentId) {
        Long memberId = AuthUtils.getMemberId();

        LikeCommand likeCommand = new LikeCommand();
        likeCommand.setId(Long.parseLong(commentId));
        likeCommand.setMemberId(memberId);
        likeCommand.setLikeType(LikeTypeEnum.COMMENT.getCode());
        likeCommand.setStatus(VideoCounterStatusEnum.DECR.getCode());

        likeFactory.getLikeStrategy(likeCommand.getLikeType()).like(likeCommand);
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
