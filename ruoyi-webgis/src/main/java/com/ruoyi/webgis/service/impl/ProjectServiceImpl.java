package com.ruoyi.webgis.service.impl;

import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.webgis.beam.NginxErrorPage;
import com.ruoyi.webgis.beam.NginxServer;
import com.ruoyi.webgis.common.CommonFields;
import com.ruoyi.webgis.common.NginxUtils;
import com.ruoyi.webgis.conf.Configer;
import com.ruoyi.webgis.constant.StatusTypeConstant;
import com.ruoyi.webgis.constant.SysConfigConstant;
import com.ruoyi.webgis.core.thread.SystemProcessManager;
import com.ruoyi.webgis.enums.BizCodeEnum;
import com.ruoyi.webgis.exception.NginxServiceManagerException;
import com.ruoyi.webgis.manager.NginxManager;
import com.ruoyi.webgis.model.po.ProjectPO;
import com.ruoyi.webgis.mapper.ProjectMapper;
import com.ruoyi.webgis.model.req.ProjectDo;
import com.ruoyi.webgis.model.vo.PageVO;
import com.ruoyi.webgis.model.vo.ProjectListVo;
import com.ruoyi.webgis.service.ProjectService;
import com.ruoyi.webgis.utils.CommonUtil;
import com.ruoyi.webgis.utils.Vali;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.odiszapc.nginxparser.*;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;

import javax.annotation.Resource;
import javax.validation.ValidationException;
import java.io.File;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 中科吉芯
 * @since 2022-02-07
 */
@Service
public class ProjectServiceImpl extends ServiceImpl<ProjectMapper, ProjectPO> implements ProjectService {

    @Resource
    private NginxManager nginxManager;

    @Autowired
    private ProjectMapper projectMapper;

    @Override
    public AjaxResult projectList(String searchName, int currentPage, int ProjectType) {
        Long userId = SecurityUtils.getUserId();
        Page<ProjectPO> page=new Page<>(currentPage,8);
        QueryWrapper<ProjectPO> qw = new QueryWrapper<ProjectPO>().like("project_name", searchName)
                .eq("del_tag", StatusTypeConstant.GLOBAL_DEL_TAG_UNDELETE.getStatusCode()).eq("user_id",userId)
                .eq("project_type",ProjectType).orderByDesc("create_time");
        IPage<ProjectPO> iPage = projectMapper.selectPage(page,qw);
        //获取数据的总条数
        long total = iPage.getTotal();
        PageVO<ProjectListVo> pageVO = new PageVO<>();
        pageVO.setTotalCount(total);
        //获取数据的总页数
        long pages = iPage.getPages();
        pageVO.setTotalPage(pages);
        List<ProjectListVo> collect = iPage.getRecords().stream().map(res -> {
            ProjectListVo projectListVo = new ProjectListVo();
            BeanUtils.copyProperties(res, projectListVo);
            if (res.getSwitchTag() == 1) {
                projectListVo.setSwitchTag(false);
            } else {
                projectListVo.setSwitchTag(true);
            }
            return projectListVo;
        }).collect(Collectors.toList());
        pageVO.setData(collect);
        return AjaxResult.success(pageVO);
    }

    @Override
    public AjaxResult projectDel(Long projectId) {
        Long userId = SecurityUtils.getUserId();
        QueryWrapper<ProjectPO> eq = new QueryWrapper<ProjectPO>().eq("project_id", projectId)
                .eq("del_tag", StatusTypeConstant.GLOBAL_DEL_TAG_UNDELETE.getStatusCode()).eq("user_id", userId);
        ProjectPO projectPO = new ProjectPO();
        projectPO.setProjectId(projectId);
        projectPO.setDelTag(Integer.parseInt(StatusTypeConstant.GLOBAL_DEL_TAG_DELETE.getStatusCode()));
        int delete = projectMapper.update(projectPO,eq);
        delRuleServer(SysConfigConstant.configs.get("Service_Addr")+":"+projectPO.getProjectPort());
        return AjaxResult.success();
    }

    /**
     * 删除Ruler Server
     * @param location localhost:port
     * @return
     */
    public void delRuleServer(String location) {
        NgxConfig conf = NginxUtils.read();

        //备份配置
        String bakConf = NginxUtils.toString(conf);
        //尝试写入文件
        try {
            //更新Config对象
            conf = delRuleConf(location, NginxUtils.read());
            //更新配置文件
            NginxUtils.save(conf);
            //尝试重启加载新的配置
            //nginx服务启动，则重启服务配置即使生效
            String nginxName = CommonFields.NGINX;
            if (SystemProcessManager.isExist(nginxName)){
                nginxManager.reload();
            }
        } catch (Exception e) {
            NginxUtils.save(bakConf);
            if (e instanceof ValidationException) {
                throw e;
            }
            throw new NginxServiceManagerException("已回滚到上次配置:" + e.getMessage(), e);
        }
    }

