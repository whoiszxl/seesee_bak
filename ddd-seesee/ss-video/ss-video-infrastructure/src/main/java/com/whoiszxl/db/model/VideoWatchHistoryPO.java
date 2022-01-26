package com.whoiszxl.db.model;

import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

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
@Getter
@Setter
@TableName("vms_video_watch_history")
@ApiModel(value = "VideoWatchHistory对象", description = "浏览历史表")
public class VideoWatchHistoryPO implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("主键ID")
    private Long id;

    @ApiModelProperty("会员ID")
    private Long memberId;

    @ApiModelProperty("视频ID")
    private Long videoId;

    @ApiModelProperty("创建时间")
    private LocalDateTime createdAt;

    @ApiModelProperty("更新时间")
    private LocalDateTime updatedAt;


}
