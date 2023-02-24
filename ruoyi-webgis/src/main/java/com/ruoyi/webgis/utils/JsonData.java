package com.ruoyi.webgis.utils;

import com.ruoyi.webgis.enums.BizCodeEnum;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 *
 * @Description
 * @Author 中科吉芯-肖德泉
 * @Version 1.0
 **/

@Data
@AllArgsConstructor
@NoArgsConstructor
@Tag(name = "返回说明")
public class JsonData {

    /**
     * 状态码 0 表示成功
     */

    private Integer code;
    /**
     * 数据
     */
    private Object data;
    /**
     * 描述
     */
    private String msg;


    /**
     * 成功，不传入数据
     * @return
     */
    public static JsonData buildSuccess() {
        return new JsonData(200, "SUCCESS", "SUCCESS");
    }

    /**
     *  成功，传入数据
     * @param data
     * @return
     */
    public static JsonData buildSuccess(Object data) {
        return new JsonData(200, data, null);
    }

    /**
     * 失败，传入描述信息
     * @param msg
     * @return
     */
    public static JsonData buildError(String msg) {
        return new JsonData(-1, null, msg);
    }



    /**
     * 自定义状态码和错误信息
     * @param code
     * @param msg
     * @return
     */
    public static JsonData buildCodeAndMsg(int code, String msg) {
        return new JsonData(code, null, msg);
    }

    /**
     * 传入枚举，返回信息
     * @param codeEnum
     * @return
     */
    public static JsonData buildResult(BizCodeEnum codeEnum){
        return JsonData.buildCodeAndMsg(codeEnum.getCode(),codeEnum.getMessage());
    }
    /**
     *  获取远程调用数据
     *  注意事项：
     *      支持多单词下划线专驼峰（序列化和反序列化）
     *
     *
     * @param typeReference
     * @param <T>
     * @return
     */
    public <T> T getData(TypeReference<T> typeReference){
        return JSON.parseObject(JSON.toJSONString(data),typeReference);
    }
}