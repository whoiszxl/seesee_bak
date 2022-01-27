package com.whoiszxl.command;

import com.whoiszxl.command.cmd.PublishCommentCommand;

/**
 * 评论应用服务接口
 *
 * @author whoiszxl
 * @date 2022/1/26
 */
public interface CommentApplicationService {

    /**
     * 评论点赞
     * @param commentId
     */
    void commentLike(Long commentId);

    /**
     * 评论取消点赞
     * @param commentId
     */
    void commentLikeDislike(Long commentId);

    /**
     * 提交评论
     * @param publishCommentCommand
     */
    void commentPublish(PublishCommentCommand publishCommentCommand);
}
