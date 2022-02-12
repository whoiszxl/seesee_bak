package com.whoiszxl.query.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.whoiszxl.adapter.MemberAdapter;
import com.whoiszxl.adapter.model.MemberAdapterDTO;
import com.whoiszxl.command.converter.VideoCommandConverter;
import com.whoiszxl.db.mapper.VideoMapper;
import com.whoiszxl.db.model.VideoPO;
import com.whoiszxl.enums.LikeTypeEnum;
import com.whoiszxl.model.query.PageQuery;
import com.whoiszxl.query.VideoQueryApplicationService;
import com.whoiszxl.query.model.dto.VideoDTO;
import com.whoiszxl.query.model.qry.MemberTimelineQuery;
import com.whoiszxl.strategy.LikeFactory;
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

    @Autowired
    private LikeFactory likeFactory;

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

    /**
     * 使用pull+push结合的模式
     *
     * 1. 先读取关注的热点用户列表，循环获取其timeline中的前10条视频
     * 2. 同时读取自己的收件箱视频列表
     * 3. 合并上述获取的列表，并按时间排序返回
     *
     * 广告实现：
     * 1. 通过大数据实时分析用户标签，比如说：单机游戏，粤语流行乐
     * 2. 推广客户创建出对应的账号，如：泰拉瑞亚官方账号
     * 3. 将具有对应标签的用户隐性关注此推广账号
     * 4. 此时广告视频也会存在与用户的feed推荐流里
     * @param pageQuery
     * @return
     */
    @Override
    public IPage<VideoDTO> attentionFeedList(PageQuery pageQuery) {
        return null;
    }

    @Override
    public IPage<VideoDTO> recommendFeedList(PageQuery pageQuery) {
        Long memberId = null;
        try{
            memberId = AuthUtils.getMemberId();
        }catch (Exception e) {

        }
        Long finalMemberId = memberId;

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
            videoDTO.setLickCount(likeFactory.getLikeStrategy(LikeTypeEnum.VIDEO.getCode()).getLikeCount(videoPO.getId()));
            videoDTO.setCommentCount(200);
            videoDTO.setShareCount(567);

            //设置是否点赞过
            Integer hasLiked = likeFactory.getLikeStrategy(LikeTypeEnum.VIDEO.getCode()).isLike(videoPO.getId(), finalMemberId);
            videoDTO.setHasLiked(hasLiked);

            return videoDTO;
        });
    }

    @Override
    public IPage<VideoDTO> timeline(MemberTimelineQuery memberTimelineQuery) {
        Long currentMemberId = null;
        try{
            currentMemberId = AuthUtils.getMemberId();
        }catch (Exception e) {

        }
        Long finalCurrentMemberId = currentMemberId;

        LambdaQueryWrapper<VideoPO> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.orderByDesc(VideoPO::getCreatedAt);
        lambdaQueryWrapper.eq(VideoPO::getMemberId, memberTimelineQuery.getMemberId());
        Page<VideoPO> videoPOPage = videoMapper.selectPage(new Page<>(memberTimelineQuery.getPage(), memberTimelineQuery.getSize()), lambdaQueryWrapper);

        List<Long> memberIdList = videoPOPage.getRecords().stream().map(VideoPO::getMemberId).distinct().collect(Collectors.toList());
        List<MemberAdapterDTO> memberInfoList = memberAdapter.findMemberInfoByIds(memberIdList);

        return videoPOPage.convert(videoPO -> {
            VideoDTO videoDTO = videoCommandConverter.poToDTO(videoPO);
            MemberAdapterDTO memberInfoAdapterDTO = memberInfoList.stream().filter(e -> e.getId().equals(videoDTO.getMemberId())).findAny().get();
            videoDTO.setMemberId(memberInfoAdapterDTO.getId());
            videoDTO.setAvatar(memberInfoAdapterDTO.getAvatar());
            videoDTO.setNickname(memberInfoAdapterDTO.getNickname());

            //TODO 设置计数器
            videoDTO.setLickCount(likeFactory.getLikeStrategy(LikeTypeEnum.VIDEO.getCode()).getLikeCount(videoPO.getId()));
            videoDTO.setCommentCount(200);
            videoDTO.setShareCount(567);

            //设置是否点赞过
            Integer hasLiked = likeFactory.getLikeStrategy(LikeTypeEnum.VIDEO.getCode()).isLike(videoPO.getId(), finalCurrentMemberId);
            videoDTO.setHasLiked(hasLiked);

            return videoDTO;
        });
    }
}
