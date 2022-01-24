package com.whoiszxl.command.impl;

import com.whoiszxl.ability.member.MemberCreateAbility;
import com.whoiszxl.aggregate.model.Member;
import com.whoiszxl.aggregate.repository.MemberRepository;
import com.whoiszxl.command.MemberApplicationService;
import com.whoiszxl.command.cmd.MemberLoginCommand;
import com.whoiszxl.command.cmd.UpdateMemberCommand;
import com.whoiszxl.event.DomainEventPublisher;
import com.whoiszxl.event.MemberLoginSuccessEvent;
import com.whoiszxl.utils.AssertUtils;
import com.whoiszxl.utils.AuthUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Objects;

/**
 * 会员应用服务实现
 *
 * @author whoiszxl
 * @date 2022/1/24
 */
@Slf4j
@Service
public class MemberApplicationServiceImpl implements MemberApplicationService {

    @Autowired
    private MemberCreateAbility memberCreateAbility;

    @Autowired
    private MemberRepository memberRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private DomainEventPublisher domainEventPublisher;


    @Override
    public void updateMemberInfo(UpdateMemberCommand updateMemberCommand) {

    }

    @Override
    public String login(MemberLoginCommand loginCommand) {
        //1. 校验账号密码是否匹配
        Member member = memberRepository.byUsername(loginCommand.getUsername());
        AssertUtils.isTrue(Objects.nonNull(member), "用户不存在");
        AssertUtils.isTrue(passwordEncoder.matches(loginCommand.getPassword(), member.getPassword()), "账号或密码错误");

        //2. 登录
        member.login();

        //3. 更新最后的登录时间
        member.updateLastLoginTime();

        //4. 发布登录成功的领域事件，处理后续的活跃度更新，登录时间更新等操作
        domainEventPublisher.publishMemberLoginSuccessEvent(new MemberLoginSuccessEvent(member.getId()));

        //5. 返回token
        return member.getCurrentToken();
    }

    @Override
    public void register(MemberLoginCommand loginCommand) {

    }
}
