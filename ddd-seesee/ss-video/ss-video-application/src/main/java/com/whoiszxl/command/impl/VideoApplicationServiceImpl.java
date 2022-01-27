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

    @Override
    public void publishVideo(PublishVideoCommand publishVideoCommand) {
        Long memberId = AuthUtils.getMemberId();

        //落库
        Video video = videoCommandConverter.commandToDomain(publishVideoCommand);
        video.bindMemberId(memberId);
        videoRepository.save(video);

        //写入粉丝的时间线 暂用push模式实现
        List<FollowerAdapterDTO> followerAdapterDTOList = memberAdapter.memberFollowerList();
        for (FollowerAdapterDTO followerAdapterDTO : followerAdapterDTOList) {
            log.info("push到follower时间线");
        }
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
