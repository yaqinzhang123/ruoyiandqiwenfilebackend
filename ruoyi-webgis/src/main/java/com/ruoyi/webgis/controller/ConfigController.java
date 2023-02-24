package com.ruoyi.webgis.controller;

import com.ruoyi.webgis.model.req.ConfigDo;
import com.ruoyi.webgis.service.ConfigService;
import com.ruoyi.webgis.utils.JsonData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController
@RequestMapping("/config")
public class ConfigController {

@Autowired
private ConfigService configService;

    @GetMapping("/select")
    public JsonData selectConfig(){
        return configService.listConfigs();
    }
    @PostMapping("/update")
    public JsonData updateConfig(MultipartFile pemFile,MultipartFile keyFile, ConfigDo configDos){
        return configService.updateConfig(pemFile,keyFile,configDos);
    }

}
