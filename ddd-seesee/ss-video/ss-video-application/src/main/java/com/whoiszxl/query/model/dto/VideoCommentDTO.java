package com.whoiszxl.query.model.dto;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 评论DTO
 *
 * @author whoiszxl
 * @date 2022/1/27
 */
@Data
public class VideoCommentDTO {

    @ApiModelProperty("评论主键ID")
    @JsonSerialize(using = ToStringSerializer.class)
    private Long id;

    @ApiModelProperty("视频ID")
    @JsonSerialize(using = ToStringSerializer.class)
    private Long videoId;

    @ApiModelProperty("点赞数")
    private Integer likeCount;

    @ApiModelProperty("自己是否点赞")
    private Integer isLiked;

    @ApiModelProperty("会员ID")
    private Long memberId;

    @ApiModelProperty("会员头像")
    private String avatar;

    @ApiModelProperty("会员昵称")
    private String nickname;

    @ApiModelProperty("评论内容")
    private String commentText;

    @ApiModelProperty("评论图片")
    private String commentImgs;

    @ApiModelProperty("@了谁，下划线分割")
    private String at;

    @ApiModelProperty("评论父ID，为0则是主评论")
    private Long parentId;

    @ApiModelProperty("创建时间")
    private LocalDateTime createdAt;
}
