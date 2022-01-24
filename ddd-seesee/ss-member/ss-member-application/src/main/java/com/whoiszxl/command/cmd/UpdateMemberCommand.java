package com.whoiszxl.command.cmd;

import com.whoiszxl.model.ddd.Command;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * 更新会员信息指令
 *
 * @author whoiszxl
 * @date 2022/1/24
 */
@Data
@ApiModel("更新会员信息指令")
public class UpdateMemberCommand implements Command {

    @NotBlank(message = "用户名不允许为空")
    @ApiModelProperty("用户名")
    private String username;

    @NotBlank(message = "密码不允许为空")
    @ApiModelProperty("密码")
    private String password;

    @ApiModelProperty("头像")
    private String avatar;

    @ApiModelProperty("昵称")
    private String nickname;

    @ApiModelProperty("真实姓名")
    private String realName;

}
