package com.ruoyi.file.controller;

import cn.hutool.core.util.IdUtil;
import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import com.baomidou.mybatisplus.core.toolkit.ClassUtils;
import com.qiwenshare.common.exception.NotLoginException;
import com.qiwenshare.common.result.RestResult;
import com.qiwenshare.common.util.DateUtil;
import com.qiwenshare.common.util.security.JwtUser;
import com.qiwenshare.common.util.security.SessionUtil;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.file.api.IFileService;
import com.ruoyi.file.api.IUserFileService;
import com.ruoyi.file.component.FileDealComp;
import com.ruoyi.file.domain.FileBean;
import com.ruoyi.file.domain.UserFile;
import com.ruoyi.file.dto.file.CreateOfficeFileDTO;
import com.ruoyi.file.dto.file.EditOfficeFileDTO;
import com.ruoyi.file.dto.file.PreviewOfficeFileDTO;
import com.ruoyi.file.util.FileModel;
import com.qiwenshare.ufop.factory.UFOPFactory;
import com.qiwenshare.ufop.operation.copy.Copier;
import com.qiwenshare.ufop.operation.copy.domain.CopyFile;
import com.qiwenshare.ufop.operation.download.domain.DownloadFile;
import com.ruoyi.framework.web.service.TokenService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.util.List;
import java.util.Scanner;
import java.util.UUID;

@Tag(name = "office", description = "该接口为Onlyoffice文件操作接口，主要用来做一些文档的编辑，浏览等。")
@RestController
@Slf4j
@RequestMapping({"/office"})
public class OfficeController {
    public static final String CURRENT_MODULE = "Onlyoffice文件操作接口";
    @Resource
    UFOPFactory ufopFactory;
    @Resource
    FileDealComp fileDealComp;
    @Value("${deployment.host}")
    private String deploymentHost;
    @Value("${server.port}")
    private String port;
    @Value("${ufop.storage-type}")
    private Integer storageType;
    @Value("${files.docservice.url.site}")
    private String filesDocSite;
    @Value("${files.docservice.url.api}")
    private String filesDocApi;


    @Resource
    IFileService fileService;
    @Resource
    IUserFileService userFileService;
    @Resource
    private TokenService tokenService;

    @Operation(summary = "创建office文件", description = "创建office文件", tags = {"office"})
    @ResponseBody
    @RequestMapping(value = "/createofficefile", method = RequestMethod.POST)
    public AjaxResult createOfficeFile(@RequestBody CreateOfficeFileDTO createOfficeFileDTO) {
        try{
            LoginUser loginUser =  SecurityUtils.getLoginUser();
            String fileName = createOfficeFileDTO.getFileName();
            String filePath = createOfficeFileDTO.getFilePath();
            String extendName = createOfficeFileDTO.getExtendName();
            List<UserFile> userFiles = userFileService.selectSameUserFile(fileName, filePath, extendName, loginUser.getUserId());
            if (userFiles != null && !userFiles.isEmpty()) {
                return AjaxResult.error("同名文件已存在");
            }
            String uuid = UUID.randomUUID().toString().replaceAll("-","");

            String templateFilePath = "";
            if ("docx".equals(extendName)) {
                templateFilePath = "template/Word.docx";
            } else if ("xlsx".equals(extendName)) {
                templateFilePath = "template/Excel.xlsx";
            } else if ("pptx".equals(extendName)) {
                templateFilePath = "template/PowerPoint.pptx";
            }
            String url2 = ClassUtils.getDefaultClassLoader().getResource("static/" + templateFilePath).getPath();
            url2 = URLDecoder.decode(url2, "UTF-8");
            FileInputStream fileInputStream = new FileInputStream(url2);
            Copier copier = ufopFactory.getCopier();
            CopyFile copyFile = new CopyFile();
            copyFile.setExtendName(extendName);
            String fileUrl = copier.copy(fileInputStream, copyFile);

            FileBean fileBean = new FileBean();
            fileBean.setFileId(IdUtil.getSnowflakeNextIdStr());
            fileBean.setFileSize(0L);
            fileBean.setFileUrl(fileUrl);
            fileBean.setStorageType(storageType);
            fileBean.setIdentifier(uuid);
            fileBean.setCreateTime(DateUtil.getCurrentTime());
            fileBean.setCreateUserId(loginUser.getUserId());
            fileBean.setFileStatus(1);
            boolean saveFlag = fileService.save(fileBean);
            UserFile userFile = new UserFile();
            if(saveFlag) {
                userFile.setUserFileId(IdUtil.getSnowflakeNextIdStr());
                userFile.setUserId(loginUser.getUserId());
                userFile.setFileName(fileName);
                userFile.setFilePath(filePath);
                userFile.setDeleteFlag(0);
                userFile.setIsDir(0);
                userFile.setExtendName(extendName);
                userFile.setUploadTime(DateUtil.getCurrentTime());
                userFile.setFileId(fileBean.getFileId());
                userFileService.save(userFile);
            }
            return AjaxResult.success("文件创建成功");
        } catch (Exception e) {
            log.error(e.getMessage());
            e.printStackTrace();
            return AjaxResult.error(e.getMessage());
        }
    }

