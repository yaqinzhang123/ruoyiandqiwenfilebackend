package com.ruoyi.file.api;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.file.domain.railway.GangGui;

import java.util.List;

public interface IGangGuiService extends IService<GangGui> {
    List<GangGui> selectByMainCode(String code);
}
