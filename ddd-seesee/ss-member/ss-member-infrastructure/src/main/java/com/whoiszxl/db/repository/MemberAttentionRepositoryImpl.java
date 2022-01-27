package com.whoiszxl.db.repository;

import com.whoiszxl.aggregate.model.MemberAttention;
import com.whoiszxl.aggregate.repository.MemberAttentionRepository;
import com.whoiszxl.db.converter.MemberAttentionConverter;
import com.whoiszxl.db.mapper.MemberAttentionMapper;
import com.whoiszxl.db.model.MemberAttentionPO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Objects;

/**
 * 会员详情信息领域仓储服务实现
 *
 * @author whoiszxl
 * @date 2022/1/24
 */
@Repository
public class MemberAttentionRepositoryImpl implements MemberAttentionRepository {
    
    @Autowired
    private MemberAttentionMapper memberAttentionMapper;

    @Autowired
    private MemberAttentionConverter memberAttentionConverter;

    @Override
    public void delete(Long id) {
        memberAttentionMapper.deleteById(id);
    }

    @Override
    public MemberAttention byId(Long id) {
        MemberAttentionPO memberAttentionPO = memberAttentionMapper.selectById(id);
        return memberAttentionConverter.poToDomain(memberAttentionPO);
    }

    @Override
    public MemberAttention save(MemberAttention memberAttention) {
        MemberAttentionPO memberAttentionPO = memberAttentionConverter.domainToPo(memberAttention);
        if(Objects.isNull(memberAttentionPO.getId())) {
            memberAttentionMapper.insert(memberAttentionPO);
        }else {
            memberAttentionMapper.updateById(memberAttentionPO);
        }
        return memberAttention;
    }
    
}
