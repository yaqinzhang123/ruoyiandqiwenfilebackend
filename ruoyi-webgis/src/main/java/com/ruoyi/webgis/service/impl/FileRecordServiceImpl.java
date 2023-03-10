package com.ruoyi.webgis.service.impl;


import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.qiwenshare.ufop.constant.UploadFileStatusEnum;
import com.qiwenshare.ufop.exception.operation.DownloadException;
import com.qiwenshare.ufop.exception.operation.UploadException;
import com.qiwenshare.ufop.factory.UFOPFactory;
import com.qiwenshare.ufop.operation.download.Downloader;
import com.qiwenshare.ufop.operation.download.domain.DownloadFile;
import com.qiwenshare.ufop.operation.upload.Uploader;
import com.qiwenshare.ufop.operation.upload.domain.UploadFile;
import com.qiwenshare.ufop.operation.upload.domain.UploadFileResult;
import com.qiwenshare.ufop.util.UFOPUtils;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.file.component.FileDealComp;
import com.ruoyi.file.domain.*;
import com.ruoyi.file.dto.file.UploadFileDTO;
import com.ruoyi.file.io.QiwenFile;
import com.ruoyi.file.mapper.UploadTaskDetailMapper;
import com.ruoyi.file.mapper.UploadTaskMapper;
import com.ruoyi.file.mapper.UserFileMapper;
import com.ruoyi.file.util.QiwenFileUtil;
import com.ruoyi.file.vo.file.UploadFileVo;
import com.ruoyi.webgis.common.FileHandleUtil;
import com.ruoyi.webgis.common.FileUploadConfig;
import com.ruoyi.webgis.common.entity.ResultCode;
import com.ruoyi.webgis.common.util.IPUtils;
import com.ruoyi.webgis.common.util.IdWorker;
import com.ruoyi.webgis.mapper.FileRecordMapper;
import com.ruoyi.webgis.model.po.FileRecord;
import com.ruoyi.webgis.model.po.FileZoneRecord;
import com.ruoyi.webgis.model.po.ResourcePO;
import com.ruoyi.webgis.service.IFileRecordService;
import com.ruoyi.webgis.service.IFileZoneRecordService;
import com.ruoyi.webgis.service.ResourceService;
import com.ruoyi.webgis.utils.CommonUtil;
import com.ruoyi.webgis.utils.JsonData;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.*;

/**
 * <p>
 * ?????????????????? ???????????????
 * </p>
 *
 * @author haijun
 * @since 2020-02-14
 */
@Service
public class FileRecordServiceImpl extends ServiceImpl<FileRecordMapper, FileRecord> implements IFileRecordService {
    @Autowired
    private FileRecordMapper fileRecordMapper;

    @Autowired
    private FileUploadConfig fileUploadConfig;

    @Autowired
    private ResourceService resourceService;
    @Resource
    UploadTaskDetailMapper uploadTaskDetailMapper;
    @Resource
    UploadTaskMapper uploadTaskMapper;

    @Autowired
    private IdWorker idWorker;

    @Autowired
    private IFileZoneRecordService fileZoneRecordService;
    @Resource
    UserFileMapper userFileMapper;

    @Resource
    UFOPFactory ufopFactory;
    @Resource
    FileDealComp fileDealComp;

