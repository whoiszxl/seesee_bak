package com.whoiszxl.db.converter;

import com.whoiszxl.aggregate.model.Member;
import com.whoiszxl.db.model.MemberPO;
import com.whoiszxl.dozer.DozerUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * 用户转换器
 *
 * @author whoiszxl
 * @date 2022/1/24
 */
@Component
public class MemberConverter {

    @Autowired
    private DozerUtils dozerUtils;

    public Member deserialize(MemberPO memberPO) {
        Member member = Member.builder()
                .id(memberPO.getId())
                .username(memberPO.getUsername())
                .password(memberPO.getPassword())
                .avatar(memberPO.getAvatar())
                .nickname(memberPO.getNickname())
                .googleKey(memberPO.getGoogleKey())
                .googleStatus(memberPO.getGoogleStatus())
                .realName(memberPO.getRealName())
                .email(memberPO.getEmail())
                .phone(memberPO.getPhone())
                .online(memberPO.getOnline())
                .status(memberPO.getStatus())
                .memberInfo(null) //TODO 聚合根组合，以及常量转枚举
                .build();

        return member;
    }
}
