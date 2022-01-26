package com.whoiszxl.command.impl;

import com.whoiszxl.aggregate.model.Video;
import com.whoiszxl.aggregate.repository.VideoRepository;
import com.whoiszxl.command.VideoApplicationService;
import com.whoiszxl.command.cmd.PublishVideoCommand;
import com.whoiszxl.command.converter.VideoCommandConverter;
import com.whoiszxl.utils.AuthUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 视频应用服务接口实现
 *
 * @author whoiszxl
 * @date 2022/1/26
 */
@Service
public class VideoApplicationServiceImpl implements VideoApplicationService {

    @Autowired
    private VideoRepository videoRepository;

    @Autowired
    private VideoCommandConverter videoCommandConverter;

    @Override
    public void publishVideo(PublishVideoCommand publishVideoCommand) {
        Long memberId = AuthUtils.getMemberId();

        //落库
        Video video = videoCommandConverter.commandToDomain(publishVideoCommand);
        video.bindMemberId(memberId);
        videoRepository.save(video);

        //TODO 写入粉丝的时间线
    }

    @Override
    public void like(Long videoId) {

    }
}
