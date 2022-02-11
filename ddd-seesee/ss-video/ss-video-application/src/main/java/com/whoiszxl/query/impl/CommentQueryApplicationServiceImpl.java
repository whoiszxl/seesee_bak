package com.whoiszxl.query.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.whoiszxl.adapter.MemberAdapter;
import com.whoiszxl.adapter.model.MemberAdapterDTO;
import com.whoiszxl.db.mapper.VideoCommentMapper;
import com.whoiszxl.db.model.VideoCommentPO;
import com.whoiszxl.dozer.DozerUtils;
import com.whoiszxl.enums.LikeTypeEnum;
import com.whoiszxl.query.CommentQueryApplicationService;
import com.whoiszxl.query.model.dto.VideoCommentDTO;
import com.whoiszxl.query.model.qry.CommentListQuery;
import com.whoiszxl.strategy.LikeFactory;
import com.whoiszxl.utils.AuthUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

/**
 * 评论查询应用服务接口实现
 *
 * @author whoiszxl
 * @date 2022/1/26
 */
@Service
public class CommentQueryApplicationServiceImpl implements CommentQueryApplicationService {

    @Autowired
    private VideoCommentMapper videoCommentMapper;

    @Autowired
    private DozerUtils dozerUtils;

    @Autowired
    private MemberAdapter memberAdapter;

    @Autowired
    private LikeFactory likeFactory;

    @Override
    public IPage<VideoCommentDTO> commentList(CommentListQuery commentListQuery) {
        LambdaQueryWrapper<VideoCommentPO> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.orderByDesc(VideoCommentPO::getCreatedAt);
        lambdaQueryWrapper.eq(VideoCommentPO::getVideoId, commentListQuery.getVideoId());
        lambdaQueryWrapper.eq(VideoCommentPO::getParentId, commentListQuery.getCommentId());

        Page<VideoCommentPO> videoCommentPOPage = videoCommentMapper.selectPage(new Page<>(commentListQuery.getPage(), commentListQuery.getSize()), lambdaQueryWrapper);
        if(videoCommentPOPage.getTotal() == 0) {
            return null;
        }

        List<Long> memberIdList = videoCommentPOPage.getRecords().stream().map(VideoCommentPO::getMemberId).distinct().collect(Collectors.toList());
        List<MemberAdapterDTO> memberInfoList = memberAdapter.findMemberInfoByIds(memberIdList);

        Long memberId = null;
        try{
            memberId = AuthUtils.getMemberId();
        }catch (Exception e) {

        }
        Long finalMemberId = memberId;

        IPage<VideoCommentDTO> videoCommentDTOIPage = videoCommentPOPage.convert(e -> {
            VideoCommentDTO videoCommentDTO = dozerUtils.map(e, VideoCommentDTO.class);
            MemberAdapterDTO memberInfoAdapterDTO = memberInfoList.stream().filter(item -> item.getId().equals(videoCommentDTO.getMemberId())).findAny().get();
            videoCommentDTO.setMemberId(memberInfoAdapterDTO.getId());
            videoCommentDTO.setAvatar(memberInfoAdapterDTO.getAvatar());
            videoCommentDTO.setNickname(memberInfoAdapterDTO.getNickname());

            //设置自己是否点赞和点赞数
            if(finalMemberId != null) {
                Integer hasLiked = likeFactory.getLikeStrategy(LikeTypeEnum.COMMENT.getCode()).isLike(videoCommentDTO.getId(), finalMemberId);
                videoCommentDTO.setIsLiked(hasLiked);
            }else {
                videoCommentDTO.setIsLiked(0);
            }
            Integer likeCount = likeFactory.getLikeStrategy(LikeTypeEnum.COMMENT.getCode()).getLikeCount(videoCommentDTO.getId());
            videoCommentDTO.setLikeCount(likeCount);

            return videoCommentDTO;
        });
        return videoCommentDTOIPage;
    }
}
