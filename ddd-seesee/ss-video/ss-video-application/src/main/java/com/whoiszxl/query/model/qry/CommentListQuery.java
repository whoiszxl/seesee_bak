package com.whoiszxl.query.model.qry;

import com.whoiszxl.model.query.PageQuery;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 评论列表查询参数
 *
 * @author whoiszxl
 * @date 2022/1/26
 */
@Data
@ApiModel("评论列表查询参数")
public class CommentListQuery extends PageQuery {

    @ApiModelProperty("视频ID")
    private String videoId;

    @ApiModelProperty("父评论ID")
    private String commentId;
}
