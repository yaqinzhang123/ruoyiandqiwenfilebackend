package com.ruoyi.webgis.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @author XiaoDequan(中科吉芯)
 * @date 2021/10/13 9:01
 */
@Controller
public class HtmlController {
//
//    @GetMapping("/index")
//    public String index(){
//        return "index"; //当浏览器输入/index时，会返回 /templates/home.html页面
//    }
@GetMapping("/view")
public String view(){
    return "/view/index"; //当浏览器输入/index时，会返回 /templates/home.html页面
}
    @GetMapping("/admin")
    public String admin(){
        return "/admins/index"; //当浏览器输入/index时，会返回 /templates/home.html页面
    }
//
//    @GetMapping("/agreement")
//    public String agreement(){
//        return "agreement"; //当浏览器输入/index时，会返回 /templates/agreement.html页面
//    }
}
