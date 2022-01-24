package com.whoiszxl.command;

import com.whoiszxl.command.cmd.MemberLoginCommand;
import com.whoiszxl.command.cmd.UpdateMemberCommand;
import com.whoiszxl.model.ddd.ApplicationService;

/**
 * 会员应用服务
 *
 * 主要是对业务逻辑进行编排，仅对领域服务与领域模型进行编排
 *
 * @author whoiszxl
 * @date 2022/1/24
 */
public interface MemberApplicationService extends ApplicationService {

    /**
     * 更新当前登录用户的详细信息
     * @param updateMemberCommand
     */
    void updateMemberInfo(UpdateMemberCommand updateMemberCommand);

    /**
     * 会员登录
     * @param loginCommand
     * @return
     */
    String login(MemberLoginCommand loginCommand);

    /**
     * 会员注册
     * @param loginCommand
     */
    void register(MemberLoginCommand loginCommand);
}
