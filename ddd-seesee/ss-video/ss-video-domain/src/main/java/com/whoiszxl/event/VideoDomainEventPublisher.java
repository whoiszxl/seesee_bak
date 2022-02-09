package com.whoiszxl.event;

/**
 * 视频领域事件发布服务
 *
 * @author whoiszxl
 * @date 2022/02/09
 */
public interface VideoDomainEventPublisher {

    /**
     * 发布视频发布成功的事件
     * @param videoPublishSuccessEvent
     */
    public void publishMemberLoginSuccessEvent(VideoPublishSuccessEvent videoPublishSuccessEvent);
}
