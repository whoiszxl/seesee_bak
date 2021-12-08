package com.whoiszxl.bean;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * TODO
 *
 * @author whoiszxl
 * @date 2021/11/30
 */
@Data
@ApiModel(description = "地址对象")
public class Address {

    @ApiModelProperty("省份")
    private String province;

    @ApiModelProperty("城市")
    private String city;
}
