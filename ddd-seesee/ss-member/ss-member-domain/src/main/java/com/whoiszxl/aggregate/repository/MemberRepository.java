package com.whoiszxl.aggregate.repository;

import com.whoiszxl.aggregate.model.Member;
import com.whoiszxl.model.ddd.Repository;

/**
 * TODO
 *
 * @author whoiszxl
 * @date 2022/1/24
 */
public interface MemberRepository extends Repository<Member, Long> {

    /**
     * 根据会员名称查询会员
     * @param username 会员名
     * @return
     */
    Member byUsername(String username);
}
