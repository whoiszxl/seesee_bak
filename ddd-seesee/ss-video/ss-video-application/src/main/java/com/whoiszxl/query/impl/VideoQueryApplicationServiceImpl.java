package com.whoiszxl.query.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.whoiszxl.adapter.MemberAdapter;
import com.whoiszxl.adapter.model.MemberAdapterDTO;
import com.whoiszxl.command.converter.VideoCommandConverter;
import com.whoiszxl.db.mapper.VideoMapper;
import com.whoiszxl.db.model.VideoPO;
import com.whoiszxl.model.query.PageQuery;
import com.whoiszxl.query.VideoQueryApplicationService;
import com.whoiszxl.query.model.dto.VideoDTO;
import com.whoiszxl.utils.AuthUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

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

    @Autowired
    private MemberAdapter memberAdapter;

    @Override
    public void feedList(PageQuery pageQuery) {

    }

    @Override
    public void videoVisitors(Long videoId) {

    }

    @Override
    public IPage<VideoDTO> videoList(PageQuery pageQuery) {
        Long memberId = AuthUtils.getMemberId();
        LambdaQueryWrapper<VideoPO> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(VideoPO::getMemberId, memberId);
        lambdaQueryWrapper.orderByDesc(VideoPO::getCreatedAt);
        Page<VideoPO> videoPOPage = videoMapper.selectPage(new Page<>(pageQuery.getPage(), pageQuery.getSize()), lambdaQueryWrapper);
        return videoPOPage.convert(videoPO -> videoCommandConverter.poToDTO(videoPO));
    }

    @Override
    public IPage<VideoDTO> attentionFeedList(PageQuery pageQuery) {
        return null;
    }

    @Override
    public IPage<VideoDTO> recommendFeedList(PageQuery pageQuery) {
        //TODO 推荐实现
        LambdaQueryWrapper<VideoPO> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.orderByDesc(VideoPO::getCreatedAt);
        Page<VideoPO> videoPOPage = videoMapper.selectPage(new Page<>(pageQuery.getPage(), pageQuery.getSize()), lambdaQueryWrapper);

        List<Long> memberIdList = videoPOPage.getRecords().stream().map(VideoPO::getMemberId).distinct().collect(Collectors.toList());
        List<MemberAdapterDTO> memberInfoList = memberAdapter.findMemberInfoByIds(memberIdList);

        return videoPOPage.convert(videoPO -> {
            VideoDTO videoDTO = videoCommandConverter.poToDTO(videoPO);
            MemberAdapterDTO memberInfoAdapterDTO = memberInfoList.stream().filter(e -> e.getId().equals(videoDTO.getMemberId())).findAny().get();
            videoDTO.setMemberId(memberInfoAdapterDTO.getId());
            videoDTO.setAvatar(memberInfoAdapterDTO.getAvatar());
            videoDTO.setNickname(memberInfoAdapterDTO.getNickname());

            //TODO 设置计数器
            videoDTO.setLickCount(100);
            videoDTO.setCommentCount(200);
            videoDTO.setShareCount(567);

            return videoDTO;
        });
    }
}
