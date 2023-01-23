package com.ruoyi.file.api;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.file.domain.railway.GuiZhen;

import java.util.List;

public interface IGuiZhenService extends IService<GuiZhen> {
    List<GuiZhen> selectByMainCode(String code);
}
