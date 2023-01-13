package com.ruoyi.file.controller;

import cn.hutool.core.util.IdUtil;
import com.alibaba.fastjson2.JSON;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.qiwenshare.common.anno.MyLog;
import com.qiwenshare.common.result.RestResult;
import com.qiwenshare.common.util.security.JwtUser;
import com.qiwenshare.common.util.security.SessionUtil;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.file.api.ICommonFileService;
import com.ruoyi.file.api.IFilePermissionService;
import com.ruoyi.file.api.IGangGuiService;
import com.ruoyi.file.api.IUserFileService;
import com.ruoyi.file.domain.CommonFile;
import com.ruoyi.file.domain.FilePermission;
import com.ruoyi.file.domain.UserFile;
import com.ruoyi.file.domain.railway.GangGui;
import com.ruoyi.file.dto.commonfile.CommonFileDTO;
import com.ruoyi.file.io.QiwenFile;
import com.ruoyi.file.vo.commonfile.CommonFileListVo;
import com.ruoyi.file.vo.commonfile.CommonFileUser;
import com.ruoyi.file.vo.file.FileListVo;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Tag(name = "common", description = "该接口为文件共享接口")
@RestController
@Slf4j
@RequestMapping("/common")
public class CommonFileController {

    public static final String CURRENT_MODULE = "文件共享";

    @Resource
    ICommonFileService commonFileService;
    @Resource
    IFilePermissionService filePermissionService;
    @Resource
    IUserFileService userFileService;

    @Operation(summary = "将文件共享给他人", description = "共享文件统一接口", tags = {"common"})
    @PostMapping(value = "/commonfile")
    @MyLog(operation = "共享文件", module = CURRENT_MODULE)
    @ResponseBody
    public AjaxResult commonFile(@RequestBody CommonFileDTO commonFileDTO) {
        CommonFile commonFile = new CommonFile();
        commonFile.setUserFileId(commonFileDTO.getUserFileId());
        commonFile.setCommonFileId(IdUtil.getSnowflakeNextIdStr());

        commonFileService.save(commonFile);

        List<FilePermission> list = JSON.parseArray(commonFileDTO.getCommonUserList(), FilePermission.class);

        List<FilePermission> filePermissionList = new ArrayList<>();
       for (FilePermission filePermission : list) {
           filePermission.setFilePermissionId(IdUtil.getSnowflakeNextId());
            filePermission.setCommonFileId(commonFile.commonFileId);
            filePermissionList.add(filePermission);
       }
        filePermissionService.saveBatch(filePermissionList);

        return AjaxResult.success();
    }

    @Operation(summary = "获取共享空间的全量用户列表", description = "共享文件用户接口", tags = {"common"})
    @GetMapping(value = "/commonfileuser")
    @MyLog(operation = "共享文件用户", module = CURRENT_MODULE)
    @ResponseBody
    public AjaxResult commonFileUserList() {

        LoginUser sessionUserBean =  SecurityUtils.getLoginUser();
        List<CommonFileUser> list = commonFileService.selectCommonFileUser(sessionUserBean.getUserId());
        return AjaxResult.success(list);
    }

    @Operation(summary = "获取共享用户文件列表", description = "用来做前台列表展示", tags = {"file"})
    @RequestMapping(value = "/getCommonFileByUser", method = RequestMethod.GET)
    @ResponseBody
    public AjaxResult getCommonFileByUser(
            @Parameter(description = "用户id", required = true) Long userId){
        LoginUser sessionUserBean =  SecurityUtils.getLoginUser();
        List<CommonFileListVo> commonFileVo = commonFileService.selectCommonFileByUser(userId, sessionUserBean.getUserId());

        return AjaxResult.success(commonFileVo);

    }

    @Operation(summary = "获取共享空间中某个用户的文件列表", description = "用来做前台列表展示", tags = {"file"})
    @RequestMapping(value = "/commonFileList", method = RequestMethod.GET)
    @ResponseBody
    public AjaxResult commonFileList(
            @Parameter(description = "用户id", required = true) Long commonFileId,
            @Parameter(description = "文件路径", required = true) String filePath,
            @Parameter(description = "当前页", required = true) long currentPage,
            @Parameter(description = "页面数量", required = true) long pageCount){

        CommonFile commonFile = commonFileService.getById(commonFileId);
        UserFile userFile = userFileService.getById(commonFile.getUserFileId());
        QiwenFile qiwenFile = new QiwenFile(userFile.getFilePath(), filePath, true);
        IPage<FileListVo> fileList = userFileService.userFileList(userFile.getUserId(), qiwenFile.getPath(), currentPage, pageCount);

        return AjaxResult.success(fileList);

    }
}
