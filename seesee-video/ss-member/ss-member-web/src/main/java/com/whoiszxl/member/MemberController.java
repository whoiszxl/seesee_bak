package com.whoiszxl.member;

import com.whoiszxl.bean.Address;
import com.whoiszxl.logger.annotation.SSLog;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

/**
 * TODO
 *
 * @author whoiszxl
 * @date 2021/11/30
 */
@RestController
@RequestMapping("/member")
@Api(tags = "用户控制器")
public class MemberController {

    @PostMapping("/save")
    @ApiOperation(value = "新增地址", notes = "新增地址信息")
    @SSLog("新增地址")
    public String save(@RequestBody Address user){
        return "OK";
    }

    @PutMapping("/update")
    @ApiOperation(value = "修改地址", notes = "修改地址信息")
    @SSLog("修改地址")
    public String update(@RequestBody Address user){
        return "OK";
    }


    @GetMapping("/list")
    @ApiOperation(value = "获取地址列表", notes = "获取地址列表")
    @SSLog("获取地址列表")
    public String list(@RequestParam("name") String name){
        return "OK";
    }
}
