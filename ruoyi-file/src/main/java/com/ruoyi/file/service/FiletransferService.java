package com.ruoyi.file.service;

import com.aspose.cad.InterpolationMode;
import com.aspose.cad.SmoothingMode;
import com.aspose.cad.TextRenderingHint;
import com.aspose.cad.fileformats.cad.CadDrawTypeMode;
import com.aspose.cad.imageoptions.CadRasterizationOptions;
import com.aspose.cad.imageoptions.PdfOptions;
import com.aspose.cad.imageoptions.UnitType;
import com.aspose.pdf.operators.EX;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.qiwenshare.common.util.DateUtil;
import com.qiwenshare.common.util.MimeUtils;
import com.qiwenshare.common.util.security.JwtUser;
import com.qiwenshare.common.util.security.SessionUtil;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.file.api.IFiletransferService;
import com.ruoyi.file.component.FileDealComp;
import com.ruoyi.file.domain.*;
import com.ruoyi.file.dto.file.DownloadFileDTO;
import com.ruoyi.file.dto.file.PreviewDTO;
import com.ruoyi.file.dto.file.UploadFileDTO;
import com.ruoyi.file.io.QiwenFile;
import com.ruoyi.file.mapper.*;
import com.ruoyi.file.util.QiwenFileUtil;
import com.ruoyi.file.vo.file.UploadFileVo;
import com.qiwenshare.ufop.constant.StorageTypeEnum;
import com.qiwenshare.ufop.constant.UploadFileStatusEnum;
import com.qiwenshare.ufop.exception.operation.DownloadException;
import com.qiwenshare.ufop.exception.operation.UploadException;
import com.qiwenshare.ufop.factory.UFOPFactory;
import com.qiwenshare.ufop.operation.delete.Deleter;
import com.qiwenshare.ufop.operation.delete.domain.DeleteFile;
import com.qiwenshare.ufop.operation.download.Downloader;
import com.qiwenshare.ufop.operation.download.domain.DownloadFile;
import com.qiwenshare.ufop.operation.preview.Previewer;
import com.qiwenshare.ufop.operation.preview.domain.PreviewFile;
import com.qiwenshare.ufop.operation.upload.Uploader;
import com.qiwenshare.ufop.operation.upload.domain.UploadFile;
import com.qiwenshare.ufop.operation.upload.domain.UploadFileResult;
import com.qiwenshare.ufop.util.UFOPUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.*;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.zip.Adler32;
import java.util.zip.CheckedOutputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

@Slf4j
@Service
@Transactional(rollbackFor=Exception.class)
public class FiletransferService implements IFiletransferService {

    @Resource
    FileMapper fileMapper;

    @Resource
    UserFileMapper userFileMapper;

    @Resource
    UFOPFactory ufopFactory;
    @Resource
    FileDealComp fileDealComp;
    @Resource
    UploadTaskDetailMapper uploadTaskDetailMapper;
    @Resource
    UploadTaskMapper uploadTaskMapper;
    @Resource
    ImageMapper imageMapper;

    @Resource
    PictureFileMapper pictureFileMapper;


    @Override
    public UploadFileVo uploadFileSpeed(UploadFileDTO uploadFileDTO,Long userId) {
        UploadFileVo uploadFileVo = new UploadFileVo();
        Map<String, Object> param = new HashMap<>();
        param.put("identifier", uploadFileDTO.getIdentifier());
        List<FileBean> list = fileMapper.selectByMap(param);

        String filePath = uploadFileDTO.getFilePath();
        String relativePath = uploadFileDTO.getRelativePath();
        QiwenFile qiwenFile = null;
        if (relativePath.contains("/")) {
            qiwenFile = new QiwenFile(filePath, relativePath, false);
        } else {
            qiwenFile = new QiwenFile(filePath, uploadFileDTO.getFilename(), false);
        }

        if (list != null && !list.isEmpty()) {
            FileBean file = list.get(0);

            UserFile userFile = new UserFile(qiwenFile, userId, file.getFileId());
            UserFile param1 = QiwenFileUtil.searchQiwenFileParam(userFile);
            List<UserFile> userFileList = userFileMapper.selectList(new QueryWrapper<>(param1));
            if (userFileList.size() <= 0) {
                userFileMapper.insert(userFile);
                fileDealComp.uploadESByUserFileId(userFile.getUserFileId());
            }
            if (relativePath.contains("/")) {
                fileDealComp.restoreParentFilePath(qiwenFile, userId);
            }

            uploadFileVo.setSkipUpload(true);
        } else {
            uploadFileVo.setSkipUpload(false);

            List<Integer> uploaded = uploadTaskDetailMapper.selectUploadedChunkNumList(uploadFileDTO.getIdentifier());
            if (uploaded != null && !uploaded.isEmpty()) {
                uploadFileVo.setUploaded(uploaded);
            } else {

                LambdaQueryWrapper<UploadTask> lambdaQueryWrapper = new LambdaQueryWrapper<>();
                lambdaQueryWrapper.eq(UploadTask::getIdentifier, uploadFileDTO.getIdentifier());
                List<UploadTask> rslist = uploadTaskMapper.selectList(lambdaQueryWrapper);
                if (rslist == null || rslist.isEmpty()) {
                    UploadTask uploadTask = new UploadTask();
                    uploadTask.setIdentifier(uploadFileDTO.getIdentifier());
                    uploadTask.setUploadTime(DateUtil.getCurrentTime());
                    uploadTask.setUploadStatus(UploadFileStatusEnum.UNCOMPLATE.getCode());
                    uploadTask.setFileName(qiwenFile.getNameNotExtend());
                    uploadTask.setFilePath(qiwenFile.getParent());
                    uploadTask.setExtendName(qiwenFile.getExtendName());
                    uploadTask.setUserId(userId);
                    uploadTaskMapper.insert(uploadTask);
                }
            }

        }
        return uploadFileVo;
    }

