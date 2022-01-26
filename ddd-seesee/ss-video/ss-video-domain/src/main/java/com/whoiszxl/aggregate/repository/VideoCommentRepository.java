package com.whoiszxl.aggregate.repository;

import com.whoiszxl.aggregate.model.VideoComment;
import com.whoiszxl.model.ddd.Repository;

/**
 * 视频评论领域仓储接口
 *
 * @author whoiszxl
 * @date 2022/1/26
 */
public interface VideoCommentRepository extends Repository<VideoComment, Long> {
}
