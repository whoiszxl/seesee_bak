package com.whoiszxl.aggregate.model;

import com.whoiszxl.model.ddd.AggregateRoot;
import com.whoiszxl.utils.ValidateUtils;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 会员详情实体
 *
 * @author whoiszxl
 * @date 2022/1/24
 */
@Data
public class MemberInfo implements AggregateRoot {

    @ApiModelProperty("用户ID")
    private Long memberId;

    @ApiModelProperty("性别(0:未知 1:男；2:女)")
    private Boolean gender;

    @ApiModelProperty("粉丝数")
    private Integer followerCount;

    @ApiModelProperty("关注数")
    private Integer attentionCount;

    @ApiModelProperty("获赞数")
    private Integer likesCount;

    @ApiModelProperty("生日")
    private LocalDateTime birthday;

    @ApiModelProperty("国家码")
    private String countryCode;

    @ApiModelProperty("国家")
    private String country;

    @ApiModelProperty("省份")
    private String province;

    @ApiModelProperty("城市")
    private String city;

    @ApiModelProperty("区域")
    private String district;

    @ApiModelProperty("学校")
    private String school;

    @ApiModelProperty("会员等级")
    private String gradeLevel;

    @ApiModelProperty("会员登录次数")
    private Long loginCount;

    @ApiModelProperty("会员登录错误次数")
    private Long loginErrorCount;

    @ApiModelProperty("最后登录")
    private LocalDateTime lastLogin;

    @ApiModelProperty("业务状态")
    private Integer status;

    public void bindMemberId(Long memberId) {
        this.memberId = memberId;
    }

    public boolean checkFieldHaveValue() {
        try {
            return ValidateUtils.checkObjFieldHaveValue(this);
        } catch (IllegalAccessException e) {
            return false;
        }
    }
}
