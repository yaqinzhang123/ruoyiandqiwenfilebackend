package com.ruoyi.webgis.model.po;

import com.baomidou.mybatisplus.annotation.*;

import java.util.Date;
import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 
 * </p>
 *
 * @author 中科吉芯
 * @since 2022-02-17
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("global_config")
public class GlobalConfigPO implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "config_id", type = IdType.AUTO)
    private Integer configId;

    /**
     * 配置名称
     */
    private String configName;

    /**
     * 配置值
     */
    private String configValue;

    private Integer delTag;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;

    /**
     * 备注
     */
    private String remark;

    /**
     * 服务器名称
     */
    private String serverName;


}
