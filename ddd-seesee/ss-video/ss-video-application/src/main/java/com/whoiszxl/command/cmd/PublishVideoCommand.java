package com.whoiszxl.command.cmd;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.math.BigDecimal;

/**
 * 发布视频命令
 *
 * @author whoiszxl
 * @date 2022/1/26
 */
@Data
@ApiModel("发布视频命令")
public class PublishVideoCommand {

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

}
