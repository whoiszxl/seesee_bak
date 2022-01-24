package com.whoiszxl.db.converter;

import com.whoiszxl.aggregate.model.Member;
import com.whoiszxl.db.model.MemberPO;
import com.whoiszxl.dozer.DozerUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * 用户转换器
 *
 * @author whoiszxl
 * @date 2022/1/24
 */
@Component
public class MemberConverter {

    @Autowired
    private DozerUtils dozerUtils;

    public static Member deserialize(MemberPO memberPO) {
        return null;
    }
}
