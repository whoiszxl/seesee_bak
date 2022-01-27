package com.whoiszxl.feign;

import com.whoiszxl.config.OAuth2FeignConfig;
import com.whoiszxl.dto.FollowerDTO;
import com.whoiszxl.dto.MemberDTO;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

@FeignClient(
        name = "ss-member",
        contextId = "MemberApiClient",
        configuration = OAuth2FeignConfig.class
)
public interface MemberApiClient {

    @GetMapping("/follower/list")
    List<FollowerDTO> memberFollowerList();

    @PostMapping("/member/info")
    List<MemberDTO> findMemberInfoByIds(@RequestBody List<Long> memberIdList);
}
