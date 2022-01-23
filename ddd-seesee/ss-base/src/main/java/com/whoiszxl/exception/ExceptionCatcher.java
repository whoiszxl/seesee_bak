package com.whoiszxl.exception;

import com.whoiszxl.exception.customize.DataNullException;
import com.whoiszxl.exception.customize.DatabaseUpdateException;
import com.whoiszxl.exception.customize.JwtAuthException;
import com.whoiszxl.exception.customize.ValidateException;
import com.whoiszxl.model.result.ResponseResult;

/**
 * 异常捕获
 *
 * @author whoiszxl
 * @date 2021/3/17
 */
public class ExceptionCatcher {

    public static void catchAuthFailEx(){
        throw new JwtAuthException();
    }

    public static void catchDatabaseFailEx(){
        throw new DatabaseUpdateException(ResponseResult.buildError("数据库更新错误"));
    }

    public static void catchValidateEx(ResponseResult result){
        throw new ValidateException(result);
    }

    public static void catchNullEx(ResponseResult result) {
        throw new DataNullException(result);
    }

}