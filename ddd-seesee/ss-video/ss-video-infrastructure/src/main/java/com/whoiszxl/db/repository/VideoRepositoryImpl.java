package com.whoiszxl.db.repository;

import com.whoiszxl.aggregate.model.Video;
import com.whoiszxl.aggregate.repository.VideoRepository;
import com.whoiszxl.db.converter.VideoConverter;
import com.whoiszxl.db.mapper.VideoMapper;
import com.whoiszxl.db.model.VideoPO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Objects;

/**
 * 视频领域仓储接口实现
 *
 * @author whoiszxl
 * @date 2022/1/26
 */
@Service
public class VideoRepositoryImpl implements VideoRepository {

    @Autowired
    private VideoMapper videoMapper;

    @Autowired
    private VideoConverter videoConverter;

    @Override
    public void delete(Long id) {
        videoMapper.deleteById(id);
    }

    @Override
    public Video byId(Long id) {
        VideoPO videoPO = videoMapper.selectById(id);
        Video video = videoConverter.poToDomain(videoPO);
        return video;
    }

    @Override
    public Video save(Video video) {
        VideoPO videoPO = videoConverter.domainToPo(video);
        if(Objects.isNull(videoPO.getMemberId())) {
            videoMapper.insert(videoPO);
        }else {
            videoMapper.updateById(videoPO);
        }
        return video;
    }
}
