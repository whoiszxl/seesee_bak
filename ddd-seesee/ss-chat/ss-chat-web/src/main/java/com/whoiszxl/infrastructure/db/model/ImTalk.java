package com.whoiszxl.infrastructure.db.model;

import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import java.io.Serializable;

/**
 * 聊天对话表
 *
 * {
 *     "id": "自增ID",
 *     "memberId": "用户ID",
 *     "talkId": "对话ID: 好友ID或群组ID",
 *     "talkType": "对话类型: 1-好友 2-群组",
 *     "createdAt": "创建时间",
 *     "updatedAt": "更新时间"
 * }
 *
 * @author whoiszxl
 * @date 2022/2/15
 */
@Data
@TableName("im_talk")
@ApiModel(value = "ImTalk对象", description = "聊天对话表")
public class ImTalk implements Serializable {

    private Long id;

    private Long memberId;

    private Integer talkId;

    private Integer talkType;

    private String createdAt;

    private String updatedAt;

}
