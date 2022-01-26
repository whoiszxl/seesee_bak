package com.whoiszxl.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.whoiszxl.command.VideoApplicationService;
import com.whoiszxl.command.cmd.PublishVideoCommand;
import com.whoiszxl.model.query.PageQuery;
import com.whoiszxl.model.result.ResponseResult;
import com.whoiszxl.query.VideoQueryApplicationService;
import com.whoiszxl.query.model.dto.VideoDTO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 视频接口
 *
 * @author whoiszxl
 * @date 2022/1/26
 */
@RestController
@RequestMapping("/video")
@Api(tags = "视频接口")
public class VideoController {

    @Autowired
    private VideoApplicationService videoApplicationService;

    @Autowired
    private VideoQueryApplicationService videoQueryApplicationService;

    @PostMapping("/publish")
    @ApiOperation(value = "发布视频", notes = "发布视频", response = Boolean.class)
    public ResponseResult<Boolean> publish(@RequestBody PublishVideoCommand publishVideoCommand) {
        videoApplicationService.publishVideo(publishVideoCommand);
        return ResponseResult.buildSuccess();
    }

    @PostMapping("/list")
    @ApiOperation(value = "分页查询当前用户的发布视频列表", notes = "分页查询当前用户的发布视频列表", response = VideoDTO.class)
    public ResponseResult<IPage<VideoDTO>> videoList(@RequestBody PageQuery pageQuery) {
        IPage<VideoDTO> videoPage = videoQueryApplicationService.videoList(pageQuery);
        return ResponseResult.buildSuccess(videoPage);
    }


    @PostMapping("/attention/feed/list")
    @ApiOperation(value = "分页查询当前用户的关注用户视频feed流列表", notes = "分页查询当前用户的关注用户视频feed流列表", response = VideoDTO.class)
    public ResponseResult<IPage<VideoDTO>> attentionFeedList(@RequestBody PageQuery pageQuery) {
        IPage<VideoDTO> videoPage = videoQueryApplicationService.attentionFeedList(pageQuery);
        return ResponseResult.buildSuccess(videoPage);
    }

    @PostMapping("/recommend/feed/list")
    @ApiOperation(value = "分页查询当前用户的推荐视频feed流列表", notes = "分页查询当前用户的推荐视频feed流列表", response = VideoDTO.class)
    public ResponseResult<IPage<VideoDTO>> recommendFeedList(@RequestBody PageQuery pageQuery) {
        IPage<VideoDTO> videoPage = videoQueryApplicationService.recommendFeedList(pageQuery);
        return ResponseResult.buildSuccess(videoPage);
    }

    @PostMapping("/like/{videoId}")
    @ApiOperation(value = "点赞", notes = "点赞", response = Boolean.class)
    public ResponseResult<Boolean> like(@PathVariable Long videoId) {
        videoApplicationService.like(videoId);
        return ResponseResult.buildSuccess();
    }

    @PostMapping("/dislike/{videoId}")
    @ApiOperation(value = "取消点赞", notes = "取消点赞", response = Boolean.class)
    public ResponseResult<Boolean> dislike(@PathVariable Long videoId) {
        videoApplicationService.like(videoId);
        return ResponseResult.buildSuccess();
    }


    @PostMapping("/visitors")
    @ApiOperation(value = "查询视频的访客", notes = "查询视频的访客", response = Boolean.class)
    public ResponseResult<Boolean> videoVisitors(@PathVariable Long videoId) {
        videoQueryApplicationService.videoVisitors(videoId);
        return ResponseResult.buildSuccess();
    }

}