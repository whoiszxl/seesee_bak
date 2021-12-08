package com.whoiszxl.service.impl;

import com.whoiszxl.entity.VideoComment;
import com.whoiszxl.mapper.VideoCommentMapper;
import com.whoiszxl.service.VideoCommentService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 视频评论表 服务实现类
 * </p>
 *
 * @author whoiszxl
 * @since 2021-12-08
 */
@Service
public class VideoCommentServiceImpl extends ServiceImpl<VideoCommentMapper, VideoComment> implements VideoCommentService {

}
