package com.whoiszxl.query;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.whoiszxl.model.query.PageQuery;
import com.whoiszxl.query.model.dto.VideoDTO;

/**
 * 视频查询应用服务接口
 *
 * @author whoiszxl
 * @date 2022/1/26
 */
public interface VideoQueryApplicationService {

    void feedList(PageQuery pageQuery);

    void videoVisitors(Long videoId);

    IPage<VideoDTO> videoList(PageQuery pageQuery);

    IPage<VideoDTO> attentionFeedList(PageQuery pageQuery);

    IPage<VideoDTO> recommendFeedList(PageQuery pageQuery);
}
