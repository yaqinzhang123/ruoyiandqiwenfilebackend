package com.ruoyi.file.api;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.file.domain.CommonFile;
import com.ruoyi.file.vo.commonfile.CommonFileListVo;
import com.ruoyi.file.vo.commonfile.CommonFileUser;

import java.util.List;

public interface ICommonFileService extends IService<CommonFile> {
    List<CommonFileUser> selectCommonFileUser(Long userId);
    List<CommonFileListVo> selectCommonFileByUser(Long userId, Long sessionUserId);
}