package com.ruoyi.file.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.file.domain.CommonFile;
import com.ruoyi.file.vo.commonfile.CommonFileListVo;
import com.ruoyi.file.vo.commonfile.CommonFileUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommonFileMapper extends BaseMapper<CommonFile> {
    List<CommonFileUser> selectCommonFileUser(@Param("userId") Long userId);
    List<CommonFileListVo> selectCommonFileByUser(@Param("userId") Long userId, @Param("sessionUserId") Long sessionUserId);

}
