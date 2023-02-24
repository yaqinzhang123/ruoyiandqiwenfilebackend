package com.ruoyi.webgis.service;

import com.ruoyi.webgis.model.req.ConfigDo;
import com.ruoyi.webgis.utils.JsonData;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface ConfigService {
    public JsonData updateConfig(MultipartFile pemFile, MultipartFile keyFile, ConfigDo configDos);
    public JsonData listConfigs();
}
