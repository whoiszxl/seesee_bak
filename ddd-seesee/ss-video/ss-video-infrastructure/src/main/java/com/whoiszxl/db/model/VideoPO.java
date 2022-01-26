package com.whoiszxl.db.model;

import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.Version;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * <p>
 * 视频表
 * </p>
 *
 * @author whoiszxl
 * @since 2021-12-08
 */
@Getter
@Setter
@TableName("vms_video")
@ApiModel(value = "Video对象", description = "视频表")
public class VideoPO implements Serializable {

    private static final long serialVersionUID = 1L;

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

    @ApiModelProperty("乐观锁")
    @Version
    private Long version;

    @ApiModelProperty("业务状态")
    private Integer status;

    @ApiModelProperty("逻辑删除 1: 已删除， 0: 未删除")
    @TableLogic
    private Integer isDeleted;

    @ApiModelProperty("创建者")
    private String createdBy;

    @ApiModelProperty("更新者")
    private String updatedBy;

    @ApiModelProperty("创建时间")
    private LocalDateTime createdAt;

    @ApiModelProperty("更新时间")
    private LocalDateTime updatedAt;

}
