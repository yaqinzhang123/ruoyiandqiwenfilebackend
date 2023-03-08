package com.ruoyi.webgis.service;

import com.ruoyi.webgis.model.po.ResourcePO;
import com.ruoyi.webgis.model.req.ProjectDo;
import com.ruoyi.webgis.utils.JsonData;
import com.baomidou.mybatisplus.extension.service.IService;
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
public interface ResourceService extends IService<ResourcePO> {
    JsonData resourceList(String searchName, int currentPage,Long projectId, Integer resourceType);
    JsonData resourceList1(String searchName, int currentPage,Long projectId, Integer resourceType,Integer modelType);

    JsonData resourceDel(Long resourceId);

    JsonData resourceAdd(MultipartFile[] resources,Long projectId);

    Map<String, String> getResourceSaveProject(Long projectId);

    JsonData insertUploadResourceAndExrtZip(ResourcePO resourcePO);

    JsonData reloadExchange(Long resourceId);

}
