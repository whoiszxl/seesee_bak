package com.whoiszxl.command;

/**
 * 评论应用服务接口
 *
 * @author whoiszxl
 * @date 2022/1/26
 */
public interface CommentApplicationService {

    void commentLike(Long commentId);

    void commentLikeDislike(Long commentId);
}
