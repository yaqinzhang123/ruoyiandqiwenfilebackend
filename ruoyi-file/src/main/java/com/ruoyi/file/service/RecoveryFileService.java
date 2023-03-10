package com.ruoyi.file.service;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.file.api.IRecoveryFileService;
import com.ruoyi.file.component.FileDealComp;
import com.ruoyi.file.domain.RecoveryFile;
import com.ruoyi.file.domain.UserFile;
import com.ruoyi.file.io.QiwenFile;
import com.ruoyi.file.mapper.RecoveryFileMapper;
import com.ruoyi.file.mapper.UserFileMapper;
import com.ruoyi.file.vo.file.RecoveryFileListVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Slf4j
@Service
@Transactional(rollbackFor=Exception.class)
public class RecoveryFileService  extends ServiceImpl<RecoveryFileMapper, RecoveryFile> implements IRecoveryFileService {
    @Resource
    UserFileMapper userFileMapper;
    @Resource
    RecoveryFileMapper recoveryFileMapper;
    @Resource
    FileDealComp fileDealComp;


    @Override
    public void deleteUserFileByDeleteBatchNum(String deleteBatchNum) {


        LambdaQueryWrapper<UserFile> userFileLambdaQueryWrapper = new LambdaQueryWrapper<>();
        userFileLambdaQueryWrapper.eq(UserFile::getDeleteBatchNum, deleteBatchNum);
        userFileMapper.delete(userFileLambdaQueryWrapper);



    }

    @Override
    public void restorefile(String deleteBatchNum, String filePath, Long sessionUserId) {

        LambdaUpdateWrapper<UserFile> userFileLambdaUpdateWrapper = new LambdaUpdateWrapper<>();
        userFileLambdaUpdateWrapper.set(UserFile::getDeleteFlag, 0)
                .set(UserFile::getDeleteBatchNum, "")
                .eq(UserFile::getDeleteBatchNum, deleteBatchNum);
        userFileMapper.update(null, userFileLambdaUpdateWrapper);
        QiwenFile qiwenFile = new QiwenFile(filePath, true);
        fileDealComp.restoreParentFilePath(qiwenFile, sessionUserId);

        fileDealComp.deleteRepeatSubDirFile(filePath, sessionUserId);
        // TODO ????????????????????????????????????????????????

        LambdaQueryWrapper<RecoveryFile> recoveryFileServiceLambdaQueryWrapper = new LambdaQueryWrapper<>();
        recoveryFileServiceLambdaQueryWrapper.eq(RecoveryFile::getDeleteBatchNum, deleteBatchNum);
        recoveryFileMapper.delete(recoveryFileServiceLambdaQueryWrapper);
    }

    @Override
    public List<RecoveryFileListVo> selectRecoveryFileList(Long userId) {
        return recoveryFileMapper.selectRecoveryFileList(userId);
    }
    @Override
    public List<RecoveryFileListVo> selectRecoveryFileListByDeptId(Long deptId) {
        return recoveryFileMapper.selectRecoveryFileListByDeptId(deptId);
    }
}
