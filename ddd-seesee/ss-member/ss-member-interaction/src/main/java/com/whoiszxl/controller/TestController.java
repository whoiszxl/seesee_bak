package com.whoiszxl.controller;


import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/test")
@Api(tags = "测试控制器")
public class TestController {

    @GetMapping
    @ApiOperation(value = "hello", notes = "hello notes", response = String.class)
    public String hello() {
        return "hello";
    }
}

