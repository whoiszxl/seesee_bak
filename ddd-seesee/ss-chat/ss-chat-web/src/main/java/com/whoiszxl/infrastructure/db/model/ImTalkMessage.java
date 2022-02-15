package com.whoiszxl.infrastructure.db.model;

import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import lombok.Data;

/**
 * {
 *     "id": "自增ID",
 *     "memberId": "用户ID",
 *     "friendId": "好友ID",
 *     "talkType": "对话类型: 1-好友 2-群组",
 *     "message": "消息体",
 *     "messageTime": "消息时间",
 *     "createdAt": "创建时间",
 *     "updatedAt": "更新时间"
 * }
 *
 * @author whoiszxl
 * @date 2022/2/15
 */
@Data
@TableName("im_talk_message")
@ApiModel(value = "ImTalkMessage对象", description = "聊天记录表")
public class ImTalkMessage {

    private Long id;

    private Long memberId;

    private Long friendId;

    private Integer talkType;

    private String message;

    private String messageTime;

    private String createdAt;

    private String updatedAt;
}
