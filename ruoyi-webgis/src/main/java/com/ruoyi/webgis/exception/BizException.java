//package com.ruoyi.webgis.exception;
//
//import com.ruoyi.webgis.enums.BizCodeEnum;
//import lombok.Data;
//import lombok.ToString;
//
///**
// * 异常处理事件封装，配合事件信息和事件码
// * @author XiaoDequan(中科吉芯)
// * @date 2021/9/18 10:28
// */
//@Data
//@ToString
//public class BizException extends RuntimeException {
//
//    private int code;
//    private String msg;
//
//    public BizException(int code, String msg){
//        super(msg);
//        this.code = code;
//        this.msg = msg;
//    }
//
//    public BizException(BizCodeEnum bizCodeEnum){
//        super(bizCodeEnum.getMessage());
//        this.code = bizCodeEnum.getCode();
//        this.msg = bizCodeEnum.getMessage();
//    }
//
//
//}