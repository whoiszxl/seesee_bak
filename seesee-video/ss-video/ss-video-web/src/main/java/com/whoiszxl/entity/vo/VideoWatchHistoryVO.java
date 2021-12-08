package com.whoiszxl.entity.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * <p>
 * 浏览历史表
 * </p>
 *
 * @author whoiszxl
 * @since 2021-12-08
 */
@Data
@ApiModel(value = "VideoWatchHistory对象", description = "浏览历史表")
public class VideoWatchHistoryVO implements Serializable {

    @ApiModelProperty("主键ID")
    private Long id;

    @ApiModelProperty("会员ID")
    private Long memberId;

    @ApiModelProperty("视频ID")
    private Long videoId;

}
