package com.whoiszxl.utils;

import com.whoiszxl.exception.ExceptionCatcher;
import com.whoiszxl.model.result.ResponseResult;
import org.apache.commons.lang3.StringUtils;

import java.lang.reflect.Field;

/**
 * 校验参数有效性工具类
 *
 * @author whoiszxl
 * @date 2021/3/17
 */
public class ValidateUtils {


    /**
     * 校验密码是否一致及强度
     * @param password
     * @param rePassword
     */
    public static void checkPasswordEqual(String password, String rePassword) {
        if(!StringUtils.equals(password, rePassword)) {
            ExceptionCatcher.catchValidateEx(ResponseResult.buildError("两次输入的密码不一致"));
        }
    }

    public static void checkPasswordLevel(String password) {
        CheckPasswordUtils.LEVEL passwordLevel = CheckPasswordUtils.getPasswordLevel(password);
        if(passwordLevel.equals(CheckPasswordUtils.LEVEL.EASY)) {
            ExceptionCatcher.catchValidateEx(ResponseResult.buildError("密码过于简单"));
        }
    }

    /**
     *  校验手机格式
     * @param phone
     */
    public static void checkPhoneRegex(String phone) {
        if(!RegexUtils.checkPhone(phone)) {
            ExceptionCatcher.catchValidateEx(ResponseResult.buildError("手机格式错误"));
        }
    }

    public static boolean checkObjFieldHaveValue(Object obj) throws IllegalAccessException {
        for(Field f : obj.getClass().getDeclaredFields()){
            f.setAccessible(true);
            if(f.get(obj) != null){
                return true;
            }
        }
        return false;
    }

    private ValidateUtils() {}
}