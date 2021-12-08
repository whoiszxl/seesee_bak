package com.whoiszxl.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

/**
 * <p>
 * 会员粉丝表
 * </p>
 *
 * @author whoiszxl
 * @since 2021-12-08
 */
@Getter
@Setter
@TableName("ums_member_follower")
@ApiModel(value = "MemberFollower对象", description = "会员粉丝表")
public class MemberFollower implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("主键ID")
      private Long id;

    @ApiModelProperty("用户ID")
    private Long memberId;

    @ApiModelProperty("粉丝ID")
    private Long followerId;


}
