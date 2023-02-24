package com.ruoyi.webgis.controller;

import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.webgis.enums.BizCodeEnum;
import com.ruoyi.webgis.model.req.ProjectDo;
import com.ruoyi.webgis.service.ProjectService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("project")
public class ProjectController {

    @Autowired
    private ProjectService projectService;

    @GetMapping("list")
    public AjaxResult projectList(@RequestParam(name="currentPage",defaultValue = "1") int currentPage, @RequestParam(name="projectType",defaultValue = "1") int projectType, @RequestParam(name = "searchName",defaultValue = "") String searchName){
        AjaxResult jsonData = projectService.projectList(searchName, currentPage,projectType);
    return jsonData;
}
    @PostMapping("add")
    public AjaxResult projectAdd(@RequestBody ProjectDo projectDo){
        if (StringUtils.isEmpty(projectDo.getProjectName()) || StringUtils.isEmpty(projectDo.getProjectPort())
                || projectDo.getProjectType()==null){
            return AjaxResult.error(String.valueOf(BizCodeEnum.Data_UNREGISTER));
        }
        AjaxResult jsonData = projectService.projectAdd(projectDo);

        return jsonData;
    }

    @PostMapping("update")
    public AjaxResult projectUpdate(@RequestBody ProjectDo projectDo){

        if (StringUtils.isEmpty(projectDo.getProjectName()) || projectDo.getProjectId()==null){
            return AjaxResult.error(String.valueOf(BizCodeEnum.Data_UNREGISTER));
        }
        AjaxResult jsonData = projectService.projectUpdate(projectDo);
        return jsonData;
    }

    @DeleteMapping("del")
    public AjaxResult projectDel(@RequestParam Long projectId){
        if (projectId==null){
            return AjaxResult.error(String.valueOf(BizCodeEnum.DATABASE_ERROR));
        }
        return projectService.projectDel(projectId);
    }

    @GetMapping("close")
    public AjaxResult projectClose(@RequestParam Long projectId){
        if (projectId==null){
            return AjaxResult.error(String.valueOf(BizCodeEnum.DATABASE_ERROR));
        }
        return projectService.projectClose(projectId);
    }
    @GetMapping("open")
    public AjaxResult projectOpen(@RequestParam Long projectId){
        if (projectId==null){
            return AjaxResult.error(String.valueOf(BizCodeEnum.DATABASE_ERROR));
        }
        return projectService.projectOpen(projectId);
    }
}
