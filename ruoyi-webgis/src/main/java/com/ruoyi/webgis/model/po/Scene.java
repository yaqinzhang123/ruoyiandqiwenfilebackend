package com.ruoyi.webgis.model.po;

import com.baomidou.mybatisplus.annotation.*;

import java.util.Date;
import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.utils.SecurityUtils;
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
@TableName("scene")
public class Scene implements Serializable{

    private static final long serialVersionUID = 1L;

    @TableId(value = "scene_id", type = IdType.AUTO)
    private Long sceneId;

    private String sceneName;

    private String sceneNo;

    private String sceneDownUrl;

    private String sceneApiUrl;

    private String sceneShareUrl;

    private String scenePath;

    private Integer sceneStatus;

    private Integer delTag;
    private String img;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    private String creator;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;

    private Integer version;

    private String description;
    private Integer visitsNumber;

    public Scene(){
        this.createTime=new Date();
        this.updateTime=new Date();
        this.creator= SecurityUtils.getUsername();
    }




}
