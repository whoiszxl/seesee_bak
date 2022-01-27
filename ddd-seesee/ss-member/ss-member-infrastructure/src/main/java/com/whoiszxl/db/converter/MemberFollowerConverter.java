package com.whoiszxl.db.converter;

import com.whoiszxl.aggregate.model.MemberFollower;
import com.whoiszxl.db.model.MemberFollowerPO;
import com.whoiszxl.dozer.DozerUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * follower 转换器
 *
 * @author whoiszxl
 * @date 2022/1/27
 */
@Component
public class MemberFollowerConverter {

    @Autowired
    private DozerUtils dozerUtils;


    public MemberFollower poToDomain(MemberFollowerPO memberFollowerPO) {
        MemberFollower memberFollower = dozerUtils.map(memberFollowerPO, MemberFollower.class);
        return memberFollower;
    }

    public MemberFollowerPO domainToPo(MemberFollower memberFollower) {
        MemberFollowerPO memberFollowerPO = dozerUtils.map(memberFollower, MemberFollowerPO.class);
        return memberFollowerPO;
    }
}
