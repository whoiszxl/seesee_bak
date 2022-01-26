package com.whoiszxl.db.model;

import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.Version;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * <p>
 * 背景音乐表
 * </p>
 *
 * @author whoiszxl
 * @since 2021-12-08
 */
@Getter
@Setter
@TableName("vms_bgmusic")
@ApiModel(value = "Bgmusic对象", description = "背景音乐表")
public class BgmusicPO implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("背景音乐主键ID")
    private Long id;

    @ApiModelProperty("音乐名")
    private String musicName;

    @ApiModelProperty("歌手")
    private String singer;

    @ApiModelProperty("作曲者")
    private String musicComposer;

    @ApiModelProperty("作词者")
    private String musicLyricist;

    @ApiModelProperty("音乐版权")
    private String musicCopyright;

    @ApiModelProperty("视频秒数")
    private Float musicSeconds;

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
