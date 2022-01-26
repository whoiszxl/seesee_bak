package com.whoiszxl.command;

import com.whoiszxl.command.cmd.PublishVideoCommand;

/**
 * 视频应用服务接口
 *
 * @author whoiszxl
 * @date 2022/1/26
 */
public interface VideoApplicationService {

    /**
     * 发布视频
     * @param publishVideoCommand 发布命令
     */
    void publishVideo(PublishVideoCommand publishVideoCommand);

    /**
     * 视频点赞
     * @param videoId 视频ID
     */
    void like(Long videoId);
}
