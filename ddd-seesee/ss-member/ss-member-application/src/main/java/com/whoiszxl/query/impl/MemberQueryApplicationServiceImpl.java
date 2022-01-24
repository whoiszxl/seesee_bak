package com.whoiszxl.query.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.whoiszxl.aggregate.model.MemberInfo;
import com.whoiszxl.auth.AuthUtils;
import com.whoiszxl.db.mapper.MemberInfoMapper;
import com.whoiszxl.db.mapper.MemberMapper;
import com.whoiszxl.db.model.MemberInfoPO;
import com.whoiszxl.db.model.MemberPO;
import com.whoiszxl.dozer.DozerUtils;
import com.whoiszxl.query.MemberQueryApplicationService;
import com.whoiszxl.query.model.response.MemberResponse;
import com.whoiszxl.utils.AssertUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Objects;

/**
 * TODO
 *
 * @author whoiszxl
 * @date 2022/1/24
 */
@Service
public class MemberQueryApplicationServiceImpl implements MemberQueryApplicationService {

    @Autowired
    private MemberMapper memberMapper;

    @Autowired
    private MemberInfoMapper memberInfoMapper;

    @Autowired
    private DozerUtils dozerUtils;

    @Override
    public MemberResponse memberInfo() {
        Long memberId = AuthUtils.getMemberId();
        AssertUtils.isTrue(Objects.nonNull(memberId), "未登录");

        MemberPO memberPO = memberMapper.selectById(memberId);
        MemberInfoPO memberInfoPO = memberInfoMapper.selectOne(Wrappers.<MemberInfoPO>lambdaQuery().eq(MemberInfoPO::getMemberId, memberId));

        MemberResponse memberResponse = dozerUtils.map(memberPO, MemberResponse.class);
        dozerUtils.map(memberInfoPO, memberResponse);
        return memberResponse;
    }
}
