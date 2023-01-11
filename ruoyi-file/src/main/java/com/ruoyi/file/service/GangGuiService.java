package com.ruoyi.file.service;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.annotation.DataSource;
import com.ruoyi.common.enums.DataSourceType;
import com.ruoyi.file.api.IGangGuiService;
import com.ruoyi.file.domain.railway.GangGui;
import com.ruoyi.file.mapper.GangGuiMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Slf4j
@Service
@Transactional(rollbackFor=Exception.class)
public class GangGuiService extends ServiceImpl<GangGuiMapper, GangGui> implements IGangGuiService {

    @Resource
    GangGuiMapper gangGuiMapper;

    @Override
    public List<GangGui> selectByMainCode(String code) {
        if(code!=null&&code.length()>0){
            LambdaQueryWrapper<GangGui> queryWrapper=new LambdaQueryWrapper();
            queryWrapper.eq(GangGui::getMainCode,code);
            List<GangGui> list= gangGuiMapper.selectList(queryWrapper);
            return list;
        }
        return null;
    }

}
