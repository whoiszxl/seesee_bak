package com.whoiszxl.controller;

import io.swagger.annotations.Api;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * IM通信相关接口
 *
 * @author whoiszxl
 * @date 2022/2/15
 */
@RestController
@RequestMapping("/chat")
@Api(tags = "IM通信相关接口")
public class ChatController {

    @GetMapping("/test/insert")
    public String test() {
        return "okk";
    }

}
