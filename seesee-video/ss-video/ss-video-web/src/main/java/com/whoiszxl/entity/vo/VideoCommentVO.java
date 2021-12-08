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
 * 视频评论表
 * </p>
 *
 * @author whoiszxl
 * @since 2021-12-08
 */
@Data
@ApiModel(value = "VideoComment对象", description = "视频评论表")
public class VideoCommentVO implements Serializable {

    @ApiModelProperty("评论主键ID")
    private Long id;

    @ApiModelProperty("视频ID")
    private Long videoId;

    @ApiModelProperty("会员ID")
    private Long memberId;

    @ApiModelProperty("评论内容")
    private String commentText;

    @ApiModelProperty("评论图片")
    private String commentImgs;

    @ApiModelProperty("@了谁，下划线分割")
    private String at;

    @ApiModelProperty("评论父ID，为0则是主评论")
    private Long parentId;

}
