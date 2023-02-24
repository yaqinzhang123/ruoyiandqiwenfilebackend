package com.ruoyi.webgis.common;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Configuration;

import java.io.File;

/**
 * @Description TODO 文件上传配置
 * @Author haijun
 * @Date 2019/12/28 20:00
 * @ClassName FileUploadConfig
 ***/
@Getter
@Setter
@Configuration
@ConfigurationProperties("fileupload.config")
@EnableConfigurationProperties({FileUploadConfig.class})
public class FileUploadConfig {
    private String uploadFolder;
    private String staticAccessPath;
    private String localPath;
    private String userHeaderPicPath;
    private String archivesFilePath;
    private String domain;

    public String getUploadFolder() {
        String string=System.getProperty("user.dir")+"\\webupload\\";
        return string;
    }
}
