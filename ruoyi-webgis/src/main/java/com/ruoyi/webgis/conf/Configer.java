package com.ruoyi.webgis.conf;


import com.ruoyi.webgis.common.CommonFields;
import com.ruoyi.webgis.constant.SysConfigConstant;
import com.ruoyi.webgis.utils.PropsUtils;

import java.io.File;

/**
 * 工程配置操作类
 *
 * @Project : nginx
 * @Program Name : com.aiyi.server.manager.nginx.conf.Configer
 * @Description :
 * @Author : 郭胜凯
 * @Creation Date : 2018年2月1日 下午5:10:33
 * @ModificationHistory Who When What ---------- ------------- -----------------------------------
 * 郭胜凯 2018年2月1日 create
 */
public class Configer {

    private static String NginxPath = null;

    private static String NginxConfPath = null;

    /**
     * 获得Nginx所在的路径
     *
     * @return : String
     * @Description :
     * @Creation Date : 2018年2月1日 下午5:11:45
     * @Author : 郭胜凯
     */
    public static String getNginxPath() {
        if (null == NginxPath) {
//            String string = PropsUtils.get(CommonFields.PATH.PATH_NGINX);
//            if (null == string || "".equals(string.trim())) {
//                string = System.getProperty("conf.dir") + "/nginx";
//            }
            String string=SysConfigConstant.configs.get("Gateway_Path");
//            String string=System.getProperty("user.dir")+"\\nginx";
            NginxPath = string;
        }
        return NginxPath;
    }

    /**
     * 获得Nginx的配置文件所在的路径
     *
     * @return : String
     * @Description :
     * @Creation Date : 2018年2月1日 下午5:11:33
     * @Author : 郭胜凯
     */
    public static String getNginxConfPath() {
        if (null == NginxConfPath) {
//            String string = PropsUtils.get(CommonFields.PATH.PATH_NGINX_CONF);
//            if (null == string) {
//                NginxConfPath = getNginxPath() + "/conf/nginx.conf";
//            } else {
//                NginxConfPath = string;
//            }
            NginxConfPath = getNginxPath() + File.separator+"conf"+File.separator+"nginx.conf";
        }
        if (NginxConfPath.contains(" ")){
            if (!NginxConfPath.startsWith("\"")){
                NginxConfPath = "\"" + NginxConfPath;
            }
            if (!NginxConfPath.endsWith("\"")){
                NginxConfPath += "\"";
            }
        }
        return NginxConfPath;
    }

    /**
     * 刷新配置
     *
     * @return : void
     * @Description :
     * @Creation Date : 2018年2月1日 下午5:18:33
     * @Author : 郭胜凯
     */
    public static void refactor() {
        NginxPath = null;
        NginxConfPath = null;
    }

    public static void main(String[] args) {
        System.out.println(getNginxPath());
        System.out.println(getNginxConfPath());
    }

}
