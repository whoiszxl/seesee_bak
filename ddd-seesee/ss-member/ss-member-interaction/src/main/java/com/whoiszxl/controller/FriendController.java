package com.whoiszxl.controller;

import com.whoiszxl.command.FollowerApplicationService;
import com.whoiszxl.command.cmd.FollowMemberCommand;
import com.whoiszxl.command.cmd.UpdateMemberCommand;
import com.whoiszxl.dto.MemberDTO;
import com.whoiszxl.model.result.ResponseResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 好友相关接口
 *
 * @author whoiszxl
 * @date 2022/1/27
 */
@RestController
@RequestMapping("/friend")
@Api(tags = "好友相关接口")
public class FriendController {

    @Autowired
    private FollowerApplicationService followerApplicationService;

    @PostMapping("/follow")
    @ApiOperation(value = "关注他人", notes = "关注他人", response = Boolean.class)
    public ResponseResult<Boolean> follow(@RequestBody FollowMemberCommand followMemberCommand) {
        followerApplicationService.follow(followMemberCommand);
        return ResponseResult.buildSuccess();
    }
}
