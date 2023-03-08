package com.ruoyi.webgis.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.webgis.conf.Configer;
import com.ruoyi.webgis.constant.StatusTypeConstant;
import com.ruoyi.webgis.enums.BizCodeEnum;
import com.ruoyi.webgis.mapper.ProjectMapper;
import com.ruoyi.webgis.mapper.SceneMapper;
import com.ruoyi.webgis.model.po.ProjectPO;
import com.ruoyi.webgis.model.po.ResourcePO;
import com.ruoyi.webgis.model.po.Scene;
import com.ruoyi.webgis.model.vo.PageVO;
import com.ruoyi.webgis.model.vo.ResourceListVo;
import com.ruoyi.webgis.service.SceneService;
import com.ruoyi.webgis.utils.CommonUtil;
import com.ruoyi.webgis.utils.FileUtils;
import com.ruoyi.webgis.utils.JsonData;
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
public class SceneServiceImpl extends ServiceImpl<SceneMapper, Scene> implements SceneService {
    @Autowired
    private SceneMapper sceneMapper;
    @Override
    public AjaxResult list(String searchName, int currentPage){
        QueryWrapper<Scene> queryWrapper = new QueryWrapper<Scene>().like("scene_name", searchName)
                .eq("del_tag", StatusTypeConstant.GLOBAL_DEL_TAG_UNDELETE.getStatusCode()).orderByDesc("create_time");
        Page<Scene> page = new Page<>(currentPage,10);
        IPage<Scene> iPage = sceneMapper.selectPage(page, queryWrapper);
        //获取数据的总条数
        long total = iPage.getTotal();
        PageVO<Scene> pageVO = new PageVO<>();
        pageVO.setTotalCount(total);
        //获取数据的总页数
        long pages = iPage.getPages();
        pageVO.setTotalPage(pages);
        pageVO.setPageSize(10L);
        pageVO.setData(iPage.getRecords());
        return AjaxResult.success(pageVO);
    }
    @Override
    public AjaxResult sceneDel(Long sceneId) {

        QueryWrapper<Scene> queryWrapper = new QueryWrapper<Scene>().eq("scene_id", sceneId).eq("del_tag", 0);
        Scene scene = sceneMapper.selectOne(queryWrapper);
        if (scene==null){
            return AjaxResult.error();
        }
        scene.setDelTag(Integer.parseInt(StatusTypeConstant.GLOBAL_DEL_TAG_DELETE.getStatusCode()));
        sceneMapper.updateById(scene);
        return AjaxResult.success();
    }

}
