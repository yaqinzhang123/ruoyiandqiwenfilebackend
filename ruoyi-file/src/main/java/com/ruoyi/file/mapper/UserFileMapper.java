package com.ruoyi.file.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ruoyi.file.domain.UserFile;
import com.ruoyi.file.vo.file.FileListVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserFileMapper extends BaseMapper<UserFile> {
    List<UserFile> selectUserFileByLikeRightFilePath(@Param("filePath") String filePath, @Param("userId") long userId);
    List<UserFile> selectUserFileByLikeRightFilePathDeptId(@Param("filePath") String filePath, @Param("deptId") long deptId);

    IPage<FileListVo> selectPageVo(Page<?> page, @Param("userFile")UserFile userFile, @Param("fileTypeId")Integer fileTypeId);
    IPage<FileListVo> selectByDeptPageVo(Page<?> page, @Param("userFile")UserFile userFile,@Param("deptId")Long deptId, @Param("fileTypeId")Integer fileTypeId);
    Long selectStorageSizeByUserId( Long userId);
    Long selectStorageSizeByUserIdDept( Long deptId);
    List<UserFile> selectFilePathTreeByDeptId(Long deptId);
}
