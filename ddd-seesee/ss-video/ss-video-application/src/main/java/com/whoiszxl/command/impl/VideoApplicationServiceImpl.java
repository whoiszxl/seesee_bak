package com.whoiszxl.command.impl;

import com.whoiszxl.adapter.MemberAdapter;
import com.whoiszxl.adapter.model.FollowerAdapterDTO;
import com.whoiszxl.aggregate.model.Video;
import com.whoiszxl.aggregate.repository.VideoRepository;
import com.whoiszxl.command.VideoApplicationService;
import com.whoiszxl.command.cmd.LikeCommand;
import com.whoiszxl.command.cmd.PublishVideoCommand;
import com.whoiszxl.command.converter.VideoCommandConverter;
import com.whoiszxl.enums.LikeTypeEnum;
import com.whoiszxl.enums.VideoCounterStatusEnum;
import com.whoiszxl.event.VideoDomainEventPublisher;
import com.whoiszxl.event.VideoPublishSuccessEvent;
import com.whoiszxl.strategy.LikeFactory;
import com.whoiszxl.utils.AuthUtils;
import com.whoiszxl.utils.RedisUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 视频应用服务接口实现
 *
 * @author whoiszxl
 * @date 2022/1/26
 */
@Slf4j
@Service
public class VideoApplicationServiceImpl implements VideoApplicationService {

    @Autowired
    private VideoRepository videoRepository;

    @Autowired
    private VideoCommandConverter videoCommandConverter;

    @Autowired
    private MemberAdapter memberAdapter;

    @Autowired
    private RedisUtils redisUtils;

    @Autowired
    private LikeFactory likeFactory;

    @Autowired
    private VideoDomainEventPublisher videoDomainEventPublisher;

    /**
     * 使用pull+push结合的模式
     *
     * 1. 将发布的视频先落库
     * 2. 判断自己是否为热点用户，如果是则结束流程。
     * 3. 自己是普通用户，则从关注列表中获取到自己的粉丝列表
     * 4. 将发布的视频信息循环写入到粉丝的收件箱里
     * @param publishVideoCommand 发布命令
     */
    @Override
    public void publishVideo(PublishVideoCommand publishVideoCommand) {
        Long memberId = AuthUtils.getMemberId();

        //落库
        Video video = videoCommandConverter.commandToDomain(publishVideoCommand);
        video.bindMemberId(memberId);
        Video saveResult = videoRepository.save(video);

        //TODO 写入粉丝的时间线 暂用push模式实现
        List<FollowerAdapterDTO> followerAdapterDTOList = memberAdapter.memberFollowerList();
        for (FollowerAdapterDTO followerAdapterDTO : followerAdapterDTOList) {
            log.info("push到follower时间线");
        }

        //TODO 发送领域事件，后续处理推荐，推送等服务
        videoDomainEventPublisher.publishMemberLoginSuccessEvent(new VideoPublishSuccessEvent(saveResult.getId()));

    }

    @Override
    public void like(Long videoId) {
        Long memberId = AuthUtils.getMemberId();

        LikeCommand likeCommand = new LikeCommand();
        likeCommand.setId(videoId);
        likeCommand.setMemberId(memberId);
        likeCommand.setLikeType(LikeTypeEnum.VIDEO.getCode());
        likeCommand.setStatus(VideoCounterStatusEnum.INCR.getCode());

        likeFactory.getLikeStrategy(likeCommand.getLikeType()).like(likeCommand);
    }

    @Override
    public void disLike(Long videoId) {
        Long memberId = AuthUtils.getMemberId();

        LikeCommand likeCommand = new LikeCommand();
        likeCommand.setId(videoId);
        likeCommand.setMemberId(memberId);
        likeCommand.setLikeType(LikeTypeEnum.VIDEO.getCode());
        likeCommand.setStatus(VideoCounterStatusEnum.DECR.getCode());

        likeFactory.getLikeStrategy(likeCommand.getLikeType()).like(likeCommand);
    }
}
