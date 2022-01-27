package com.whoiszxl.strategy.impl;

import com.whoiszxl.command.cmd.LikeCommand;
import com.whoiszxl.enums.LikeTypeEnum;
import com.whoiszxl.strategy.LikeStrategy;
import org.springframework.stereotype.Component;

/**
 * TODO
 *
 * @author whoiszxl
 * @date 2021/12/8
 */
@Component
public class VideoLike extends LikeStrategy {

    @Override
    public void like(LikeCommand likeCommand) {
        likeByType(likeCommand, LikeTypeEnum.VIDEO);
    }

    @Override
    public boolean isLike(Long id, Long memberId) {
        return isLike(id, memberId, LikeTypeEnum.VIDEO);
    }

    @Override
    public String getLikeTypeName() {
        return LikeTypeEnum.VIDEO.getTypeName();
    }
}
