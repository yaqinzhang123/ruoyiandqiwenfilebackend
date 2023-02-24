package com.ruoyi.webgis.enums;

import lombok.Getter;

/**
 *
 * @Description 状态码定义约束，共6位数，前三位代表服务，后4位代表接口
 *  比如 商品服务210,购物车是220、用户服务230，403代表权限
 *
 **/
public enum BizCodeEnum {

    /**
     * 通用操作码
     */
    OPS_REPEAT(110001,"重复操作"),
    PARAM_ERROR(110002,"值异常"),
    DATABASE_ERROR(110003,"数据操作异常"),
    SENTINEL_AUTHORITY_EXCEPTION(500001,"授权异常"),
    DATABASE_UPDATE_ERROR(110004,"数据操作异常"),

    /**
     *验证码
     */
    CODE_TO_ERROR(240001,"接收号码不合规"),
    CODE_LIMITED(240002,"验证码发送过快"),
    CODE_ERROR(240003,"验证码错误"),
    CODE_CAPTCHA(240101,"图形验证码错误"),
    CODE_UNUSE(240102,"验证码失效，请新获取"),

    /**
     * 账号
     */
    ACCOUNT_REPEAT(250001,"账号已经存在"),
    AUTH_BIND_REPEAT(250001,"微信账号已绑定"),
    ACCOUNT_UNREGISTER(250002,"账号不存在"),
    ACCOUNT_PWD_ERROR(250003,"账号或者密码错误"),
    ACCOUNT_ACCESS_INVALID(250004,"用户授权失效"),
    ACCOUNT_UNTICK_TREATY(250005,"用户未勾选协议"),
    ACCOUNT_UNLOGIN(250006,"账号未登录"),
    ACCOUNT_BASEINFO_RJ(250007,"基本信息审核驳回"),
    ACCOUNT_BASEINFO_UR(250008,"基本信息审核中"),
    ACCOUNT_BASEINFO_FIRST_INPUT(250010,"请先填写完成基础信息！"),
    ACCOUNT_UNFOLLOW_PUBLIC(250009,"账户未关注公众号"),
    ACCOUNT_ROLE_ERROR(250010,"账号为非管理员账户，不可登录"),

    /**
     * 数据
     */
    Data_UNREGISTER(260001,"数据不存在"),
    FILE_UPLOAD_ERROR(260002,"文件上传失败"),

    /**
     * 项目
     */
    PROJECT_DELETE(270001,"项目已被删除或关闭！"),
    PROJECT_PORT_REPEAT(270002,"端口被使用，请更换！"),

    /**
     * 服务
     */
    SERVER_START_ERROR(280001,"服务启动异常！请联系管理员查看日志！");




    @Getter
    private String message;

    @Getter
    private int code;

    private BizCodeEnum(int code, String message){
        this.code = code;
        this.message = message;
    }



}
