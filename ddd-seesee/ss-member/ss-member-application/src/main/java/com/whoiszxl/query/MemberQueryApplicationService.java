package com.whoiszxl.query;

import com.whoiszxl.query.model.response.MemberResponse;

/**
 * TODO
 *
 * @author whoiszxl
 * @date 2022/1/24
 */
public interface MemberQueryApplicationService {

    /**
     * 查询当前登录用户的用户信息
     * @return
     */
    MemberResponse memberInfo();

}
