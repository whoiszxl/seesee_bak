package com.whoiszxl.event;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 视频发布成功事件
 *
 * @author whoiszxl
 * @date 2022/1/24
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class VideoPublishSuccessEvent {

    private Long videoId;

}
