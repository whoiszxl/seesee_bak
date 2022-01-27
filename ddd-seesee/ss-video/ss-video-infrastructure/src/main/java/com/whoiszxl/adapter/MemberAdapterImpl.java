package com.whoiszxl.adapter;

import com.whoiszxl.adapter.model.FollowerAdapterDTO;
import com.whoiszxl.adapter.model.MemberAdapterDTO;
import com.whoiszxl.dozer.DozerUtils;
import com.whoiszxl.dto.FollowerDTO;
import com.whoiszxl.dto.MemberDTO;
import com.whoiszxl.feign.MemberApiClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * TODO
 *
 * @author whoiszxl
 * @date 2022/1/27
 */
@Component
public class MemberAdapterImpl implements MemberAdapter {

    @Autowired
    private MemberApiClient memberApiClient;

    @Autowired
    private DozerUtils dozerUtils;

    @Override
    public List<FollowerAdapterDTO> memberFollowerList() {
        List<FollowerDTO> followerDTOList = memberApiClient.memberFollowerList();
        return dozerUtils.mapList(followerDTOList, FollowerAdapterDTO.class);
    }

    @Override
    public List<MemberAdapterDTO> findMemberInfoByIds(List<Long> memberIdList) {
        List<MemberDTO> memberInfoDTOList = memberApiClient.findMemberInfoByIds(memberIdList);
        List<MemberAdapterDTO> memberInfoAdapterDTOList = dozerUtils.mapList(memberInfoDTOList, MemberAdapterDTO.class);
        return memberInfoAdapterDTOList;
    }
}
