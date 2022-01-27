package com.whoiszxl.aggregate.model;

import com.whoiszxl.model.ddd.AggregateRoot;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * <p>
 * 会员关注MemberAttention领域实体
 * </p>
 *
 * @author whoiszxl
 * @since 2021-12-08
 */
@Data
@ApiModel(value = "MemberAttention领域实体", description = "MemberAttention领域实体")
public class MemberAttention implements AggregateRoot {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("主键ID")
    private Long id;

    @ApiModelProperty("用户ID")
    private Long memberId;

    @ApiModelProperty("粉丝ID")
    private Long attentionId;


}
