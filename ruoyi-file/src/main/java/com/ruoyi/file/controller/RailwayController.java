package com.ruoyi.file.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.qiwenshare.common.result.RestResult;
import com.ruoyi.file.api.IGangGuiService;
import com.ruoyi.file.api.IGuiZhenService;
import com.ruoyi.file.domain.railway.GangGui;
import com.ruoyi.file.domain.railway.GuiZhen;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.extern.slf4j.Slf4j;
import org.apache.poi.ss.formula.functions.T;
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
    @Resource
    IGuiZhenService guiZhenService;

    @Operation(summary = "测试", description = "测试")
    @RequestMapping(value = "/selectByMainCode", method = RequestMethod.GET)
    @ResponseBody
    public RestResult<GangGui> selectByMainCode(
            @Parameter(description = "code", required = true) String code){
       List<GangGui> fileList=gangGuiService.selectByMainCode(code);
        return RestResult.success().data(fileList);

    }
    @Operation(summary = "测试", description = "测试")
    @RequestMapping(value = "/selectGuiZhenByMainCode", method = RequestMethod.GET)
    @ResponseBody
    public RestResult<GuiZhen> selectGuiZhenByMainCode(
            @Parameter(description = "code", required = true) String code){
        List<GuiZhen> fileList=guiZhenService.selectByMainCode(code);
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
        }else if(type.toLowerCase().equals("guizhen")){
            LambdaQueryWrapper<GuiZhen> lambdaQueryWrapper=new LambdaQueryWrapper<>();
            List<GuiZhen> result2=guiZhenService.list();
            return RestResult.success().data(result2);
        }
        return RestResult.success().data(result);

    }
}
