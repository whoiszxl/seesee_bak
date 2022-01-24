package com.whoiszxl.ability.member;

import com.whoiszxl.ability.member.cmd.CreateMemberAbilityCommand;
import com.whoiszxl.ability.share.BaseAbility;
import com.whoiszxl.model.result.ResponseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.whoiszxl.aggregate.repository.MemberRepository;

/**
 * TODO
 *
 * @author whoiszxl
 * @date 2022/1/24
 */
@Service
public class MemberCreateAbility extends BaseAbility<CreateMemberAbilityCommand, Void> {

    @Autowired
    private MemberRepository memberRepository;

    @Override
    public void checkHandler(CreateMemberAbilityCommand abilityCmd) {
        //1. 校验用户名不存在


    }

    @Override
    public ResponseResult<Void> checkIdempotent(CreateMemberAbilityCommand abilityCmd) {
        return null;
    }

    @Override
    public ResponseResult<Void> execute(CreateMemberAbilityCommand abilityCmd) {
        return null;
    }
}
