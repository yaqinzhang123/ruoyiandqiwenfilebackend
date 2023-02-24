package com.ruoyi.webgis.model.req;

import com.ruoyi.webgis.constant.SysConfigConstant;
import lombok.Data;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.UnknownHostException;

@Data
public class ConfigDo {

    private String serviceAddr;

    private String servicePem;

    private String serviceKey;

    private String gatewayPath;

    private String _3dtilePath;

    private String viewAddr;


    public void setServiceAddr(String serviceAddr) {
        if (serviceAddr==null || serviceAddr.trim().equals("")){
            InetAddress localHost = null;
            try {
                localHost = Inet4Address.getLocalHost();
            } catch (UnknownHostException e) {
                e.printStackTrace();
            }
            String ip = localHost.getHostAddress();
            serviceAddr=ip;
        }
        if (!serviceAddr.contains("http") && !serviceAddr.contains("https")){
            //判断地址是否有http://
            if (StringUtils.isEmpty(SysConfigConstant.configs.get("Service_Pem_Key")) && StringUtils.isEmpty(SysConfigConstant.configs.get("Service_Pem"))){
                // http://
                serviceAddr="http://"+serviceAddr;
            }else{
                // https://
                serviceAddr="https://"+serviceAddr;
            }
        }
        this.serviceAddr = serviceAddr;
    }

    public void setGatewayPath(String gatewayPath) {
        if (gatewayPath==null || gatewayPath.trim().equals("")){
            String Gateway_Path=System.getProperty("user.dir")+ File.separator +"nginx";
            gatewayPath= Gateway_Path;
        }
        this.gatewayPath = gatewayPath;
    }

    public void set_3dtilePath(String _3dtilePath) {
        if (_3dtilePath==null || _3dtilePath.trim().equals("")){
            String _3dtile_Path=System.getProperty("user.dir")+ File.separator +"3dtile"+File.separator+"3dtile.exe";
            _3dtilePath=_3dtile_Path ;
        }
        this._3dtilePath = _3dtilePath;
    }

    public void setViewAddr(String viewAddr) {
        if (viewAddr==null || viewAddr.trim().equals("")){
            String View_Addr="http://39.96.60.245:8064";
            viewAddr= View_Addr;
        }
        if (!viewAddr.contains("http") && !viewAddr.contains("https")){
            viewAddr="http://"+viewAddr;
        }
        this.viewAddr = viewAddr;
    }
}
