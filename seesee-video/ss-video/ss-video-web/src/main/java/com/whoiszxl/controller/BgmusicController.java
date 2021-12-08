package com.whoiszxl.controller;


import cn.dev33.satoken.annotation.SaCheckLogin;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.whoiszxl.bean.ResponseResult;
import com.whoiszxl.dozer.DozerUtils;
import com.whoiszxl.entity.Bgmusic;
import com.whoiszxl.entity.query.BgMusicQuery;
import com.whoiszxl.entity.vo.BgmusicVO;
import com.whoiszxl.service.BgmusicService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 背景音乐表 前端控制器
 * </p>
 *
 * @author whoiszxl
 * @since 2021-12-08
 */
@RestController
@RequestMapping("/bgmusic")
@Api(tags = "背景音乐相关接口")
public class BgmusicController {

    @Autowired
    private BgmusicService bgmusicService;

    @Autowired
    private DozerUtils dozerUtils;

    @SaCheckLogin
    @PostMapping("/list")
    @ApiOperation(value = "分页获取背景音乐", notes = "分页获取背景音乐", response = BgmusicVO.class)
    public ResponseResult<IPage<BgmusicVO>> list(@RequestBody BgMusicQuery query) {
        LambdaQueryWrapper<Bgmusic> queryWrapper = new LambdaQueryWrapper<>();
        if(StringUtils.isNotBlank(query.getSearchKey())) {
            queryWrapper.like(Bgmusic::getMusicName, query.getSearchKey()).or().like(Bgmusic::getSinger, query.getSearchKey());
        }

        Page<Bgmusic> bgmusicPage = bgmusicService.page(new Page<>(query.getPage(), query.getSize()), queryWrapper);
        IPage<BgmusicVO> result = bgmusicPage.convert(item -> dozerUtils.map(item, BgmusicVO.class));
        return ResponseResult.buildSuccess(result);
    }
}

