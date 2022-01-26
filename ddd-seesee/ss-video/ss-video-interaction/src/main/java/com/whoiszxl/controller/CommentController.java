package com.whoiszxl.controller;

import com.whoiszxl.command.CommentApplicationService;
import com.whoiszxl.command.VideoApplicationService;
import com.whoiszxl.model.result.ResponseResult;
import com.whoiszxl.query.CommentQueryApplicationService;
import com.whoiszxl.query.VideoQueryApplicationService;
import com.whoiszxl.query.model.qry.CommentListQuery;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 评论接口
 *
 * @author whoiszxl
 * @date 2022/1/26
 */
@RestController
@RequestMapping("/comment")
@Api(tags = "评论接口")
public class CommentController {

    @Autowired
    private CommentApplicationService commentApplicationService;

    @Autowired
    private CommentQueryApplicationService commentQueryApplicationService;


    @PostMapping("/list")
    @ApiOperation(value = "评论列表", notes = "评论列表", response = Boolean.class)
    public ResponseResult<Boolean> commentList(@RequestBody CommentListQuery commentListQuery) {
        commentQueryApplicationService.commentList(commentListQuery);
        return ResponseResult.buildSuccess();
    }


    @PostMapping("/like/{commentId}")
    @ApiOperation(value = "评论点赞", notes = "点赞", response = Boolean.class)
    public ResponseResult<Boolean> commentLike(@PathVariable Long commentId) {
        commentApplicationService.commentLike(commentId);
        return ResponseResult.buildSuccess();
    }

    @PostMapping("/dislike/{commentId}")
    @ApiOperation(value = "评论取消点赞", notes = "取消点赞", response = Boolean.class)
    public ResponseResult<Boolean> commentLikeDislike(@PathVariable Long commentId) {
        commentApplicationService.commentLikeDislike(commentId);
        return ResponseResult.buildSuccess();
    }
}
