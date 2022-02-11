package com.whoiszxl.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * 用户DTO
 *
 * @author whoiszxl
 * @date 2022/1/27
 */
@Data
public class MemberDTO implements Serializable {

    private String id;

    private String nickname;

    private String avatar;

}
