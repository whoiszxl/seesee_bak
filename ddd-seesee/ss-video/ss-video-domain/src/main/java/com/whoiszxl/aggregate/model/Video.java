package com.whoiszxl.aggregate.model;

import com.whoiszxl.model.ddd.AggregateRoot;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.math.BigDecimal;

/**
 * 视频聚合根
 *
 * @author whoiszxl
 * @date 2022/1/26
 */
@Data
public class Video implements AggregateRoot {

    @ApiModelProperty("视频主键ID")
    private Long id;

    @ApiModelProperty("会员ID")
    private Long memberId;

    @ApiModelProperty("文字内容")
    private String descs;

    @ApiModelProperty("视频封面")
    private String cover;

    @ApiModelProperty("视频文件地址")
    private String videoUrl;

    @ApiModelProperty("视频秒数")
    private Float seconds;

    @ApiModelProperty("视频宽度")
    private Integer width;

    @ApiModelProperty("视频高度")
    private Integer height;

    @ApiModelProperty("观看类型：（1:所有人 2:私密 3:好友可见 4:部分可见 5:对谁不可见）")
    private Integer watchType;

    @ApiModelProperty("可见用户的id列表，使用逗号 , 分隔")
    private String canWatchMember;

    @ApiModelProperty("不可见用户的id列表，使用逗号 , 分隔")
    private String cannotWatchMember;

    @ApiModelProperty("来自什么渠道")
    private String channel;

    @ApiModelProperty("定位地址")
    private String address;

    @ApiModelProperty("经度")
    private BigDecimal longitude;

    @ApiModelProperty("纬度")
    private BigDecimal latitude;

    @ApiModelProperty("ip地址")
    private String ip;

    @ApiModelProperty("业务状态")
    private Integer status;



}
