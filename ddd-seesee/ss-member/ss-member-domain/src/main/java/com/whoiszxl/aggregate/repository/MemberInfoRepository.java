package com.whoiszxl.aggregate.repository;

import com.whoiszxl.aggregate.model.MemberInfo;
import com.whoiszxl.model.ddd.Repository;

/**
 * 会员详情信息领域仓储服务
 *
 * @author whoiszxl
 * @date 2022/1/24
 */
public interface MemberInfoRepository extends Repository<MemberInfo, Long> {

    MemberInfo byMemberId(Long memberId);

}
