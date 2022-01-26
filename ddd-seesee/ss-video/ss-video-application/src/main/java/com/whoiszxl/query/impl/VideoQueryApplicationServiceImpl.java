package com.whoiszxl.query.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.whoiszxl.command.converter.VideoCommandConverter;
import com.whoiszxl.db.mapper.VideoMapper;
import com.whoiszxl.db.model.VideoPO;
import com.whoiszxl.model.query.PageQuery;
import com.whoiszxl.query.VideoQueryApplicationService;
import com.whoiszxl.query.model.dto.VideoDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 视频查询应用服务接口实现
 *
 * @author whoiszxl
 * @date 2022/1/26
 */
@Service
public class VideoQueryApplicationServiceImpl implements VideoQueryApplicationService {

    @Autowired
    private VideoMapper videoMapper;

    @Autowired
    private VideoCommandConverter videoCommandConverter;

    @Override
    public void feedList(PageQuery pageQuery) {

    }

    @Override
    public void videoVisitors(Long videoId) {

    }

    @Override
    public IPage<VideoDTO> videoList(PageQuery pageQuery) {
        return null;
    }

    @Override
    public IPage<VideoDTO> attentionFeedList(PageQuery pageQuery) {
        return null;
    }

    @Override
    public IPage<VideoDTO> recommendFeedList(PageQuery pageQuery) {
        LambdaQueryWrapper<VideoPO> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.orderByDesc(VideoPO::getCreatedAt);
        Page<VideoPO> videoPOPage = videoMapper.selectPage(new Page<>(pageQuery.getPage(), pageQuery.getSize()), lambdaQueryWrapper);
        return videoPOPage.convert(videoPO -> videoCommandConverter.poToDTO(videoPO));
    }
}
