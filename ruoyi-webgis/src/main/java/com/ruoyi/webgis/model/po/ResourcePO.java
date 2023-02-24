package com.ruoyi.webgis.model.po;

import com.baomidou.mybatisplus.annotation.*;

import java.util.Date;
import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * <p>
 * 
 * </p>
 *
 * @author 中科吉芯
 * @since 2022-02-07
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("resource")
public class ResourcePO implements Serializable{

    private static final long serialVersionUID = 1L;

    @TableId(value = "resource_id", type = IdType.AUTO)
    private Long resourceId;

    private String resourceName;

    private String resourceNo;

    private String resourceDownUrl;

    private String resourceApiUrl;

    private String resourceShareUrl;

    private String resourcePath;

    private Integer resourceStatus;

    private Integer delTag;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;

    private Integer version;

    private Long projectId;
}
