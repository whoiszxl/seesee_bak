package com.whoiszxl.aggregate.model;

import com.whoiszxl.model.ddd.AggregateRoot;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.springframework.data.annotation.Version;

import java.time.LocalDateTime;

/**
 * <p>
 * MemberReport领域实体对象
 * </p>
 *
 * @author whoiszxl
 * @since 2021-12-08
 */
@Data
@ApiModel(value = "MemberReport领域实体对象", description = "MemberReport领域实体对象")
public class MemberReport implements AggregateRoot {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("主键ID")
    private Long id;

    @ApiModelProperty("举报人的用户ID")
    private Long memberId;

    @ApiModelProperty("被举报的用户ID")
    private Long reportMemberId;

    @ApiModelProperty("被举报的视频ID")
    private Long reportVideoId;

    @ApiModelProperty("被举报的评论ID")
    private Long reportCommentId;

    @ApiModelProperty("举报标题")
    private String title;

    @ApiModelProperty("举报内容")
    private String content;

    @ApiModelProperty("业务状态")
    private Integer status;

}
