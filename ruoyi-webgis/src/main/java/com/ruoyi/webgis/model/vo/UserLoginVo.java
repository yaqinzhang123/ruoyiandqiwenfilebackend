package com.ruoyi.webgis.model.vo;

import lombok.Data;

@Data
public class UserLoginVo {

private String account;
private String userName;
private String token;
private Long expireTime;
}
