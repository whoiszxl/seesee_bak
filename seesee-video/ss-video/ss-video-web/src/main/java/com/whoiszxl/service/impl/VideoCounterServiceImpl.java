package com.whoiszxl.service.impl;

import com.whoiszxl.entity.VideoCounter;
import com.whoiszxl.mapper.VideoCounterMapper;
import com.whoiszxl.service.VideoCounterService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 视频计数表 服务实现类
 * </p>
 *
 * @author whoiszxl
 * @since 2021-12-08
 */
@Service
public class VideoCounterServiceImpl extends ServiceImpl<VideoCounterMapper, VideoCounter> implements VideoCounterService {

}
