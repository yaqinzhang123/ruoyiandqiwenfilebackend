package com.ruoyi.webgis.service.impl;

import com.ruoyi.webgis.constant.SysConfigConstant;
import com.ruoyi.webgis.mapper.GlobalConfigMapper;
import com.ruoyi.webgis.model.po.GlobalConfigPO;
import com.ruoyi.webgis.model.req.ConfigDo;
import com.ruoyi.webgis.model.vo.ConfigVo;
import com.ruoyi.webgis.model.vo.ResourceListVo;
import com.ruoyi.webgis.service.ConfigService;
import com.ruoyi.webgis.utils.CommonUtil;
import com.ruoyi.webgis.utils.FileUtils;
import com.ruoyi.webgis.utils.JsonData;
import com.ruoyi.webgis.utils.UtilFuns;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ConfigServiceImpl implements ConfigService {

    @Autowired
    private GlobalConfigMapper configMapper;

    @Override
    public JsonData listConfigs() {
        QueryWrapper<GlobalConfigPO> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("del_tag",0);
        try {
            queryWrapper.eq("server_name", CommonUtil.getMACAddress());
        } catch (Exception e) {
            e.printStackTrace();
        }
        List<GlobalConfigPO> globalConfigPOS = configMapper.selectList(queryWrapper);
        ConfigVo configVo = new ConfigVo();
        globalConfigPOS.stream().forEach(res -> {
            if (res.getConfigName().equals("Service_Addr")) {
                configVo.setServiceAddr(res.getConfigValue());
            }else if (res.getConfigName().equals("Service_Pem")) {
                configVo.setServicePem(res.getConfigValue());
            }else if (res.getConfigName().equals("Service_Pem_Key")) {
                configVo.setServiceKey(res.getConfigValue());
            }else if (res.getConfigName().equals("Gateway_Path")) {
                configVo.setGatewayPath(res.getConfigValue());
            }else if (res.getConfigName().equals("3dtile_Path")) {
                configVo.set_3dtilePath(res.getConfigValue());
            }else if (res.getConfigName().equals("View_Addr")) {
                configVo.setViewAddr(res.getConfigValue());
            }
        });
        return JsonData.buildSuccess(configVo);
    }

    @Override
    public JsonData updateConfig(MultipartFile pemFile,MultipartFile keyFile,ConfigDo configDo){
        //保存文件到ngnx目录下cert

        String serviceAddr = configDo.getServiceAddr();
        String dtilePath = configDo.get_3dtilePath();
        String gatewayPath = configDo.getGatewayPath();
        String serviceKey = configDo.getServiceKey();
        String servicePem = configDo.getServicePem();
        String viewAddr = configDo.getViewAddr();
        baseUpdateConfig("Service_Addr",serviceAddr);
        baseUpdateConfig("Service_Pem",servicePem);
        baseUpdateConfig("Service_Pem_Key",serviceKey);
        baseUpdateConfig("Gateway_Path",gatewayPath);
        baseUpdateConfig("3dtile_Path",dtilePath);
        baseUpdateConfig("View_Addr",viewAddr);
        uploadCert(pemFile,keyFile,configDo.getGatewayPath());
        updateConfigMap();
        return JsonData.buildSuccess();
    }

    public void uploadCert(MultipartFile pemFile,MultipartFile keyFile,String path){
        try {
            path=path+File.separator+"cert";
            File file = new File(path);
            if (!file.exists()){
                file.mkdirs();
            }
            if (pemFile!=null){
                pemFile.transferTo(new File(path,pemFile.getOriginalFilename()));
            }
            if (keyFile!=null){
                keyFile.transferTo(new File(path,keyFile.getOriginalFilename()));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void baseUpdateConfig(String configName,String configValue){
        QueryWrapper<GlobalConfigPO> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("config_name",configName);
        try {
            queryWrapper.eq("server_name", CommonUtil.getMACAddress());
        } catch (Exception e) {
            e.printStackTrace();
        }
        GlobalConfigPO globalConfigPO = new GlobalConfigPO();
        globalConfigPO.setConfigValue(configValue);
        configMapper.update(globalConfigPO,queryWrapper);
    }

    public void updateConfigMap(){
        QueryWrapper<GlobalConfigPO> queryWrapper = new QueryWrapper<>();
        try {
            queryWrapper.eq("del_tag",0).eq("server_name", CommonUtil.getMACAddress());
        } catch (Exception e) {
            e.printStackTrace();
        }
        List<GlobalConfigPO> globalConfigPOS = configMapper.selectList(queryWrapper);
        if (globalConfigPOS!=null && globalConfigPOS.size()>0){
            //有参数
            HashMap<String, String> map = new HashMap<>();
            for (GlobalConfigPO config:globalConfigPOS) {
                map.put(config.getConfigName(),config.getConfigValue());
            }
            SysConfigConstant.configs=map;
    }
    }
}
