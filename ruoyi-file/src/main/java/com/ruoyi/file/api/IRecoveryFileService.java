package com.ruoyi.file.api;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.file.domain.RecoveryFile;
import com.ruoyi.file.vo.file.RecoveryFileListVo;

import java.util.List;

public interface IRecoveryFileService extends IService<RecoveryFile> {
    void deleteUserFileByDeleteBatchNum(String deleteBatchNum);
    void restorefile(String deleteBatchNum, String filePath, Long sessionUserId);
    List<RecoveryFileListVo> selectRecoveryFileList(Long userId);
    List<RecoveryFileListVo> selectRecoveryFileListByDeptId(Long deptId);
}
