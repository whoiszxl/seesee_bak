package com.whoiszxl.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 计数器新增减少状态枚举
 * @author whoiszxl
 * @date 2021/3/17
 */
@Getter
@AllArgsConstructor
public enum VideoCounterStatusEnum {

    INCR(1, "增加"),
    DECR(2, "减少"),
    ;
    private Integer code;
    private String desc;
}