package com.whoiszxl.command.converter;

import com.whoiszxl.aggregate.model.VideoComment;
import com.whoiszxl.command.cmd.PublishCommentCommand;
import com.whoiszxl.dozer.DozerUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * 用户命令转换器
 *
 * @author whoiszxl
 * @date 2022/1/24
 */
@Component
public class CommentCommandConverter {

    @Autowired
    private DozerUtils dozerUtils;


    public VideoComment commandToDomain(PublishCommentCommand publishCommentCommand) {
        VideoComment videoComment = dozerUtils.map(publishCommentCommand, VideoComment.class);
        return videoComment;
    }

    public PublishCommentCommand domainToCommand(VideoComment videoComment) {
        PublishCommentCommand publishCommentCommand = dozerUtils.map(videoComment, PublishCommentCommand.class);
        return publishCommentCommand;
    }

}
