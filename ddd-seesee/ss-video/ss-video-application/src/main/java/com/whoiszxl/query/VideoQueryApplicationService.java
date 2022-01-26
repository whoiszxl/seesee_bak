package com.whoiszxl.query;

import com.whoiszxl.model.query.PageQuery;

/**
 * 视频查询应用服务接口
 *
 * @author whoiszxl
 * @date 2022/1/26
 */
public interface VideoQueryApplicationService {

    void feedList(PageQuery pageQuery);

    void videoVisitors(Long videoId);
}
