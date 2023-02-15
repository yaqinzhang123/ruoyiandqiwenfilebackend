package com.ruoyi.file.controller;

import com.alibaba.fastjson2.JSON;
import com.qiwenshare.common.anno.MyLog;
import com.qiwenshare.common.result.RestResult;
import com.qiwenshare.common.util.security.JwtUser;
import com.qiwenshare.common.util.security.SessionUtil;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.file.api.*;
import com.ruoyi.file.component.AsyncTaskComp;
import com.ruoyi.file.domain.RecoveryFile;
import com.ruoyi.file.dto.file.DeleteRecoveryFileDTO;
import com.ruoyi.file.dto.recoveryfile.BatchDeleteRecoveryFileDTO;
import com.ruoyi.file.dto.recoveryfile.RestoreFileDTO;
import com.ruoyi.file.vo.file.RecoveryFileListVo;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@Tag(name = "recoveryfile", description = "文件删除后会进入回收站，该接口主要是对回收站文件进行管理")
@RestController
@Slf4j
@RequestMapping("/recoveryfile")
public class RecoveryFileController {
    @Resource
    IRecoveryFileService recoveryFileService;
    @Resource
    IUserFileService userFileService;

    @Resource
    IFileService fileService;
    @Resource
    IFiletransferService filetransferService;
    @Resource
    AsyncTaskComp asyncTaskComp;


    public static final String CURRENT_MODULE = "回收站文件接口";

    @Operation(summary = "删除回收文件", description = "删除回收文件", tags = {"recoveryfile"})
    @MyLog(operation = "删除回收文件", module = CURRENT_MODULE)
    @RequestMapping(value = "/deleterecoveryfile", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult deleteRecoveryFile(@RequestBody DeleteRecoveryFileDTO deleteRecoveryFileDTO) {
         LoginUser sessionUserBean= SecurityUtils.getLoginUser();
        RecoveryFile recoveryFile = recoveryFileService.getById(deleteRecoveryFileDTO.getRecoveryFileId());

        asyncTaskComp.deleteUserFile(recoveryFile.getUserFileId());

        recoveryFileService.removeById(deleteRecoveryFileDTO.getRecoveryFileId());
        return AjaxResult.success("删除成功");
    }

    @Operation(summary = "批量删除回收文件", description = "批量删除回收文件", tags = {"recoveryfile"})
    @RequestMapping(value = "/batchdelete", method = RequestMethod.POST)
    @MyLog(operation = "批量删除回收文件", module = CURRENT_MODULE)
    @ResponseBody
    public AjaxResult batchDeleteRecoveryFile(@RequestBody BatchDeleteRecoveryFileDTO batchDeleteRecoveryFileDTO) {
         LoginUser sessionUserBean= SecurityUtils.getLoginUser();
        List<RecoveryFile> recoveryFileList = JSON.parseArray(batchDeleteRecoveryFileDTO.getRecoveryFileIds(), RecoveryFile.class);
        for (RecoveryFile recoveryFile : recoveryFileList) {
            RecoveryFile recoveryFile1 = recoveryFileService.getById(recoveryFile.getRecoveryFileId());

            if (recoveryFile1 != null) {
                asyncTaskComp.deleteUserFile(recoveryFile1.getUserFileId());

                recoveryFileService.removeById(recoveryFile1.getRecoveryFileId());
            }

        }
        return AjaxResult.success("批量删除成功");
    }

    @Operation(summary = "回收文件列表", description = "回收文件列表", tags = {"recoveryfile"})
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult getRecoveryFileList() {
        LoginUser sessionUserBean= SecurityUtils.getLoginUser();
        RestResult<List<RecoveryFileListVo>> restResult = new RestResult<List<RecoveryFileListVo>>();
        List<RecoveryFileListVo> recoveryFileList = recoveryFileService.selectRecoveryFileListByDeptId(sessionUserBean.getDeptId());
        return AjaxResult.success(recoveryFileList);
    }

    @Operation(summary = "还原文件", description = "还原文件", tags = {"recoveryfile"})
    @RequestMapping(value = "/restorefile", method = RequestMethod.POST)
    @MyLog(operation = "还原文件", module = CURRENT_MODULE)
    @ResponseBody
    public AjaxResult restoreFile(@RequestBody RestoreFileDTO restoreFileDto) {
         LoginUser sessionUserBean= SecurityUtils.getLoginUser();
        recoveryFileService.restorefile(restoreFileDto.getDeleteBatchNum(), restoreFileDto.getFilePath(), sessionUserBean.getUserId());
        return AjaxResult.success("还原成功！");
    }

}









