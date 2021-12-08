package com.whoiszxl.entity;

import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.Version;
import java.io.Serializable;
import java.time.LocalDateTime;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

/**
 * <p>
 * 会员举报表
 * </p>
 *
 * @author whoiszxl
 * @since 2021-12-08
 */
@Getter
@Setter
@TableName("ums_member_report")
@ApiModel(value = "MemberReport对象", description = "会员举报表")
public class MemberReport implements Serializable {

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

    @ApiModelProperty("乐观锁")
    @Version
    private Long version;

    @ApiModelProperty("业务状态")
    private Integer status;

    @ApiModelProperty("逻辑删除 1: 已删除， 0: 未删除")
    @TableLogic
    private Integer isDeleted;

    @ApiModelProperty("创建者")
    private String createdBy;

    @ApiModelProperty("更新者")
    private String updatedBy;

    @ApiModelProperty("创建时间")
    private LocalDateTime createdAt;

    @ApiModelProperty("更新时间")
    private LocalDateTime updatedAt;


}