    @Override
    public void uploadFile(HttpServletRequest request, UploadFileDTO uploadFileDto, Long userId) {

        UploadFile uploadFile = new UploadFile();
        uploadFile.setChunkNumber(uploadFileDto.getChunkNumber());
        uploadFile.setChunkSize(uploadFileDto.getChunkSize());
        uploadFile.setTotalChunks(uploadFileDto.getTotalChunks());
        uploadFile.setIdentifier(uploadFileDto.getIdentifier());
        uploadFile.setTotalSize(uploadFileDto.getTotalSize());
        uploadFile.setCurrentChunkSize(uploadFileDto.getCurrentChunkSize());

        Uploader uploader = ufopFactory.getUploader();
        if (uploader == null) {
            log.error("????????????????????????storageType??????????????????");
            throw new UploadException("????????????");
        }
        List<UploadFileResult> uploadFileResultList;
        try {
            uploadFileResultList = uploader.upload(request, uploadFile);
        } catch (Exception e) {
            log.error("????????????????????????UFOP????????????????????????");
            throw new UploadException("????????????", e);
        }
        for (int i = 0; i < uploadFileResultList.size(); i++){
            UploadFileResult uploadFileResult = uploadFileResultList.get(i);
            String relativePath = uploadFileDto.getRelativePath();
            QiwenFile qiwenFile = null;
            if (relativePath.contains("/")) {
                qiwenFile = new QiwenFile(uploadFileDto.getFilePath(), relativePath, false);
            } else {
                qiwenFile = new QiwenFile(uploadFileDto.getFilePath(), uploadFileDto.getFilename(), false);
            }

            if (UploadFileStatusEnum.SUCCESS.equals(uploadFileResult.getStatus())){
                FileBean fileBean = new FileBean(uploadFileResult);
                fileBean.setCreateUserId(userId);
                fileMapper.insert(fileBean);


                UserFile userFile = new UserFile(qiwenFile, userId, fileBean.getFileId());



                UserFile param = QiwenFileUtil.searchQiwenFileParam(userFile);
                List<UserFile> userFileList = userFileMapper.selectList(new QueryWrapper<>(param));
                if (userFileList.size() > 0) {
                    String fileName = fileDealComp.getRepeatFileName(userFile, userFile.getFilePath());
                    userFile.setFileName(fileName);
                }
                if(StringUtils.isEmpty(userFile.getFilePath())){
                    userFile.setFilePath("/");
                }
                userFileMapper.insert(userFile);

                if (relativePath.contains("/")) {
                    fileDealComp.restoreParentFilePath(qiwenFile, userId);
                }

                fileDealComp.uploadESByUserFileId(userFile.getUserFileId());


                LambdaQueryWrapper<UploadTaskDetail> lambdaQueryWrapper = new LambdaQueryWrapper<>();
                lambdaQueryWrapper.eq(UploadTaskDetail::getIdentifier, uploadFileDto.getIdentifier());
                uploadTaskDetailMapper.delete(lambdaQueryWrapper);

                LambdaUpdateWrapper<UploadTask> lambdaUpdateWrapper = new LambdaUpdateWrapper<>();
                lambdaUpdateWrapper.set(UploadTask::getUploadStatus, UploadFileStatusEnum.SUCCESS.getCode())
                        .eq(UploadTask::getIdentifier, uploadFileDto.getIdentifier());
                uploadTaskMapper.update(null, lambdaUpdateWrapper);


                try {
                    if (UFOPUtils.isImageFile(uploadFileResult.getExtendName())) {
                        BufferedImage src = uploadFileResult.getBufferedImage();
                        Image image = new Image();
                        image.setImageWidth(src.getWidth());
                        image.setImageHeight(src.getHeight());
                        image.setFileId(fileBean.getFileId());
                        imageMapper.insert(image);
                    }
                } catch (Exception e) {
                    log.error("??????????????????????????????", e);
                }

                fileDealComp.parseMusicFile(uploadFileResult.getExtendName(), uploadFileResult.getStorageType().getCode(), uploadFileResult.getFileUrl(), fileBean.getFileId());

            } else if (UploadFileStatusEnum.UNCOMPLATE.equals(uploadFileResult.getStatus())) {
                UploadTaskDetail uploadTaskDetail = new UploadTaskDetail();
                uploadTaskDetail.setFilePath(qiwenFile.getParent());
                uploadTaskDetail.setFileName(qiwenFile.getNameNotExtend());
                uploadTaskDetail.setChunkNumber(uploadFileDto.getChunkNumber());
                uploadTaskDetail.setChunkSize((int)uploadFileDto.getChunkSize());
                uploadTaskDetail.setRelativePath(uploadFileDto.getRelativePath());
                uploadTaskDetail.setTotalChunks(uploadFileDto.getTotalChunks());
                uploadTaskDetail.setTotalSize((int)uploadFileDto.getTotalSize());
                uploadTaskDetail.setIdentifier(uploadFileDto.getIdentifier());
                uploadTaskDetailMapper.insert(uploadTaskDetail);

            } else if (UploadFileStatusEnum.FAIL.equals(uploadFileResult.getStatus())) {
                LambdaQueryWrapper<UploadTaskDetail> lambdaQueryWrapper = new LambdaQueryWrapper<>();
                lambdaQueryWrapper.eq(UploadTaskDetail::getIdentifier, uploadFileDto.getIdentifier());
                uploadTaskDetailMapper.delete(lambdaQueryWrapper);

                LambdaUpdateWrapper<UploadTask> lambdaUpdateWrapper = new LambdaUpdateWrapper<>();
                lambdaUpdateWrapper.set(UploadTask::getUploadStatus, UploadFileStatusEnum.FAIL.getCode())
                        .eq(UploadTask::getIdentifier, uploadFileDto.getIdentifier());
                uploadTaskMapper.update(null, lambdaUpdateWrapper);
            }
        }

    }


