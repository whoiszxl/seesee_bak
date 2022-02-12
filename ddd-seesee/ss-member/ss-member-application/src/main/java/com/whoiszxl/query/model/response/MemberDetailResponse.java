package com.whoiszxl.query.model.response;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.whoiszxl.model.ddd.Representation;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 会员profile页面返回实体
 *
 * @author whoiszxl
 * @date 2022/1/24
 */
@Data
@ApiModel("会员profile页面返回实体")
public class MemberDetailResponse implements Representation {

    @ApiModelProperty("用户ID")
    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private Long memberId;

    @ApiModelProperty("会员名")
    private String username;

    @ApiModelProperty("头像")
    private String avatar;

    @ApiModelProperty("昵称")
    private String nickname;

    @ApiModelProperty("性别(0:未知 1:男；2:女)")
    private Integer gender;

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

    @ApiModelProperty("粉丝数")
    private Integer followerCount;

    @ApiModelProperty("关注数")
    private Integer attentionCount;

    @ApiModelProperty("获赞数")
    private Integer likesCount;
}
