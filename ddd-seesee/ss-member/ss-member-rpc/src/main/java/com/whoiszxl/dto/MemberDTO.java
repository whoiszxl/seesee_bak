package com.whoiszxl.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * TODO
 *
 * @author whoiszxl
 * @date 2022/1/27
 */
@Data
public class MemberDTO implements Serializable {

    private Long id;

    private String nickname;

    private String avatar;

}
