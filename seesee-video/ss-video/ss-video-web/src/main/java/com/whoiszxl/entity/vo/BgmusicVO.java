package com.whoiszxl.entity.vo;

import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.Version;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

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
@Data
@ApiModel(value = "Bgmusic对象", description = "背景音乐表")
public class BgmusicVO implements Serializable {


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
}
