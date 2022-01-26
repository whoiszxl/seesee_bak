package com.whoiszxl.command.impl;

import com.whoiszxl.command.VideoApplicationService;
import com.whoiszxl.command.cmd.PublishVideoCommand;
import org.springframework.stereotype.Service;

/**
 * 视频应用服务接口实现
 *
 * @author whoiszxl
 * @date 2022/1/26
 */
@Service
public class VideoApplicationServiceImpl implements VideoApplicationService {

    @Override
    public void publishVideo(PublishVideoCommand publishVideoCommand) {

    }

    @Override
    public void like(Long videoId) {

    }
}
