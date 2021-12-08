package com.whoiszxl.controller;


import cn.dev33.satoken.annotation.SaCheckLogin;
import cn.dev33.satoken.stp.StpUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.whoiszxl.bean.PageQuery;
import com.whoiszxl.bean.ResponseResult;
import com.whoiszxl.dozer.DozerUtils;
import com.whoiszxl.entity.Video;
import com.whoiszxl.entity.vo.LikeVO;
import com.whoiszxl.entity.vo.VideoVO;
import com.whoiszxl.service.VideoService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 视频表 前端控制器
 * </p>
 *
 * 点赞实现：
 *
 * @author whoiszxl
 * @since 2021-12-08
 */
@RestController
@RequestMapping("/video")
@Api(tags = "短视频相关接口")
public class VideoController {

    @Autowired
    private VideoService videoService;

    @Autowired
    private DozerUtils dozerUtils;

    @PostMapping("/list")
    @ApiOperation(value = "分页获取短视频列表", notes = "分页获取短视频列表", response = VideoVO.class)
    public ResponseResult<IPage<VideoVO>> list(@RequestBody PageQuery query) {
        LambdaQueryWrapper<Video> queryWrapper = new LambdaQueryWrapper<>();
        Page<Video> videoPage = videoService.page(new Page<>(query.getPage(), query.getSize()), queryWrapper);
        IPage<VideoVO> result = videoPage.convert(item -> dozerUtils.map(item, VideoVO.class));
        return ResponseResult.buildSuccess(result);
    }


    @SaCheckLogin
    @PostMapping("/like")
    @ApiOperation(value = "点赞或取消点赞", notes = "点赞或取消点赞", response = Boolean.class)
    public ResponseResult<Boolean> like(@RequestBody LikeVO likeVO) {
        long memberId = StpUtil.getLoginIdAsLong();
        likeVO.setMemberId(memberId);
        videoService.like(likeVO);
        return ResponseResult.buildSuccess();
    }


    @SaCheckLogin
    @PostMapping("/publish")
    @ApiOperation(value = "发表视频", notes = "发表视频", response = Boolean.class)
    public ResponseResult<Boolean> publish(@RequestBody VideoVO videoVO) {
        long memberId = StpUtil.getLoginIdAsLong();
        //TODO 发表视频
        return ResponseResult.buildSuccess();
    }




}

