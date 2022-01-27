package com.whoiszxl.adapter;

import com.whoiszxl.adapter.model.FollowerAdapterDTO;
import com.whoiszxl.adapter.model.MemberAdapterDTO;
import com.whoiszxl.model.ddd.Adapter;

import java.util.List;

/**
 * 用户client api适配器
 *
 * @author whoiszxl
 * @date 2022/1/27
 */
public interface MemberAdapter extends Adapter {

    List<FollowerAdapterDTO> memberFollowerList();

    List<MemberAdapterDTO> findMemberInfoByIds(List<Long> memberIdList);

}
