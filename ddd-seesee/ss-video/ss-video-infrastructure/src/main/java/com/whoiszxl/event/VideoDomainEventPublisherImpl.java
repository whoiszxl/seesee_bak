package com.whoiszxl.event;

import com.whoiszxl.mq.RocketMQProducer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * 领域事件发布服务实现
 *
 * @author whoiszxl
 * @date 2022/1/24
 */
@Component
public class VideoDomainEventPublisherImpl implements VideoDomainEventPublisher {

    @Autowired
    private RocketMQProducer rocketMQProducer;

    @Override
    public void publishMemberLoginSuccessEvent(VideoPublishSuccessEvent videoPublishSuccessEvent) {

    }
}
