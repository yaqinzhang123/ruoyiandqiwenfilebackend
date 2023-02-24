package com.ruoyi.webgis.model.req;

import lombok.Data;

@Data
public class ProjectDo {
    private Long projectId;
    private String projectName;
    private String projectPort;
    private String projectDesc;
    private Integer projectType;
}
