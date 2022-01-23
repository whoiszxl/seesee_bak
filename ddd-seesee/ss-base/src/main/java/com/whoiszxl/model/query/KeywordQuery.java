package com.whoiszxl.model.query;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
@ApiModel("关键词查询模型")
public class KeywordQuery extends PageQuery {

    @ApiModelProperty("关键字")
    private String keyword;

}
