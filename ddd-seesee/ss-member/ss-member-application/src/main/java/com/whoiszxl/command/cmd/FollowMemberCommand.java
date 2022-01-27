package com.whoiszxl.command.cmd;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 关注用户命令
 *
 * @author whoiszxl
 * @date 2022/1/27
 */
@Data
@ApiModel("关注用户命令")
public class FollowMemberCommand {

    @ApiModelProperty("被follow的用户ID")
    private Long memberId;

}