    private String formatChatset(String str) {
        if (str == null) {
            return "";
        }
        if (Charset.forName("ISO-8859-1").newEncoder().canEncode(str)) {
            byte[] bytes = str.getBytes(StandardCharsets.ISO_8859_1);
            return new String(bytes, Charset.forName("GBK"));
        }
        return str;
    }

    @Override
    public void downloadFile(HttpServletResponse httpServletResponse, DownloadFileDTO downloadFileDTO) {
        UserFile userFile = userFileMapper.selectById(downloadFileDTO.getUserFileId());

        if (userFile.getIsDir() == 0) {

            FileBean fileBean = fileMapper.selectById(userFile.getFileId());
            Downloader downloader = ufopFactory.getDownloader(fileBean.getStorageType());
            if (downloader == null) {
                log.error("???????????????????????????????????????????????????storageType:{}", fileBean.getStorageType());
                throw new DownloadException("????????????");
            }
            DownloadFile downloadFile = new DownloadFile();

            downloadFile.setFileUrl(fileBean.getFileUrl());
            httpServletResponse.setContentLengthLong(fileBean.getFileSize());
            downloader.download(httpServletResponse, downloadFile);
        } else {

            QiwenFile qiwenFile = new QiwenFile(userFile.getFilePath(), userFile.getFileName(), true);
            List<UserFile> userFileList = userFileMapper.selectUserFileByLikeRightFilePath(qiwenFile.getPath() , userFile.getUserId());
            List<String> userFileIds = userFileList.stream().map(UserFile::getUserFileId).collect(Collectors.toList());

            downloadUserFileList(httpServletResponse, userFile.getFilePath(), userFile.getFileName(), userFileIds);
        }
    }

