package com.ruoyi.webgis.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.webgis.model.po.Scene;
import com.ruoyi.webgis.utils.JsonData;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 中科吉芯
 * @since 2022-02-07
 */
public interface SceneService extends IService<Scene> {

    AjaxResult list(String searchName,int currentPage);
    AjaxResult sceneDel(Long sceneId);

}