    @Override
    public AjaxResult upload(HttpServletRequest request, Integer uploadType, Integer storageYear) {
        Long nowtime=System.currentTimeMillis();
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        Map<String, MultipartFile> files = multipartRequest.getFileMap();
        for (Map.Entry<String, MultipartFile> entry : files.entrySet()) {
            MultipartFile multipartFile = entry.getValue();
            if (multipartFile.isEmpty()) {
                return AjaxResult.error("??????????????????");
            }
            String contentType = multipartFile.getContentType();
            System.out.println("contentType:"+contentType);
//            if(contentType==null||!isFileter(contentType)){//??????????????????????????????
//                return new Result(ResultCode.FILENOTSUPPORT);
//            }

            String fileName = multipartFile.getOriginalFilename();
            Long size = multipartFile.getSize();
            System.out.println(fileName + "-->" + size);
            String saticAccess = fileUploadConfig.getStaticAccessPath().replace("*", "");
            try {
                //????????????  1 ????????????  2 ????????????
                uploadType = uploadType == 1 ? uploadType : 2;
                //??????MD5???
                String filemd5 = DigestUtils.md5DigestAsHex(multipartFile.getInputStream());
                //???????????????????????????????????????????????????????????????????????????
                FileRecord fileRecorddb = selByMD5AndUpType(filemd5, uploadType);
                Map<String, String> map = new HashMap<>();
                String fileType = contentType.split("/")[0];

                if (fileRecorddb == null) {
                    String pathTypeDir = (uploadType == 1 ? fileUploadConfig.getUserHeaderPicPath() : fileUploadConfig.getArchivesFilePath()) + fileType + "/";
                    // ?????????/??????  ???????????????????????????????????????????????????????????? ??? ?????? ??????
                    String path_date = DateUtil.format(new Date(), "yyyy") + "/" + DateUtil.format(new Date(), "MMdd") + "/" + DateUtil.format(new Date(), "HH");
                    String localPath = getUploadFolder() + fileUploadConfig.getLocalPath() + pathTypeDir + path_date;
                    //?????????????????????????????????
                    String fileSuffix = getFileSuffix(fileName);
                    String serverFileName = fileSuffix;
                    FileHandleUtil.upload(multipartFile.getInputStream(), localPath, serverFileName);
                    String netWorkPath = "/" + saticAccess + pathTypeDir + path_date + "/" + serverFileName;
                    map.put("network", netWorkPath);

                    FileRecord fileRecord = new FileRecord();
                    fileRecord.setDownloadCount(0);
                    fileRecord.setUploadCount(1);
                    fileRecord.setIsMerge(1);//????????????????????????
                    fileRecord.setIsZone(0);
                    fileRecord.setFileSize(size);
                    fileRecord.setFileType(fileType);
                    fileRecord.setMd5Value(filemd5);
                    fileRecord.setOrgName(fileName);
                    fileRecord.setUploadType(uploadType);
                    fileRecord.setServerLocalName(serverFileName);
                    fileRecord.setServerLocalPath(localPath + serverFileName);
                    fileRecord.setNetworkPath(netWorkPath);
                    fileRecord.setStorageDate(getDateToYear(storageYear));//???????????????
                    String fileId=saveFileRecord(request, fileRecord);
                    map.put("fileId", fileId);
                    map.put("network", fileRecord.getNetworkPath());
                } else {
//                    fileRecorddb.setUploadCount(fileRecorddb.getUploadCount()+1);
                    String fileId=saveFileRecord(request, fileRecorddb);
                    map.put("fileId", fileId);
                    map.put("network", fileRecorddb.getNetworkPath());
                }
                System.out.println("????????? "+(System.currentTimeMillis()-nowtime)+" ms");
                return AjaxResult.success(map);
            } catch (IllegalStateException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
                return AjaxResult.error("????????????????????????????????????" + e.getMessage());
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
                return AjaxResult.error("????????????????????????????????????" + e.getMessage());
            } catch (Exception e){
                e.printStackTrace();
                return AjaxResult.error("????????????????????????????????????" + e.getMessage());
            }
        }
        return AjaxResult.error("??????????????????" );
    }

