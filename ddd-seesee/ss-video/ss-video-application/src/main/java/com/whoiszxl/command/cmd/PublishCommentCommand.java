package com.whoiszxl.command.cmd;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

/**
 * 发布视频评论命令
 *
 * @author whoiszxl
 * @date 2022/1/27
 */
@Data
@ApiModel("发布视频评论命令")
public class PublishCommentCommand {

    @NotNull(message = "视频封面不能为空")
    @ApiModelProperty("视频ID")
    private Long videoId;

    @NotBlank(message = "评论内容不能为空")
    @ApiModelProperty("评论内容")
    private String commentText;

    @ApiModelProperty("评论图片")
    private String commentImgs;

    @ApiModelProperty("@了谁，下划线分割")
    private String at;

    @NotBlank(message = "评论父ID不能为空")
    @ApiModelProperty("评论父ID")
    private Long parentId;

}
