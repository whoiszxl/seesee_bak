package com.whoiszxl.aggregate.model;

import com.whoiszxl.model.ddd.AggregateRoot;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 视频评论聚合根
 *
 * @author whoiszxl
 * @date 2022/1/26
 */
@Data
public class VideoComment implements AggregateRoot {

    @ApiModelProperty("评论主键ID")
    private Long id;

    @ApiModelProperty("视频ID")
    private Long videoId;

    @ApiModelProperty("会员ID")
    private Long memberId;

    @ApiModelProperty("评论内容")
    private String commentText;

    @ApiModelProperty("评论图片")
    private String commentImgs;

    @ApiModelProperty("@了谁，下划线分割")
    private String at;

    @ApiModelProperty("评论父ID，为0则是主评论")
    private Long parentId;

    @ApiModelProperty("业务状态")
    private Integer status;


    public void bindMemberId(Long memberId) {
        this.memberId = memberId;
    }
}
