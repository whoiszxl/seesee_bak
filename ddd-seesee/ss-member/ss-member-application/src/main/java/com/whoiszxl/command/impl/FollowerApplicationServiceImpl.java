package com.whoiszxl.command.impl;

import com.whoiszxl.aggregate.model.MemberAttention;
import com.whoiszxl.aggregate.model.MemberFollower;
import com.whoiszxl.aggregate.repository.MemberAttentionRepository;
import com.whoiszxl.aggregate.repository.MemberFollowerRepository;
import com.whoiszxl.command.FollowerApplicationService;
import com.whoiszxl.command.cmd.FollowMemberCommand;
import com.whoiszxl.utils.AuthUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 关注应用服务接口实现
 *
 * @author whoiszxl
 * @date 2022/1/27
 */
@Service
public class FollowerApplicationServiceImpl implements FollowerApplicationService {

    @Autowired
    private MemberFollowerRepository memberFollowerRepository;

    @Autowired
    private MemberAttentionRepository memberAttentionRepository;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void follow(FollowMemberCommand followMemberCommand) {
        Long memberId = AuthUtils.getMemberId();
        
        MemberFollower memberFollower = new MemberFollower();
        memberFollower.setMemberId(followMemberCommand.getMemberId());
        memberFollower.setFollowerId(memberId);

        MemberAttention memberAttention = new MemberAttention();
        memberAttention.setMemberId(memberId);
        memberAttention.setAttentionId(followMemberCommand.getMemberId());

        memberFollowerRepository.save(memberFollower);
        memberAttentionRepository.save(memberAttention);

        //TODO 发送领域事件

    }
}
