package com.whoiszxl.command.cmd;

import com.whoiszxl.enums.VideoCounterStatusEnum;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * TODO
 *
 * @author whoiszxl
 * @date 2022/1/27
 */
@Data
public class LikeCommand {

    @ApiModelProperty("点赞id，视频id or 评论id")
    private Long id;

    /**
     * {@link com.whoiszxl.enums.LikeTypeEnum}
     */
    @ApiModelProperty("点赞id： 1:视频点赞 2:评论点赞")
    private Integer likeType;

    /**
     * {@link VideoCounterStatusEnum}
     */
    @ApiModelProperty("状态：1: 增加 2: 减少")
    private Integer status;

    @ApiModelProperty("用户ID")
    private Long memberId;

}
