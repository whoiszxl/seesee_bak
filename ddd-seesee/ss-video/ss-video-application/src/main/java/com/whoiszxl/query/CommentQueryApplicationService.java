package com.whoiszxl.query;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.whoiszxl.command.cmd.PublishCommentCommand;
import com.whoiszxl.query.model.dto.VideoCommentDTO;
import com.whoiszxl.query.model.qry.CommentListQuery;

/**
 * 评论查询应用服务接口
 *
 * @author whoiszxl
 * @date 2022/1/26
 */
public interface CommentQueryApplicationService {

    /**
     * 通过视频ID查询一级评论或二级评论
     * @param commentListQuery
     * @return
     */
    IPage<VideoCommentDTO> commentList(CommentListQuery commentListQuery);


}
