package com.ruoyi.file.controller;

import com.aspose.cad.CodePages;
import com.aspose.cad.InterpolationMode;
import com.aspose.cad.SmoothingMode;
import com.aspose.cad.TextRenderingHint;
import com.aspose.cad.fileformats.cad.CadDrawTypeMode;
import com.aspose.cad.imageoptions.CadRasterizationOptions;
import com.aspose.cad.imageoptions.PdfOptions;
import com.aspose.cad.imageoptions.UnitType;
import com.aspose.cad.Image;
import com.aspose.cad.LoadOptions;
import com.qiwenshare.common.anno.MyLog;
import com.qiwenshare.common.result.RestResult;
import com.qiwenshare.common.util.MimeUtils;
import com.qiwenshare.common.util.security.JwtUser;
import com.qiwenshare.common.util.security.SessionUtil;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.file.api.IFileService;
import com.ruoyi.file.api.IFiletransferService;
import com.ruoyi.file.api.IUserFileService;
import com.ruoyi.file.component.FileDealComp;
import com.ruoyi.file.domain.FileBean;
import com.ruoyi.file.domain.StorageBean;
import com.ruoyi.file.domain.UserFile;
import com.ruoyi.file.dto.file.BatchDownloadFileDTO;
import com.ruoyi.file.dto.file.DownloadFileDTO;
import com.ruoyi.file.dto.file.PreviewDTO;
import com.ruoyi.file.dto.file.UploadFileDTO;
import com.ruoyi.file.io.QiwenFile;
import com.ruoyi.file.service.StorageService;
import com.ruoyi.file.vo.file.UploadFileVo;
import com.qiwenshare.ufop.factory.UFOPFactory;
import com.qiwenshare.ufop.operation.download.Downloader;
import com.qiwenshare.ufop.operation.download.domain.DownloadFile;
import com.qiwenshare.ufop.operation.download.domain.Range;
import com.qiwenshare.ufop.util.UFOPUtils;
import com.ruoyi.framework.web.service.TokenService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Slf4j
@Tag(name = "filetransfer", description = "?????????????????????????????????????????????????????????????????????????????????")
@RestController
@RequestMapping("/filetransfer")
public class FiletransferController {

    @Resource
    IFiletransferService filetransferService;

    @Resource
    TokenService tokenService;
    @Resource
    IFileService fileService;
    @Resource
    IUserFileService userFileService;
    @Resource
    FileDealComp fileDealComp;
    @Resource
    StorageService storageService;
    @Resource
    UFOPFactory ufopFactory;


    public static final String CURRENT_MODULE = "??????????????????";

    @Operation(summary = "????????????", description = "????????????MD5??????????????????????????????????????????????????????????????????skipUpload=true????????????????????????skipUpload=false??????????????????????????????POST??????", tags = {"filetransfer"})
    @RequestMapping(value = "/uploadfile", method = RequestMethod.GET)
    @MyLog(operation = "????????????", module = CURRENT_MODULE)
    @ResponseBody
    public AjaxResult uploadFileSpeed(HttpServletRequest request, UploadFileDTO uploadFileDto) {

        LoginUser sessionUserBean = tokenService.getLoginUser(request);

        boolean isCheckSuccess = storageService.checkStorage(sessionUserBean.getUserId(), uploadFileDto.getTotalSize());
        if (!isCheckSuccess) {
            return AjaxResult.error("??????????????????");
        }
        UploadFileVo uploadFileVo = filetransferService.uploadFileSpeed(uploadFileDto,sessionUserBean.getUserId());
        return AjaxResult.success(uploadFileVo);

    }

    @Operation(summary = "????????????", description = "???????????????????????????", tags = {"filetransfer"})
    @RequestMapping(value = "/uploadfile", method = RequestMethod.POST)
    @MyLog(operation = "????????????", module = CURRENT_MODULE)
    @ResponseBody
    public AjaxResult uploadFile(HttpServletRequest request, UploadFileDTO uploadFileDto) {

        LoginUser sessionUserBean = tokenService.getLoginUser(request);

        filetransferService.uploadFile(request, uploadFileDto, sessionUserBean.getUserId());

        UploadFileVo uploadFileVo = new UploadFileVo();
        return AjaxResult.success(uploadFileVo);

    }


