package com.whoiszxl.aggregate.model;

import com.whoiszxl.model.ddd.AggregateRoot;
import com.whoiszxl.utils.AuthUtils;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import java.time.LocalDateTime;

/**
 * 会员聚合根
 *
 * @author whoiszxl
 * @date 2022/1/24
 */
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Slf4j
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

    @ApiModelProperty("会员详细信息")
    private MemberInfo memberInfo;

    public void login() {
        AuthUtils.login(this.id);
    }

    public String getCurrentToken() {
        return AuthUtils.getToken();
    }


    public void updateLastLoginTime() {
        this.memberInfo.setLastLogin(LocalDateTime.now());
    }
}
