package com.ruoyi.webgis.conf;

import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.utils.SecurityUtils;
import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * @author XiaoDequan(中科吉芯)
 * @date 2021/9/7 14:38
 */
@Component
public class MetaHandler implements MetaObjectHandler {

    /**
     * 新增数据执行
     * @param metaObject
     */
    @Override
    public void insertFill(MetaObject metaObject) {
        LoginUser sessionUserBean= SecurityUtils.getLoginUser();
        if (sessionUserBean!=null){
        this.setFieldValByName("createBy", sessionUserBean.getUserId()+"", metaObject);
        this.setFieldValByName("updateBy", sessionUserBean.getUserId()+"", metaObject);
        }else {
            this.setFieldValByName("createBy", "0", metaObject);
            this.setFieldValByName("updateBy", "0", metaObject);
        }
        this.setFieldValByName("revision", 0, metaObject);
        this.setFieldValByName("createTime", new Date(), metaObject);
        this.setFieldValByName("updateTime", new Date(), metaObject);
    }

    /**
     * 更新数据执行
     * @param metaObject
     */
    @Override
    public void updateFill(MetaObject metaObject) {
        LoginUser sessionUserBean= SecurityUtils.getLoginUser();
        if (sessionUserBean!=null){
            this.setFieldValByName("updateBy", sessionUserBean.getUserId()+"", metaObject);
        }else {
            this.setFieldValByName("updateBy", "0", metaObject);
        }
        this.setFieldValByName("updateTime", new Date(), metaObject);
    }
}
