package com.whoiszxl.db.converter;

import com.whoiszxl.aggregate.model.MemberAttention;
import com.whoiszxl.db.model.MemberAttentionPO;
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
public class MemberAttentionConverter {

    @Autowired
    private DozerUtils dozerUtils;


    public MemberAttention poToDomain(MemberAttentionPO memberAttentionPO) {
        MemberAttention memberAttention = dozerUtils.map(memberAttentionPO, MemberAttention.class);
        return memberAttention;
    }

    public MemberAttentionPO domainToPo(MemberAttention memberAttention) {
        MemberAttentionPO memberAttentionPO = dozerUtils.map(memberAttention, MemberAttentionPO.class);
        return memberAttentionPO;
    }
}