    @Override
    public AjaxResult zoneUpload(HttpServletRequest request, String contentType, FileZoneRecord fileZoneRecord) {
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        Map<String, MultipartFile> files = multipartRequest.getFileMap();
        for (Map.Entry<String, MultipartFile> entry : files.entrySet()) {
            MultipartFile multipartFile = entry.getValue();
            if(multipartFile.isEmpty()){
                return AjaxResult.error("???????????????");
            }
            String fileName = multipartFile.getOriginalFilename();
            if(fileName.equals("blob")){
                fileName=fileZoneRecord.getZoneName();
            }
//            String contentType = multipartFile.getContentType();
            System.out.println("contentType");
//            if(contentType==null||!isFileter(contentType)){
//                return new Result(ResultCode.FILENOTSUPPORT);
//            }
            String fileType=contentType.split("/")[0];
            Long size = multipartFile.getSize();
            System.out.println(fileName + "-->" + size);
            try {

                Map<String,Object> map=new HashMap<>();
                synchronized (UUID.randomUUID()){
                    //???????????????????????????????????????????????????????????????????????????
                    FileZoneRecord fileZoneRecorddb = fileZoneRecordService.selByMD5AndZoneTotalMd5(fileZoneRecord.getZoneMd5(), fileZoneRecord.getZoneTotalMd5());
                    if(fileZoneRecorddb==null){
                        String pathTypeDir=fileUploadConfig.getArchivesFilePath();
                        // ?????????/??????  ???????????????????????????????????????????????????????????? ??? ?????? ??????
                        //?????????????????????????????????MD5???????????????
                        String localPath="";
                        //?????????????????????????????????
                        String fileSuffix = getFileSuffix(fileName);
                        //????????????MD5????????????????????????????????????
                        String filemd5= "";
                        if(fileZoneRecord.getZoneMd5()==null||fileZoneRecord.getZoneMd5().trim().length()==0){
                            filemd5=DigestUtils.md5DigestAsHex(multipartFile.getInputStream());
                            fileZoneRecord.setZoneMd5(filemd5);
                        }else{
                            filemd5=fileZoneRecord.getZoneMd5();
                        }

                        String serverFileName=filemd5+fileSuffix+".temp";
                        String fileRecordId = "";
                        FileRecord fileRecorddb =null;
                        synchronized  (UUID.randomUUID().toString()) {
                            //?????? ???????????????????????????????????????????????????????????????,????????????
                            fileRecorddb = this.selByMD5AndUpType(fileZoneRecord.getZoneTotalMd5(), 2);
                        }
                        if (fileRecorddb == null) {
                            localPath = getUploadFolder() + fileUploadConfig.getLocalPath() + pathTypeDir + "temp/" + fileZoneRecord.getZoneTotalMd5();

                            FileRecord fileRecord = new FileRecord();
                            fileRecord.setFileSize(fileZoneRecord.getZoneTotalSize());
                            fileRecord.setFileType(fileType);
                            fileRecord.setMd5Value(fileZoneRecord.getZoneTotalMd5());
                            fileRecord.setOrgName(fileName);
                            fileRecord.setUploadType(2);
                            fileRecord.setServerLocalPath(localPath);
                            fileRecord.setStorageDate(getDateToYear(100));//???????????????
                            fileRecord.setIsZone(1);
                            fileRecord.setIsMerge(0);//????????????
                            fileRecord.setDownloadCount(0);
                            fileRecord.setUploadCount(1);
                            System.out.println("fileRecord:"+fileRecord);
                            fileRecord.setZoneTotal(fileZoneRecord.getZoneTotalCount());
                            fileRecord.setZoneDate(new Date());
                            fileRecordId = saveFileRecord(request, fileRecord);
                            saveFileRecord(request,fileRecord);
                        } else {
                            //??????????????????????????????????????????????????????????????????
                            if (fileRecorddb.getIsZone() == 1 && fileRecorddb.getIsMerge() == 1) {//?????????????????????????????????????????????
                                return AjaxResult.error("??????????????????");
                            }
                            fileRecordId = fileRecorddb.getId();
                            localPath = fileRecorddb.getServerLocalPath();
                        }
//                        }
                        //?????????????????????
                        FileHandleUtil.upload(multipartFile.getInputStream(), localPath, serverFileName);

                        //??????????????????
                        fileZoneRecord.setId(idWorker.nextId() + "");
                        fileZoneRecord.setZoneMd5(filemd5);//??????????????????MD5
                        fileZoneRecord.setFileRecordId(fileRecordId);
                        fileZoneRecord.setZoneName(serverFileName);
                        fileZoneRecord.setZonePath(localPath);//??????????????????????????????????????????????????????????????????
                        fileZoneRecord.setZoneRecordDate(new Date());
                        fileZoneRecord.setZoneSuffix(fileSuffix);
                        fileZoneRecordService.save(fileZoneRecord);
                        map.put("fileZone", fileZoneRecord);
                        map.put("isExist", false);//?????????
                        map.put("zoneNowIndex", fileZoneRecord.getZoneNowIndex());

                    }else{
                        map.put("fileZone",fileZoneRecorddb);
                        map.put("isExist", true);//??????
                        map.put("zoneNowIndex", fileZoneRecorddb.getZoneNowIndex());
                    }
                }
                return AjaxResult.success(map);
            } catch (IllegalStateException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
                return AjaxResult.error("????????????????????????????????????"+e.getMessage());
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
                return AjaxResult.error("????????????????????????????????????"+e.getMessage());
            }
        }
        return AjaxResult.error("??????????????????");
    }

