package com.ruoyi.webgis.conf;

import com.ruoyi.webgis.constant.SysConfigConstant;
import com.ruoyi.webgis.mapper.GlobalConfigMapper;
import com.ruoyi.webgis.model.po.GlobalConfigPO;
import com.ruoyi.webgis.utils.CommonUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import java.io.File;
import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
@Order(value=2)
public class InitRunner implements CommandLineRunner {

    @Autowired
    private GlobalConfigMapper configMapper;
    @Value("${server.port}")
    private String serverPort;

    @Override
    public  void run(String... var1) throws Exception{
        QueryWrapper<GlobalConfigPO> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("del_tag",0).eq("server_name", CommonUtil.getMACAddress());
        List<GlobalConfigPO> globalConfigPOS = configMapper.selectList(queryWrapper);
        if (globalConfigPOS!=null && globalConfigPOS.size()>0){
            //有参数
            HashMap<String, String> map = new HashMap<>();
            for (GlobalConfigPO config:globalConfigPOS) {
                map.put(config.getConfigName(),config.getConfigValue());
            }
            SysConfigConstant.configs=map;
        }else {
            HashMap<String, String> map = new HashMap<>();
            //初始化参数
            //初始化域名访问地址
            InetAddress localHost = Inet4Address.getLocalHost();
            String ip = "http://"+localHost.getHostAddress();
            initConfig("Service_Addr",ip);
            map.put("Service_Addr",ip);

            initConfig("Service_Pem",null);
            map.put("Service_Pem",null);
            initConfig("Service_Pem_Key",null);
            map.put("Service_Pem_Key",null);

            String Gateway_Path=System.getProperty("user.dir")+ File.separator +"nginx";
            initConfig("Gateway_Path",Gateway_Path);
            map.put("Gateway_Path",Gateway_Path);

            String _3dtile_Path=System.getProperty("user.dir")+ File.separator +"3dtile"+File.separator+"3dtile.exe";
            initConfig("3dtile_Path",_3dtile_Path);
            map.put("3dtile_Path",_3dtile_Path);

            String View_Addr="http://localhost:"+serverPort+"/view/";
            initConfig("View_Addr",View_Addr);
            map.put("View_Addr",View_Addr);

            SysConfigConstant.configs=map;
        }
    }

    public void initConfig(String paramName,String paramValue){
        GlobalConfigPO globalConfigPO = new GlobalConfigPO();
        globalConfigPO.setConfigName(paramName);
        globalConfigPO.setConfigValue(paramValue);
        try {
            globalConfigPO.setServerName(CommonUtil.getMACAddress());
        } catch (Exception e) {
            e.printStackTrace();
        }
        configMapper.insert(globalConfigPO);
    }
}