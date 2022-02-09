package com.whoiszxl.event;

/**
 * 领域事件发布服务
 *
 * @author whoiszxl
 * @date 2022/1/24
 */
public interface MemberDomainEventPublisher {

    /**
     * 发布用户登录成功的事件
     * @param memberLoginSuccessEvent
     */
    public void publishMemberLoginSuccessEvent(MemberLoginSuccessEvent memberLoginSuccessEvent);

    /**
     * 发布用户关注成功的事件
     * @param followSuccessEvent
     */
    public void publishFollowSuccessEvent(FollowSuccessEvent followSuccessEvent);
}
