package com.whoiszxl.aggregate.model;

import com.whoiszxl.model.ddd.AggregateRoot;
import com.whoiszxl.utils.AuthUtils;
import com.whoiszxl.utils.ValidateUtils;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;


/**
 * 会员聚合根
 *
 * @author whoiszxl
 * @date 2022/1/24
 */
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Member implements AggregateRoot {

    @ApiModelProperty("主键ID")
    private Long id;

    @ApiModelProperty("会员名")
    private String username;

    @ApiModelProperty("密码")
    private String password;

    @ApiModelProperty("头像")
    private String avatar;

    @ApiModelProperty("昵称")
    private String nickname;

    @ApiModelProperty("谷歌验证码")
    private String googleKey;

    @ApiModelProperty("谷歌验证码是否开启，默认0不开启, 1开启")
    private Integer googleStatus;

    @ApiModelProperty("真实姓名")
    private String realName;

    @ApiModelProperty("邮箱")
    private String email;

    @ApiModelProperty("手机")
    private String phone;

    @ApiModelProperty("是否在线(0：离线 1：在线)")
    private Integer online;

    @ApiModelProperty("业务状态")
    private Integer status;

    public void login() {
        AuthUtils.login(this.id);
    }

    public String getCurrentToken() {
        return AuthUtils.getToken();
    }

    public void bindMemberId(Long memberId) {
        this.id = memberId;
    }

    public boolean checkFieldHaveValue() {
        try {
            return ValidateUtils.checkObjFieldHaveValue(this);
        } catch (IllegalAccessException e) {
            return false;
        }
    }
}