    @Override
    public AjaxResult md5Check(FileZoneRecord fileZoneRecord, Integer checkType,String contentType,HttpServletRequest request) {
        if(checkType==1){//????????????
//            if(contentType==null||!isFileter(contentType)){
//                return new Result(ResultCode.FILENOTSUPPORT);
//            }
            FileRecord fileRecordb = this.selByMD5AndUpType(fileZoneRecord.getZoneTotalMd5(), 2);
            if(fileRecordb!=null){
                saveFileRecord(request,fileRecordb);
            }
            return fileRecordb!=null&&fileRecordb.getIsMerge()==1?AjaxResult.success(ResultCode.FILEUPLOADED.message(),fileRecordb):AjaxResult.error("?????????????????????");
        }else{
            FileZoneRecord fileZoneRecordb = fileZoneRecordService.selByMD5AndZoneTotalMd5(fileZoneRecord.getZoneMd5(), fileZoneRecord.getZoneTotalMd5());
            return fileZoneRecordb!=null?AjaxResult.success(fileZoneRecordb):AjaxResult.error("????????????????????????????????????");
        }
    }

    @Override
    public AjaxResult mergeZoneFile(String totalmd5,HttpServletRequest request,Long projectId,Integer modelType) {
        //???????????????????????????
        if(totalmd5!=null&&totalmd5.trim().length()>0){
            FileRecord fileRecordb = this.selByMD5AndUpType(totalmd5, 2);
            Map<String,Object> map=new HashMap<>();
            if(fileRecordb!=null&&fileRecordb.getIsZone()==1&&fileRecordb.getIsMerge()==1){
                map.put("netWorkPath",fileRecordb.getNetworkPath());
                map.put("fileId",fileRecordb.getId());
                map.put("fileInfo",fileRecordb);
                map.put("message","?????????????????????????????????????????????"+fileRecordb.getNetworkPath());
                return AjaxResult.success(map);
            }
            String fileType=fileRecordb.getFileType();
            List<FileZoneRecord> fileZoneRecords = fileZoneRecordService.selByTotalMd5(totalmd5);
            if(fileZoneRecords.size()>0){
                // ?????????/??????  ???????????????????????????????????????????????????????????? ??? ?????? ??????
                String path_date= DateUtil.format(new Date(),"yyyy")+"/"+DateUtil.format(new Date(),"MMdd")+"/"+DateUtil.format(new Date(),"HH")+"/";
                String pathTypeDir=fileUploadConfig.getArchivesFilePath()+fileType+"/";

                //??????????????????????????????
                Map<String, String> resourceSaveProject = resourceService.getResourceSaveProject(projectId);
                if (resourceSaveProject==null){
                    return AjaxResult.error("??????????????????????????????????????????");
                }
                String localPath=resourceSaveProject.get("basePath");

                //?????????????????????????????????

                String fileSuffix = getFileSuffix(fileRecordb.getOrgName());
                String randomFileName = CommonUtil.generateUUID();
                String serverFileName= randomFileName+fileSuffix;
                String saticAccess = fileUploadConfig.getStaticAccessPath().replace("*", "");
                String netWorkPath="/"+saticAccess+pathTypeDir+path_date+"/"+ serverFileName;
                fileRecordb.setServerLocalName(serverFileName);
                fileRecordb.setServerLocalPath(localPath+serverFileName);
                fileRecordb.setNetworkPath(netWorkPath);
                FileOutputStream destTempfos =null;
                try {
                    String zonePath = fileZoneRecords.get(0).getZonePath();
                    File parentFileDir = new File(zonePath);//?????????????????????
                    if(parentFileDir.isDirectory()){
                        FileHandleUtil.createDirIfNotExists(localPath);
                        File destTempFile = new File(localPath, serverFileName);
                        if(!destTempFile.exists()){
                            //????????????????????????????????????????????????????????????????????????,
                            destTempFile.getParentFile().mkdir();
                            try {
                                //????????????
                                destTempFile.createNewFile(); //??????????????????????????????????????????
                            } catch (IOException e) {
                                e.printStackTrace();
                            }
                        }
                        System.out.println(parentFileDir.listFiles().length);
                        List<String> ids=new ArrayList<>();
                        for(FileZoneRecord fileZoneR:fileZoneRecords){
                            File partFile = new File(parentFileDir, fileZoneR.getZoneName());
                            destTempfos = new FileOutputStream(destTempFile, true);
                            //??????"??????????????????"???"????????????"???
                            FileUtils.copyFile(partFile, destTempfos);
                            destTempfos.close();
                            ids.add(fileZoneR.getId());
                        }

                        // ????????????????????????????????????
                        String tempDir=getUploadFolder() + fileUploadConfig.getLocalPath()+fileUploadConfig.getArchivesFilePath()+"/temp/"+fileRecordb.getMd5Value();
                        FileHandleUtil.deleteFolder(tempDir);
                        fileZoneRecordService.removeByIds(ids);//??????????????????
                        fileRecordMapper.deleteById(fileRecordb.getId());
//                        fileRecordb.setZoneMergeDate(new Date());
//                        fileRecordb.setIsMerge(1);//??????????????????
//                        this.updateById(fileRecordb);//?????????????????????
//                        String fileId = saveFileRecord(request, fileRecordb);
                        map.put("netWorkPath",netWorkPath);
                        map.put("fileInfo",fileRecordb);
                        map.put("fileId",fileRecordb.getId());

                        //????????????????????????????????????????????????????????????
                        ResourcePO resourcePO = new ResourcePO();
                        resourcePO.setResourceName(fileRecordb.getOrgName());
//            resourcePO.setResourceNo(resourceNo);
                        resourcePO.setResourcePath(localPath+serverFileName);
                        resourcePO.setCreateTime(new Date());
                        resourcePO.setUpdateTime(new Date());
                        resourcePO.setResourceNo(randomFileName);
//                        String optionPath = resourcePO.getResourcePath().substring(0,resourcePO.getResourcePath().lastIndexOf("."));
//                        String exchangeFilePath = com.ruoyi.webgis.utils.FileUtils.hasExchangeFile(optionPath);
//                        //apiTailPath  ==> /id/??????/**/ Data???????????????????????????
//                        String apiTailPath=exchangeFilePath.substring(exchangeFilePath.indexOf(randomFileName));

                        resourcePO.setResourceDownUrl(resourceSaveProject.get("port")+File.separator+serverFileName);
                        resourcePO.setResourceApiUrl(resourceSaveProject.get("port"));
                        resourcePO.setResourceShareUrl("?port="+resourceSaveProject.get("port")+"&fileid=");
                        resourcePO.setProjectId(projectId);
                        resourcePO.setModelType(modelType);
                        JsonData jsonData = resourceService.insertUploadResourceAndExrtZip(resourcePO);
                        return AjaxResult.success(map);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    return AjaxResult.error("????????????????????????"+e.getMessage());
                }finally {
                    try {
                        if(destTempfos!=null){
                            destTempfos.close();
                        }
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
        return AjaxResult.error("????????????");
    }

    @Override
    public AjaxResult delZoneFile(String totalmd5) {
        return null;
    }

    @Override
    public AjaxResult delFile(String fileId) {
        return null;
    }

//    @Override
//    public void recordDownloadLog(String fileId,FileRecord fileRecord) {
//        FileDownloadLog fileDownloadLog=new FileDownloadLog();
//        fileDownloadLog.setSysFileRecordId(fileId);
//        fileDownloadLog.setOrgFileName(fileRecord.getOrgName());
//        fileDownloadLog.setFileSize(fileRecord.getFileSize());
//        fileDownloadLog.setServerLocalName(fileRecord.getServerLocalName());
//        fileDownloadLog.setServerLocalPath(fileRecord.getServerLocalPath());
//        fileDownloadLogService.save(fileDownloadLog);
//        //???????????????
//        fileRecord.setDownloadCount(fileRecord.getDownloadCount()+1);
//        this.updateById(fileRecord);
//    }

    //
    public FileRecord selByMD5AndUpType(String md5,Integer uploadType){
        QueryWrapper queryWrapper=new QueryWrapper();
        queryWrapper.eq("md5_value",md5);
        queryWrapper.eq("upload_type",uploadType);
        List<FileRecord> list = fileRecordMapper.selectList(queryWrapper);
        if(list.size()>0){
            return list.get(0);
        }
        return null;
    }
    /***
     * ??????????????????
     * @param fileName
     * @return
     */
    private String getFileSuffix(String fileName){
        if(fileName==null||fileName.length()==0){
            return "";
        }
        return fileName.substring(fileName.lastIndexOf("."));
    }


    /**
     * ??????????????????????????????
     */
    public Date getDateToYear(Integer year){
        if(year==null){//???????????????
            year=100;
        }
        //?????????????????????
        Date date = new Date();
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);//???????????????
        cal.add(Calendar.YEAR, year);//??????year???
        return cal.getTime();
    }

    public  String getUploadFolder(){
//        String uploadFolderdb = configService.getValueByKey("uploadFolder");
//        System.out.println("uploadFolderdb:"+uploadFolderdb);
//        if(uploadFolderdb==null||uploadFolderdb.trim().length()==0){
//            return fileUploadConfig.getUploadFolder();
//        }
//        return uploadFolderdb;
        return fileUploadConfig.getUploadFolder();
    }

    /**
     * ??????????????????
     */
    public String saveFileRecord(HttpServletRequest request, FileRecord fileRecord){
        fileRecord.setDelFlag(1);
        String device = request.getHeader("User-Agent");
        fileRecord.setUploadDevice(device);
        String ipAddr = IPUtils.getIpAddr(request);
        if(fileRecord.getUploadCount()==1&&fileRecord.getId()==null){
            fileRecord.setUploadIp(ipAddr);
            this.save(fileRecord);
        }
        //??????????????????
//        FileUploadLog fileUploadLogdb = selFileUploadLog(fileRecord.getId(), fileRecord.getCreateBy(), ipAddr);
//        if(fileUploadLogdb==null){//??????ID
//            fileUploadLogdb=new FileUploadLog();
//            fileUploadLogdb.setCreateBy(fileRecord.getCreateBy());
//            fileUploadLogdb.setCreateTime(new Date());
//            fileUploadLogdb.setDelFlag(1);
//            fileUploadLogdb.setOrgFileName(fileRecord.getOrgName());
//            fileUploadLogdb.setSysFileRecordId(fileRecord.getId());
//            fileUploadLogdb.setUploadIp(IPUtils.getIpAddr(request));
//            fileUploadLogdb.setUploadDevice(device);
//            fileUploadLogService.save(fileUploadLogdb);
//        }
//        fileRecord.setUploadCount(selFileUploadLog(fileRecord.getId()));
        this.updateById(fileRecord);
        return fileRecord.getId();
    }

//    /**
//     * ??????????????????
//     */
//    public FileUploadLog selFileUploadLog(String fileId,String createBy,String uploadIp){
//        QueryWrapper queryWrapper=new QueryWrapper();
//        queryWrapper.eq("sys_file_record_id",fileId);
//        queryWrapper.eq("upload_ip",uploadIp);
//        queryWrapper.eq("create_by",createBy);
//        FileUploadLog one = fileUploadLogService.getOne(queryWrapper);
//        return one;
//    }

//    /**
//     * ??????????????????
//     */
//    public Integer selFileUploadLog(String fileId){
//        QueryWrapper queryWrapper=new QueryWrapper();
//        queryWrapper.eq("sys_file_record_id",fileId);
//        return fileUploadLogService.count(queryWrapper);
//    }

    //?????????????????????
//    private boolean isFileter(String contentType){
//        QueryWrapper queryWrapper=new QueryWrapper();
//        queryWrapper.eq("content_type",contentType);
//        queryWrapper.eq("is_filter",1);
//        int count = fileFilterService.count(queryWrapper);
//        return count>0;
//    }



    @Override
    public UploadFileVo uploadFileSpeed(UploadFileDTO uploadFileDTO, Long userId) {
        UploadFileVo uploadFileVo = new UploadFileVo();
        Map<String, Object> param = new HashMap<>();
        param.put("md5_value", uploadFileDTO.getIdentifier());
        List<FileRecord> list = fileRecordMapper.selectByMap(param);

        String filePath = uploadFileDTO.getFilePath();
        String relativePath = uploadFileDTO.getRelativePath();
        QiwenFile qiwenFile = null;
        if (relativePath.contains("/")) {
            qiwenFile = new QiwenFile(filePath, relativePath, false);
        } else {
            qiwenFile = new QiwenFile(filePath, uploadFileDTO.getFilename(), false);
        }

        if (list != null && !list.isEmpty()) {
//            FileRecord file = list.get(0);

//            UserFile userFile = new UserFile(qiwenFile, userId, file.getId());
//            UserFile param1 = QiwenFileUtil.searchQiwenFileParam(userFile);
//            List<UserFile> userFileList = userFileMapper.selectList(new QueryWrapper<>(param1));
//            if (userFileList.size() <= 0) {
//                userFileMapper.insert(userFile);
//                fileDealComp.uploadESByUserFileId(userFile.getUserFileId());
//            }
//            if (relativePath.contains("/")) {
//                fileDealComp.restoreParentFilePath(qiwenFile, userId);
//            }

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
                    uploadTask.setUploadTime(com.qiwenshare.common.util.DateUtil.getCurrentTime());
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
        for (int i = 0; i < uploadFileResultList.size(); i++) {
            UploadFileResult uploadFileResult = uploadFileResultList.get(i);
            String relativePath = uploadFileDto.getRelativePath();
            QiwenFile qiwenFile = null;
            if (relativePath.contains("/")) {
                qiwenFile = new QiwenFile(uploadFileDto.getFilePath(), relativePath, false);
            } else {
                qiwenFile = new QiwenFile(uploadFileDto.getFilePath(), uploadFileDto.getFilename(), false);
            }

            if (UploadFileStatusEnum.SUCCESS.equals(uploadFileResult.getStatus())) {
                //???resource
                // ?????????/??????  ???????????????????????????????????????????????????????????? ??? ?????? ??????
                String fileType = uploadFileDto.getFilename();
                String path_date= DateUtil.format(new Date(),"yyyy")+"/"+DateUtil.format(new Date(),"MMdd")+"/"+DateUtil.format(new Date(),"HH")+"/";
                String pathTypeDir=fileUploadConfig.getArchivesFilePath()+fileType+"/";

                //??????????????????????????????
                Map<String, String> resourceSaveProject = resourceService.getResourceSaveProject(uploadFileDto.getProjectId());
                if (resourceSaveProject==null){
//                    return AjaxResult.error("??????????????????????????????????????????");
                }
                String localPath=resourceSaveProject.get("basePath");

                //?????????????????????????????????

                String fileSuffix = getFileSuffix(uploadFileDto.getFilename());
                String randomFileName = CommonUtil.generateUUID();
                String serverFileName= randomFileName+fileSuffix;
                String saticAccess = fileUploadConfig.getStaticAccessPath().replace("*", "");
                String netWorkPath="/"+saticAccess+pathTypeDir+path_date+"/"+ serverFileName;

               //???nginx??????
                    FileHandleUtil.createDirIfNotExists(localPath);
                    File destTempFile = new File(localPath, serverFileName);
                    if(!destTempFile.exists()){
                        //????????????????????????????????????????????????????????????????????????,
                        destTempFile.getParentFile().mkdir();
                        try {
                            //????????????
                            destTempFile.createNewFile(); //??????????????????????????????????????????
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }

                //????????????????????????????????????????????????????????????
                ResourcePO resourcePO = new ResourcePO();
                resourcePO.setResourceName(uploadFileDto.getFilename());
                resourcePO.setResourcePath(localPath+serverFileName);
                resourcePO.setCreateTime(new Date());
                resourcePO.setUpdateTime(new Date());
                resourcePO.setResourceNo(randomFileName);
                resourcePO.setVisitsNumber(0);
                resourcePO.setResourceDownUrl(resourceSaveProject.get("port")+File.separator+serverFileName);
                resourcePO.setResourceApiUrl(resourceSaveProject.get("port"));
                resourcePO.setResourceShareUrl("?port="+resourceSaveProject.get("port")+"&fileid=");
                resourcePO.setProjectId(uploadFileDto.getProjectId());
                resourcePO.setModelType(uploadFileDto.getModelType());
                JsonData jsonData = resourceService.insertUploadResourceAndExrtZip(resourcePO);
//                FileRecord file = new FileRecord(uploadFileResult);
//                file.setCreateBy(SecurityUtils.getUsername());
//                fileRecordMapper.insert(file);
//
//                //????????????  1 ????????????  2 ????????????
//                Integer uploadType = 1;
//                //??????MD5???
//                String filemd5 = uploadFileDto.getIdentifier();
//                //???????????????????????????????????????????????????????????????????????????
//                FileRecord fileRecorddb = selByMD5AndUpType(filemd5, uploadType);
//                Map<String, String> map = new HashMap<>();
//                //!!!!
//                String fileType = uploadFileDto.getFilename();
//                if (fileRecorddb == null) {
//                    String pathTypeDir = (uploadType == 1 ? fileUploadConfig.getUserHeaderPicPath() : fileUploadConfig.getArchivesFilePath()) + fileType + "/";
//                    // ?????????/??????  ???????????????????????????????????????????????????????????? ??? ?????? ??????
//                    String path_date = DateUtil.format(new Date(), "yyyy") + "/" + DateUtil.format(new Date(), "MMdd") + "/" + DateUtil.format(new Date(), "HH");
//                    String localPath = getUploadFolder() + fileUploadConfig.getLocalPath() + pathTypeDir + path_date;
//                    //?????????????????????????????????
//                    String fileSuffix = getFileSuffix(uploadFileDto.getFilename());
//                    String serverFileName = fileSuffix;
//                    Downloader downloader = ufopFactory.getDownloader(uploadFileResult.getStorageType().getCode());
//                    DownloadFile downloadFile = new DownloadFile();
//                    downloadFile.setFileUrl(file.getServerLocalPath());
//                    InputStream in = downloader.getInputStream(downloadFile);
//
//                    FileHandleUtil.upload(in, localPath, serverFileName);
//                    String saticAccess = fileUploadConfig.getStaticAccessPath().replace("*", "");
//                    String netWorkPath = "/" + saticAccess + pathTypeDir + path_date + "/" + serverFileName;
//                    map.put("network", netWorkPath);
//
//                    FileRecord fileRecord = new FileRecord();
//                    fileRecord.setDownloadCount(0);
//                    fileRecord.setUploadCount(1);
//                    fileRecord.setIsMerge(1);//????????????????????????
//                    fileRecord.setIsZone(0);
//                    fileRecord.setFileSize(uploadFileDto.getTotalSize());
//                    fileRecord.setFileType(fileType);
//                    fileRecord.setMd5Value(filemd5);
//                    fileRecord.setOrgName(uploadFileDto.getFilename());
//                    fileRecord.setUploadType(uploadType);
//                    fileRecord.setServerLocalName(serverFileName);
//                    fileRecord.setServerLocalPath(localPath + serverFileName);
//                    fileRecord.setStorageDate(getDateToYear(100));//???????????????
//                    fileRecord.setNetworkPath(netWorkPath);
//                    String fileId = saveFileRecord(request, fileRecord);
//                    map.put("fileId", fileId);
//                    map.put("network", fileRecord.getNetworkPath());

                    LambdaQueryWrapper<UploadTaskDetail> lambdaQueryWrapper = new LambdaQueryWrapper<>();
                    lambdaQueryWrapper.eq(UploadTaskDetail::getIdentifier, uploadFileDto.getIdentifier());
                    uploadTaskDetailMapper.delete(lambdaQueryWrapper);

                    LambdaUpdateWrapper<UploadTask> lambdaUpdateWrapper = new LambdaUpdateWrapper<>();
                    lambdaUpdateWrapper.set(UploadTask::getUploadStatus, UploadFileStatusEnum.SUCCESS.getCode())
                            .eq(UploadTask::getIdentifier, uploadFileDto.getIdentifier());
                    uploadTaskMapper.update(null, lambdaUpdateWrapper);
                    fileDealComp.parseMusicFile(uploadFileResult.getExtendName(), uploadFileResult.getStorageType().getCode(), uploadFileResult.getFileUrl(), resourcePO.getResourceId()+"");

                } else if (UploadFileStatusEnum.UNCOMPLATE.equals(uploadFileResult.getStatus())) {
                    UploadTaskDetail uploadTaskDetail = new UploadTaskDetail();
                    uploadTaskDetail.setFilePath(qiwenFile.getParent());
                    uploadTaskDetail.setFileName(qiwenFile.getNameNotExtend());
                    uploadTaskDetail.setChunkNumber(uploadFileDto.getChunkNumber());
                    uploadTaskDetail.setChunkSize((int) uploadFileDto.getChunkSize());
                    uploadTaskDetail.setRelativePath(uploadFileDto.getRelativePath());
                    uploadTaskDetail.setTotalChunks(uploadFileDto.getTotalChunks());
                    uploadTaskDetail.setTotalSize((int) uploadFileDto.getTotalSize());
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


}
