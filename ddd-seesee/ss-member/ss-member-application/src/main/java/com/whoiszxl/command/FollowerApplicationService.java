package com.whoiszxl.command;

import com.whoiszxl.command.cmd.FollowMemberCommand;
import com.whoiszxl.model.ddd.ApplicationService;

/**
 * 关注应用服务接口
 *
 * @author whoiszxl
 * @date 2022/1/27
 */
public interface FollowerApplicationService extends ApplicationService {

    /**
     * 关注用户
     * @param followMemberCommand
     */
    void follow(FollowMemberCommand followMemberCommand);
}
