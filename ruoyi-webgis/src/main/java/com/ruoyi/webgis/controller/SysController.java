package com.ruoyi.webgis.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import javax.annotation.Resource;

import com.ruoyi.webgis.annotation.NoHandlerLogger;
import com.ruoyi.webgis.bean.DiskInfo;
import com.ruoyi.webgis.bean.MemoryBean;
import com.ruoyi.webgis.bean.result.Result;
import com.ruoyi.webgis.common.CommonFields;
import com.ruoyi.webgis.common.SystemUtils;
import com.ruoyi.webgis.core.thread.SystemProcessManager;
import com.ruoyi.webgis.enums.BizCodeEnum;
import com.ruoyi.webgis.manager.NginxManager;
import com.ruoyi.webgis.sys.DiskLisner;
import com.ruoyi.webgis.sys.MemoryLisner;

import com.ruoyi.webgis.utils.JsonData;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 系统状态展示页面
 *
 * @author guo
 */
@Controller
@RequestMapping("admin/sys/status")
public class SysController {

    @Resource
    private MemoryLisner memoryLisner;

    @Resource
    private DiskLisner diskLisner;

    @Resource
    private NginxManager nginxManager;

    /**
     * 主页入口
     *
     * @return
     */
    @RequestMapping("/")
    public String index(Model model) {
        //获得内存监控
        List<MemoryBean> alwaysMemory = memoryLisner.getAlwaysMemory();
        model.addAttribute("alwaysMemory", alwaysMemory);
        Map<String, Object> alwaysCharts = new HashMap<>();
        String y = "[";
        String x = "[";
        for (int i = 60; i > 0; i--) {
            int yIndex = alwaysMemory.size() - i;
            if (yIndex < 0) {
                y += "'0'";
            } else {
                y += "'" + alwaysMemory.get(yIndex).getCompare() / 1024 + "'";
            }
            if (i == 1) {
                x += "'实时'";
            } else {
                y += ",";
                x += ("'" + i + "秒前',");
            }

        }
        x += "]";
        y += "]";
        alwaysCharts.put("y", y);
        alwaysCharts.put("x", x);
        model.addAttribute("alwaysMemoryCharts", alwaysCharts);
        model.addAttribute("alwaysMaxTotal", alwaysMemory.get(0).getTotal() / 1024 + "");
        int cpuUsedPerc = SystemUtils.getCpuUsedPerc();
        model.addAttribute("cpuUsedPerc", cpuUsedPerc);

        //磁盘
        List<DiskInfo> diskInfo = diskLisner.getDiskInfo().get(0);
        model.addAttribute("diskInfos", diskInfo);

//	    model.addAttribute("nginxStart", nginxManager.isStart());
        model.addAttribute("nginxStart", false);

        return "admin/sys/status/index";
    }

    /**
     * 获得Nginx状态
     *
     * @return : Result
     * @Description :
     * @Creation Date : 2018年2月26日 下午1:08:31
     * @Author : 郭胜凯
     */
    @RequestMapping(value = "nginx", method = RequestMethod.GET)
    @ResponseBody
    public Result nginxStatus() {
        Result result = new Result();
        result.setResult(nginxManager.isStart());
        result.setSuccess(true);
        return result;
    }

    /**
     * 设置nginx状态
     *
     * @return : Result
     * @Description :
     * @Creation Date : 2018年2月26日 下午1:12:29
     * @Author : 郭胜凯
     */
    @RequestMapping(value = "nginx/{status}", method = RequestMethod.PUT)
    @ResponseBody
    public JsonData setNginxStatus(@PathVariable String status) {

        if ("start".equals(status)) {
            nginxManager.start();
        } else if ("stop".equals(status)) {
            nginxManager.stop();
            return JsonData.buildSuccess();
        } else {
            nginxManager.reload();
        }
        try {
            //启动2s后，检测启动状态
            TimeUnit.SECONDS.sleep(2);
            String nginxName = CommonFields.NGINX;
            if (!SystemProcessManager.isExist(nginxName)){
                return JsonData.buildResult(BizCodeEnum.SERVER_START_ERROR);
            }

        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        return JsonData.buildSuccess();
    }

    /**
     * 异步获得CPU占用率
     *
     * @return : int
     * @Description :
     * @Creation Date : 2018年2月7日 上午9:47:59
     * @Author : 郭胜凯
     */
    @RequestMapping(value = "cpuUsedPerc", method = RequestMethod.GET)
    @ResponseBody
    @NoHandlerLogger
    public int cpuUsedPerc() {
        return SystemUtils.getCpuUsedPerc();
    }

    /**
     * 异步获得内存使用率
     *
     * @return : int
     * @Description :
     * @Creation Date : 2018年2月7日 上午9:47:59
     * @Author : 郭胜凯
     */
    @RequestMapping(value = "memoryUsedPerc", method = RequestMethod.GET)
    @ResponseBody
    @NoHandlerLogger
    public List<String> memoryUsedPerc() {
        List<String> y = new ArrayList<>();
        List<MemoryBean> alwaysMemory = memoryLisner.getAlwaysMemory();
        for (int i = 60; i > 0; i--) {
            int yIndex = alwaysMemory.size() - i;
            if (yIndex < 0) {
                y.add("0");
            } else {
                y.add("" + alwaysMemory.get(yIndex).getCompare() / 1024);
            }
        }
        return y;
    }

    /**
     * 异步获得磁盘占用率
     *
     * @return : int
     * @Description :
     * @Creation Date : 2018年2月7日 上午9:47:59
     * @Author : 郭胜凯
     */
    @RequestMapping(value = "diskUsedPerc", method = RequestMethod.GET)
    @ResponseBody
    @NoHandlerLogger
    public List<DiskInfo> diskUsedPerc() {
        //磁盘
        List<DiskInfo> diskInfo = diskLisner.getDiskInfo().get(0);
        return diskInfo;
    }
}
