package com.whoiszxl.query;

import com.whoiszxl.dto.FollowerDTO;
import com.whoiszxl.dto.MemberDTO;
import com.whoiszxl.query.model.response.MemberDetailResponse;
import com.whoiszxl.query.model.response.MemberResponse;

import java.util.List;

/**
 * 用户查询应用服务接口
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

    /**
     * 查询粉丝列表
     * @return
     */
    List<FollowerDTO> getFollowerList();

    /**
     * 通过用户id列表批量获取用户信息
     * @param memberIdList
     * @return
     */
    List<MemberDTO> findMemberInfoByIds(List<Long> memberIdList);

    /**
     * 通过用户主键ID获取用户详细信息
     * @param memberId
     * @return
     */
    MemberDetailResponse memberDetailById(String memberId);
}
