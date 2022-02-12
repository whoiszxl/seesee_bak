package com.whoiszxl.query.model.qry;

import com.whoiszxl.model.query.PageQuery;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 查询指定用户视频时间线列表的查询参数
 *
 * @author whoiszxl
 * @date 2022/1/26
 */
@Data
@ApiModel("查询指定用户视频时间线列表的查询参数")
public class MemberTimelineQuery extends PageQuery {

    @ApiModelProperty("用户ID")
    private String memberId;
}
