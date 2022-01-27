package com.whoiszxl.adapter.model;

import lombok.Data;

/**
 * 粉丝client查询DTO
 *
 * @author whoiszxl
 * @date 2022/1/27
 */
@Data
public class FollowerAdapterDTO {

    /**
     * 主键ID
     */
    private Long id;

    /**
     * 用户ID
     */
    private Long memberId;

    /**
     * 粉丝ID
     */
    private Long followerId;

}
