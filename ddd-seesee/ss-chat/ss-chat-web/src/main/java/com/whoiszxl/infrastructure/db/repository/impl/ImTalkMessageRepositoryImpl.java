package com.whoiszxl.infrastructure.db.repository.impl;

import com.whoiszxl.infrastructure.db.mapper.ImTalkMessageMapper;
import com.whoiszxl.infrastructure.db.model.ImTalkMessage;
import com.whoiszxl.infrastructure.db.repository.ImTalkMessageRepository;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Objects;

/**
 * 聊天记录仓储服务实现
 *
 * @author whoiszxl
 * @date 2022/2/15
 */
public class ImTalkMessageRepositoryImpl implements ImTalkMessageRepository {

    @Autowired
    private ImTalkMessageMapper imTalkMessageMapper;

    @Override
    public void delete(Long id) {
        imTalkMessageMapper.deleteById(id);
    }

    @Override
    public ImTalkMessage byId(Long id) {
        return imTalkMessageMapper.selectById(id);
    }

    @Override
    public ImTalkMessage save(ImTalkMessage imTalkMessage) {
        if(Objects.isNull(imTalkMessage.getId())) {
            imTalkMessageMapper.insert(imTalkMessage);
        }else {
            imTalkMessageMapper.updateById(imTalkMessage);
        }
        return imTalkMessage;
    }
}
