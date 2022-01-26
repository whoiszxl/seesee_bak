package com.whoiszxl.command.converter;
import com.whoiszxl.aggregate.model.Video;
import com.whoiszxl.command.cmd.PublishVideoCommand;
import com.whoiszxl.db.model.VideoPO;
import com.whoiszxl.dozer.DozerUtils;
import com.whoiszxl.query.model.dto.VideoDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * 用户命令转换器
 *
 * @author whoiszxl
 * @date 2022/1/24
 */
@Component
public class VideoCommandConverter {

    @Autowired
    private DozerUtils dozerUtils;


    public Video commandToDomain(PublishVideoCommand publishVideoCommand) {
        Video video = dozerUtils.map(publishVideoCommand, Video.class);
        return video;
    }

    public PublishVideoCommand domainToCommand(Video video) {
        PublishVideoCommand updateMemberCommand = dozerUtils.map(video, PublishVideoCommand.class);
        return updateMemberCommand;
    }

    public VideoDTO poToDTO(VideoPO videoPO) {
        return dozerUtils.map(videoPO, VideoDTO.class);
    }
}
