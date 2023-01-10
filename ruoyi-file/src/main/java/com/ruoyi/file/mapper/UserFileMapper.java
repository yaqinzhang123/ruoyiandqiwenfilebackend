package com.ruoyi.file.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ruoyi.file.domain.UserFile;
import com.ruoyi.file.vo.file.FileListVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserFileMapper extends BaseMapper<UserFile> {




    List<UserFile> selectUserFileByLikeRightFilePath(@Param("file_path") String filePath, @Param("user_id") long userId);

    IPage<FileListVo> selectPageVo(Page<?> page, @Param("userFile")UserFile userFile, @Param("fileTypeId")Integer fileTypeId);
    Long selectStorageSizeByUserId( Long userId);
}