    @Operation(summary = "????????????", description = "??????????????????", tags = {"filetransfer"})
    @MyLog(operation = "????????????", module = CURRENT_MODULE)
    @RequestMapping(value = "/downloadfile", method = RequestMethod.GET)
    public void downloadFile(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, DownloadFileDTO downloadFileDTO) {
        Cookie[] cookieArr = httpServletRequest.getCookies();
        String token = "";
        if (cookieArr != null) {
            for (Cookie cookie : cookieArr) {
                if ("token".equals(cookie.getName())) {
                    token = cookie.getValue();
                }
            }
        }
        boolean authResult = fileDealComp.checkAuthDownloadAndPreview(downloadFileDTO.getShareBatchNum(),
                downloadFileDTO.getExtractionCode(),
                token,
                downloadFileDTO.getUserFileId(), null);
        if (!authResult) {
            log.error("???????????????????????????");
            return;
        }
        httpServletResponse.setContentType("application/force-download");// ???????????????????????????
        UserFile userFile = userFileService.getById(downloadFileDTO.getUserFileId());
        String fileName = "";
        if (userFile.getIsDir() == 1) {
            fileName = userFile.getFileName() + ".zip";
        } else {
            fileName = userFile.getFileName() + "." + userFile.getExtendName();

        }
        try {
            fileName = new String(fileName.getBytes("utf-8"), "ISO-8859-1");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        httpServletResponse.addHeader("Content-Disposition", "attachment;fileName=" + fileName);// ???????????????

        filetransferService.downloadFile(httpServletResponse, downloadFileDTO);
    }

    @Operation(summary = "??????????????????", description = "??????????????????", tags = {"filetransfer"})
    @RequestMapping(value = "/batchDownloadFile", method = RequestMethod.GET)
    @MyLog(operation = "??????????????????", module = CURRENT_MODULE)
    public void batchDownloadFile(HttpServletResponse httpServletResponse,@Parameter String userFileIds) {

        String[] userFileIdStrs = userFileIds.split(",");
        List<String> userFileIdList = new ArrayList<>();
        for(String userFileId : userFileIdStrs) {
            UserFile userFile = userFileService.getById(userFileId);
            if (userFile.getIsDir() == 0) {
                userFileIdList.add(userFileId);
            } else {
                QiwenFile qiwenFile = new QiwenFile(userFile.getFilePath(), userFile.getFileName(), true);
                List<UserFile> userFileList = userFileService.selectUserFileByLikeRightFilePath(qiwenFile.getPath(), userFile.getUserId());
                List<String> userFileIds1 = userFileList.stream().map(UserFile::getUserFileId).collect(Collectors.toList());
                userFileIdList.add(userFile.getUserFileId());
                userFileIdList.addAll(userFileIds1);
            }
            
        }
        UserFile userFile = userFileService.getById(userFileIdStrs[0]);
        httpServletResponse.setContentType("application/force-download");// ???????????????????????????
        Date date = new Date();
        String fileName = String.valueOf(date.getTime());
        httpServletResponse.addHeader("Content-Disposition", "attachment;fileName=" + fileName + ".zip");// ???????????????
        filetransferService.downloadUserFileList(httpServletResponse, userFile.getFilePath(), fileName, userFileIdList);
    }

    @Operation(summary="????????????", description="??????????????????", tags = {"filetransfer"})
    @GetMapping("/preview")
    public void preview(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse,  PreviewDTO previewDTO) throws IOException {

        if (previewDTO.getPlatform() != null && previewDTO.getPlatform() == 2) {
            filetransferService.previewPictureFile(httpServletResponse, previewDTO);
            return ;
        }
        String token = "";
        if (StringUtils.isNotEmpty(previewDTO.getToken())) {
            token = previewDTO.getToken();
        } else {
            Cookie[] cookieArr = httpServletRequest.getCookies();
            if (cookieArr != null) {
                for (Cookie cookie : cookieArr) {
                    if ("token".equals(cookie.getName())) {
                        token = cookie.getValue();
                    }
                }
            }
        }

        UserFile userFile = userFileService.getById(previewDTO.getUserFileId());
        boolean authResult = fileDealComp.checkAuthDownloadAndPreview(previewDTO.getShareBatchNum(),
                previewDTO.getExtractionCode(),
                token,
                previewDTO.getUserFileId(),
                previewDTO.getPlatform());

        if (!authResult) {
            log.error("???????????????????????????");
            return;
        }

        String fileName = userFile.getFileName() + "." + userFile.getExtendName();
        try {
            fileName = new String(fileName.getBytes("utf-8"), "ISO-8859-1");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        httpServletResponse.addHeader("Content-Disposition", "fileName=" + fileName);// ???????????????
        String mime = MimeUtils.getMime(userFile.getExtendName());
        httpServletResponse.setHeader("Content-Type", mime);

        FileBean fileBean = fileService.getById(userFile.getFileId());
        if ((UFOPUtils.isVideoFile(userFile.getExtendName()) || "mp3".equalsIgnoreCase(userFile.getExtendName()) || "flac".equalsIgnoreCase(userFile.getExtendName()))
                && !"true".equals(previewDTO.getIsMin())) {
            //???????????????????????????????????????
            String rangeString = httpServletRequest.getHeader("Range");
            int start = 0;
            if (StringUtils.isNotBlank(rangeString)) {
                start = Integer.valueOf(rangeString.substring(rangeString.indexOf("=") + 1, rangeString.indexOf("-")));
            }

            Downloader downloader = ufopFactory.getDownloader(fileBean.getStorageType());
            DownloadFile downloadFile = new DownloadFile();
            downloadFile.setFileUrl(fileBean.getFileUrl());
            Range range = new Range();
            range.setStart(start);
            range.setLength(1024 * 1024 * 1);
            downloadFile.setRange(range);
            InputStream inputStream = downloader.getInputStream(downloadFile);

            OutputStream outputStream = httpServletResponse.getOutputStream();
            try {

                //??????????????????206?????????????????????????????????????????????????????????
                httpServletResponse.setStatus(HttpServletResponse.SC_PARTIAL_CONTENT);
                // ?????????????????????1MB????????????

                httpServletResponse.setHeader("Accept-Ranges", "bytes");
                //???????????????????????????????????????
                httpServletResponse.setHeader("Content-Range", "bytes " + start + "-" + (fileBean.getFileSize() - 1) + "/" + fileBean.getFileSize());
                IOUtils.copy(inputStream, outputStream);


            } finally {
                IOUtils.closeQuietly(inputStream);
                IOUtils.closeQuietly(outputStream);
                if (downloadFile.getOssClient() != null) {
                    downloadFile.getOssClient().shutdown();
                }
            }

        } else {
            filetransferService.previewFile(httpServletResponse, previewDTO);
        }

    }
    @Operation(summary = "??????DWG", description = "??????DWG", tags = {"filetransfer"})
    @RequestMapping(value = "/previewerDWG", method = RequestMethod.GET)
    @ResponseBody
    public void previewerDWG(HttpServletResponse httpServletResponse,  PreviewDTO previewDTO) {
        UserFile userFile = userFileService.getById(previewDTO.getUserFileId());
        FileBean fileBean = fileService.getById(userFile.getFileId());
        String fileUrl = fileBean.getFileUrl();
        String fileName = userFile.getFileName() + "." + userFile.getExtendName();
        httpServletResponse.addHeader("Content-Disposition", "fileName=" + fileName);// ???????????????
        String mime = MimeUtils.getMime(userFile.getExtendName());
        httpServletResponse.setHeader("Content-Type", mime);
        Downloader downloader = ufopFactory.getDownloader(fileBean.getStorageType());
        DownloadFile downloadFile = new DownloadFile();
        downloadFile.setFileUrl(fileUrl);
        InputStream inputStream = downloader.getInputStream(downloadFile);
        try{
            filetransferService.previewFileDWG(httpServletResponse, inputStream);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Operation(summary = "??????????????????", description = "??????????????????", tags = {"filetransfer"})
    @RequestMapping(value = "/getstorage", method = RequestMethod.GET)
    @ResponseBody
    public AjaxResult getStorage() {
        // ???userid??????deptId
         LoginUser sessionUserBean= SecurityUtils.getLoginUser();
        StorageBean storageBean = new StorageBean();
        storageBean.setUserId(sessionUserBean.getDeptId());
        Long storageSize = filetransferService.selectStorageSizeByUserIdDept(sessionUserBean.getDeptId());
        StorageBean storage = new StorageBean();
        storage.setUserId(sessionUserBean.getDeptId());
        storage.setStorageSize(storageSize);
        Long totalStorageSize = storageService.getTotalStorageSize(sessionUserBean.getDeptId());
        storage.setTotalStorageSize(totalStorageSize);
        return AjaxResult.success(storage);
    }
    @Operation(summary = "??????????????????", description = "??????????????????", tags = {"filetransfer"})
    @RequestMapping(value = "/setTotalStorage", method = RequestMethod.GET)
    @ResponseBody
    public AjaxResult setTotalStorage(Long totalStorage) {
        LoginUser sessionUserBean= SecurityUtils.getLoginUser();
        StorageBean storageBean = new StorageBean();
        storageBean.setUserId(sessionUserBean.getDeptId());
        Long storageSize = filetransferService.selectStorageSizeByUserIdDept(sessionUserBean.getDeptId());//????????????
        StorageBean storage = new StorageBean();
        storage.setUserId(sessionUserBean.getDeptId());
        Long usedSize=storageSize/1024/1024;
        if(totalStorage>0&&totalStorage>usedSize){
            // ???userid??????deptId

            storageService.setTotalStorageSize(sessionUserBean.getDeptId(),totalStorage);


            return AjaxResult.success();
        }
        return AjaxResult.error("?????????????????????????????????????????????????????????:"+usedSize+"M,?????????????????????"+totalStorage+"M???");

    }


}
