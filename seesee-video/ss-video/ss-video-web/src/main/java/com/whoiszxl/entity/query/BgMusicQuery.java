package com.whoiszxl.entity.query;

import com.whoiszxl.bean.PageQuery;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
@ApiModel("背景音乐查询参数")
public class BgMusicQuery extends PageQuery {

    @ApiModelProperty("搜索关键词")
    private String searchKey;

}
