package com.whoiszxl.entity.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

/**
 * <p>
 * 视频计数表
 * </p>
 *
 * @author whoiszxl
 * @since 2021-12-08
 */
@Data
@ApiModel(value = "点赞参数", description = "点赞参数")
public class LikeVO implements Serializable {

    @ApiModelProperty("点赞id，视频id or 评论id")
    private Long id;

    @ApiModelProperty("点赞id： 1:视频点赞 2:评论点赞")
    private Integer likeType;

    @ApiModelProperty("状态：1: 增加 2: 减少")
    private Integer status;

    @ApiModelProperty("用户ID")
    private Long memberId;
}
