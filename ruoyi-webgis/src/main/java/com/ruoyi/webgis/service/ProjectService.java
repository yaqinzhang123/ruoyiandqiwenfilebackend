package com.ruoyi.webgis.service;

import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.webgis.model.po.ProjectPO;
import com.ruoyi.webgis.model.req.ProjectDo;
import com.ruoyi.webgis.utils.JsonData;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 中科吉芯
 * @since 2022-02-07
 */
public interface ProjectService extends IService<ProjectPO> {

    AjaxResult projectList(String searchName, int currentPage, int ProjectType);

    AjaxResult projectDel(Long projectId);

    AjaxResult projectAdd(ProjectDo projectDo);

    AjaxResult projectUpdate(ProjectDo projectDo);

    AjaxResult projectClose(Long projectId);

    AjaxResult projectOpen(Long projectId);
}
