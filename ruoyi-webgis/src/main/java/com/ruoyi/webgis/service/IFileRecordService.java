package com.ruoyi.webgis.service;


import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.file.dto.file.UploadFileDTO;
import com.ruoyi.file.vo.file.UploadFileVo;
import com.ruoyi.webgis.common.entity.Result;
import com.ruoyi.webgis.model.po.FileRecord;
import com.ruoyi.webgis.model.po.FileZoneRecord;
import com.baomidou.mybatisplus.extension.service.IService;

import javax.servlet.http.HttpServletRequest;

/**
 * <p>
 * 文件上传记录 服务类
 * </p>
 *
 * @author haijun
 * @since 2020-02-14
 */
public interface IFileRecordService extends IService<FileRecord> {

    AjaxResult upload(HttpServletRequest request, Integer uploadType, Integer storageYear);

    AjaxResult zoneUpload(HttpServletRequest request, String contentType, FileZoneRecord fileZoneRecord);

    AjaxResult md5Check(FileZoneRecord fileZoneRecord, Integer checkType, String contentType, HttpServletRequest request);

    AjaxResult mergeZoneFile(String totalmd5, HttpServletRequest request,Long projectId,Integer modelType);
//    AjaxResult mergeZoneFile1(String totalmd5, HttpServletRequest request,Long projectId,Long modelType);

    AjaxResult delZoneFile(String totalmd5);

    AjaxResult delFile(String fileId);


    UploadFileVo uploadFileSpeed(UploadFileDTO uploadFileDTO, Long userId);

    void uploadFile(HttpServletRequest request, UploadFileDTO UploadFileDto, Long userId);

//    void recordDownloadLog(String fileId, FileRecord fileRecord);
}
