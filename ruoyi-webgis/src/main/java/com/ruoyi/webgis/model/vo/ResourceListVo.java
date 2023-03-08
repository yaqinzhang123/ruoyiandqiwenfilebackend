package com.ruoyi.webgis.model.vo;

import com.ruoyi.webgis.constant.SysConfigConstant;
import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.util.Date;
@Data
public class ResourceListVo {

    private Long resourceId;

    private String resourceName;

    private String resourceNo;

    private String resourceDownUrl;

    private String resourceApiUrl;

    private String resourceShareUrl;

    private String resourcePath;

    private Integer resourceStatus;
    private String description;
    private Integer visitsNumber;
    private Integer modelType;
    @TableField(fill = FieldFill.INSERT)
    private Date createTime;

    private Long projectId;

    public String getResourceStatus() {
        if (resourceStatus==1){
            return "解压中";
        }else if (resourceStatus==2){
            return "转换中";
        }else if (resourceStatus==3){
            return "转换完成";
        }else{
            return "转换完成";
        }
    }

    public String getResourceDownUrl() {
        String service_addr = SysConfigConstant.configs.get("Service_Addr")+":";
        return service_addr+resourceDownUrl;
    }

    public String getResourceApiUrl() {
        String service_addr = SysConfigConstant.configs.get("Service_Addr")+":";
        return service_addr+resourceApiUrl;
    }

    public String getResourceShareUrl() {
//        String service_addr = SysConfigConstant.configs.get("View_Addr");
        return resourceShareUrl;
    }
}
