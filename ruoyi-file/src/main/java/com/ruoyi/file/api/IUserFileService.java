package com.ruoyi.file.api;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.file.domain.UserFile;
import com.ruoyi.file.vo.file.FileListVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IUserFileService extends IService<UserFile> {
    List<UserFile> selectUserFileByNameAndPath(String fileName, String filePath, Long userId);
    List<UserFile> selectSameUserFile(String fileName, String filePath, String extendName, Long userId);

    IPage<FileListVo> userFileList(Long userId, String filePath, Long beginCount, Long pageCount);
    IPage<FileListVo> userFileListByDept(Long userId, String filePath, Long beginCount, Long pageCount);
    void updateFilepathByUserFileId(String userFileId, String newfilePath, long userId);
    void userFileCopy(String userFileId, String newfilePath, long userId);

    IPage<FileListVo> getFileByFileType(Integer fileTypeId, Long currentPage, Long pageCount, long userId);
    List<UserFile> selectUserFileListByPath(String filePath, Long userId);
    List<UserFile> selectFilePathTreeByUserId(Long userId);
    List<UserFile> selectFilePathTreeByDeptId(Long deptId);
    void deleteUserFile(String userFileId, Long sessionUserId);

    List<UserFile> selectUserFileByLikeRightFilePath(@Param("filePath") String filePath, @Param("userId") long userId);
    List<UserFile> selectUserFileByLikeRightFilePathDeptId(@Param("filePath") String filePath, @Param("deptId") long deptId);

}
