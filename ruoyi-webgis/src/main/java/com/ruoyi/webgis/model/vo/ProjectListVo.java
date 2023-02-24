package com.ruoyi.webgis.model.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.text.SimpleDateFormat;
import java.util.Date;

@Data
public class ProjectListVo {

    private Long projectId;

    private String projectName;

    private String projectPort;

    private String projectDesc;

    @JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
    private Date createTime;

    private boolean switchTag;

}
