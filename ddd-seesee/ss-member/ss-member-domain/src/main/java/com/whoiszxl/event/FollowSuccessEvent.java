package com.whoiszxl.event;

import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 用户关注成功事件
 *
 * @author whoiszxl
 * @date 2022/1/24
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class FollowSuccessEvent {

    @ApiModelProperty("用户ID")
    private Long memberId;

    @ApiModelProperty("粉丝ID")
    private Long attentionId;
}
