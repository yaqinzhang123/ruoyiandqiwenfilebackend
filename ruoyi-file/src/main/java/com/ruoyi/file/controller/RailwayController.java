package com.ruoyi.file.controller;

import cn.hutool.core.util.IdUtil;
import com.alibaba.fastjson2.JSON;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.qiwenshare.common.anno.MyLog;
import com.qiwenshare.common.result.RestResult;
import com.qiwenshare.common.util.security.JwtUser;
import com.qiwenshare.common.util.security.SessionUtil;
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
import org.apache.poi.ss.formula.functions.T;
import org.checkerframework.checker.units.qual.A;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Tag(name = "railway", description = "")
@RestController
@Slf4j
@RequestMapping("/railway")
public class RailwayController {

    @Resource
    IGangGuiService gangGuiService;

    @Operation(summary = "测试", description = "测试")
    @RequestMapping(value = "/selectByMainCode", method = RequestMethod.GET)
    @ResponseBody
    public RestResult<GangGui> selectByMainCode(
            @Parameter(description = "code", required = true) String code){
       List<GangGui> fileList=gangGuiService.selectByMainCode(code);
        return RestResult.success().data(fileList);

    }
    @Operation(summary = "测试", description = "测试")
    @RequestMapping(value = "/getList", method = RequestMethod.GET)
    @ResponseBody
    public RestResult<T> getList(
            @Parameter(description = "type", required = true) String type){
        List<Object> result=new ArrayList<>();

        if(type.toLowerCase().equals("ganggui")){
            LambdaQueryWrapper<GangGui> lambdaQueryWrapper=new LambdaQueryWrapper<>();
            List<GangGui> result2=gangGuiService.list();
            return RestResult.success().data(result2);
        }
        return RestResult.success().data(result);

    }
}