    @Operation(summary = "预览office文件", description = "预览office文件", tags = {"office"})
    @RequestMapping(value = "/previewofficefile", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult previewOfficeFile(HttpServletRequest request, @RequestBody PreviewOfficeFileDTO previewOfficeFileDTO) {
        try {

            LoginUser loginUser =  SecurityUtils.getLoginUser();
            UserFile userFile = userFileService.getById(previewOfficeFileDTO.getUserFileId());
            String baseUrl = request.getScheme()+"://"+ deploymentHost + ":" + port + request.getContextPath();
            String token= loginUser.getToken();
            String query = "?type=show&token="+token;
            String username= loginUser.getUser()!=null? loginUser.getUser().getUserName():null;
            String callbackUrl = baseUrl + "/office/IndexServlet" + query;
            FileModel file = new FileModel(userFile.getUserFileId(),
                    userFile.getFileName() + "." + userFile.getExtendName(),
                    previewOfficeFileDTO.getPreviewUrl(),
                    userFile.getUploadTime(),
                    String.valueOf(loginUser.getUserId()),
                    username,
                    callbackUrl,
                    "view");

            JSONObject jsonObject = new JSONObject();
            jsonObject.put("file",file);
            jsonObject.put("docserviceApiUrl", filesDocSite+ filesDocApi);
            jsonObject.put("reportName",userFile.getFileName());
            return AjaxResult.success("获取报告成功！",jsonObject);
        } catch (Exception e) {
            log.error(e.getMessage());
            e.printStackTrace();
            return AjaxResult.success("服务器错误！",e.getMessage());
        }
    }
    @Operation(summary = "编辑office文件", description = "编辑office文件", tags = {"office"})
    @ResponseBody
    @RequestMapping(value = "/editofficefile", method = RequestMethod.POST)
    public AjaxResult editOfficeFile(HttpServletRequest request, @RequestBody EditOfficeFileDTO editOfficeFileDTO) {
        log.info("editOfficeFile");
        try {

            LoginUser loginUser =  SecurityUtils.getLoginUser();
            UserFile userFile = userFileService.getById(editOfficeFileDTO.getUserFileId());

            String baseUrl = request.getScheme()+"://"+ deploymentHost + ":" + port + request.getContextPath();

            log.info("回调地址baseUrl：" + baseUrl);
            String query = "?type=edit&userFileId="+userFile.getUserFileId()+"&token="+loginUser.getToken();
            String callbackUrl = baseUrl + "/office/IndexServlet" + query;

            FileModel file = new FileModel(userFile.getUserFileId(),
                    userFile.getFileName() + "." + userFile.getExtendName(),
                    editOfficeFileDTO.getPreviewUrl(),
                    userFile.getUploadTime(),
                    String.valueOf(loginUser.getUserId()),
                    loginUser.getUser().getUserName(),
                    callbackUrl,
                    "edit");

            JSONObject jsonObject = new JSONObject();
            jsonObject.put("file",file);
            jsonObject.put("docserviceApiUrl",filesDocSite+filesDocApi);
            jsonObject.put("reportName",userFile.getFileName());
            return AjaxResult.success("编辑报告成功！",jsonObject);
        } catch (Exception e) {
            log.error(e.getMessage());
            return AjaxResult.success("服务器错误！",e.getMessage());
        }
    }


    @RequestMapping(value = "/IndexServlet", method = RequestMethod.POST)
    @ResponseBody
    public void IndexServlet(HttpServletResponse response, HttpServletRequest request) throws IOException {
        String token = request.getParameter("token");
        Long userId = 1l;
        if (userId == null) {
            throw new NotLoginException();
        }

        PrintWriter writer = response.getWriter();
        Scanner scanner = new Scanner(request.getInputStream()).useDelimiter("\\A");
        String body = scanner.hasNext() ? scanner.next() : "";

        JSONObject jsonObj = JSON.parseObject(body);
        log.info("===saveeditedfile:" + jsonObj.get("status")); ;
        String status = jsonObj != null ? jsonObj.get("status").toString() : "";
        if ("2".equals(status) || "6".equals(status)) {
            String type = request.getParameter("type");
            String downloadUri = (String) jsonObj.get("url");

            if("edit".equals(type)){//修改报告
                String userFileId = request.getParameter("userFileId");
                UserFile userFile = userFileService.getById(userFileId);
                FileBean fileBean = fileService.getById(userFile.getFileId());
                Long pointCount = fileService.getFilePointCount(userFile.getFileId());
                String fileUrl = fileBean.getFileUrl();
                if (pointCount > 1) {
                    fileUrl = fileDealComp.copyFile(fileBean, userFile);
                }

                URL url = new URL(downloadUri);
                HttpURLConnection connection = (HttpURLConnection) url.openConnection();

                try {
                    InputStream stream = connection.getInputStream();
                    fileDealComp.saveFileInputStream(fileBean.getStorageType(), fileUrl, stream);

                } catch (Exception e) {
                    log.error(e.getMessage());
                } finally {

                    int fileLength = connection.getContentLength();
                    log.info("当前修改文件大小为：" + Long.valueOf(fileLength));

                    DownloadFile downloadFile = new DownloadFile();
                    downloadFile.setFileUrl(fileBean.getFileUrl());
                    InputStream inputStream = ufopFactory.getDownloader(fileBean.getStorageType()).getInputStream(downloadFile);
                    String md5Str = DigestUtils.md5Hex(inputStream);

                    fileService.updateFileDetail(userFile.getUserFileId(), md5Str, fileLength, userId);
                    connection.disconnect();
                }
            }
        }

        if("3".equals(status)||"7".equals(status)) {//不强制手动保存时为6,"6".equals(status)
            log.debug("====保存失败:");
            writer.write("{\"error\":1}");
        }else {
            log.debug("状态为：0") ;
            writer.write("{\"error\":" + "0" + "}");
        }
    }

}