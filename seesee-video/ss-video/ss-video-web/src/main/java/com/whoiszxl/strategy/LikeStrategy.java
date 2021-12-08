package com.whoiszxl.strategy;

import com.whoiszxl.constants.RedisKeyPrefixConstants;
import com.whoiszxl.entity.vo.LikeVO;
import com.whoiszxl.enums.VideoCounterStatusEnum;
import com.whoiszxl.enums.LikeTypeEnum;
import com.whoiszxl.utils.RedisUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * 点赞策略
 *
 * @author whoiszxl
 * @date 2021/12/8
 */
@Component
public abstract class LikeStrategy {

    @Autowired
    protected RedisUtils redisUtils;

    protected void likeByType(LikeVO videoCounterVO, LikeTypeEnum likeTypeEnum) {
        //video:video_like:
        String redisKey = RedisKeyPrefixConstants.VIDEO_PREFIX + likeTypeEnum.getTypeName() + ":" + videoCounterVO.getId();
        String countKey = redisKey + ":count";
        String setKey = redisKey + ":set";

        //如果是新增,添加一条记录到hash里
        if(VideoCounterStatusEnum.INCR.getCode().equals(videoCounterVO.getStatus())) {
            if(Boolean.FALSE.equals(redisUtils.sIsMember(setKey,videoCounterVO.getMemberId() + ""))) {
               redisUtils.sAdd(setKey, videoCounterVO.getMemberId() + "");
                redisUtils.incrBy(countKey, 1);
            }
        }else {
            if(Boolean.TRUE.equals(redisUtils.sIsMember(setKey, videoCounterVO.getMemberId() + ""))) {
                redisUtils.incrBy(countKey, -1);
                redisUtils.sRemove(setKey, videoCounterVO.getMemberId() + "");
                if(redisUtils.sSize(setKey) == 0) {
                    redisUtils.delete(setKey);
                }
            }
        }
    }

    public abstract void like(LikeVO videoCounterVO);

    public abstract String getLikeTypeName();

}
