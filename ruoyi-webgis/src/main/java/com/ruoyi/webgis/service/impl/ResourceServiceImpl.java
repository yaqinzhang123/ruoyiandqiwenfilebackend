package com.ruoyi.webgis.service.impl;

import com.ruoyi.webgis.conf.Configer;
import com.ruoyi.webgis.constant.FileUploadInfo;
import com.ruoyi.webgis.constant.StatusTypeConstant;
import com.ruoyi.webgis.enums.BizCodeEnum;
import com.ruoyi.webgis.mapper.ProjectMapper;
import com.ruoyi.webgis.model.po.ProjectPO;
import com.ruoyi.webgis.model.po.ResourcePO;
import com.ruoyi.webgis.mapper.ResourceMapper;
import com.ruoyi.webgis.model.vo.PageVO;
import com.ruoyi.webgis.model.vo.ResourceListVo;
import com.ruoyi.webgis.service.ResourceService;
import com.ruoyi.webgis.utils.CommonUtil;
import com.ruoyi.webgis.utils.FileUtils;
import com.ruoyi.webgis.utils.JsonData;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 中科吉芯
 * @since 2022-02-07
 */
@Service
public class ResourceServiceImpl extends ServiceImpl<ResourceMapper, ResourcePO> implements ResourceService {


    @Autowired
    private ResourceMapper resourceMapper;

    @Autowired
    private ZipServiceAsyncImpl zipServiceAsync;

    @Autowired
    private ProjectMapper projectMapper;


    @Override
    public JsonData resourceList(String searchName, int currentPage,Long projectId, Integer resourceStatus) {


        QueryWrapper<ResourcePO> queryWrapper = new QueryWrapper<ResourcePO>().like("resource_name", searchName).eq("project_id",projectId)
                .eq("del_tag", StatusTypeConstant.GLOBAL_DEL_TAG_UNDELETE.getStatusCode()).orderByDesc("create_time");
        if (resourceStatus!=0){
            queryWrapper.eq("resource_status", resourceStatus);
        }
        Page<ResourcePO> page = new Page<>(currentPage,10);
        IPage<ResourcePO> iPage = resourceMapper.selectPage(page, queryWrapper);
        //获取数据的总条数
        long total = iPage.getTotal();
        List<ResourceListVo> resourceListVos = iPage.getRecords().stream().map(resource -> {
            ResourceListVo resourceListVo = new ResourceListVo();
            BeanUtils.copyProperties(resource, resourceListVo);
            return resourceListVo;
        }).collect(Collectors.toList());

        PageVO<ResourceListVo> pageVO = new PageVO<>();
        pageVO.setTotalCount(total);
        //获取数据的总页数
        long pages = iPage.getPages();
        pageVO.setTotalPage(pages);
        pageVO.setPageSize(10L);
        pageVO.setData(resourceListVos);
        return JsonData.buildSuccess(pageVO);
    }

    @Override
    public JsonData resourceDel(Long resourceId) {

        QueryWrapper<ResourcePO> queryWrapper = new QueryWrapper<ResourcePO>().eq("resource_id", resourceId).eq("del_tag", 0);

        ResourcePO resourcePO = resourceMapper.selectOne(queryWrapper);
        if (resourcePO==null){
            return JsonData.buildSuccess();
        }
        resourcePO.setDelTag(Integer.parseInt(StatusTypeConstant.GLOBAL_DEL_TAG_DELETE.getStatusCode()));
        resourceMapper.updateById(resourcePO);

        String resourcePath = resourcePO.getResourcePath();
        Boolean delete = FileUtils.delete(resourcePath);
        return JsonData.buildSuccess();
    }

