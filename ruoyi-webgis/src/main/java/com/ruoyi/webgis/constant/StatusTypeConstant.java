package com.ruoyi.webgis.constant;

import lombok.Getter;

/**
 * @author XiaoDequan(中科吉芯)
 * @date 2021/9/13 16:37
 */

/**
 * 状态常量配置信息
 */
public enum StatusTypeConstant {

    //全局参数
    GLOBAL_DEL_TAG_UNDELETE("未删除","0"),
    GLOBAL_DEL_TAG_DELETE("已删除","1"),

    //通知 支付 状态
    STATUS_SUCCESS("成功","S"),
    STATUS_FAILURE("失败","F"),

    //招聘公司状态
    STATUS_NORMAL("正常","N"),
    STATUS_STOP("停用","S"),

    //应聘结果状态
    AR_RESULT_IN("进行中","I"),
    AR_RESULT_PASS("已通过","P"),
    AR_RESULT_UN("不通过","U"),

    //应聘流程状态
    AP_STATUS_UP("未支付","UP"),
    AP_STATUS_ON("进行中","ON"),
    AP_STATUS_IN("待入成绩","IN"),
    AP_STATUS_VERIFY("待核查成绩","VY"),
    AP_STATUS_COMMPLETE("已完成","CM"),
    AP_RESULT_PASS("合格","P"),
    AP_RESULT_UN("不合格","U"),

    //用户角色
    USER_ROLE_NORMAL("普通用户","N"),
    USER_ROLE_ADMIN("权限用户","A"),



    //岗位招聘流程  显示结果
    RECRUITMENT_PROCESS_SHOW_RESULT("显示","S"),
    RECRUITMENT_PROCESS_UNSHOW_RESULT("不显示","U"),



    //支付方式
    PAY_WAY_WX("微信","WX"),
    PAY_WAY_AL("支付宝","AL"),

    //支付记录
    PY_STATUS_SUCCESS("成功","S"),
    PY_STATUS_FAIL("失败","F"),
    PY_STATUS_ON("进行中","ON"),

    //基础信息审核状态
    UBINFO_EXAMINE_UNDER_REVIEW("审核中","UR"),
    UBINFO_EXAMINE_REJECT("审核拒绝","RJ"),
    UBINFO_EXAMINE_PASS("审核通过","PS"),


    /**
     * 日志操作
     */
    LOG_TYPE_OPTION("OPTION","操作日志"),
    LOG_TYPE_PAY("PAY","支付日志"),
    LOG_STATUS_INFO("INFO","成功"),
    LOG_STATUS_ERROR("ERROR","失败"),
    ;



    //状态名称
    @Getter
    private String statusName;

    //状态编码
    @Getter
    private String statusCode;

    private StatusTypeConstant(String statusName, String statusCode){
        this.statusName = statusName;
        this.statusCode = statusCode;
    }

//    //全局参数
//    GLOBAL_DEL_TAG_UNDELETE()=0;
//    public static Integer GLOBAL_DEL_TAG_DELETE=1;
//
//    //应聘结果状态
//    public static String AR_RESULT_IN ="I";
//    public static String AR_RESULT_PASS ="P";
//    public static String AR_RESULT_UN ="U";
//
//    //应聘流程状态
//    public static String AP_STATUS_UP ="UP";    //未支付，只有在需要支付的流程才有的状态
//    public static String AP_STATUS_ON ="ON";    //进行中，不需要支付的流程 默认的初始状态
//    public static String AP_STATUS_IN ="IN";    //待入成绩
//    public static String AP_STATUS_COMMPLETE ="CM"; //完成
//
//    //基础信息审核状态
//    public static String UBINFO_EXAMINE_UNDER_REVIEW="UR"; //审核进行中
//    public static String UBINFO_EXAMINE_REJECT="RJ";    //审核拒绝
//    public static String UBINFO_EXAMINE_PASS="PS";      //审核通过
}