    @Override
    public void downloadUserFileList(HttpServletResponse httpServletResponse, String filePath, String fileName, List<String> userFileIds) {
        String staticPath = UFOPUtils.getStaticPath();
        String tempPath = staticPath + "temp" + File.separator;
        File tempDirFile = new File(tempPath);
        if (!tempDirFile.exists()) {
            tempDirFile.mkdirs();
        }

        FileOutputStream f = null;
        try {
            f = new FileOutputStream(tempPath + fileName + ".zip");
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        CheckedOutputStream csum = new CheckedOutputStream(f, new Adler32());
        ZipOutputStream zos = new ZipOutputStream(csum);
        BufferedOutputStream out = new BufferedOutputStream(zos);

        try {
            for (String userFileId : userFileIds) {
                UserFile userFile1 = userFileMapper.selectById(userFileId);
                if (userFile1.getIsDir() == 0) {
                    FileBean fileBean = fileMapper.selectById(userFile1.getFileId());
                    Downloader downloader = ufopFactory.getDownloader(fileBean.getStorageType());
                    if (downloader == null) {
                        log.error("???????????????????????????????????????????????????storageType:{}", fileBean.getStorageType());
                        throw new UploadException("????????????");
                    }
                    DownloadFile downloadFile = new DownloadFile();
                    downloadFile.setFileUrl(fileBean.getFileUrl());
                    InputStream inputStream = downloader.getInputStream(downloadFile);
                    if(inputStream==null){
                        log.error("??????????????????????????????");
                        throw new UploadException("????????????");
                    }
                    BufferedInputStream bis = new BufferedInputStream(inputStream);
                    try {
                        QiwenFile qiwenFile = new QiwenFile(userFile1.getFilePath().replaceFirst(filePath, ""), userFile1.getFileName() + "." + userFile1.getExtendName(), false);
                        zos.putNextEntry(new ZipEntry(qiwenFile.getPath()));

                        byte[] buffer = new byte[1024];
                        int i = bis.read(buffer);
                        while (i != -1) {
                            out.write(buffer, 0, i);
                            i = bis.read(buffer);
                        }
                    } catch (IOException e) {
                        log.error("" + e);
                        e.printStackTrace();
                    } finally {
                        IOUtils.closeQuietly(bis);
                        try {
                            out.flush();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                } else {
                    QiwenFile qiwenFile = new QiwenFile(userFile1.getFilePath(), userFile1.getFileName(), true);
                    // ?????????????????????
                    zos.putNextEntry(new ZipEntry(qiwenFile.getPath() + QiwenFile.separator));
                    // ?????????????????????????????????copy
                    zos.closeEntry();
                }
            }

        } catch (Exception e) {
            log.error("???????????????????????????:"+ e);
        } finally {
            try {
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        String zipPath = "";
        try {
            Downloader downloader = ufopFactory.getDownloader(StorageTypeEnum.LOCAL.getCode());
            DownloadFile downloadFile = new DownloadFile();
            downloadFile.setFileUrl("temp" + File.separator + fileName + ".zip");
            File tempFile = new File(UFOPUtils.getStaticPath() + downloadFile.getFileUrl());
            httpServletResponse.setContentLengthLong(tempFile.length());
            downloader.download(httpServletResponse, downloadFile);
            zipPath = UFOPUtils.getStaticPath() + "temp" + File.separator + fileName + ".zip";
        } catch (Exception e) {
            //org.apache.catalina.connector.ClientAbortException: java.io.IOException: Connection reset by peer
            if (e.getMessage().contains("ClientAbortException")) {
                //???????????????????????????
            } else {
                log.error("??????zip?????????????????????{}", e.getMessage());
            }

        } finally {
            File file = new File(zipPath);
            if (file.exists()) {
                file.delete();
            }
        }
    }

    @Override
    public void previewFileDWG( HttpServletResponse httpServletResponse, InputStream inputStream)   {
        OutputStream outputStream=null;
        try{
        File file=asFile(inputStream,"dwg");
        com.aspose.cad.Image objImage = com.aspose.cad.Image.load(inputStream);
        PdfOptions pdfOptions = new PdfOptions();
        CadRasterizationOptions cadRasterizationOptions = new CadRasterizationOptions();
        cadRasterizationOptions.setPageHeight(1080);
        cadRasterizationOptions.setPageWidth(1920);
        cadRasterizationOptions.setDrawType(CadDrawTypeMode.UseObjectColor);
        cadRasterizationOptions.setUnitType(UnitType.Unitless);

        cadRasterizationOptions.getGraphicsOptions().setSmoothingMode(SmoothingMode.HighQuality);
        cadRasterizationOptions.getGraphicsOptions().setTextRenderingHint(TextRenderingHint.AntiAliasGridFit);
        cadRasterizationOptions.getGraphicsOptions().setInterpolationMode(InterpolationMode.HighQualityBicubic);
        pdfOptions.setVectorRasterizationOptions(cadRasterizationOptions);
        log.info("11111");


             outputStream = httpServletResponse.getOutputStream();
            objImage.save(outputStream,pdfOptions);
        }catch (Exception e){

        }finally {
            try {
                if(outputStream!=null){
                    outputStream.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }


    @Override
    public void previewFile(HttpServletResponse httpServletResponse, PreviewDTO previewDTO) {
        UserFile userFile = userFileMapper.selectById(previewDTO.getUserFileId());
        FileBean fileBean = fileMapper.selectById(userFile.getFileId());
        Previewer previewer = ufopFactory.getPreviewer(fileBean.getStorageType());
        if (previewer == null) {
            log.error("???????????????????????????????????????????????????storageType:{}", fileBean.getStorageType());
            throw new UploadException("????????????");
        }
        PreviewFile previewFile = new PreviewFile();
        previewFile.setFileUrl(fileBean.getFileUrl());
        try {
            if ("true".equals(previewDTO.getIsMin())) {
                previewer.imageThumbnailPreview(httpServletResponse, previewFile);
            } else {
                previewer.imageOriginalPreview(httpServletResponse, previewFile);
            }
        } catch (Exception e){
                //org.apache.catalina.connector.ClientAbortException: java.io.IOException: ????????????????????????????????????????????????????????????
                if (e.getMessage().contains("ClientAbortException")) {
                //???????????????????????????
            } else {
                log.error("???????????????????????????{}", e.getMessage());
            }

        }

    }
    @Override
    public void previewPictureFile(HttpServletResponse httpServletResponse, PreviewDTO previewDTO) {
        byte[] bytesUrl = Base64.getDecoder().decode(previewDTO.getUrl());
        PictureFile pictureFile = new PictureFile();
        pictureFile.setFileUrl(new String(bytesUrl));
        pictureFile = pictureFileMapper.selectOne(new QueryWrapper<>(pictureFile));
        Previewer previewer = ufopFactory.getPreviewer(pictureFile.getStorageType());
        if (previewer == null) {
            log.error("???????????????????????????????????????????????????storageType:{}", pictureFile.getStorageType());
            throw new UploadException("????????????");
        }
        PreviewFile previewFile = new PreviewFile();
        previewFile.setFileUrl(pictureFile.getFileUrl());
//        previewFile.setFileSize(pictureFile.getFileSize());
        try {

            String mime= MimeUtils.getMime(pictureFile.getExtendName());
            httpServletResponse.setHeader("Content-Type", mime);

            String fileName = pictureFile.getFileName() + "." + pictureFile.getExtendName();
            try {
                fileName = new String(fileName.getBytes("utf-8"), "ISO-8859-1");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }

            httpServletResponse.addHeader("Content-Disposition", "fileName=" + fileName);// ???????????????

            previewer.imageOriginalPreview(httpServletResponse, previewFile);
        } catch (Exception e){
            //org.apache.catalina.connector.ClientAbortException: java.io.IOException: ????????????????????????????????????????????????????????????
            if (e.getMessage().contains("ClientAbortException")) {
                //???????????????????????????
            } else {
                log.error("???????????????????????????{}", e.getMessage());
            }

        }
    }

    @Override
    public void deleteFile(FileBean fileBean) {
        Deleter deleter = null;

        deleter = ufopFactory.getDeleter(fileBean.getStorageType());
        DeleteFile deleteFile = new DeleteFile();
        deleteFile.setFileUrl(fileBean.getFileUrl());
        deleter.delete(deleteFile);
    }



    @Override
    public Long selectStorageSizeByUserId(Long userId){
        return userFileMapper.selectStorageSizeByUserId(userId);
    }

    @Override
    public Long selectStorageSizeByUserIdDept(Long deptId) {
        return userFileMapper.selectStorageSizeByUserIdDept(deptId);
    }
    public static File asFile(InputStream inputStream,String name) throws IOException{
        File tmp = File.createTempFile("11", "."+name, new File("C:\\"));
        OutputStream os = new FileOutputStream(tmp);
        int bytesRead = 0;
        byte[] buffer = new byte[8192];
        while ((bytesRead = inputStream.read(buffer, 0, 8192)) != -1) {
            os.write(buffer, 0, bytesRead);
        }
        inputStream.close();
        return tmp;
    }
}
