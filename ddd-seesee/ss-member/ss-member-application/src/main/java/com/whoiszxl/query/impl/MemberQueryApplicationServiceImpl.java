package com.whoiszxl.query.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.whoiszxl.db.mapper.MemberFollowerMapper;
import com.whoiszxl.db.mapper.MemberInfoMapper;
import com.whoiszxl.db.mapper.MemberMapper;
import com.whoiszxl.db.model.MemberFollowerPO;
import com.whoiszxl.db.model.MemberInfoPO;
import com.whoiszxl.db.model.MemberPO;
import com.whoiszxl.dozer.DozerUtils;
import com.whoiszxl.dto.FollowerDTO;
import com.whoiszxl.dto.MemberDTO;
import com.whoiszxl.query.MemberQueryApplicationService;
import com.whoiszxl.query.model.response.MemberDetailResponse;
import com.whoiszxl.query.model.response.MemberResponse;
import com.whoiszxl.utils.AssertUtils;
import com.whoiszxl.utils.AuthUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;

/**
 * 用户查询应用服务接口实现
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
    private MemberFollowerMapper memberFollowerMapper;

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

    @Override
    public List<FollowerDTO> getFollowerList() {
        Long memberId = AuthUtils.getMemberId();
        List<MemberFollowerPO> memberFollowerPOList = memberFollowerMapper.selectList(Wrappers.<MemberFollowerPO>lambdaQuery().eq(MemberFollowerPO::getMemberId, memberId));
        List<FollowerDTO> followerDTOList = dozerUtils.mapList(memberFollowerPOList, FollowerDTO.class);
        return followerDTOList;
    }

    @Override
    public List<MemberDTO> findMemberInfoByIds(List<Long> memberIdList) {
        List<MemberPO> memberPOList = memberMapper.selectList(Wrappers.<MemberPO>lambdaQuery().in(MemberPO::getId, memberIdList));
        List<MemberDTO> memberDTOList = dozerUtils.mapList(memberPOList, MemberDTO.class);
        return memberDTOList;
    }

    @Override
    public MemberDetailResponse memberDetailById(String memberId) {
        MemberPO memberPO = memberMapper.selectById(memberId);
        MemberInfoPO memberInfoPO = memberInfoMapper.selectOne(Wrappers.<MemberInfoPO>lambdaQuery().eq(MemberInfoPO::getMemberId, memberId));

        MemberDetailResponse memberDetailResponse = dozerUtils.map(memberPO, MemberDetailResponse.class);
        dozerUtils.map(memberInfoPO, memberDetailResponse);
        return memberDetailResponse;
    }
}
