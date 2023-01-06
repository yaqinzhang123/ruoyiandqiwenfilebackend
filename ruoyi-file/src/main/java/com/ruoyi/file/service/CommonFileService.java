package com.ruoyi.file.service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.file.api.ICommonFileService;
import com.ruoyi.file.domain.CommonFile;
import com.ruoyi.file.mapper.CommonFileMapper;
import com.ruoyi.file.vo.commonfile.CommonFileListVo;
import com.ruoyi.file.vo.commonfile.CommonFileUser;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Slf4j
@Service
@Transactional(rollbackFor=Exception.class)
public class CommonFileService extends ServiceImpl<CommonFileMapper, CommonFile> implements ICommonFileService {

    @Resource
    CommonFileMapper commonFileMapper;

    @Override
    public List<CommonFileUser> selectCommonFileUser(Long userId) {
        return commonFileMapper.selectCommonFileUser(userId);
    }

    @Override
    public List<CommonFileListVo> selectCommonFileByUser(Long userId, Long sessionUserId) {
        return commonFileMapper.selectCommonFileByUser(userId, sessionUserId);
    }


}
