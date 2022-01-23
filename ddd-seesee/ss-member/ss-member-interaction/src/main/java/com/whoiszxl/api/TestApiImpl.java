package com.whoiszxl.api;

import io.swagger.annotations.Api;
import org.springframework.web.bind.annotation.RestController;

@Api(tags = "rpc调用：test")
@RestController
public class TestApiImpl implements TestApi {

    @Override
    public String getById(String id) {
        return "this is result: " + id;
    }
}
