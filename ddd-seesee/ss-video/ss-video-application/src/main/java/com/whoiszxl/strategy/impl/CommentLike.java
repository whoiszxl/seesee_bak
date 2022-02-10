package com.whoiszxl.strategy.impl;

import com.whoiszxl.command.cmd.LikeCommand;
import com.whoiszxl.enums.LikeTypeEnum;
import com.whoiszxl.strategy.LikeStrategy;

/**
 * TODO
 *
 * @author whoiszxl
 * @date 2021/12/8
 */
public class CommentLike extends LikeStrategy {

    @Override
    public void like(LikeCommand likeCommand) {
        likeByType(likeCommand, LikeTypeEnum.COMMENT);
    }

    @Override
    public boolean isLike(Long id, Long memberId) {
        return isLike(id, memberId, LikeTypeEnum.COMMENT);
    }

    @Override
    public Integer getLikeCount(Long id) {
        return getLikeCountByType(LikeTypeEnum.COMMENT, id);
    }

    @Override
    public String getLikeTypeName() {
        return LikeTypeEnum.COMMENT.getTypeName();
    }
}
