package com.whoiszxl.infrastructure.db.repository.impl;

import com.whoiszxl.infrastructure.db.mapper.ImTalkMapper;
import com.whoiszxl.infrastructure.db.model.ImTalk;
import com.whoiszxl.infrastructure.db.repository.ImTalkRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Objects;

/**
 * 聊天窗口仓储服务实现
 *
 * @author whoiszxl
 * @date 2022/2/15
 */
@Repository
public class ImTalkRepositoryImpl implements ImTalkRepository {

    @Autowired
    private ImTalkMapper imTalkMapper;

    @Override
    public void delete(Long id) {
        imTalkMapper.deleteById(id);
    }

    @Override
    public ImTalk byId(Long id) {
        ImTalk imTalk = imTalkMapper.selectById(id);
        if(Objects.isNull(imTalk)) {
            return null;
        }
        return imTalk;
    }

    @Override
    public ImTalk save(ImTalk imTalk) {
        if(Objects.isNull(imTalk.getId())) {
            imTalkMapper.insert(imTalk);
        }else {
            imTalkMapper.updateById(imTalk);
        }
        return imTalk;
    }

}
