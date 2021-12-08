package com.whoiszxl.service.impl;

import com.whoiszxl.entity.Video;
import com.whoiszxl.entity.vo.LikeVO;
import com.whoiszxl.mapper.VideoMapper;
import com.whoiszxl.service.VideoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.whoiszxl.strategy.LikeFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 视频表 服务实现类
 * </p>
 *
 * @author whoiszxl
 * @since 2021-12-08
 */
@Service
public class VideoServiceImpl extends ServiceImpl<VideoMapper, Video> implements VideoService {

    @Autowired
    private LikeFactory likeFactory;

    @Override
    public void like(LikeVO likeVO) {
        if(likeVO != null && likeVO.getLikeType() != null) {
            likeFactory.getLikeStrategy(likeVO.getLikeType()).like(likeVO);
        }
    }
}
