package com.whoiszxl.service.impl;

import com.whoiszxl.entity.Member;
import com.whoiszxl.mapper.MemberMapper;
import com.whoiszxl.service.IMemberService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 会员表 服务实现类
 * </p>
 *
 * @author whoiszxl
 * @since 2021-12-08
 */
@Service
public class MemberServiceImpl extends ServiceImpl<MemberMapper, Member> implements IMemberService {

}
