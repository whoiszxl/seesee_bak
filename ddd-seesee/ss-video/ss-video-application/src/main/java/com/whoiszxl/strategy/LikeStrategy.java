package com.whoiszxl.strategy;

import com.whoiszxl.command.cmd.LikeCommand;
import com.whoiszxl.constants.BaseRedisKeyPrefixConstants;
import com.whoiszxl.enums.LikeTypeEnum;
import com.whoiszxl.enums.VideoCounterStatusEnum;
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

    /**
     * 通过点赞类型进行点赞操作
     * @param videoCounterVO
     * @param likeTypeEnum
     */
    protected void likeByType(LikeCommand likeCommand, LikeTypeEnum likeTypeEnum) {
        //video:video_like:
        String redisKey = BaseRedisKeyPrefixConstants.VIDEO_PREFIX + likeTypeEnum.getTypeName() + ":" + likeCommand.getId();
        String countKey = redisKey + ":count";
        String setKey = redisKey + ":set";

        //如果是新增,添加一条记录到hash里
        if(VideoCounterStatusEnum.INCR.getCode().equals(likeCommand.getStatus())) {
            if(Boolean.FALSE.equals(redisUtils.sIsMember(setKey,likeCommand.getMemberId() + ""))) {
               redisUtils.sAdd(setKey, likeCommand.getMemberId() + "");
                redisUtils.incrBy(countKey, 1);
            }
        }else {
            if(Boolean.TRUE.equals(redisUtils.sIsMember(setKey, likeCommand.getMemberId() + ""))) {
                redisUtils.incrBy(countKey, -1);
                redisUtils.sRemove(setKey, likeCommand.getMemberId() + "");
                if(redisUtils.sSize(setKey) == 0) {
                    redisUtils.delete(setKey);
                }
            }
        }
    }


    /**
     * 判断用户是否对此记录进行过点赞
     * @param id 记录ID
     * @param memberId 会员ID
     * @param likeTypeEnum 点赞记录的类型
     * @return 是否点过赞
     */
    protected boolean isLike(Long id, Long memberId, LikeTypeEnum likeTypeEnum) {
        String redisKey = BaseRedisKeyPrefixConstants.VIDEO_PREFIX + likeTypeEnum.getTypeName() + ":" + id + ":set";
        return redisUtils.sIsMember(redisKey, memberId + "");
    }

    public abstract void like(LikeCommand likeCommand);

    public abstract boolean isLike(Long id, Long memberId);

    public abstract String getLikeTypeName();

}
