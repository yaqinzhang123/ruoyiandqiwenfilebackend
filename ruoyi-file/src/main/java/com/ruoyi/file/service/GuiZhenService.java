package com.ruoyi.file.service;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.annotation.DataSource;
import com.ruoyi.common.enums.DataSourceType;
import com.ruoyi.file.api.IGuiZhenService;
import com.ruoyi.file.domain.railway.GuiZhen;
import com.ruoyi.file.mapper.GuiZhenMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Slf4j
@Service
@Transactional(rollbackFor=Exception.class)
public class GuiZhenService extends ServiceImpl<GuiZhenMapper, GuiZhen> implements IGuiZhenService {

    @Resource
    GuiZhenMapper guiZhenMapper;

    @Override
    public List<GuiZhen> selectByMainCode(String code) {
        if(code!=null&&code.length()>0){
            LambdaQueryWrapper<GuiZhen> queryWrapper=new LambdaQueryWrapper();
            queryWrapper.eq(GuiZhen::getMainCode,code);
            List<GuiZhen> list= guiZhenMapper.selectList(queryWrapper);
            return list;
        }
        return null;
    }

}
