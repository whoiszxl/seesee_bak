package com.whoiszxl.strategy.impl;

import com.whoiszxl.entity.vo.LikeVO;
import com.whoiszxl.enums.LikeTypeEnum;
import com.whoiszxl.strategy.LikeStrategy;
import org.springframework.stereotype.Component;

/**
 * TODO
 *
 * @author zhouxiaolong
 * @date 2021/12/8
 */
@Component
public class VideoLike extends LikeStrategy {

    @Override
    public void like(LikeVO videoCounterVO) {
        likeByType(videoCounterVO, LikeTypeEnum.VIDEO);
    }

    @Override
    public String getLikeTypeName() {
        return LikeTypeEnum.VIDEO.getTypeName();
    }
}
