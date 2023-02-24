package com.ruoyi.webgis.model.po;

import com.baomidou.mybatisplus.annotation.*;

import java.util.Date;
import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

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
@TableName("project")
public class ProjectPO implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @TableId(type = IdType.AUTO)
    @Column(columnDefinition="bigint(20)", unique = true)
    private Long projectId;

    private String projectName;

    private String projectPort;

    private String projectDesc;

    private Integer projectType;

    private String projectFilename;

    private String projectNo;

    private Long userId;

    private int delTag;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;

    private String version;

    private int switchTag;


}
