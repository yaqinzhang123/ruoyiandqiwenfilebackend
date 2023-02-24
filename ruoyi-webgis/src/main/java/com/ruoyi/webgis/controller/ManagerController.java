package com.ruoyi.webgis.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 后台主页控制
 *
 * @Project : nginx
 * @Program Name : com.ruoyi.webgis.controller.ManagerController
 * @Description :
 * @Author : 郭胜凯
 * @Creation Date : 2018年2月2日 下午6:20:18
 * @ModificationHistory Who When What ---------- ------------- -----------------------------------
 * 郭胜凯 2018年2月2日 create
 */
@Controller
@RequestMapping("admin")
public class ManagerController {

    /**
     * 打开主页面
     *
     * @return : String
     * @Description :
     * @Creation Date : 2018年2月2日 下午6:20:39
     * @Author : 郭胜凯
     */
    @RequestMapping("/")
    public String index() {
        return "admin/index";
    }
}
