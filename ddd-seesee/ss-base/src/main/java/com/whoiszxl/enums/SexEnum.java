package com.whoiszxl.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 性别类型
 * @author whoiszxl
 * @date 2021/3/17
 */
@Getter
@AllArgsConstructor
public enum SexEnum {


    UNKNOWN(0, "未知"),
    MAN(1, "关闭"),
    FEMAN(2, "开启")
    ;
    private Integer code;
    private String desc;
}