    @Override
    public JsonData resourceAdd(MultipartFile[] resources,Long projectId) {
        try {
        for(MultipartFile file:resources){
            String fileName = file.getOriginalFilename();
            InputStream fileStrem = null;
            fileStrem = file.getInputStream();
            //查询项目编号
            QueryWrapper<ProjectPO> queryWrapper = new QueryWrapper<ProjectPO>().eq("project_id",projectId)
                    .eq("del_tag",StatusTypeConstant.GLOBAL_DEL_TAG_UNDELETE.getStatusCode());
            ProjectPO projectPO = projectMapper.selectOne(queryWrapper);

            if (projectPO==null || StringUtils.isEmpty(projectPO.getProjectNo())){
                return JsonData.buildResult(BizCodeEnum.PROJECT_DELETE);
            }

            String basePath = Configer.getNginxPath() + "/" + projectId + "-" + projectPO.getProjectNo() + "/";
//            String basePath=System.getProperty("user.dir")+"/"+ FileUploadInfo.RESOURCE_FILES+"/"+projectId+"/";
//            String resourceName = FileUtils.saveFileAndExtractall(file, basePath);
            String resourceNo = CommonUtil.generateUUID();
            ResourcePO resourcePO = new ResourcePO();
            resourcePO.setResourceName(file.getOriginalFilename());
//            resourcePO.setResourceNo(resourceNo);
//            resourcePO.setResourcePath(basePath+"/"+resourceNo);
            resourcePO.setCreateTime(new Date());
            resourcePO.setUpdateTime(new Date());
            resourcePO.setResourceNo(resourceNo);
            resourcePO.setResourceDownUrl( projectPO.getProjectPort()+"/"+resourceNo+fileName.substring(fileName.lastIndexOf(".")));
            resourcePO.setProjectId(projectId);
            int insert = resourceMapper.insert(resourcePO);
//            uploadFile(file, basePath,resourcePO.getResourceId());

            //文件上传
            String fielExt = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
            File file1 = new File(basePath+resourceNo+fielExt);
            org.apache.commons.io.FileUtils.writeByteArrayToFile(file1,file.getBytes());

            //判断是否需要解压缩
            if (fielExt.equals(".zip")){
                //解压文件目录
                String extFile=basePath+File.separator+resourceNo;
                zipServiceAsync.extractZip(file1, extFile, resourcePO);
            }
            return JsonData.buildSuccess();
        }
        } catch (IOException e) {
                e.printStackTrace();
            }

        return JsonData.buildResult(BizCodeEnum.DATABASE_ERROR);
    }

    @Override
    public  Map<String, String> getResourceSaveProject(Long projectId) {
        //查询项目编号
        QueryWrapper<ProjectPO> queryWrapper = new QueryWrapper<ProjectPO>().eq("project_id",projectId)
                .eq("del_tag",StatusTypeConstant.GLOBAL_DEL_TAG_UNDELETE.getStatusCode());
        ProjectPO projectPO = projectMapper.selectOne(queryWrapper);

        if (projectPO==null || StringUtils.isEmpty(projectPO.getProjectNo())){
            return null;
        }

        String basePath = Configer.getNginxPath() +File.separator + projectId + "-" + projectPO.getProjectNo() +File.separator;
        Map<String, String> result = new HashMap<>();
        result.put("basePath",basePath);
        result.put("port",projectPO.getProjectPort());
        return result;
    }

    @Override
    public JsonData insertUploadResourceAndExrtZip(ResourcePO resourcePO) {
        int insert = resourceMapper.insert(resourcePO);
        String fielExt=resourcePO.getResourceName().substring(resourcePO.getResourceName().lastIndexOf("."));
        //判断是否需要解压缩
        if (fielExt.equals(".zip")){
            //解压文件目录
            String extFilePath = resourcePO.getResourcePath().substring(0,resourcePO.getResourcePath().lastIndexOf("."));
           File file=new File(resourcePO.getResourcePath());
           zipServiceAsync.extractZip(file, extFilePath, resourcePO);

        }
        return null;
    }

    @Override
    public JsonData reloadExchange(Long resourceId) {
        ResourcePO resourcePO = resourceMapper.selectById(resourceId);
        if (resourcePO==null){
            return JsonData.buildResult(BizCodeEnum.Data_UNREGISTER);
        }
        //解压文件目录
        String extFilePath = resourcePO.getResourcePath().substring(0,resourcePO.getResourcePath().lastIndexOf("."));
        zipServiceAsync.exchangeOsgb(extFilePath,resourcePO);
        return JsonData.buildSuccess();
    }


}