    /**
     * 删除规则实现
     *
     * @param location 所属监听域
     */
    private NgxConfig delRuleConf(String location, NgxConfig conf) {
        NgxBlock http = conf.findBlock("http");
        conf.remove(http);
        List<NgxEntry> httpItems = new ArrayList<>(http.getEntries());
        for (NgxEntry httpItem : httpItems) {
            if (!(httpItem instanceof NgxBlock)) {
                continue;
            }
            NgxBlock server = (NgxBlock) httpItem;
            if (!server.getName().equals("server")) {
                continue;
            }

            String hostAndProt = getHostAndProt(server);
            if (null == hostAndProt) {
                continue;
            }
            // 找到块
            if (hostAndProt.equals(location)) {
                http.remove(server);
                break;
            }
        }
        conf.addEntry(http);
        return conf;
    }

    private String getHostAndProt(NgxBlock server) {
        //端口
        NgxParam listen = server.findParam("listen");
        if (null == listen) {
            return null;
        }
        //域名
        NgxParam server_name = server.findParam("server_name");
        if (null == server_name) {
            return null;
        }
        return server_name.getValue().trim() + ":" + listen.getValue().trim();
    }

    @Override
    public AjaxResult projectAdd(ProjectDo projectDo) {
        if (projectDo.getProjectId()!=null){
            return AjaxResult.error(String.valueOf(BizCodeEnum.DATABASE_ERROR));
        }

        //查询是否有相同端口占用
        QueryWrapper<ProjectPO> queryWrapper = new QueryWrapper<ProjectPO>().eq("project_port", projectDo.getProjectPort())
                .eq("project_type", projectDo.getProjectType()).eq("del_tag", StatusTypeConstant.GLOBAL_DEL_TAG_UNDELETE.getStatusCode());

        Integer integer = projectMapper.selectCount(queryWrapper).intValue();

        if (integer>0){
            //有相同的端口号占用
            return AjaxResult.error(String.valueOf(BizCodeEnum.PROJECT_PORT_REPEAT));
        }

        //没有占用，即新增
        ProjectPO projectPO = new ProjectPO();
        BeanUtils.copyProperties(projectDo,projectPO);
        projectPO.setProjectNo(CommonUtil.getRandomCode(8));
        Long userId = SecurityUtils.getUserId();
        projectPO.setUserId(userId);
        int insert = projectMapper.insert(projectPO);

        String path = projectPO.getProjectId() + "-" + projectPO.getProjectNo();
        //TODO TODO TODO 域名
        //写入nginx.conf
        String Service_Addr = SysConfigConstant.configs.get("Service_Addr");
        saveListener(Service_Addr,Integer.parseInt(projectDo.getProjectPort()),path);
        return AjaxResult.success();
    }

    public AjaxResult saveListener(String host,Integer port,String path){
        NgxConfig conf = NginxUtils.read();
        //备份配置
        String bakConf = NginxUtils.toString(conf);
        //尝试写入文件
        try {
            //更新Config对象
            NginxServer server = new NginxServer();
            server.setPort(port);
            addServerLisner(host, server, conf,path);
            //更新配置文件
            NginxUtils.save(conf);
            //尝试重启加载新的配置
            //nginx服务启动，则重启服务配置即使生效
            String nginxName = CommonFields.NGINX;
            if (SystemProcessManager.isExist(nginxName)){
            nginxManager.reload();
            }
        } catch (Exception e) {
            NginxUtils.save(bakConf);
            throw new NginxServiceManagerException("已回滚到上次配置:" + e.getMessage(), e);
        }
        return AjaxResult.success();
    }

