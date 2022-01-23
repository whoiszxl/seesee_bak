package com.whoiszxl.api;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/test")
public interface TestApi {

    @GetMapping("/getById")
    String getById(@RequestParam("id") String id);
}
