package com.whoiszxl.service;

import com.whoiszxl.entity.Video;
import com.baomidou.mybatisplus.extension.service.IService;
import com.whoiszxl.entity.vo.LikeVO;

/**
 * <p>
 * 视频表 服务类
 * </p>
 *
 * @author whoiszxl
 * @since 2021-12-08
 */
public interface VideoService extends IService<Video> {

    /**
     * 点赞或取消点赞
     * @param likeVO
     * @return
     */
    void like(LikeVO likeVO);
}
