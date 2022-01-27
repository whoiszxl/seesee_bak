package com.whoiszxl.db.repository;

import com.whoiszxl.aggregate.model.MemberFollower;
import com.whoiszxl.aggregate.repository.MemberFollowerRepository;
import com.whoiszxl.db.converter.MemberFollowerConverter;
import com.whoiszxl.db.mapper.MemberFollowerMapper;
import com.whoiszxl.db.model.MemberFollowerPO;
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
public class MemberFollowerRepositoryImpl implements MemberFollowerRepository {

    @Autowired
    private MemberFollowerMapper memberFollowerMapper;

    @Autowired
    private MemberFollowerConverter memberFollowerConverter;

    @Override
    public void delete(Long id) {
        memberFollowerMapper.deleteById(id);
    }

    @Override
    public MemberFollower byId(Long id) {
        MemberFollowerPO memberFollowerPO = memberFollowerMapper.selectById(id);
        return memberFollowerConverter.poToDomain(memberFollowerPO);
    }

    @Override
    public MemberFollower save(MemberFollower memberFollower) {
        MemberFollowerPO memberFollowerPO = memberFollowerConverter.domainToPo(memberFollower);
        if(Objects.isNull(memberFollowerPO.getId())) {
            memberFollowerMapper.insert(memberFollowerPO);
        }else {
            memberFollowerMapper.updateById(memberFollowerPO);
        }
        return memberFollower;
    }

}
