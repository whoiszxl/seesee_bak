package com.whoiszxl.api;

import com.whoiszxl.command.MemberApplicationService;
import com.whoiszxl.dto.FollowerDTO;
import com.whoiszxl.dto.MemberDTO;
import com.whoiszxl.feign.MemberApiClient;
import com.whoiszxl.query.MemberQueryApplicationService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Api(tags = "rpc调用：用户服务")
@RestController
public class MemberApiClientImpl implements MemberApiClient {

    @Autowired
    private MemberApplicationService memberApplicationService;

    @Autowired
    private MemberQueryApplicationService memberQueryApplicationService;

    @Override
    public List<FollowerDTO> memberFollowerList() {
        List<FollowerDTO> result = memberQueryApplicationService.getFollowerList();
        return result;
    }

    @Override
    public List<MemberDTO> findMemberInfoByIds(List<Long> memberIdList) {
        List<MemberDTO> result = memberQueryApplicationService.findMemberInfoByIds(memberIdList);
        return result;
    }
}