    /**
     * 修改或添加NgxConfig对象中的监听配置
     *
     * @param nameAndPort
     * @param server
     * @param conf
     */
    public void addServerLisner(String nameAndPort, NginxServer server, NgxConfig conf,String path) {
        NgxBlock http = conf.findBlock("http");
        List<NgxEntry> servers = http.findAll(NgxConfig.BLOCK, "server");
        NgxBlock serBlock = null;
        for (NgxEntry enty : servers) {
            NgxBlock ser = (NgxBlock) enty;
            NginxServer nginxServer = new NginxServer();
            //端口
            NgxParam listen = ser.findParam("listen");
            if (null != listen) {
                nginxServer.setPort(Integer.valueOf(listen.getValue()));
            }
            //域名
            NgxParam server_name = ser.findParam("server_name");
            if (null != server_name) {
                nginxServer.setName(server_name.getValue());
            }

            if (nameAndPort.equals(nginxServer.getName() + ":" + nginxServer.getPort())) {
                //conf.remove(ser);
                serBlock = new NgxBlock();
                serBlock.addValue(new NgxToken("server"));
                List<NgxEntry> servConfs = new ArrayList<>(ser.getEntries());
                //端口
                NgxParam lis = new NgxParam();
                lis.addValue("listen " + server.getPort());
                servConfs = setNgxParam(servConfs, lis, "listen");
                //域名
                NgxParam sernm = new NgxParam();

                String Service_Addr = SysConfigConstant.configs.get("Service_Addr");
                sernm.addValue("server_name " + (Vali.isEpt(server.getName()) ? Service_Addr : server.getName()));
                servConfs = setNgxParam(servConfs, sernm, "server_name");
                //错误页
                Iterator<NgxEntry> iterator = servConfs.iterator();
                while (iterator.hasNext()) {
                    NgxEntry next = iterator.next();
                    if (next instanceof NgxParam) {
                        NgxParam param = ((NgxParam) next);
                        if (param.getName().equals("error_page")) {
                            iterator.remove();
                        }
                    }
                }
                for (NginxErrorPage page :
                        server.getErrorPage()) {
                    NgxParam erpg = new NgxParam();
                    erpg.addValue("error_page");
                    for (String status :
                            page.getStatus()) {
                        erpg.addValue(status);
                    }
                    erpg.addValue(page.getPath());
                    servConfs.add(erpg);
                }
                //日志
                if (!Vali.isEpt(server.getAccessLog())) {
                    NgxParam log = new NgxParam();
                    log.addValue("access_log " + server.getAccessLog());
                    servConfs = setNgxParam(servConfs, log, "access_log");
                }
                //TODO TODO TODO
//                serBlock.addValue("location /");
//
//                NgxParam root = new NgxParam();
//                root.addValue("root "+path);
////                root.addValue("root " + location.getRoot());
//                servConfs = setNgxParam(servConfs, root, "root");
////                serBlock.addValue("location " + location.getPath());



                for (NgxEntry servConf :
                        servConfs) {
                    serBlock.addEntry(servConf);
                }
                http.remove(ser);
                break;
            }
        }
        if (null == serBlock) {
            serBlock = new NgxBlock();
            serBlock.addValue(new NgxToken("server"));

            //域名
            NgxParam name = new NgxParam();
            String Service_Addr = SysConfigConstant.configs.get("Service_Addr");
            name.addValue("server_name " + (Vali.isEpt(server.getName()) ? Service_Addr : server.getName()));
            serBlock.addEntry(name);
            //证书
            if (StringUtils.isNotEmpty(SysConfigConstant.configs.get("Service_Pem")) && StringUtils.isNotEmpty(SysConfigConstant.configs.get("Service_Pem_Key"))){
                NgxParam ssl1 = new NgxParam();
                ssl1.addValue("ssl_certificate /cert/" + SysConfigConstant.configs.get("Service_Pem"));
                serBlock.addEntry(ssl1);

                NgxParam ssl2 = new NgxParam();
                ssl2.addValue("ssl_certificate_key /cert/" + SysConfigConstant.configs.get("Service_Pem_Key"));
                serBlock.addEntry(ssl2);

                NgxParam ssl3 = new NgxParam();
                ssl3.addValue("ssl_session_timeout 5m");
                serBlock.addEntry(ssl3);

                NgxParam ssl4 = new NgxParam();
                ssl4.addValue("ssl_protocols TLSv1 TLSv1.1 TLSv1.2");
                serBlock.addEntry(ssl4);

                NgxParam ssl5 = new NgxParam();
                ssl5.addValue("ssl_ciphers ECDHE-RSA-AES128-GCM-SHA256:HIGH:!aNULL:!MD5:!RC4:!DHE");
                serBlock.addEntry(ssl5);

                NgxParam ssl6 = new NgxParam();
                ssl6.addValue("ssl_prefer_server_ciphers on");
                serBlock.addEntry(ssl6);

                //端口
                NgxParam port = new NgxParam();
                port.addValue("listen " + server.getPort()+" ssl");
                serBlock.addEntry(port);
            }else {
                //端口
                NgxParam port = new NgxParam();
                port.addValue("listen " + server.getPort());
                serBlock.addEntry(port);
            }
            //日志
            NgxParam accessLog = new NgxParam();
            //创建日志文件夹
            File file = new File(Configer.getNginxPath() + "\\logs\\" + path);
            if (!file.exists()){
                file.mkdirs();
            }
            accessLog.addValue("access_log " +"logs\\"+path);
                serBlock.addEntry(accessLog);
            //错误页面
            for (NginxErrorPage page :
                    server.getErrorPage()) {
                NgxParam errorPage = new NgxParam();
                errorPage.addValue("error_page");
                for (String status :
                        page.getStatus()) {
                    errorPage.addValue(status);
                }
                errorPage.addValue(page.getPath());
                serBlock.addEntry(errorPage);
            }

            //配置跨域
            NgxParam cors1 = new NgxParam();
            cors1.addValue("add_header Access-Control-Allow-Origin *");
            serBlock.addEntry(cors1);
            NgxParam cors2 = new NgxParam();
            cors2.addValue("add_header Access-Control-Allow-Methods 'GET, POST, OPTIONS'");
            serBlock.addEntry(cors2);
            NgxParam cors3 = new NgxParam();
            cors3.addValue("add_header Access-Control-Allow-Headers 'DNT,X-Mx-ReqToken,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Authorization'");
            serBlock.addEntry(cors3);

            NgxBlock location = new NgxBlock();
            location.addValue("location /");
            NgxParam root = new NgxParam();

            //创建资源文件夹
            File fileroot = new File(Configer.getNginxPath() + "\\" + path);
            if (!fileroot.exists()){
                fileroot.mkdirs();
            }
            root.addValue("root "+path);

            //设置跨域
            NgxParam head1 = new NgxParam();

//                root.addValue("root " + location.getRoot());
            List<NgxEntry> servConfs = new ArrayList<>();
            servConfs = setNgxParam(servConfs, root, "root");
            for (NgxEntry entry : servConfs) {
                location.addEntry(entry);
            }
            serBlock.addEntry(location);
//                serBlock.addValue("location " + location.getPath());

        }

        conf.remove(http);
        http.addEntry(serBlock);
        conf.addEntry(http);
    }

