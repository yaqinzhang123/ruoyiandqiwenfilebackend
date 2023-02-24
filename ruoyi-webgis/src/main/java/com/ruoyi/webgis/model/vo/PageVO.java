package com.ruoyi.webgis.model.vo;


import lombok.Data;

import java.util.List;

/**
 * 分页插件数据类
 */
@Data
//@ApiModel(value = "分页数据")
public class PageVO<T> {

//    @ApiModelProperty(name = "search",value = "查询内容")
    private String searchName;

//    @ApiModelProperty(name = "currentPage",value = "当前页",example = "1")
    //当前页
    private Long currentPage=1L;
//    @ApiModelProperty(name = "pageSize",value = "页面记录数",example = "8")
    //每页记录数
    private Long pageSize=8L;
    //总记录数
    private Long totalCount;
    //总页数
    private Long totalPage;
    //数据
    private List<T> data;



}
