package com.whoiszxl.strategy.impl;

import com.whoiszxl.entity.vo.LikeVO;
import com.whoiszxl.enums.LikeTypeEnum;
import com.whoiszxl.strategy.LikeStrategy;

/**
 * TODO
 *
 * @author zhouxiaolong
 * @date 2021/12/8
 */
public class CommentLike extends LikeStrategy {

    @Override
    public void like(LikeVO videoCounterVO) {
        likeByType(videoCounterVO, LikeTypeEnum.COMMENT);
    }

    @Override
    public String getLikeTypeName() {
        return LikeTypeEnum.COMMENT.getTypeName();
    }
}
