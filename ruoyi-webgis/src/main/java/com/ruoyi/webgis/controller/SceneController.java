package com.ruoyi.webgis.controller;

import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.webgis.enums.BizCodeEnum;
import com.ruoyi.webgis.model.po.Scene;
import com.ruoyi.webgis.model.req.ProjectDo;
import com.ruoyi.webgis.service.SceneService;
import com.ruoyi.webgis.utils.JsonData;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.web.bind.annotation.*;

@RequestMapping("/scene")
@RestController
@CrossOrigin
@EnableAsync
public class SceneController {

    @Autowired
    private SceneService sceneService;


    @GetMapping(value = "/list")
    public AjaxResult list(@RequestParam(name = "searchName",defaultValue = "") String searchName, @RequestParam(name="currentPage",defaultValue = "1")  int currentPage){

        return sceneService.list(searchName,currentPage);
    }

    @PostMapping("add")
    public AjaxResult sceneAdd(@RequestBody Scene scene){
        if (StringUtils.isEmpty(scene.getSceneName())){
            return AjaxResult.error(String.valueOf(BizCodeEnum.Data_UNREGISTER));
        }
        return sceneService.saveOrUpdate(scene)?AjaxResult.success():AjaxResult.error("添加失败");
    }

    @PostMapping("update")
    public AjaxResult sceneUpdate(@RequestBody  Scene scene){

        if (StringUtils.isEmpty(scene.getSceneName()) || scene.getSceneId()==null){
            return AjaxResult.error(String.valueOf(BizCodeEnum.Data_UNREGISTER));
        }
        return sceneService.saveOrUpdate(scene)?AjaxResult.success():AjaxResult.error("修改失败");
    }

    @DeleteMapping("del")
    public AjaxResult sceneDel(@RequestParam Long sceneId){
        if (sceneId==null){
            return AjaxResult.error(String.valueOf(BizCodeEnum.DATABASE_ERROR));
        }
        return sceneService.sceneDel(sceneId);
    }

}