    private List<NgxEntry> setNgxParam(List<NgxEntry> servConfs, NgxParam param, String name) {
        boolean has = false;
        List<NgxEntry> res = new ArrayList<>();
        for (NgxEntry servConf :
                servConfs) {
            if (servConf instanceof NgxParam) {
                NgxParam p = ((NgxParam) servConf);
                if (p.getName().equals(name)) {
                    servConf = param;
                    has = true;
                }
            }
            res.add(servConf);
        }
        if (!has) {
            res.add(param);
        }
        return res;
    }

    @Override
    public AjaxResult projectUpdate(ProjectDo projectDo) {
        if (projectDo.getProjectId()==null){
            return AjaxResult.error(String.valueOf(BizCodeEnum.DATABASE_ERROR));
        }
        //不能修改端口号，端口置空
        projectDo.setProjectPort(null);

        QueryWrapper<ProjectPO> queryWrapper = new QueryWrapper<ProjectPO>().eq("project_id", projectDo.getProjectId())
                .eq("del_tag", StatusTypeConstant.GLOBAL_DEL_TAG_UNDELETE.getStatusCode());
        ProjectPO projectPO = projectMapper.selectOne(queryWrapper);

        BeanUtils.copyProperties(projectDo,projectPO);

        int i = projectMapper.updateById(projectPO);

        return AjaxResult.success();
    }

    @Override
    public AjaxResult projectClose(Long projectId) {
        ProjectPO projectPO = projectMapper.selectById(projectId);
        if (projectPO==null){
            return AjaxResult.error(String.valueOf(BizCodeEnum.Data_UNREGISTER));
        }
        delRuleServer(SysConfigConstant.configs.get("Service_Addr")+":"+projectPO.getProjectPort());

        //更新状态
        projectPO.setSwitchTag(1);
        projectMapper.updateById(projectPO);
        return AjaxResult.success();
    }

    @Override
    public AjaxResult projectOpen(Long projectId) {
        ProjectPO projectPO = projectMapper.selectById(projectId);
        if (projectPO==null){
            return AjaxResult.error(String.valueOf(BizCodeEnum.Data_UNREGISTER));
        }

        if (projectPO.getSwitchTag()==0){
            //已经是开启状态
            return AjaxResult.success();
        }

        String path = projectPO.getProjectId() + "-" + projectPO.getProjectNo();
        //写入nginx.conf
        String Service_Addr = SysConfigConstant.configs.get("Service_Addr");
        saveListener(Service_Addr,Integer.parseInt(projectPO.getProjectPort()),path);

        //更新状态
        projectPO.setSwitchTag(0);
        projectMapper.updateById(projectPO);
        return AjaxResult.success();
    }
}
