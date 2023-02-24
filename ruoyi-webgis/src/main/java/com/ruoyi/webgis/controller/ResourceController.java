package com.ruoyi.webgis.controller;

import com.ruoyi.webgis.constant.FileUploadInfo;
import com.ruoyi.webgis.enums.BizCodeEnum;
import com.ruoyi.webgis.model.po.ResourcePO;
import com.ruoyi.webgis.service.ResourceService;
import com.ruoyi.webgis.utils.FileUtils;
import com.ruoyi.webgis.utils.JsonData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.Map;

@RequestMapping("/resource")
@RestController
@CrossOrigin
@EnableAsync
public class ResourceController {

    @Autowired
    private ResourceService resourceService;

//    @RequestMapping(value="/uploadResourceFiles")
//    public JsonData uploadQusImages(@RequestParam("file") MultipartFile[] file) {
//        if (file == null && file.length <= 0 && projectId!=null) {
//            return JsonData.buildResult(BizCodeEnum.Data_UNREGISTER);
//        }
//        JsonData jsonData = resourceService.resourceAdd(file, projectId);
//        return JsonData.buildSuccess();
//    }
//    @RequestMapping(value = "uploadResourceFiles", method = RequestMethod.POST)
//    public void compareSensorData(@RequestPart("file")
//                                          MultipartFile file,HttpServletRequest request){
//        String data = request.getParameter("data");
//    }
    @RequestMapping(value="/uploadResourceFiles")
    public JsonData uploadQusImages(@RequestParam("file") MultipartFile[] file,Long projectId) {
        if (file == null && file.length <= 0 && projectId!=null) {
            return JsonData.buildResult(BizCodeEnum.Data_UNREGISTER);
        }
        JsonData jsonData = resourceService.resourceAdd(file, projectId);
        return JsonData.buildSuccess();
    }

    @GetMapping(value = "/list")
    public JsonData list(@RequestParam(name = "searchName",defaultValue = "") String searchName,@RequestParam(name="currentPage",defaultValue = "1")  int currentPage,@RequestParam(name="projectId",defaultValue = "0")  Long projectId,@RequestParam(name="resourceType",defaultValue = "0") Integer resourceType){
        if (resourceType==null) {
            return JsonData.buildResult(BizCodeEnum.Data_UNREGISTER);
        }
        return resourceService.resourceList(searchName,currentPage,projectId,resourceType);
    }

    @DeleteMapping("del")
    public JsonData projectDel(@RequestParam Long resourceId){
        if (resourceId==null){
            return JsonData.buildResult(BizCodeEnum.DATABASE_ERROR);
        }
        return resourceService.resourceDel(resourceId);
    }

    @GetMapping("reloadExchange")
    public JsonData reloadExchange(@RequestParam Long resourceId){
        if (resourceId==null){
            return JsonData.buildResult(BizCodeEnum.DATABASE_ERROR);
        }
        return resourceService.resourceDel(resourceId);
    }
}
